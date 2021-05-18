Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223B6387FD5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:43:53 +0200 (CEST)
Received: from localhost ([::1]:43194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4h6-0001mn-6n
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bQ-0002Im-3W
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bO-0008Mu-5B
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U16c3X0rSV9FYD1KTuocNMeM8+m1WhwCWumESQ9vymU=;
 b=AbY4TjXpHgmU2bINFtOTummpdixNreTobL8m3CLIO0DtfObfekQTwAAIOox2MxP0xVyhxz
 rzDE7KjqL0DlUiIUyU6K60wGjSOaWLmFimVIEqpREUVftwfUWqLeCKwdOBQMbJwmIvbZYR
 N+adlJJkIOv1BMiGwTIBteG0OWAqyyI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-Wl4WRBZyO4OyjlkU7l4VRA-1; Tue, 18 May 2021 14:37:55 -0400
X-MC-Unique: Wl4WRBZyO4OyjlkU7l4VRA-1
Received: by mail-ed1-f71.google.com with SMTP id
 h16-20020a0564020950b029038cbdae8cbaso6236872edz.6
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U16c3X0rSV9FYD1KTuocNMeM8+m1WhwCWumESQ9vymU=;
 b=j1TgpPLfBX5qpjm34V/EbMZsdJVmDdtBC3058WkwOmffcqIjFxcbomWwz6JThEL0lk
 Yeo3eMhj45RiXzoPogqgWPBTXY0MwgWPv5DbSC3WPp4ht7zh+3njTK9MQg75pMLVoS67
 Hx7Ey/cLVuDHvUOi5Yg/Gl7u9LVu9pz45zTkPJJ6EXvGqqB+KPIb+lcOj11fdDThYr/T
 cDSUqXXdgAgSERguLAc8/ES4Xjo5BxD8yCbHiUr2bHT1rsimJP8BGdMie1xIHMhCNf+8
 8vMZMS3DJWOr69YT3DMFJee1KPkyyAOe8EN5SmG0mSgjRhpOlLcv9ZXvPRhaM/hF8DnK
 9a5A==
X-Gm-Message-State: AOAM533GgnwO1UiMTeAE5i9MlqIeWnZ4gikREcrxOvJnLqhICRWFY9Re
 lqfdoY66xHn5I5PmP4WUdsPvjkGTyW0sQNjLjSLXuez3Ql9LJqCXO1hOulASbvh+L6NA3CNWgq3
 A/QJr3cvp3WxZwct63ra9B7ysUzx1ng6MA3GGxo4ZF1bUgrUKMna7nJvEKKDmHanf
X-Received: by 2002:a17:906:1699:: with SMTP id
 s25mr7305483ejd.238.1621363073367; 
 Tue, 18 May 2021 11:37:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhWd1c84RJ4S+9JW2ul2+H0I8NejwzCUspbBhOOsaF8SM13UF0q5H99Wu5VBrk+JdwBAImCA==
X-Received: by 2002:a17:906:1699:: with SMTP id
 s25mr7305460ejd.238.1621363073197; 
 Tue, 18 May 2021 11:37:53 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b25sm13715199edv.9.2021.05.18.11.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:37:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 11/25] qemu/bswap: Use LD_CONVERT macro to emit 16-bit
 unsigned load/store code
Date: Tue, 18 May 2021 20:36:41 +0200
Message-Id: <20210518183655.1711377-12-philmd@redhat.com>
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qemu/bswap.h | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index af9b18f373d..ee86dc4ed8c 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -336,13 +336,6 @@ static inline void stb_p(void *ptr, uint8_t v)
  * of good performance.
  */
 
-static inline int lduw_he_p(const void *ptr)
-{
-    uint16_t r;
-    __builtin_memcpy(&r, ptr, sizeof(r));
-    return r;
-}
-
 static inline int ldl_he_p(const void *ptr)
 {
     int32_t r;
@@ -367,11 +360,6 @@ static inline void stq_he_p(void *ptr, uint64_t v)
     __builtin_memcpy(ptr, &v, sizeof(v));
 }
 
-static inline int lduw_le_p(const void *ptr)
-{
-    return (uint16_t)le_bswap(lduw_he_p(ptr), 16);
-}
-
 static inline int ldl_le_p(const void *ptr)
 {
     return le_bswap(ldl_he_p(ptr), 32);
@@ -392,11 +380,6 @@ static inline void stq_le_p(void *ptr, uint64_t v)
     stq_he_p(ptr, le_bswap(v, 64));
 }
 
-static inline int lduw_be_p(const void *ptr)
-{
-    return (uint16_t)be_bswap(lduw_he_p(ptr), 16);
-}
-
 static inline int ldl_be_p(const void *ptr)
 {
     return be_bswap(ldl_he_p(ptr), 32);
@@ -455,6 +438,7 @@ static inline void st ## size ## _ ## endian ## _p(void *ptr, vtype v)\
 
 ST_CONVERT(16, uint16_t, w)
 LD_CONVERT(16, int, int16_t, sw)
+LD_CONVERT(16, int, uint16_t, uw)
 
 static inline unsigned long leul_to_cpu(unsigned long v)
 {
-- 
2.26.3


