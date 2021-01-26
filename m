Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6003303EE9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 14:40:37 +0100 (CET)
Received: from localhost ([::1]:35964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4OaC-0002PD-T3
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 08:40:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1l4OYl-0001yY-4s
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:39:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1l4OYj-0000Bh-Lq
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611668344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KxhsBT8fid1+mbCBwf1x3CIR6tIWDyu7r2d8y3TQTr8=;
 b=NkMaxgbC+junzVUTZbk26WnCYJoR6Ic2Hi1HtgnWSOkarZSqTCB3+TnWIwdey5QGVVCg2f
 RiLtP9FvoaEedNpn2hW+WtAncGXTx/by7MCbUxNEGtgwRqTS0+MqnWXoLgbeOuivN8zE9M
 /tbw4zXSqk0H/dleEoxU1PVFhrDJXuI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-GU-ghPIAPhuvA-YvaIvsdw-1; Tue, 26 Jan 2021 08:39:02 -0500
X-MC-Unique: GU-ghPIAPhuvA-YvaIvsdw-1
Received: by mail-ej1-f71.google.com with SMTP id ox17so4928933ejb.2
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 05:39:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KxhsBT8fid1+mbCBwf1x3CIR6tIWDyu7r2d8y3TQTr8=;
 b=txY6wv1utVcipJjGnptQ7fO/fBMNBpbCECLEmA49BzWB50F9+evBpCUfMQPtmiczEr
 X2VOpO9702jSolNx2j5xOkV5cUkBEFarbApL6c7r7WXDa+2wAUC4f5nJNztDdlq8RHXk
 qPx17oX6exYOc6I4t0powUjGe1+u+tiyt/2LfD5U02MqiDZEDsOiI04/AxuCzVURzIbI
 lxQFkCW43Ym0EZ9Nk/qOZOj7IxxmTD59Dp4hkZjZr1RjD5+hHEGWOoLocVNPEWEd9dl9
 uT5k8vGRnZ0bhJlUW7fo/v5XDPNpvZ7pg5RLpWZjqN8p0cbhKAjGDOzj8Szeu/mmshmG
 sctg==
X-Gm-Message-State: AOAM532hr5A+gF8IRA5XXKWQHttAngagskoweCxhqedfxA3F4+Ke9xTt
 Ud+dHYUk//sEa80sMuT+4vaAUZMIQiPL2qHlyVnBC6Sco1m6wMD9U0FffDuK8VUCBV8ydHyhN0E
 HuwQhuoKRwnbSUK0=
X-Received: by 2002:aa7:c604:: with SMTP id h4mr4643283edq.166.1611668341080; 
 Tue, 26 Jan 2021 05:39:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysGTDVB0MqV/wSsoy4NHMIdhBZPiL42S8aJW6+izfA1lHgwRCO4nFtV9fcO5HURx3QYXPmBw==
X-Received: by 2002:aa7:c604:: with SMTP id h4mr4643269edq.166.1611668340873; 
 Tue, 26 Jan 2021 05:39:00 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id p15sm9662392ejd.121.2021.01.26.05.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 05:39:00 -0800 (PST)
Date: Tue, 26 Jan 2021 14:38:57 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 1/2] net/eth: Simplify _eth_get_rss_ex_dst_addr()
Message-ID: <20210126133857.d5zprtwdwvushfti@steredhat>
References: <20210126111847.3142636-1-philmd@redhat.com>
 <20210126111847.3142636-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210126111847.3142636-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 12:18:46PM +0100, Philippe Mathieu-Daudé wrote:
>The length field is already contained in the ip6_ext_hdr structure.
>Check it direcly in eth_parse_ipv6_hdr() before calling
>_eth_get_rss_ex_dst_addr(), which gets a bit simplified.
>
>Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> net/eth.c | 14 +++++++-------
> 1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/net/eth.c b/net/eth.c
>index 1e0821c5f81..7d4dd48c1ff 100644
>--- a/net/eth.c
>+++ b/net/eth.c
>@@ -407,9 +407,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
> {
>     struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
>
>-    if ((rthdr->rtype == 2) &&
>-        (rthdr->len == sizeof(struct in6_address) / 8) &&
>-        (rthdr->segleft == 1)) {
>+    if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>
>         size_t input_size = iov_size(pkt, pkt_frags);
>         size_t bytes_read;
>@@ -528,10 +526,12 @@ bool eth_parse_ipv6_hdr(const struct iovec *pkt, int pkt_frags,
>         }
>
>         if (curr_ext_hdr_type == IP6_ROUTING) {
>-            info->rss_ex_dst_valid =
>-                _eth_get_rss_ex_dst_addr(pkt, pkt_frags,
>-                                         ip6hdr_off + info->full_hdr_len,
>-                                         &ext_hdr, &info->rss_ex_dst);
>+            if (ext_hdr.ip6r_len == sizeof(struct in6_address) / 8) {
>+                info->rss_ex_dst_valid =
>+                    _eth_get_rss_ex_dst_addr(pkt, pkt_frags,
>+                                             ip6hdr_off + info->full_hdr_len,
>+                                             &ext_hdr, &info->rss_ex_dst);
>+            }
>         } else if (curr_ext_hdr_type == IP6_DESTINATON) {
>             info->rss_ex_src_valid =
>                 _eth_get_rss_ex_src_addr(pkt, pkt_frags,
>-- 
>2.26.2
>
>


