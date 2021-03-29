Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C49534C1EC
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 04:23:48 +0200 (CEST)
Received: from localhost ([::1]:35340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQhZD-0005hj-87
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 22:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lQhY7-0005EH-3A
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 22:22:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lQhY5-0006pT-Pr
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 22:22:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616984557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKHZ46vhE4qkGs65FtNk9qFpdq4ZNWZl1+SLj00CWOA=;
 b=E1QKxe81hBVoxnLI39nDhTOug/0dUt9z8Blpxxa3FRzsEiYX/wJNz1pb1JiQ4ndnV7K1wq
 LhEM39AgolOBn8nASRzHPKG6cXcLykaz3v5gkOJHGhEjhWKvHEWJ1bC/lI3YV8CIE1fkXY
 wa1FlHbEiHtsVRFEqHg0FOQ/dN4mEOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-oC3kAQSlMUKkbUuBPRb63Q-1; Sun, 28 Mar 2021 22:22:35 -0400
X-MC-Unique: oC3kAQSlMUKkbUuBPRb63Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F153814338;
 Mon, 29 Mar 2021 02:22:34 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-5.pek2.redhat.com
 [10.72.13.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 662C953E35;
 Mon, 29 Mar 2021 02:22:33 +0000 (UTC)
Subject: Re: [PATCH] tap-bsd: Remove special casing for older OpenBSD releases
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
References: <YF5y+MDiK2QInFA2@humpty.home.comstyle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8571b8c8-f3ed-ef67-6ea3-2e6652a2e435@redhat.com>
Date: Mon, 29 Mar 2021 10:22:31 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YF5y+MDiK2QInFA2@humpty.home.comstyle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/3/27 ÉÏÎç7:49, Brad Smith Ð´µÀ:
> OpenBSD added support for tap(4) 10 releases ago.
>
> Remove the special casing for older releases.
>
>
> Signed-off-by: Brad Smith <brad@comstyle.com>
>
> diff --git a/net/tap-bsd.c b/net/tap-bsd.c
> index 77aaf674b1..59dfcdfae0 100644
> --- a/net/tap-bsd.c
> +++ b/net/tap-bsd.c
> @@ -35,10 +35,6 @@
>   #include <net/if_tap.h>
>   #endif
>   
> -#if defined(__OpenBSD__)
> -#include <sys/param.h>
> -#endif
> -
>   #ifndef __FreeBSD__
>   int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>                int vnet_hdr_required, int mq_required, Error **errp)
> @@ -59,11 +55,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>           if (*ifname) {
>               snprintf(dname, sizeof dname, "/dev/%s", ifname);
>           } else {
> -#if defined(__OpenBSD__) && OpenBSD < 201605


I am not sure this sis correct. My understanding is that we still need 
to use tun for old OpenBSD release.

Thanks


> -            snprintf(dname, sizeof dname, "/dev/tun%d", i);
> -#else
>               snprintf(dname, sizeof dname, "/dev/tap%d", i);
> -#endif
>           }
>           TFR(fd = open(dname, O_RDWR));
>           if (fd >= 0) {
>


