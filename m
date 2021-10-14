Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E7D42D0EC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 05:25:34 +0200 (CEST)
Received: from localhost ([::1]:40254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1marN7-0001J9-GN
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 23:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1marKY-0008UQ-TA
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 23:22:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1marKV-0000oi-8o
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 23:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634181769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=96bNmqHwsksTAUVcQNEpKlQUWjM/tgadAcyuArojN4w=;
 b=BH2jUjdR3BCv/4pdLZsArUHFYouyA/h0gBrf7n5A48+KBC15QpTg2jSVPbWEdoW14Atbds
 EZZfsXXPaRGpIHk0wP/os3trnOPIMDlU4sYeJKjOWGUEp05WxzPB0UFD96qIyn0L3Ut0OD
 vzwMm1dks6lFPC8REo+1/8RLowzivIA=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-AzVuP2k3OZCjMFl2Tp3XOw-1; Wed, 13 Oct 2021 23:22:48 -0400
X-MC-Unique: AzVuP2k3OZCjMFl2Tp3XOw-1
Received: by mail-pg1-f199.google.com with SMTP id
 j18-20020a633c12000000b0029956680edaso2114520pga.15
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 20:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=96bNmqHwsksTAUVcQNEpKlQUWjM/tgadAcyuArojN4w=;
 b=I/0JdHvmbGc+1xCNVPi/DiPsm17foVOpVfm0B0gSC6bbFsDzrJBDC2zuAQJgjFQjjL
 aTr5h+wg+dacKJHjPwlt+J0gAQCjuI/JpLzFjEWnAf6gkRUpzI60qFPJh1afNVRorC9V
 VTWYAfrBElq28+cn0O410/mguH9OyKdhmCaK8Icq64bp2bqTV/wliimEnKBCbln4oOdL
 rxmhDZ5oKo5Nkm5BSnTiLRXh4rTZX9cGIYhE2owuRy9oXEOTzMCPUXtTqnvKfizXRPEw
 aPD7Kla3pWvM9mEIce4Tc7fvJ9g60Ims46BDS4XJ/fuloh7bxCA768mvdvV+gtbN5SYo
 1Y6A==
X-Gm-Message-State: AOAM5316kEwrA+oSDzcB3O55j0l2jWiXTG0hs3Qqyp3fYBAYCXl8RpXx
 9LwDFZ0IrQlNC+tbBBhiz2bvLz8qIqlBVXIitcu9yWRk8rHlYkg/dKAdlVkFb7nAnePuXopXVnp
 VtK8H6rU0rXV8vHE=
X-Received: by 2002:a62:84d5:0:b0:44d:7cf:e6dc with SMTP id
 k204-20020a6284d5000000b0044d07cfe6dcmr3120217pfd.12.1634181767005; 
 Wed, 13 Oct 2021 20:22:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWIyc5PeAm3Nv3+dv3DyVNnRjf0335XLCRRGta+PzboAgK9x9UO2SSpZZKruOr+BrrDqqdzw==
X-Received: by 2002:a62:84d5:0:b0:44d:7cf:e6dc with SMTP id
 k204-20020a6284d5000000b0044d07cfe6dcmr3120195pfd.12.1634181766630; 
 Wed, 13 Oct 2021 20:22:46 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id u16sm789993pfn.187.2021.10.13.20.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 20:22:46 -0700 (PDT)
Subject: Re: [PATCH v2 01/15] net: Introduce NetClientInfo.check_peer_type()
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20211008133442.141332-1-kwolf@redhat.com>
 <20211008133442.141332-2-kwolf@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <69984c12-aa7a-6be2-0c28-baffbc954db5@redhat.com>
Date: Thu, 14 Oct 2021 11:22:36 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211008133442.141332-2-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: damien.hedde@greensocs.com, lvivier@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, libvir-list@redhat.com, quintela@redhat.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, its@irrelevant.dk, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/10/8 ÏÂÎç9:34, Kevin Wolf Ð´µÀ:
> Some network backends (vhost-user and vhost-vdpa) work only with
> specific devices. At startup, they second guess what the command line
> option handling will do and error out if they think a non-virtio device
> will attach to them.
>
> This second guessing is not only ugly, it can lead to wrong error
> messages ('-device floppy,netdev=foo' should complain about an unknown
> property, not about the wrong kind of network device being attached) and
> completely ignores hotplugging.
>
> Add a callback where backends can check compatibility with a device when
> it actually tries to attach, even on hotplug.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   include/net/net.h                | 2 ++
>   hw/core/qdev-properties-system.c | 6 ++++++
>   2 files changed, 8 insertions(+)
>
> diff --git a/include/net/net.h b/include/net/net.h
> index 5d1508081f..986288eb07 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -62,6 +62,7 @@ typedef struct SocketReadState SocketReadState;
>   typedef void (SocketReadStateFinalize)(SocketReadState *rs);
>   typedef void (NetAnnounce)(NetClientState *);
>   typedef bool (SetSteeringEBPF)(NetClientState *, int);
> +typedef bool (NetCheckPeerType)(NetClientState *, ObjectClass *, Error **);
>   
>   typedef struct NetClientInfo {
>       NetClientDriver type;
> @@ -84,6 +85,7 @@ typedef struct NetClientInfo {
>       SetVnetBE *set_vnet_be;
>       NetAnnounce *announce;
>       SetSteeringEBPF *set_steering_ebpf;
> +    NetCheckPeerType *check_peer_type;
>   } NetClientInfo;
>   
>   struct NetClientState {
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> index e71f5d64d1..a91f60567a 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -431,6 +431,12 @@ static void set_netdev(Object *obj, Visitor *v, const char *name,
>               goto out;
>           }
>   
> +        if (peers[i]->info->check_peer_type) {
> +            if (!peers[i]->info->check_peer_type(peers[i], obj->class, errp)) {
> +                goto out;
> +            }
> +        }
> +
>           ncs[i] = peers[i];
>           ncs[i]->queue_index = i;
>       }


