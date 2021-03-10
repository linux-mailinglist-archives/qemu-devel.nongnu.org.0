Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FCF33450F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:23:09 +0100 (CET)
Received: from localhost ([::1]:42482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2Y8-0004qP-N4
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lK25Y-00044I-LG
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:53:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lK25X-0004dp-3C
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:53:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615395214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EHDkg8X3JqISqc02e7S+AlXSe+w0fPHjVOSMgsH/hQ0=;
 b=CKmgSnpKFvLGJROibFPoI2WhdvvwiLB8xfLdBFG7qg03ZmqhYtAaVutqSalYdP1VcDqZgM
 9sT86phtr59dxEqokVPuuTWnByeOK6hOD7Wejo6+wQtlsf9smN6L1n3UFNRe+kZe00So1W
 GBxcqHAfG/6NUR5ey+VNBgxRF6XLgpo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-XDRz846wPZSxg9bS4OIcyQ-1; Wed, 10 Mar 2021 11:53:31 -0500
X-MC-Unique: XDRz846wPZSxg9bS4OIcyQ-1
Received: by mail-wm1-f70.google.com with SMTP id z26so2910678wml.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:53:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EHDkg8X3JqISqc02e7S+AlXSe+w0fPHjVOSMgsH/hQ0=;
 b=QBRWkNMBUXjLD6J73+WkMIkSza6fpD2Ki1rXrYOY8xNfe1WrkiA6a/Z4WZLDnnm1ky
 /87QT434KqQlW0UxwCaZyV5WR1+VUp4KAnKu+x5uB7JajMPNQTjjYGREynVYnlqnWGPz
 p00gUs9sJxnLVUECALkBNcnZ4YdlnMrL/Vuyl6Ez5MsDb2gNpO3SZsehzS3FmdG8+HQs
 8/7S3fXHB/cNiyXUwFEI0byiAkckR0xHQ2xEXr2x5jEPLjIibAwSupC4yMIRoz5AuhU8
 s7eByWhvAjuYvud0Az3XkLvBQi/MVcp1MHHP5upRktCxoKLVfyL1kGC77MPkuMxy1UQO
 qDbQ==
X-Gm-Message-State: AOAM532NLUL6NLzcOv217X6UcH2jpNLv6tYvsGWBQN4X9OGk3tKAhBeO
 UJ0/S26n5OPpUh/wASjVXfrETaptQaOla3fQpJtCfGF5ubUwG0yeOBedRKEfSRyPZzrfhV+Y/vb
 7XaBAs8ta3yAWfa4=
X-Received: by 2002:a1c:7901:: with SMTP id l1mr4352846wme.114.1615395210583; 
 Wed, 10 Mar 2021 08:53:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHk0OKtjcLrZQaudPN0Q7syYx5Koe1d6NuzfT9NJrthoDcc8Fq1CMi8sEFk5Ax8GmAlsGQqQ==
X-Received: by 2002:a1c:7901:: with SMTP id l1mr4352828wme.114.1615395210350; 
 Wed, 10 Mar 2021 08:53:30 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id j11sm23155851wro.55.2021.03.10.08.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:53:30 -0800 (PST)
Date: Wed, 10 Mar 2021 17:53:27 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 5/7] net/eth: Check iovec has enough data earlier
Message-ID: <20210310165327.w27noda3nva2yfcg@steredhat>
References: <20210310160135.1148272-1-philmd@redhat.com>
 <20210310160135.1148272-6-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210310160135.1148272-6-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 05:01:33PM +0100, Philippe Mathieu-Daudé wrote:
>We want to check fields from ip6_ext_hdr_routing structure
>and if correct read the full in6_address. Let's directly check
>if our iovec contains enough data for everything, else return
>early.
>
>Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> net/eth.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/net/eth.c b/net/eth.c
>index e870d02b0df..28cdc843a69 100644
>--- a/net/eth.c
>+++ b/net/eth.c
>@@ -409,7 +409,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
>     size_t input_size = iov_size(pkt, pkt_frags);
>     size_t bytes_read;
>
>-    if (input_size < ext_hdr_offset + sizeof(*ext_hdr)) {
>+    if (input_size < ext_hdr_offset + sizeof(*rthdr) + sizeof(*dst_addr)) {
>         return false;
>     }

If you have to respin, maybe we should also fix the offset in 
iov_to_buf() in this patch and queue it for stable:

@@ -415,7 +415,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
  
      if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
          bytes_read = iov_to_buf(pkt, pkt_frags,
-                                ext_hdr_offset + sizeof(*ext_hdr),
+                                ext_hdr_offset + sizeof(*rthdr),
                                  dst_addr, sizeof(*dst_addr));
  
          return bytes_read == sizeof(*dst_addr);

Otherwise:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


