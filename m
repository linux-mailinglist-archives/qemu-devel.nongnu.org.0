Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603B561F260
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 13:04:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os0qQ-0007dQ-43; Mon, 07 Nov 2022 07:03:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1os0qE-0007Zm-4i
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:03:04 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1os0qA-0005KB-Dj
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:03:01 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F0983225AD;
 Mon,  7 Nov 2022 12:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667822575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=epAlZCyXBElGHAgphgY5hwW4/vMIKpPmnqoVJKFFcV0=;
 b=al4BvurPiSw+Sor1quaz/fsOXmqI4OxpDqluvEgIcjnnzoKG/AtAhbNVnfEswyJonFogIm
 9N5fT9YtyuzpuWp+tVBQRTmbTj7eqJpCDSW8rTNtPLWo8txvDvnvyuON97DEIMAKKZUc2C
 KTUvQJ4GaMQnWrToNZr6he5LLvSEog4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667822575;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=epAlZCyXBElGHAgphgY5hwW4/vMIKpPmnqoVJKFFcV0=;
 b=Ejpz393gBqHGnt2BQalvPo9zSV1bQCyoQrKiMMH4jYhK2WaEXDDpBkZGoSjBP41BLItorj
 7dS3qtfUkuph5oBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C341D13AC7;
 Mon,  7 Nov 2022 12:02:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yX1NLu/zaGP7JwAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 07 Nov 2022 12:02:55 +0000
Message-ID: <9081f337-e3bc-3ac2-ed53-4c01bfadad61@suse.de>
Date: Mon, 7 Nov 2022 13:02:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/3] net: Move the code to collect available NIC models to
 a separate function
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, pbonzini@redhat.com
References: <20221104125705.415923-1-thuth@redhat.com>
 <20221104125705.415923-2-thuth@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221104125705.415923-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/22 13:57, Thomas Huth wrote:
> The code that collects the available NIC models is not really specific
> to PCI anymore and will be required in the next patch, too, so let's
> move this into a new separate function in net.c instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/net/net.h |  1 +
>  hw/pci/pci.c      | 29 +----------------------------
>  net/net.c         | 36 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 38 insertions(+), 28 deletions(-)
> 
> diff --git a/include/net/net.h b/include/net/net.h
> index 3db75ff841..c96cefb89a 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -189,6 +189,7 @@ void qemu_set_vnet_hdr_len(NetClientState *nc, int len);
>  int qemu_set_vnet_le(NetClientState *nc, bool is_le);
>  int qemu_set_vnet_be(NetClientState *nc, bool is_be);
>  void qemu_macaddr_default_if_unset(MACAddr *macaddr);
> +GPtrArray *qemu_get_nic_models(const char *device_type);

I know there is no precedent in this file, but it would be useful to document this function,
what it does exactly and what it returns, the return value, allocation assumptions etc.

>  int qemu_show_nic_models(const char *arg, const char *const *models);
>  void qemu_check_nic_model(NICInfo *nd, const char *model);
>  int qemu_find_nic_model(NICInfo *nd, const char * const *models,
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 2f450f6a72..2b7b343e82 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1964,7 +1964,6 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>                                 const char *default_devaddr)
>  {
>      const char *devaddr = nd->devaddr ? nd->devaddr : default_devaddr;
> -    GSList *list;
>      GPtrArray *pci_nic_models;
>      PCIBus *bus;
>      PCIDevice *pci_dev;
> @@ -1979,33 +1978,7 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>          nd->model = g_strdup("virtio-net-pci");
>      }
>  
> -    list = object_class_get_list_sorted(TYPE_PCI_DEVICE, false);
> -    pci_nic_models = g_ptr_array_new();
> -    while (list) {
> -        DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, list->data,
> -                                             TYPE_DEVICE);
> -        GSList *next;
> -        if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
> -            dc->user_creatable) {
> -            const char *name = object_class_get_name(list->data);
> -            /*
> -             * A network device might also be something else than a NIC, see
> -             * e.g. the "rocker" device. Thus we have to look for the "netdev"
> -             * property, too. Unfortunately, some devices like virtio-net only
> -             * create this property during instance_init, so we have to create
> -             * a temporary instance here to be able to check it.
> -             */
> -            Object *obj = object_new_with_class(OBJECT_CLASS(dc));
> -            if (object_property_find(obj, "netdev")) {
> -                g_ptr_array_add(pci_nic_models, (gpointer)name);
> -            }
> -            object_unref(obj);
> -        }
> -        next = list->next;
> -        g_slist_free_1(list);
> -        list = next;
> -    }
> -    g_ptr_array_add(pci_nic_models, NULL);
> +    pci_nic_models = qemu_get_nic_models(TYPE_PCI_DEVICE);
>  
>      if (qemu_show_nic_models(nd->model, (const char **)pci_nic_models->pdata)) {
>          exit(0);
> diff --git a/net/net.c b/net/net.c
> index 840ad9dca5..c0516a8067 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -899,6 +899,42 @@ static int nic_get_free_idx(void)
>      return -1;
>  }
>  
> +GPtrArray *qemu_get_nic_models(const char *device_type)
> +{
> +    GPtrArray *nic_models;
> +    GSList *list;
> +
> +    list = object_class_get_list_sorted(device_type, false);
> +    nic_models = g_ptr_array_new();
> +    while (list) {
> +        DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, list->data,
> +                                             TYPE_DEVICE);
> +        GSList *next;
> +        if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
> +            dc->user_creatable) {
> +            const char *name = object_class_get_name(list->data);
> +            /*
> +             * A network device might also be something else than a NIC, see
> +             * e.g. the "rocker" device. Thus we have to look for the "netdev"
> +             * property, too. Unfortunately, some devices like virtio-net only
> +             * create this property during instance_init, so we have to create
> +             * a temporary instance here to be able to check it.
> +             */
> +            Object *obj = object_new_with_class(OBJECT_CLASS(dc));
> +            if (object_property_find(obj, "netdev")) {
> +                g_ptr_array_add(nic_models, (gpointer)name);
> +            }
> +            object_unref(obj);
> +        }
> +        next = list->next;
> +        g_slist_free_1(list);
> +        list = next;
> +    }
> +    g_ptr_array_add(nic_models, NULL);
> +
> +    return nic_models;
> +}
> +
>  int qemu_show_nic_models(const char *arg, const char *const *models)
>  {
>      int i;

Claudio

