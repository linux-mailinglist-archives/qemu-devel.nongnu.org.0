Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582352BFFD1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 07:14:02 +0100 (CET)
Received: from localhost ([::1]:57472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh56u-0005nX-Qg
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 01:14:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kh53v-0003T6-48
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 01:10:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kh53t-0007Le-5R
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 01:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606111852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lt/HRA6aD1ZD1bVCieoucwUneE5AprvmafpMkXqdBJ4=;
 b=dGKHBmq1ZvHSE+rx+5fHdCQQ3q4CJ99TBpI6V+dLIqI7Sh9aqrhqzJCtBBRgLPCtRt9SgO
 UWSMMS9DpsC1wmZQGPIf3QiEP6DC79dRAfXzoL9nAnVJaFBpbMX9AMrkX937kbwzI4gb/L
 16Y6hyNpFWaNUhuwqbBC1AQqvjrkhsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-wMUXa99lNYOhRNvqwbcM_Q-1; Mon, 23 Nov 2020 01:10:50 -0500
X-MC-Unique: wMUXa99lNYOhRNvqwbcM_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 405111934118;
 Mon, 23 Nov 2020 06:10:49 +0000 (UTC)
Received: from [10.72.13.199] (ovpn-13-199.pek2.redhat.com [10.72.13.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 241D219C46;
 Mon, 23 Nov 2020 06:10:42 +0000 (UTC)
Subject: Re: [RFC PATCH v2 1/5] net: Added SetSteeringEBPF method for
 NetClientState.
To: Andrew Melnychenko <andrew@daynix.com>, mst@redhat.com
References: <20201119111305.485202-1-andrew@daynix.com>
 <20201119111305.485202-2-andrew@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <883450e0-94ee-b64c-e39d-9f6ae2866593@redhat.com>
Date: Mon, 23 Nov 2020 14:10:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119111305.485202-2-andrew@daynix.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/19 下午7:13, Andrew Melnychenko wrote:
> From: Andrew <andrew@daynix.com>
>
> For now, that method supported only by Linux TAP.
> Linux TAP uses TUNSETSTEERINGEBPF ioctl.
>
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>   include/net/net.h |  2 ++
>   net/tap-bsd.c     |  5 +++++
>   net/tap-linux.c   | 13 +++++++++++++
>   net/tap-linux.h   |  1 +
>   net/tap-solaris.c |  5 +++++
>   net/tap-stub.c    |  5 +++++
>   net/tap.c         |  9 +++++++++
>   net/tap_int.h     |  1 +
>   8 files changed, 41 insertions(+)
>
> diff --git a/include/net/net.h b/include/net/net.h
> index 897b2d7595..d8a41fb010 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -60,6 +60,7 @@ typedef int (SetVnetBE)(NetClientState *, bool);
>   typedef struct SocketReadState SocketReadState;
>   typedef void (SocketReadStateFinalize)(SocketReadState *rs);
>   typedef void (NetAnnounce)(NetClientState *);
> +typedef bool (SetSteeringEBPF)(NetClientState *, int);
>   
>   typedef struct NetClientInfo {
>       NetClientDriver type;
> @@ -81,6 +82,7 @@ typedef struct NetClientInfo {
>       SetVnetLE *set_vnet_le;
>       SetVnetBE *set_vnet_be;
>       NetAnnounce *announce;
> +    SetSteeringEBPF *set_steering_ebpf;
>   } NetClientInfo;
>   
>   struct NetClientState {
> diff --git a/net/tap-bsd.c b/net/tap-bsd.c
> index 77aaf674b1..4f64f31e98 100644
> --- a/net/tap-bsd.c
> +++ b/net/tap-bsd.c
> @@ -259,3 +259,8 @@ int tap_fd_get_ifname(int fd, char *ifname)
>   {
>       return -1;
>   }
> +
> +int tap_fd_set_steering_ebpf(int fd, int prog_fd)
> +{
> +    return -1;
> +}
> diff --git a/net/tap-linux.c b/net/tap-linux.c
> index b0635e9e32..9584769740 100644
> --- a/net/tap-linux.c
> +++ b/net/tap-linux.c
> @@ -316,3 +316,16 @@ int tap_fd_get_ifname(int fd, char *ifname)
>       pstrcpy(ifname, sizeof(ifr.ifr_name), ifr.ifr_name);
>       return 0;
>   }
> +
> +int tap_fd_set_steering_ebpf(int fd, int prog_fd)
> +{
> +    if (ioctl(fd, TUNSETSTEERINGEBPF, (void *) &prog_fd) != 0) {
> +        error_report("Issue while setting TUNSETSTEERINGEBPF:"
> +                    " %s with fd: %d, prog_fd: %d",
> +                    strerror(errno), fd, prog_fd);
> +
> +       return -1;
> +    }
> +
> +    return 0;
> +}
> diff --git a/net/tap-linux.h b/net/tap-linux.h
> index 2f36d100fc..1d06fe0de6 100644
> --- a/net/tap-linux.h
> +++ b/net/tap-linux.h
> @@ -31,6 +31,7 @@
>   #define TUNSETQUEUE  _IOW('T', 217, int)
>   #define TUNSETVNETLE _IOW('T', 220, int)
>   #define TUNSETVNETBE _IOW('T', 222, int)
> +#define TUNSETSTEERINGEBPF _IOR('T', 224, int)


Let's do this in another patch.

Thanks


