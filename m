Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83411669E29
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:32:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMFe-00019R-7Y; Fri, 13 Jan 2023 10:45:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFc-00018O-6g
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:45:52 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFa-0005n2-Jl
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:45:51 -0500
Received: by mail-wr1-x429.google.com with SMTP id r2so21452224wrv.7
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pvYLGALX7rNfkYIcU44tpI5yU5Uu3TIO2nPnZ6uyyWs=;
 b=feyTSx0K5N2sG8a5FKNHH/NjCWtn0ene4mufiRXyE4axWlzF5myKcmi+/u8w8m/R0b
 crc30bYeBdp9ZuPPycBOxIOcEbI7LZ+8X+9elag0JDtcQUXA5kxvGNcyXamyv7hJmTsM
 f/n3tNlg6smT1DwXYjF78DQT0LUMjddoyZg2lYXD4k1pgDzMoZEDO/hjJfknhCFTDHU5
 N1k506Ic3BrWyzf0dPAWNqb3AQLFLJxJAGuOdgk7zXy7TXKql1VO8aF6GgNpi0xY8gVP
 VxIzSbQZeulSkNCYsFZarrKQEtTwdL/o6J5oSrgSq7waeUUzIwEEK7MlJrCUm2+opAHR
 0yMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvYLGALX7rNfkYIcU44tpI5yU5Uu3TIO2nPnZ6uyyWs=;
 b=poUTCeiLM4LlBhPCXb6mftg0gS903/X+5zWWIiDT9vo8mE7EfeRnKQoErcSxiMCK12
 wONZxBXIWLQXWwTYlUllb3+2SRZuOOaDjk0QZOqx/aVImsh8kRtLPhblfIMafvArdRZ3
 zywJPnyphquXrjzePS/UJfb6fOYSZoDy9VLiZJYcXqTopByRZhm0OnvWJwz/urZ6JZ3C
 oBSeAb9r6pT0vd55ziVmNEOJeolsZNBYt57A29i+HB0C/RNxkl7XIG6AF9JezsO6y4vW
 n9N1/UODjSqTA2AKAmjlW8ywRxbMyilGvsJJu42Av0qCcl8+yOKw1lLeibWehU4RT+Gq
 pEEA==
X-Gm-Message-State: AFqh2kq2fZuNX+ypBECi8CkpyZyadHsgVmEIH1i/o+d4c8yI+zMbaX9n
 dFHDDqPJ7z/qZ29IP2FO+p6ChRhmbuO9F0Lj
X-Google-Smtp-Source: AMrXdXun9C0mEmk3fHFCd+0J3uJxk6AUWW32vhxnhIFBUrl3kpsOkce53FnZlX9o5FJi0v0F9QwOxw==
X-Received: by 2002:a5d:6e07:0:b0:242:285:6b39 with SMTP id
 h7-20020a5d6e07000000b0024202856b39mr51676173wrz.50.1673624748942; 
 Fri, 13 Jan 2023 07:45:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a056000024500b00267bcb1bbe5sm19729768wrz.56.2023.01.13.07.45.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:45:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 03/46] hw/mips/gt64xxx_pci: Accumulate address space changes
Date: Fri, 13 Jan 2023 16:44:49 +0100
Message-Id: <20230113154532.49979-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Single registers access in ISD can produce multiple changes
in the address spaces. To reduce computational effort,
accumulate these as a single memory transaction.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230104133935.4639-5-philmd@linaro.org>
---
 hw/mips/gt64xxx_pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 164866cf3e..65416c7b27 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -282,6 +282,8 @@ static void gt64120_isd_mapping(GT64120State *s)
     hwaddr start = ((hwaddr)s->regs[GT_ISD] << 21) & 0xFFFE00000ull;
     hwaddr length = 0x1000;
 
+    memory_region_transaction_begin();
+
     if (s->ISD_length) {
         memory_region_del_subregion(get_system_memory(), &s->ISD_mem);
     }
@@ -292,10 +294,14 @@ static void gt64120_isd_mapping(GT64120State *s)
     s->ISD_start = start;
     s->ISD_length = length;
     memory_region_add_subregion(get_system_memory(), s->ISD_start, &s->ISD_mem);
+
+    memory_region_transaction_commit();
 }
 
 static void gt64120_pci_mapping(GT64120State *s)
 {
+    memory_region_transaction_begin();
+
     /* Update PCI0IO mapping */
     if ((s->regs[GT_PCI0IOLD] & 0x7f) <= s->regs[GT_PCI0IOHD]) {
         /* Unmap old IO address */
@@ -354,6 +360,8 @@ static void gt64120_pci_mapping(GT64120State *s)
                                         &s->PCI0M1_mem);
         }
     }
+
+    memory_region_transaction_commit();
 }
 
 static int gt64120_post_load(void *opaque, int version_id)
-- 
2.38.1


