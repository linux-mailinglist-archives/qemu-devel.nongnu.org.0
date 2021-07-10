Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D25C3C339C
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 09:46:48 +0200 (CEST)
Received: from localhost ([::1]:54140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m27hG-0005VB-V9
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 03:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m27fU-0004WY-59
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 03:44:56 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m27fS-000415-B8
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 03:44:55 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3DDE8222D4;
 Sat, 10 Jul 2021 07:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625903091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h5PsQEb1w8SDuOv+FBkKFMzwQeZ5uv60hKfgQaminws=;
 b=amtYSvRjm22iG9yXw5kBuj8rkbHD3NVK9055kQOoms2qZ9VglxhoW6zskMlTSb3Ausy7nM
 GPWCupwIL9MHbLaUovZypzCOioSDMAuGkKGiCjEpHjPU6WxF340tOVADo18MsbcxNlC4gk
 a7rPxN6qZKn8+Y9xBNgoC+Pm7c2/G2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625903091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h5PsQEb1w8SDuOv+FBkKFMzwQeZ5uv60hKfgQaminws=;
 b=EWLZhHgeWq/ovOuu4ng6xYeabZt+fF84Ka0PCCfIBLkaK/dpkpcJp+Pt0bi/NaU7lNVTcK
 cuVqo1Zc9knOLLDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id CFE341340F;
 Sat, 10 Jul 2021 07:44:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id PExtMPJP6WAkZgAAGKfGzw
 (envelope-from <cfontana@suse.de>); Sat, 10 Jul 2021 07:44:50 +0000
Subject: Re: [PATCH v1 1/1] vfio: Make migration support non experimental by
 default.
To: Tarun Gupta <targupta@nvidia.com>, alex.williamson@redhat.com,
 qemu-devel@nongnu.org
References: <20210308160949.4290-1-targupta@nvidia.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e8ad19da-0064-2edc-e7c6-6114031ea0f8@suse.de>
Date: Sat, 10 Jul 2021 09:44:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210308160949.4290-1-targupta@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: cjia@nvidia.com, quintela@redhat.com, cohuck@redhat.com,
 dgilbert@redhat.com, lushenming@huawei.com,
 Kirti Wankhede <kwankhede@nvidia.com>, dnigam@nvidia.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 5:09 PM, Tarun Gupta wrote:
> VFIO migration support in QEMU is experimental as of now, which was done to
> provide soak time and resolve concerns regarding bit-stream.
> But, with the patches discussed in
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg784931.html , we have
> corrected ordering of saving PCI config space and bit-stream.
> 
> So, this patch proposes to make vfio migration support in QEMU to be enabled
> by default. Tested by successfully migrating mdev device.
> 
> Signed-off-by: Tarun Gupta <targupta@nvidia.com>
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> ---
>  hw/vfio/pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index f74be78209..15e26f460b 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3199,7 +3199,7 @@ static Property vfio_pci_dev_properties[] = {
>      DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
>                      VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
>      DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
> -                     vbasedev.enable_migration, false),
> +                     vbasedev.enable_migration, true),
>      DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap, false),
>      DEFINE_PROP_BOOL("x-balloon-allowed", VFIOPCIDevice,
>                       vbasedev.ram_block_discard_allowed, false),
> 

Hello,

has plain snapshot been tested?
If I issue the HMP command "savevm", and then "loadvm", will things work fine?

Thanks,

CLaudio

