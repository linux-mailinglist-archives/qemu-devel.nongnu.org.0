Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C9615C65
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 07:42:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq7Rr-0001yF-KD; Wed, 02 Nov 2022 02:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oq7Rp-0001xr-7L
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 02:42:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oq7Rn-0006DB-Fg
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 02:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667371318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p6TyEbf44Ae+/Tk9+wnAoGW209Lp0ov7anQh3/tkS0U=;
 b=ATny+GDnaLPLSPHtIOqgcAyiQuX1hO8+8eWQfZGA1uNCy4KNygQzaLBuNDYFjiX5STTlUk
 jE5anXj32nK0B3CTznS1g1Yg652dOiONy3bFY69wkf2ap7ao1YM2MvjvheP06RNN1evfIJ
 +AYtpSF3NTsaNicuo8i8QLihD5Io2yc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-NxEInYmtMUGgITFwl2r0Pg-1; Wed, 02 Nov 2022 02:41:57 -0400
X-MC-Unique: NxEInYmtMUGgITFwl2r0Pg-1
Received: by mail-wm1-f71.google.com with SMTP id
 d13-20020a05600c34cd00b003ce1f62ac5aso639596wmq.4
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 23:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p6TyEbf44Ae+/Tk9+wnAoGW209Lp0ov7anQh3/tkS0U=;
 b=xXfcxAYbN3io4AVTUuqYllyJfngp1fCK7SsLXc2O2u0huTaeEVKCx4OkKXIh+/q+gZ
 a2iV2ozkFePK+w7BpSGOAtNBZWF378b6Kqhu89zuZxbeopkBxFV1+7CWGoOi2pu3ooR3
 eXNMseeMZMhJotpBNBebBirA+l/g2REE9Ul+n8Oq8usc8kq8aHPq4oyBNa+uE/JQ8QMA
 J0t03IMTlIbeW456uu0HllSjBEzW5F4QDP2faCMRtj0orNSmlVMrYRVl43AyF6qqX5ZC
 gWjAodHK55MqJsFOMPi2Ov9DFtVkpJV5jdHWT2WG4XalyUTPg6d9i8jEbRibnHtgh9LM
 ylNw==
X-Gm-Message-State: ACrzQf3XFtQ8pbg3MYj1nRuX2R6Ad6vKS4WPZo6Lr2Bf4dcSTRbu2Lmz
 PlVetuV0bK1X0J6lO3LcRxq8e3Khv/KTT6D30cTTzPKJaXob/tHO+LaFziBoStDcYZnefS9OhIK
 zfhe3Mhl8R+0u1UY=
X-Received: by 2002:a05:600c:3655:b0:3cf:7082:dc18 with SMTP id
 y21-20020a05600c365500b003cf7082dc18mr9809650wmq.36.1667371316198; 
 Tue, 01 Nov 2022 23:41:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4dj+Q7ZoCm9laAoAjA1t5j8FD4A+6KuHFvyqwyMaLttVcGHilSylT/PD6oRh+gdQNOT7I6Jg==
X-Received: by 2002:a05:600c:3655:b0:3cf:7082:dc18 with SMTP id
 y21-20020a05600c365500b003cf7082dc18mr9809640wmq.36.1667371315935; 
 Tue, 01 Nov 2022 23:41:55 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 i10-20020a1c540a000000b003a3442f1229sm929955wmb.29.2022.11.01.23.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 23:41:55 -0700 (PDT)
Date: Wed, 2 Nov 2022 02:41:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH RFC 1/4] net: Introduce qmp cmd "query-netdev"
Message-ID: <20221102024054-mutt-send-email-mst@kernel.org>
References: <cover.1667232396.git.huangy81@chinatelecom.cn>
 <d254324983817fb380411995155c9e927edaeb92.1667232396.git.huangy81@chinatelecom.cn>
 <CACGkMEvvoVwtr8aSqTpAVxYN7q7mxMmLbusfgKDf3zwfmk2itg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEvvoVwtr8aSqTpAVxYN7q7mxMmLbusfgKDf3zwfmk2itg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Nov 02, 2022 at 01:42:39PM +0800, Jason Wang wrote:
