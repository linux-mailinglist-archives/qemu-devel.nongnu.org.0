Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A018615BEB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 06:43:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq6Wm-0002dz-MH; Wed, 02 Nov 2022 01:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oq6Wf-0002dJ-KR
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 01:42:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oq6Wd-0003gc-JO
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 01:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667367773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3ympHSg2qy6mZdrBrJgBttcrANWd4yQ/hyxnZz+10A=;
 b=Oi/OEHqcyoSvtmIAD9rQYzP0KtzACz+P9JIvlXKubt/nz+bOPZjFxU0kDm0jNVTBwBxZdI
 00t4D1r9UbTjG0gAFTTb9v44vCmrzYYZtoFH9gN23jLdtwNOyYUwsBBcJluA5ZCENsf7yV
 fRZ1a4oZf5aQAbWlPjF7rPe46UnC2YM=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-2oeCtvDwO5edyb0bBDHIVg-1; Wed, 02 Nov 2022 01:42:52 -0400
X-MC-Unique: 2oeCtvDwO5edyb0bBDHIVg-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-13af11be44dso8518954fac.21
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 22:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s3ympHSg2qy6mZdrBrJgBttcrANWd4yQ/hyxnZz+10A=;
 b=U0TAK6HSi/OX11Xg5D2nuX1G5SEXz3aCyh/N0GF9bWnvIe5OskUeNLEN74u3iOdMfT
 wrvTogBJA23bi68yN3Xq7rjeQ1+o7cimVaDPwYNw4QFuoufpSXH67Ir4BpGDOhhZ+vHc
 ZkcX17IGssKZ0mYOPaVdBjy10b70d/d4Wq0iFmoFPk2fnphmZLjq9fHD+DK7J0HAgpIE
 8T9fxY+3D4j7Yny+M10Kp2LPKvU6z/JyALMM4jftoLcoRuzRCvbEZXnYTO8G9sJoqLRA
 GsHVIqgUi5MdzkwPKdlrguN8uHm6wtKfFBafdTEjMLS8YEKK3Lt7NiqJt5BQd153vf0P
 GkJg==
X-Gm-Message-State: ACrzQf2s/UMNvOE3akFx1B7eHTyj+sNv3hCztR2NwcOm4oevuUqTPWQE
 Vm3yNHp/KH1/yA5sX5n4FuhRyQnj3tS56zyRA6cIixHxbv/ZHSE3JO4y7Jg3BX8+fEQ27Zdasa4
 iaQluu28M9Q0RFfvolKnV5AlBHDOIYZ8=
X-Received: by 2002:a05:6808:1483:b0:354:a36e:5b with SMTP id
 e3-20020a056808148300b00354a36e005bmr19957237oiw.35.1667367771550; 
 Tue, 01 Nov 2022 22:42:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4JGe3Eo4x+evKx6xZ09DLJ4Og5153JowPC/+4fpUmjulwEXaAQSAqXEgRKcDB0jUvukgXPyKE92fRj++nXvfQ=
X-Received: by 2002:a05:6808:1483:b0:354:a36e:5b with SMTP id
 e3-20020a056808148300b00354a36e005bmr19957216oiw.35.1667367771274; Tue, 01
 Nov 2022 22:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1667232396.git.huangy81@chinatelecom.cn>
 <d254324983817fb380411995155c9e927edaeb92.1667232396.git.huangy81@chinatelecom.cn>
