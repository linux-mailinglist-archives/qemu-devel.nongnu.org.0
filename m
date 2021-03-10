Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5993344DA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:12:09 +0100 (CET)
Received: from localhost ([::1]:48624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2NU-0002AM-Oj
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lK1za-0006Uq-6M
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:47:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lK1zY-0002Qc-Lp
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615394844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GtwrLMyFvm3y/aDOJrVBmn73PCZazXnsPxq1nHXEoHQ=;
 b=IHhjD579BB5GEOBtpp/owhnD6H3MkGMQ5m0mkwSSWZfDrR7WqkC+zHAjO9TxB8+Msowvko
 Bzi4Cstlos8frTCgR+kxwkX/2uDUfSXjDZMnbrJCOIdhG4Rx3wkJGMTRn8H42wCLH6OpYT
 JdI47xZbZwbBmtLD6tgU/cVl4EULifo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-2JKwjWoRNgSt6UYKTRnFWA-1; Wed, 10 Mar 2021 11:47:22 -0500
X-MC-Unique: 2JKwjWoRNgSt6UYKTRnFWA-1
Received: by mail-wm1-f71.google.com with SMTP id a65so1270645wmh.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GtwrLMyFvm3y/aDOJrVBmn73PCZazXnsPxq1nHXEoHQ=;
 b=sen+a0HDU4ydRpSWYVudzYh/TuwEbsF/3UVwcnwD448uqTJ/DVtnajBIc/xefSdomd
 xcwEBAiQ9MC5wYvtDdfMv8oHPDJgJQfrF+4OU8UVQfjlGPCKxgf6ln8r5yxQ+TqooEya
 2OhLsQC0bvKGrNvjkiQeF+Wg0LP34OtjAqjt+01KA3MAJ09/h2rhUj7NHXx4ulY7DZBl
 mUHJeygtVawGJEMG7lEW7ak0U5rkB+1wQCoULsIWldXI8crcs6gceLmu36XFLM9dNpin
 BIT8BQ+Ul+wEcBiRyZR8CQZ95NNXtgNA7NadUnBQkS05j/EQ58UbDgOY2gIfzq6c6CqM
 Wmfg==
X-Gm-Message-State: AOAM5324omcmkNBTfmS7zGjTaAM8MWVSJrRzxCNwI2M8YNGo0Vwb2lYy
 a+N+k2ShgnI6rWe/FVSrcWNEr0pxcBp/uJZj8A6kfp8KzSMIHLHAHDTILKO2Li0cff4OIx8zKQc
 hbFhE/hKft5eyfsg=
X-Received: by 2002:adf:f78f:: with SMTP id q15mr4316878wrp.383.1615394841210; 
 Wed, 10 Mar 2021 08:47:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbcputMpirCbf3jJ6RS1QVsqJMBzKgK2Tnjv9Af9ce9KRachiZrwEKJ+844+czDQ+qFLW1LA==
X-Received: by 2002:adf:f78f:: with SMTP id q15mr4316867wrp.383.1615394841074; 
 Wed, 10 Mar 2021 08:47:21 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id m17sm30820021wrx.92.2021.03.10.08.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:47:20 -0800 (PST)
Date: Wed, 10 Mar 2021 17:47:18 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 4/7] net/eth: Check the size earlier
Message-ID: <20210310164718.62pco4jyvq2o5735@steredhat>
References: <20210310160135.1148272-1-philmd@redhat.com>
 <20210310160135.1148272-5-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210310160135.1148272-5-philmd@redhat.com>
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

On Wed, Mar 10, 2021 at 05:01:32PM +0100, Philippe Mathieu-Daudé wrote:
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> net/eth.c | 14 ++++++--------
> 1 file changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/net/eth.c b/net/eth.c
>index 7c47a267a7a..e870d02b0df 100644
>--- a/net/eth.c
>+++ b/net/eth.c
>@@ -406,16 +406,14 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
>                         struct in6_address *dst_addr)
> {
>     struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
>+    size_t input_size = iov_size(pkt, pkt_frags);
>+    size_t bytes_read;
>+
>+    if (input_size < ext_hdr_offset + sizeof(*ext_hdr)) {
>+        return false;
>+    }
>
>     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>-
>-        size_t input_size = iov_size(pkt, pkt_frags);
>-        size_t bytes_read;
>-
>-        if (input_size < ext_hdr_offset + sizeof(*ext_hdr)) {
>-            return false;
>-        }
>-
>         bytes_read = iov_to_buf(pkt, pkt_frags,
>                                 ext_hdr_offset + sizeof(*ext_hdr),
>                                 dst_addr, sizeof(*dst_addr));
>-- 
>2.26.2
>


