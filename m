Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928DA3338DF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 10:35:53 +0100 (CET)
Received: from localhost ([::1]:52988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvFw-0002fw-Gy
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 04:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lJvCg-0008Vs-E2
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:32:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lJvCa-00004x-5C
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:32:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615368743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rhaTaGHz+Xs/ZD8AuUWEaYmzNscQ+yjG1Dpt/UboDws=;
 b=gFNHVRmJCfoFOj/SNGSlZ1DRw0LKHvk/rJsUfiOtO9U8tS/ctxFA7H2zqhSZeqwMtsv1ty
 kpbbGLMr3iQkyJG0YheWOBMbD/3jezMvHzZLupZHIlKWg2rzc0mJrbA63DE38E1UCEmp6K
 bNeXO77fMZvxHqvxt5JI8ccuXL5P8SE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-u26jFXczNWmp67ku2rtf3g-1; Wed, 10 Mar 2021 04:32:20 -0500
X-MC-Unique: u26jFXczNWmp67ku2rtf3g-1
Received: by mail-wm1-f70.google.com with SMTP id n2so2417143wmi.2
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 01:32:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rhaTaGHz+Xs/ZD8AuUWEaYmzNscQ+yjG1Dpt/UboDws=;
 b=dwgOGNWMVQbRC2dGU/Kkn1Zm0adPSQssarJ7mUGbR5gNgHTZPYZPoP90tuxLoh/kF1
 9JyfrdhraxCvQtI669BVSKBCjPWrLUolxCQDxjDf+18l/Xu7MmF2BWjSuQk55YTETNbs
 lfxrPkcbdO1ZPnxcjW8tBEyYT+fPNV8icPndImBZ8FK3H50Zhye1dDIMo22Q/1syffRB
 YmyW6wc6EXtcdYGYfEaYslTRqlW0IAwns8y/jJViJRLI6Zdo64sk/z6jilxl/FY/VIRr
 CsyPBQzvl6/07fd1qTsUORqmNfHObvhNfCQusMpDslraURxLC7Qdg9To14Y2SFjQOzIr
 9erA==
X-Gm-Message-State: AOAM532XHZ5snFI/yNLO7fU8PNUGX702HLxTbL69Bfzw786KF5jx3zy0
 YgRX2G+Jzv+j7A7bbQMZlXkSUihWHMIa+RrNq4umlo5lk6pkVnhP1Czu4A2MR/tD6hKOjgYDRwZ
 dDNZkWw/aa3Hq6a0=
X-Received: by 2002:a1c:cc04:: with SMTP id h4mr2373618wmb.142.1615368739413; 
 Wed, 10 Mar 2021 01:32:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvNw/7priBvCWo5CSuQdURBEpB0UwAJWySlgTR3Mg29HpCegQJzBG7tIBu12/GmxOIS0aDyw==
X-Received: by 2002:a1c:cc04:: with SMTP id h4mr2373608wmb.142.1615368739238; 
 Wed, 10 Mar 2021 01:32:19 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id 75sm8710677wma.23.2021.03.10.01.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 01:32:18 -0800 (PST)
Date: Wed, 10 Mar 2021 10:32:16 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 6/6] net/eth: Return earlier in
 _eth_get_rss_ex_dst_addr()
Message-ID: <20210310093216.qsghuz3dsgwstie6@steredhat>
References: <20210309182709.810955-1-philmd@redhat.com>
 <20210309182709.810955-7-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210309182709.810955-7-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 07:27:09PM +0100, Philippe Mathieu-Daudé wrote:
>Slightly simplify _eth_get_rss_ex_dst_addr() by returning earlier.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> net/eth.c | 16 +++++++---------
> 1 file changed, 7 insertions(+), 9 deletions(-)
>
>diff --git a/net/eth.c b/net/eth.c
>index e984edcfb0b..b44439d31c5 100644
>--- a/net/eth.c
>+++ b/net/eth.c
>@@ -407,23 +407,21 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
> {
>     size_t input_size = iov_size(pkt, pkt_frags);
>     struct ip6_ext_hdr_routing *rthdr;
>+    size_t bytes_read;
>
>     if (input_size < ext_hdr_offset + sizeof(*rthdr)) {
>         return false;
>     }
>     rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
>
>-    if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>-        size_t bytes_read;
>-
>-        bytes_read = iov_to_buf(pkt, pkt_frags,
>-                                ext_hdr_offset + sizeof(*ext_hdr),
>-                                dst_addr, sizeof(*dst_addr));
>-
>-        return bytes_read == sizeof(*dst_addr);
>+    if ((rthdr->rtype != 2) || (rthdr->segleft != 1)) {
>+        return false;
>     }
>
>-    return false;
>+    bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset + sizeof(*ext_hdr),
>+                            dst_addr, sizeof(*dst_addr));

Pre-existing issue, but looking at the Routing extension header format 
[1], I think the offset we're using here is wrong.

I had a doubt if the address started at ext_hdr_offset + 4 or 
ext_hdr_offset + 8 but looking in the linux code I think the offset we 
should use is ext_hdr_offset + sizeof(*rthdr).

This is the structure that I found in include/uapi/linux/ipv6.h:

     /*
      *	routing header type 2
      */

     struct rt2_hdr {
     	struct ipv6_rt_hdr	rt_hdr;
     	__u32			reserved;
     	struct in6_addr		addr;

     #define rt2_type		rt_hdr.type
     };

Thanks,
Stefano

[1] https://en.wikipedia.org/wiki/IPv6_packet#Routing


