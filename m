Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6210387FDA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:45:43 +0200 (CEST)
Received: from localhost ([::1]:47142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4is-0004S1-R6
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4ar-0001c9-Hb
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4ap-00085y-M0
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YLH7tC7sd/ju26noenjhTGGhpMc2gBLlxO2UZKdJboA=;
 b=bcn0WThPUr8qEw1VeWtz91NCb/7cv5L1jZKi60JKusOIvqdGXHvGIH+rouG5rJa+JYAPO2
 uHJtkUb31lonlYwE/Qc6QXHUewVioMdA6Rcd0x/a0lEMwRMQLurPdbdAqud7l+USEJ1mOE
 PcH+S/tI/cLspDiwhFbdynOIsxMHvho=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-XwFVSay2NkSc5OkO8bsBAw-1; Tue, 18 May 2021 14:37:19 -0400
X-MC-Unique: XwFVSay2NkSc5OkO8bsBAw-1
Received: by mail-ed1-f72.google.com with SMTP id
 c15-20020a05640227cfb029038d710bf29cso254752ede.16
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YLH7tC7sd/ju26noenjhTGGhpMc2gBLlxO2UZKdJboA=;
 b=f6oMYTXI/V9e0A/JgjjT3Q9Dh4wuitSvfJhJajeR9bkROk6QaskFbY2Me2ATFMgHV3
 PIRE/OU979zo6nHrKehKWpFrJT9bB5JEjqcXV6VoNffHxSrc0Tv/un6QTl4XayDU60Y+
 1DCBODGBLS7r+zCA3EHY4e0avuwfPyvozcqys3lO4cwIGrmt+SiB7GDiDo9R6odJ+l9T
 +EHPwYJ2brqrwgApBOSWF+Tpf9LEjeUNhdqMAfo5rdS0PUZf3OeQ+OIZDAtV8dyGjJDX
 6mKQ6cEyGoooBBTeK6olaqWAjz4qFDt9smjko7IzpRX7x94lNvTquk/P6nrdVVWI54TR
 7iAQ==
X-Gm-Message-State: AOAM530dLD5/d/VrU3LKKEU40ROCPJVlcHCFJ96vI35wzrmfuLkbEnIy
 LEe2c3eqDXZ/mO64vvEsjSPtkAKXpDp3hs6l1LvANRArPkfYnww0Q6KuRtU+yzRRyPfBBfaleYC
 ixe9MlLxit9b8E+gX0IOJgrL8YDmPjAzT4aB7Gp+61ewBN7xP5mF1sHtjX3FnvFYa
X-Received: by 2002:a17:906:2b4b:: with SMTP id
 b11mr7451848ejg.379.1621363038250; 
 Tue, 18 May 2021 11:37:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/LdkZ2ZlBydKFNzHlPnIZ1OrnCGCaOeoOetmr9AHzezUlYe6gVD+JCn2t7ydjlCw8lZOjTg==
X-Received: by 2002:a17:906:2b4b:: with SMTP id
 b11mr7451825ejg.379.1621363038013; 
 Tue, 18 May 2021 11:37:18 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id g13sm3993451ejr.63.2021.05.18.11.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:37:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 04/25] exec/memory_ldst_phys: Use correct type sizes
Date: Tue, 18 May 2021 20:36:34 +0200
Message-Id: <20210518183655.1711377-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518183655.1711377-1-philmd@redhat.com>
References: <20210518183655.1711377-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use uint8_t for (unsigned) byte, and uint16_t for (unsigned)
16-bit word.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory_ldst_phys.h.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/exec/memory_ldst_phys.h.inc b/include/exec/memory_ldst_phys.h.inc
index 4033795add7..ecd678610d1 100644
--- a/include/exec/memory_ldst_phys.h.inc
+++ b/include/exec/memory_ldst_phys.h.inc
@@ -20,7 +20,7 @@
  */
 
 #ifdef TARGET_ENDIANNESS
-static inline uint32_t glue(lduw_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
+static inline uint16_t glue(lduw_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_lduw, SUFFIX)(ARG1, addr,
                                             MEMTXATTRS_UNSPECIFIED, NULL);
@@ -38,7 +38,7 @@ static inline uint64_t glue(ldq_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
                                            MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline void glue(stw_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
+static inline void glue(stw_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint16_t val)
 {
     glue(address_space_stw, SUFFIX)(ARG1, addr, val,
                                     MEMTXATTRS_UNSPECIFIED, NULL);
@@ -56,19 +56,19 @@ static inline void glue(stq_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint64_t val)
                                     MEMTXATTRS_UNSPECIFIED, NULL);
 }
 #else
-static inline uint32_t glue(ldub_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
+static inline uint8_t glue(ldub_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_ldub, SUFFIX)(ARG1, addr,
                                             MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline uint32_t glue(lduw_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
+static inline uint16_t glue(lduw_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_lduw_le, SUFFIX)(ARG1, addr,
                                                MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline uint32_t glue(lduw_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
+static inline uint16_t glue(lduw_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_lduw_be, SUFFIX)(ARG1, addr,
                                                MEMTXATTRS_UNSPECIFIED, NULL);
@@ -98,19 +98,19 @@ static inline uint64_t glue(ldq_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
                                               MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline void glue(stb_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
+static inline void glue(stb_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint8_t val)
 {
     glue(address_space_stb, SUFFIX)(ARG1, addr, val,
                                     MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline void glue(stw_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
+static inline void glue(stw_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint16_t val)
 {
     glue(address_space_stw_le, SUFFIX)(ARG1, addr, val,
                                        MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline void glue(stw_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
+static inline void glue(stw_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint16_t val)
 {
     glue(address_space_stw_be, SUFFIX)(ARG1, addr, val,
                                        MEMTXATTRS_UNSPECIFIED, NULL);
-- 
2.26.3


