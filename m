Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA786334511
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:24:34 +0100 (CET)
Received: from localhost ([::1]:47952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2ZV-0007Hi-Sa
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lK2Ci-0001GV-Fr
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:01:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lK2CZ-0007EM-3K
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:01:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615395642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=McVQbvGH9CyDuXDKiekvj4Td9XwfNsdd8f6uZZkl0YM=;
 b=EdF2o35Zaqkjj3yFlCL09KZSDgzXBrj2UlpvtTjdMZJcwQhUPFrYzXbtKyNWbeyQ4PVZHQ
 RbJMDTQFPnryY1YOpGtx0EiHzNTe4SeK3oNTfYPYLm9JzUDq5B/w3mLebrO8DsOWU9rWc/
 DLS5rLqkiHp/ORgzYvtn5EEFfscRsiY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-pY9vD701OBWwYjUi1jzy9Q-1; Wed, 10 Mar 2021 12:00:40 -0500
X-MC-Unique: pY9vD701OBWwYjUi1jzy9Q-1
Received: by mail-wr1-f69.google.com with SMTP id f3so8239873wrt.14
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:00:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=McVQbvGH9CyDuXDKiekvj4Td9XwfNsdd8f6uZZkl0YM=;
 b=SiWRXk4tfqIlATFI+K/XxVx6WhePI+ANLG6Nv0ooBV+eoQJBjIPqUpnYFnvi7PZq2s
 UQmA61KMabkvgHoeY+lT3rF5Hxsy9SLPHivtV6OG9trudUhiHGUdplKKDWI6m7sJXpo8
 kSRAavIZSagDpUvVoKNhTNq/B0Apm4bQhoQVIFnVmw8KLjgjFH3zC1W6jBRmJMShl8NE
 NK2V3BQT+lzKQwW1G80RwHYG65ft2XIZznWh0mz1RAPfhagAbf+Qd32ACI+cxVWTynpT
 eGxxAVbOmyVmTXbxJhsiE8EcCwLaQvXhpbgconN3QbcWa5mSgSXMTroy3NldwvkbrnrQ
 2xVQ==
X-Gm-Message-State: AOAM530S0iCNTUqmhcZvOsmo1Z//tDgxubgTp71rr4Y3IWdeS1fnkFiz
 cz8NOelhachPJT9+Yvn9GijHyT75r73yO6duSNOlOcXS1KQsh3sMcOmjSqbky96/ToTA+HaZzaK
 wTnXvBek46XLbDm8=
X-Received: by 2002:a05:6000:124f:: with SMTP id
 j15mr4501649wrx.263.1615395637312; 
 Wed, 10 Mar 2021 09:00:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHnXOdYCawjVOkaWiTxiyIUgjQ3oiHf8kujh0k2a3zZ5OWGXsL6xx4gwlPrzmZI6ZWOea8mQ==
X-Received: by 2002:a05:6000:124f:: with SMTP id
 j15mr4501508wrx.263.1615395635731; 
 Wed, 10 Mar 2021 09:00:35 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id b15sm29497wmd.41.2021.03.10.09.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 09:00:35 -0800 (PST)
Date: Wed, 10 Mar 2021 18:00:33 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 7/7] net/eth: Add an assert() and invert if()
 statement to simplify code
Message-ID: <20210310170033.2zjvusdjqyf2eowa@steredhat>
References: <20210310160135.1148272-1-philmd@redhat.com>
 <20210310160135.1148272-8-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210310160135.1148272-8-philmd@redhat.com>
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

On Wed, Mar 10, 2021 at 05:01:35PM +0100, Philippe Mathieu-Daudé wrote:
>To simplify the function body, invert the if() statement, returning
>earlier.
>Since we already checked there is enough data in the iovec buffer,
>simply add an assert() call to consume the bytes_read variable.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> net/eth.c | 14 ++++++--------
> 1 file changed, 6 insertions(+), 8 deletions(-)
>
>diff --git a/net/eth.c b/net/eth.c
>index b150d73c13a..c0a5ca12be2 100644
>--- a/net/eth.c
>+++ b/net/eth.c
>@@ -416,16 +416,14 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
>     bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset,
>                             &rt_hdr, sizeof(rt_hdr));
>     assert(bytes_read == sizeof(rt_hdr));
>-
>-    if ((rt_hdr.rtype == 2) && (rt_hdr.segleft == 1)) {
>-        bytes_read = iov_to_buf(pkt, pkt_frags,
>-                                ext_hdr_offset + sizeof(*ext_hdr),
>-                                dst_addr, sizeof(*dst_addr));
>-
>-        return bytes_read == sizeof(*dst_addr);
>+    if ((rt_hdr.rtype != 2) || (rt_hdr.segleft != 1)) {
>+        return false;
>     }
>+    bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset + sizeof(rt_hdr),

If we add the offset fix in patch 5 this patch is fine, otherwise we 
should mention the fix here in the commit message (and queue this for 
stable?).

With that fixed:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

>+                            dst_addr, sizeof(*dst_addr));
>+    assert(bytes_read == sizeof(*dst_addr));
>
>-    return false;
>+    return true;
> }
>
> static bool
>-- 
>2.26.2
>