In-Reply-To: <d254324983817fb380411995155c9e927edaeb92.1667232396.git.huangy81@chinatelecom.cn>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 2 Nov 2022 13:42:39 +0800
Message-ID: <CACGkMEvvoVwtr8aSqTpAVxYN7q7mxMmLbusfgKDf3zwfmk2itg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] net: Introduce qmp cmd "query-netdev"
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 1, 2022 at 12:19 AM <huangy81@chinatelecom.cn> wrote:
>
> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> For netdev device that can offload virtio-net dataplane to slave,
> such as vhost-net, vhost-user and vhost-vdpa, exporting it's
> capability information and acked features would be more friendly for
> developers. These infomation can be analyzed and compare to slave
> capability provided by, eg dpdk or other slaves directly, helping to
> draw conclusions about if vm network interface works normally, if
> it vm can be migrated to another feature-compatible destination or
> whatever else.
>
> For developers who devote to offload virtio-net dataplane to DPU
> and make efforts to migrate vm lively from software-based source
> host to DPU-offload destination host smoothly, virtio-net feature
> compatibility is an serious issue, exporting the key capability
> and acked_features of netdev could also help to debug greatly.
>
> So we export out the key capabilities of netdev, which may affect
> the final negotiated virtio-net features, meanwhile, backed-up
> acked_features also exported, which is used to initialize or
> restore features negotiated between qemu and vhost slave when
> starting vhost_dev device.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> ---
>  net/net.c     | 44 +++++++++++++++++++++++++++++++++++++++
>  qapi/net.json | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 110 insertions(+)
>
> diff --git a/net/net.c b/net/net.c
> index 2db160e..5d11674 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -53,6 +53,7 @@
>  #include "sysemu/runstate.h"
>  #include "net/colo-compare.h"
>  #include "net/filter.h"
> +#include "net/vhost-user.h"
>  #include "qapi/string-output-visitor.h"
>
>  /* Net bridge is currently not supported for W32. */
> @@ -1224,6 +1225,49 @@ void qmp_netdev_del(const char *id, Error **errp)
>      }
>  }
>
> +static NetDevInfo *query_netdev(NetClientState *nc)
> +{
> +    NetDevInfo *info =3D NULL;
> +
> +    if (!nc || !nc->is_netdev) {
> +        return NULL;
> +    }
> +
> +    info =3D g_malloc0(sizeof(*info));
> +    info->name =3D g_strdup(nc->name);
> +    info->type =3D nc->info->type;
> +    info->ufo =3D nc->info->has_ufo;
> +    info->vnet_hdr =3D nc->info->has_vnet_hdr;
> +    info->vnet_hdr_len =3D nc->info->has_vnet_hdr_len;

So all the fields are virtio specific, I wonder if it's better to
rename the command as query-vhost or query-virtio?

Thanks

> +
> +    if (nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_USER) {
> +        info->has_acked_features =3D true;
> +        info->acked_features =3D vhost_user_get_acked_features(nc);
> +    }
> +
> +    return info;
> +}
> +
> +NetDevInfoList *qmp_query_netdev(Error **errp)
> +{
> +    NetClientState *nc;
> +    NetDevInfo *info =3D NULL;
> +    NetDevInfoList *head =3D NULL, **tail =3D &head;
> +
> +    QTAILQ_FOREACH(nc, &net_clients, next) {
> +        if (nc->info->type =3D=3D NET_CLIENT_DRIVER_NIC) {
> +            continue;
> +        }
> +
> +        info =3D query_netdev(nc);
> +        if (info) {
> +            QAPI_LIST_APPEND(tail, info);
> +        }
> +    }
> +
> +    return head;
> +}
> +
>  static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
>  {
>      char *str;
> diff --git a/qapi/net.json b/qapi/net.json
> index dd088c0..76a6513 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -631,6 +631,72 @@
>                         'if': 'CONFIG_VMNET' } } }
>
>  ##
> +# @NetDevInfo:
> +#
> +# NetDev information.  This structure describes a NetDev information, in=
cluding
> +# capabilities and negotiated features.
> +#
> +# @name: The NetDev name.
> +#
> +# @type: Type of NetDev.
> +#
> +# @ufo: True if NetDev has ufo capability.
> +#
> +# @vnet-hdr: True if NetDev has vnet_hdr.
> +#
> +# @vnet-hdr-len: True if given length can be assigned to NetDev.
> +#
> +# @acked-features: Negotiated features with vhost slave device if device=
 support
> +#                  dataplane offload.
> +#
> +# Since:  7.1
> +##
> +{'struct': 'NetDevInfo',
> + 'data': {
> +    'name': 'str',
> +    'type': 'NetClientDriver',
> +    'ufo':'bool',
> +    'vnet-hdr':'bool',
> +    'vnet-hdr-len':'bool',
> +    '*acked-features': 'uint64' } }
> +
> +##
> +# @query-netdev:
> +#
> +# Get a list of NetDevInfo for all virtual netdev peer devices.
> +#
> +# Returns: a list of @NetDevInfo describing each virtual netdev peer dev=
ice.
> +#
> +# Since: 7.1
> +#
> +# Example:
> +#
> +# -> { "execute": "query-netdev" }
> +# <- {
> +#       "return":[
> +#          {
> +#             "name":"hostnet0",
> +#             "type":"vhost-user",
> +#             "ufo":true,
> +#             "vnet-hdr":true,
> +#             "vnet-hdr-len":true,
> +#             "acked-features":"5111807907",
> +#          },
> +#          {
> +#             "name":"hostnet1",
> +#             "type":"vhost-user",
> +#             "ufo":true,
> +#             "vnet-hdr":true,
> +#             "vnet-hdr-len":true,
> +#             "acked-features":"5111807907",
> +#          }
> +#       ]
> +#    }
> +#
> +##
> +{ 'command': 'query-netdev', 'returns': ['NetDevInfo'] }
> +
> +##
>  # @RxState:
>  #
>  # Packets receiving state
> --
> 1.8.3.1
>


