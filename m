Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7E159779C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 22:16:45 +0200 (CEST)
Received: from localhost ([::1]:49704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOPT2-0003CZ-Rg
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 16:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPJB-0003Mn-2P
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPJ9-0000JO-MI
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660766790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dumk1EQg5Ag6vu8AL5g6B95ji6VBlJBMEnXMduaUodE=;
 b=dABd/0/K6n0Hf6+O3bplNyaJDJqpUMAg+5tB5dLoeBcHjJAE3eVVaVD2V+p6ZRXT+pgtGK
 FSfKEQ44pPvvedzq600r6v3BK83Y7AjoTqzENFQZT0PZmFX7Dv4kKu7oZ4up4PpEWZU5Id
 uk7TzJJabv75y/bOXUj1M3egU9uI/uk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-0FbmhPlNPw22ZHkW8l35uQ-1; Wed, 17 Aug 2022 16:06:29 -0400
X-MC-Unique: 0FbmhPlNPw22ZHkW8l35uQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 f7-20020a1c6a07000000b003a60ede816cso616998wmc.0
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 13:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Dumk1EQg5Ag6vu8AL5g6B95ji6VBlJBMEnXMduaUodE=;
 b=l+OY8k5EKd3ryEEB8AuU1el1IdGZEbBfq9jm0ryrJKMWDf49WfvzCN2O5FCleO+lYY
 twveYO+d+LLqJ3NNKxcnHRA4DQi1MQwHa33HtaC+oH4sjAivkM6watkABgUNqCIApz7X
 zv0swrvSaZ3DDsWpvVadvXgru1qOKM2BV+V89Eq9I9ANdo9sto7498li85jcneQeu0cd
 vBuRMxsDMMeE0lp0EvsTupqWVQeheQmqTT4+GJFgfzJEzYKbdjXT6ankRKXCDCs3qUk6
 siSB8MqDRObIWQaEIGilcfOwWbBR1iVlsLrxWxhNfvohGk2uj61pYGk+tIsYijapZljr
 v/Gg==
X-Gm-Message-State: ACgBeo1j7UdW36P+In3tIs/AwebBsGUHr7AonQp1kordYZIEW+szA99q
 /Rs2jQ/SU5MVjaSoYU7wnF+1BJgJuzN2y+PQBit0KfMyQZ1fOINlqTyX0iyd9EX2Z71OR+BDU0W
 U7qntZyP/co30tTJ876qdBEG2i/umYd1IKK4ByCr3iPh1hL/1QD1P4+vTA7D5
X-Received: by 2002:a5d:634f:0:b0:225:2ab4:d539 with SMTP id
 b15-20020a5d634f000000b002252ab4d539mr910962wrw.149.1660766787679; 
 Wed, 17 Aug 2022 13:06:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4n55/kBZDJXtsB8wbcMdm+czA81NyKpCJHPIfkXzAcdxUltnZcN735X2uH+vYTlS1AFmxO3w==
X-Received: by 2002:a5d:634f:0:b0:225:2ab4:d539 with SMTP id
 b15-20020a5d634f000000b002252ab4d539mr910948wrw.149.1660766787322; 
 Wed, 17 Aug 2022 13:06:27 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 q1-20020a05600c030100b003a331c6bffdsm2974368wmd.47.2022.08.17.13.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:06:26 -0700 (PDT)
Date: Wed, 17 Aug 2022 16:06:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 10/12] hw/cxl: Correctly handle variable sized mailbox input
 payloads.
Message-ID: <20220817200536.350795-11-mst@redhat.com>
References: <20220817200536.350795-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817200536.350795-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

A placeholder of ~0 is used to indicate variable payload size.
Whilst the checks for output payload correctly took this into
account, those for input payload did not.

This results in failure of the Set LSA command.

Fixes: 464e14ac43 ("hw/cxl/device: Implement basic mailbox (8.2.8.4)")
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220817145759.32603-4-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/cxl/cxl-mailbox-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 3cea8b17a8..bc1bb18844 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -425,7 +425,7 @@ void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
     cxl_cmd = &cxl_cmd_set[set][cmd];
     h = cxl_cmd->handler;
     if (h) {
-        if (len == cxl_cmd->in) {
+        if (len == cxl_cmd->in || cxl_cmd->in == ~0) {
             cxl_cmd->payload = cxl_dstate->mbox_reg_state +
                 A_CXL_DEV_CMD_PAYLOAD;
             ret = (*h)(cxl_cmd, cxl_dstate, &len);
-- 
MST


