Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA31387FD7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:44:58 +0200 (CEST)
Received: from localhost ([::1]:44844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4i9-0002sK-A6
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bB-0001ns-5M
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4b0-0008BN-EG
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C7wusLwtBFDnZbn88h3Dk4owU1ZPJsD/w4Pwm7Wu00A=;
 b=R3Jmc/kIXIDv72iqJ6nKb4eE8unJRmaidBe70aozgD4PH62LAYCs/wYhIRZ05xkUJ6hh3i
 uzBB7L16gWihqCOg9yLMgGAy1Gte+eaidQIzip9KlRkwGd1Hgnu/EgcFEgaJ5s9jG48MnA
 DQt5J5w9wt6SZNWnAN+2jt1/ulTS+Ts=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-L2WMtb7zN6ajpowKZdApJw-1; Tue, 18 May 2021 14:37:31 -0400
X-MC-Unique: L2WMtb7zN6ajpowKZdApJw-1
Received: by mail-ej1-f69.google.com with SMTP id
 la2-20020a170906ad82b02903d4bcc8de3bso2753908ejb.4
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C7wusLwtBFDnZbn88h3Dk4owU1ZPJsD/w4Pwm7Wu00A=;
 b=RFFSH942J3Mz8zymdg2hen4ruzg4adVqoSaCdVPqCMTsc3ZvhtEbUpczZNguCRo8Y+
 x/bs3wK1YH5fK9DpnKqiaTcLSv/ipgtUwWFIcjT3vN8qQcLWrbN/uuJc9XfD/znTcCBJ
 7M4rVICxhIVDlINPwPcFx/CgRcWskGK+xpWbwEfrZLbkpuDT5bwQ+iV67nxBK2gJlxgC
 h9fPKI62bgx7I1IHlZ35p/r5hIInfrZIwVeyRFL1LDva6JMIqIwkAo5NZtLYehdEKm+m
 vFyorIgBENpvEvvCtekdsh91lN+P7XEwYkaI+rN9agVmvOKo0JQ2rDrKv9fEv8oxFF78
 xn5w==
X-Gm-Message-State: AOAM531Clmt6dhYC5L48FElY4GkRVhSVb8eVXG884laMrWMeXEfQTGx/
 bBDZfbWaJQz+5sxVnRCYLgcDcJcqQhgrtjD0bBuCdxd5HYKDJnup0z1VloM50Q2ed7QmFsj9ilh
 JmN8dF8Tca73hV5dmeIslD8OZglKixfqNouVCz2ro+f2Hwz7ijlBeZygpHuZPj75L
X-Received: by 2002:a17:907:960b:: with SMTP id
 gb11mr7385627ejc.123.1621363048311; 
 Tue, 18 May 2021 11:37:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4GJ3r/UfgeQk+p0MiSOfjMwt+3hEFxBreXrSEWejRCJA4FS6tLPTHeXkW+euo030mVwFZog==
X-Received: by 2002:a17:907:960b:: with SMTP id
 gb11mr7385599ejc.123.1621363048019; 
 Tue, 18 May 2021 11:37:28 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id g11sm13444419edt.85.2021.05.18.11.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:37:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/25] exec/memory: Use correct type size
Date: Tue, 18 May 2021 20:36:36 +0200
Message-Id: <20210518183655.1711377-7-philmd@redhat.com>
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

Use uint8_t for (unsigned) byte.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c8b90889241..175d7151a5d 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2305,7 +2305,7 @@ static inline uint8_t address_space_ldub_cached(MemoryRegionCache *cache,
 }
 
 static inline void address_space_stb_cached(MemoryRegionCache *cache,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint8_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     assert(addr < cache->len);
     if (likely(cache->ptr)) {
-- 
2.26.3


