Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB1B61FBA5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 18:40:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os65o-000800-Tn; Mon, 07 Nov 2022 12:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os65n-0007zR-1k
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 12:39:27 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os65l-0005hV-4X
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 12:39:26 -0500
Received: by mail-wr1-x432.google.com with SMTP id a14so17347978wru.5
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 09:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oRBZpEb2uhJb9zeEh3xAn8f5EJDG6EH78C1dfS/sgqI=;
 b=eoXo4o/Q+qzgbIL1ljZPHiW8N3Fd174iFo6Gitg1LhAjxnwsL9dJuRzmFtSEBIKgT3
 hBQSQJqL/jFN6VM8NUzbubm63/f45SJ/q59Dkng/gowBq5dROfDpjwCX/Q7roDLFOo5E
 41xyLNXTLHi/P0A2AR4fZXZmT5LGaTHQDX/AeTNut9vCfRDJduAMC6UIxZHKBcP/LNJA
 bvv4rsql0jOIKRu6vLK8ACdhHnsM4oSeKeapkv39hphnS2oirCB0zXxU1w+UCrIoUtFR
 hvtBtVX38PyVqaYRSNJmzDcXhcxcGUS4BMxDfe4IuEheNv+1ofs6wvxJ7JnpT9/OwGIb
 4aJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oRBZpEb2uhJb9zeEh3xAn8f5EJDG6EH78C1dfS/sgqI=;
 b=mKzqmEdgzO5THuhDHO7nvoap77iSt5Zp27hl6i/AqCSeVHJXA7iTkWxqSDATHH99M3
 TAm/WQEfrIl25FLrpTawXFAEmi8RUARy9AqKRnL+Pjpy8g82yBHnoWhOSf+mA3myntfl
 vWGsHfLIsf9Gv9uhPE5EC8xUNtzevkguBPsplSwuv1xfjb9mCeTF/b3wQoiW0DYpjqks
 p2piI1ml71eY6dMhg1EZq8mQUR+/GkKRC6TLSQIohiFZEr+PSED4Y2NsUBTzCb7WRqbc
 Rs8yDyTgZXAG6qKuo15mLBiLfGVQ83/CMgO48CHRfbhie2Roi+Z67PJOLC38AQnVQrRg
 sxVw==
X-Gm-Message-State: ACrzQf3IEdN10PaR+adVncsY85gYG1XxnEAmsnBYX0tXT46UX6JM88D2
 V7aEdfaf4d4sFWKh1lEIBRoDvdJZiDYKug==
X-Google-Smtp-Source: AMsMyM6yRuAJFRfb77rLu4n4MgupA4X4FRJP7jPU4Y/jBzY0KVwnTcQapwyQFU+wbyY8pjUg9wlYcQ==
X-Received: by 2002:adf:ab1d:0:b0:236:6301:c77 with SMTP id
 q29-20020adfab1d000000b0023663010c77mr31731001wrc.119.1667842762987; 
 Mon, 07 Nov 2022 09:39:22 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a7bc447000000b003cf7928e731sm8678571wmi.9.2022.11.07.09.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 09:39:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AB4151FFB7;
 Mon,  7 Nov 2022 17:39:21 +0000 (GMT)
References: <20221104125705.415923-1-thuth@redhat.com>
 <20221104125705.415923-2-thuth@redhat.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/3] net: Move the code to collect available NIC models
 to a separate function
Date: Mon, 07 Nov 2022 17:34:38 +0000
In-reply-to: <20221104125705.415923-2-thuth@redhat.com>
Message-ID: <87sfiufyuu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


