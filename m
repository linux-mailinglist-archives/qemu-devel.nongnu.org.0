Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FC0702995
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:53:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUtX-0005S9-7z; Mon, 15 May 2023 05:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyUtV-0005Rx-6J
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:53:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyUtT-00077G-PE
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684144406;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jU2ZRLdlCa+6agMlurZuAcsOfIAmMApkBEkVu3XSkLE=;
 b=ioZPpFqdqlaEARHTqIN7biJtsFak3rKvez9oGC5g2GCMgojYeH47zq+RLPKW98/ELnM8Zu
 IPb4w9T+XZXm1gHn2EeWd2D+YqGFSIB6qQGoE8qWMv38aRiBoDR4SqSrTO5GT3jUZJ7MXe
 ahQhRZWEQCG5iiHmlcVoJErs2AqUViY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-x83C5-g1Pjm8XXuUwIo0mA-1; Mon, 15 May 2023 05:53:23 -0400
X-MC-Unique: x83C5-g1Pjm8XXuUwIo0mA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC133101A553;
 Mon, 15 May 2023 09:53:22 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C223D492B00;
 Mon, 15 May 2023 09:53:21 +0000 (UTC)
Date: Mon, 15 May 2023 10:53:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Cc: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com,
 eblake@redhat.com, qemu-devel@nongnu.org,
 yuri.benditovich@daynix.com, yan@daynix.com
Subject: Re: [PATCH v2 6/6] ebpf: Updated eBPF program and skeleton.
Message-ID: <ZGIBD1ux3NrJwTbt@redhat.com>
References: <20230512122902.34345-1-andrew@daynix.com>
 <20230512122902.34345-7-andrew@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230512122902.34345-7-andrew@daynix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, May 12, 2023 at 03:29:02PM +0300, Andrew Melnychenko wrote:
> Updated section name, so libbpf should init/gues proper
> program type without specifications during open/load.
> 
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  ebpf/rss.bpf.skeleton.h | 1469 ++++++++++++++++++++-------------------
>  tools/ebpf/rss.bpf.c    |    2 +-
>  2 files changed, 741 insertions(+), 730 deletions(-)

..snip..

Can't say I've verified the big hex blob, but I'll asume its a faithful
compilation of the change below:

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


> diff --git a/tools/ebpf/rss.bpf.c b/tools/ebpf/rss.bpf.c
> index 20f227e2acc..d32b6fb42a4 100644
> --- a/tools/ebpf/rss.bpf.c
> +++ b/tools/ebpf/rss.bpf.c
> @@ -528,7 +528,7 @@ static inline __u32 calculate_rss_hash(struct __sk_buff *skb,
>      return result;
>  }
>  
> -SEC("tun_rss_steering")
> +SEC("socket")
>  int tun_rss_steering_prog(struct __sk_buff *skb)
>  {
>  
> -- 
> 2.39.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