> On Tue, Nov 1, 2022 at 12:19 AM <huangy81@chinatelecom.cn> wrote:
> >
> > From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> >
> > For netdev device that can offload virtio-net dataplane to slave,
> > such as vhost-net, vhost-user and vhost-vdpa, exporting it's
> > capability information and acked features would be more friendly for
> > developers. These infomation can be analyzed and compare to slave
> > capability provided by, eg dpdk or other slaves directly, helping to
> > draw conclusions about if vm network interface works normally, if
> > it vm can be migrated to another feature-compatible destination or
> > whatever else.
> >
> > For developers who devote to offload virtio-net dataplane to DPU
> > and make efforts to migrate vm lively from software-based source
> > host to DPU-offload destination host smoothly, virtio-net feature
> > compatibility is an serious issue, exporting the key capability
> > and acked_features of netdev could also help to debug greatly.
> >
> > So we export out the key capabilities of netdev, which may affect
> > the final negotiated virtio-net features, meanwhile, backed-up
> > acked_features also exported, which is used to initialize or
> > restore features negotiated between qemu and vhost slave when
> > starting vhost_dev device.
> >
> > Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> > ---
> >  net/net.c     | 44 +++++++++++++++++++++++++++++++++++++++
> >  qapi/net.json | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 110 insertions(+)
> >
> > diff --git a/net/net.c b/net/net.c
> > index 2db160e..5d11674 100644
> > --- a/net/net.c
> > +++ b/net/net.c
> > @@ -53,6 +53,7 @@
> >  #include "sysemu/runstate.h"
> >  #include "net/colo-compare.h"
> >  #include "net/filter.h"
> > +#include "net/vhost-user.h"
> >  #include "qapi/string-output-visitor.h"
> >
> >  /* Net bridge is currently not supported for W32. */
> > @@ -1224,6 +1225,49 @@ void qmp_netdev_del(const char *id, Error **errp)
> >      }
> >  }
> >
> > +static NetDevInfo *query_netdev(NetClientState *nc)
> > +{
> > +    NetDevInfo *info = NULL;
> > +
> > +    if (!nc || !nc->is_netdev) {
> > +        return NULL;
> > +    }
> > +
> > +    info = g_malloc0(sizeof(*info));
> > +    info->name = g_strdup(nc->name);
> > +    info->type = nc->info->type;
> > +    info->ufo = nc->info->has_ufo;
> > +    info->vnet_hdr = nc->info->has_vnet_hdr;
> > +    info->vnet_hdr_len = nc->info->has_vnet_hdr_len;
> 
> So all the fields are virtio specific, I wonder if it's better to
> rename the command as query-vhost or query-virtio?
> 
> Thanks

We have info virtio already. Seems to fit there logically.


> > +
> > +    if (nc->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> > +        info->has_acked_features = true;
> > +        info->acked_features = vhost_user_get_acked_features(nc);
> > +    }
> > +
> > +    return info;
> > +}
> > +
> > +NetDevInfoList *qmp_query_netdev(Error **errp)
> > +{
> > +    NetClientState *nc;
> > +    NetDevInfo *info = NULL;
> > +    NetDevInfoList *head = NULL, **tail = &head;
> > +
> > +    QTAILQ_FOREACH(nc, &net_clients, next) {
> > +        if (nc->info->type == NET_CLIENT_DRIVER_NIC) {
> > +            continue;
> > +        }
> > +
> > +        info = query_netdev(nc);
> > +        if (info) {
> > +            QAPI_LIST_APPEND(tail, info);
> > +        }
> > +    }
> > +
> > +    return head;
> > +}
> > +
> >  static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
> >  {
> >      char *str;
> > diff --git a/qapi/net.json b/qapi/net.json
> > index dd088c0..76a6513 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -631,6 +631,72 @@
> >                         'if': 'CONFIG_VMNET' } } }
> >
> >  ##
> > +# @NetDevInfo:
> > +#
> > +# NetDev information.  This structure describes a NetDev information, including
> > +# capabilities and negotiated features.
> > +#
> > +# @name: The NetDev name.
> > +#
> > +# @type: Type of NetDev.
> > +#
> > +# @ufo: True if NetDev has ufo capability.
> > +#
> > +# @vnet-hdr: True if NetDev has vnet_hdr.
> > +#
> > +# @vnet-hdr-len: True if given length can be assigned to NetDev.
> > +#
> > +# @acked-features: Negotiated features with vhost slave device if device support
> > +#                  dataplane offload.
> > +#
> > +# Since:  7.1
> > +##
> > +{'struct': 'NetDevInfo',
> > + 'data': {
> > +    'name': 'str',
> > +    'type': 'NetClientDriver',
> > +    'ufo':'bool',
> > +    'vnet-hdr':'bool',
> > +    'vnet-hdr-len':'bool',
> > +    '*acked-features': 'uint64' } }
> > +
> > +##
> > +# @query-netdev:
> > +#
> > +# Get a list of NetDevInfo for all virtual netdev peer devices.
> > +#
> > +# Returns: a list of @NetDevInfo describing each virtual netdev peer device.
> > +#
> > +# Since: 7.1
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "query-netdev" }
> > +# <- {
> > +#       "return":[
> > +#          {
> > +#             "name":"hostnet0",
> > +#             "type":"vhost-user",
> > +#             "ufo":true,
> > +#             "vnet-hdr":true,
> > +#             "vnet-hdr-len":true,
> > +#             "acked-features":"5111807907",
> > +#          },
> > +#          {
> > +#             "name":"hostnet1",
> > +#             "type":"vhost-user",
> > +#             "ufo":true,
> > +#             "vnet-hdr":true,
> > +#             "vnet-hdr-len":true,
> > +#             "acked-features":"5111807907",
> > +#          }
> > +#       ]
> > +#    }
> > +#
> > +##
> > +{ 'command': 'query-netdev', 'returns': ['NetDevInfo'] }
> > +
> > +##
> >  # @RxState:
> >  #
> >  # Packets receiving state
> > --
> > 1.8.3.1
> >