Thomas Huth <thuth@redhat.com> writes:

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
> @@ -189,6 +189,7 @@ void qemu_set_vnet_hdr_len(NetClientState *nc, int le=
n);
>  int qemu_set_vnet_le(NetClientState *nc, bool is_le);
>  int qemu_set_vnet_be(NetClientState *nc, bool is_be);
>  void qemu_macaddr_default_if_unset(MACAddr *macaddr);
> +GPtrArray *qemu_get_nic_models(const char *device_type);
>  int qemu_show_nic_models(const char *arg, const char *const *models);
>  void qemu_check_nic_model(NICInfo *nd, const char *model);
>  int qemu_find_nic_model(NICInfo *nd, const char * const *models,
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 2f450f6a72..2b7b343e82 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1964,7 +1964,6 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus =
*rootbus,
>                                 const char *default_devaddr)
>  {
>      const char *devaddr =3D nd->devaddr ? nd->devaddr : default_devaddr;
> -    GSList *list;
>      GPtrArray *pci_nic_models;
>      PCIBus *bus;
>      PCIDevice *pci_dev;
> @@ -1979,33 +1978,7 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus=
 *rootbus,
>          nd->model =3D g_strdup("virtio-net-pci");
>      }
>=20=20
> -    list =3D object_class_get_list_sorted(TYPE_PCI_DEVICE, false);
> -    pci_nic_models =3D g_ptr_array_new();
> -    while (list) {
> -        DeviceClass *dc =3D OBJECT_CLASS_CHECK(DeviceClass, list->data,
> -                                             TYPE_DEVICE);
> -        GSList *next;
> -        if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
> -            dc->user_creatable) {
> -            const char *name =3D object_class_get_name(list->data);
> -            /*
> -             * A network device might also be something else than a NIC,=
 see
> -             * e.g. the "rocker" device. Thus we have to look for the "n=
etdev"
> -             * property, too. Unfortunately, some devices like virtio-ne=
t only
> -             * create this property during instance_init, so we have to =
create
> -             * a temporary instance here to be able to check it.
> -             */
> -            Object *obj =3D object_new_with_class(OBJECT_CLASS(dc));
> -            if (object_property_find(obj, "netdev")) {
> -                g_ptr_array_add(pci_nic_models, (gpointer)name);
> -            }
> -            object_unref(obj);
> -        }
> -        next =3D list->next;
> -        g_slist_free_1(list);
> -        list =3D next;
> -    }
> -    g_ptr_array_add(pci_nic_models, NULL);
> +    pci_nic_models =3D qemu_get_nic_models(TYPE_PCI_DEVICE);
>=20=20
>      if (qemu_show_nic_models(nd->model, (const char **)pci_nic_models->p=
data)) {
>          exit(0);
> diff --git a/net/net.c b/net/net.c
> index 840ad9dca5..c0516a8067 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -899,6 +899,42 @@ static int nic_get_free_idx(void)
>      return -1;
>  }
>=20=20
> +GPtrArray *qemu_get_nic_models(const char *device_type)
> +{
> +    GPtrArray *nic_models;
> +    GSList *list;
> +
> +    list =3D object_class_get_list_sorted(device_type, false);
> +    nic_models =3D g_ptr_array_new();
> +    while (list) {
> +        DeviceClass *dc =3D OBJECT_CLASS_CHECK(DeviceClass, list->data,
> +                                             TYPE_DEVICE);
> +        GSList *next;
> +        if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
> +            dc->user_creatable) {
> +            const char *name =3D object_class_get_name(list->data);
> +            /*
> +             * A network device might also be something else than a NIC,=
 see
> +             * e.g. the "rocker" device. Thus we have to look for the "n=
etdev"
> +             * property, too. Unfortunately, some devices like virtio-ne=
t only
> +             * create this property during instance_init, so we have to =
create
> +             * a temporary instance here to be able to check it.
> +             */
> +            Object *obj =3D object_new_with_class(OBJECT_CLASS(dc));
> +            if (object_property_find(obj, "netdev")) {
> +                g_ptr_array_add(nic_models, (gpointer)name);
> +            }
> +            object_unref(obj);
> +        }
> +        next =3D list->next;
> +        g_slist_free_1(list);
> +        list =3D next;
> +    }
> +    g_ptr_array_add(nic_models, NULL);
> +
> +    return nic_models;
> +}

Is it worth freeing as you go and playing the next/list dance when you
could just:

  GPtrArray *qemu_get_nic_models(const char *device_type)
  {
      GPtrArray *nic_models =3D g_ptr_array_new();
      g_autoptr(GSList) list =3D object_class_get_list_sorted(device_type, =
false);

      do {
          DeviceClass *dc =3D OBJECT_CLASS_CHECK(DeviceClass, list->data,
                                               TYPE_DEVICE);
          if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
              dc->user_creatable) {
              const char *name =3D object_class_get_name(list->data);
              /*
               * A network device might also be something else than a NIC, =
see
               * e.g. the "rocker" device. Thus we have to look for the "ne=
tdev"
               * property, too. Unfortunately, some devices like virtio-net=
 only
               * create this property during instance_init, so we have to c=
reate
               * a temporary instance here to be able to check it.
               */
              Object *obj =3D object_new_with_class(OBJECT_CLASS(dc));
              if (object_property_find(obj, "netdev")) {
                  g_ptr_array_add(nic_models, (gpointer)name);
              }
              object_unref(obj);
          }
      } while ((list =3D g_slist_next(list)));
      g_ptr_array_add(nic_models, NULL);

      return nic_models;
  }

I must admit I'm not super clear on the lifetimes
object_class_get_list_sorted but I assume the contents are static and we
only need the equivalent of g_slist_free.=20


> +
>  int qemu_show_nic_models(const char *arg, const char *const *models)
>  {
>      int i;


--=20
Alex Benn=C3=A9e

