Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA02942C18F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 15:38:22 +0200 (CEST)
Received: from localhost ([::1]:35714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maeSb-0007Gp-LP
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 09:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1maeJX-0004Fh-SL; Wed, 13 Oct 2021 09:28:59 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:59266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1maeJU-0003FL-H9; Wed, 13 Oct 2021 09:28:59 -0400
Received: from [192.168.15.165] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id A4A1F21C36;
 Wed, 13 Oct 2021 13:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1634131733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXTVgk6LGrEWFCfhMWcLNkHk9L3rTBsHnZwQPqmikJE=;
 b=vKgjkoBwZ7iS8ihUw/ZrtA4A4L7qPN2daVHzJVV3WhTpY1xSHz6IpLDnUmWXNuX//dP+x4
 VSYlOUCeFO/s0EPCsiZyBlvbaesHQDZOdtPNTi9/43p406sWXp6DCAh2BMHzpZlWMptdHy
 jYs76a+RbkcrkrcoV2TikzeyN7xG3iI=
Message-ID: <c21a1f75-9d08-5708-3db3-ac54c29ec6bf@greensocs.com>
Date: Wed, 13 Oct 2021 15:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 01/15] net: Introduce NetClientInfo.check_peer_type()
Content-Language: en-US-large
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20211008133442.141332-1-kwolf@redhat.com>
 <20211008133442.141332-2-kwolf@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20211008133442.141332-2-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 libvir-list@redhat.com, jasowang@redhat.com, quintela@redhat.com,
 armbru@redhat.com, vsementsov@virtuozzo.com, its@irrelevant.dk,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/8/21 15:34, Kevin Wolf wrote:
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

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
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
> 

