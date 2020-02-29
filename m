Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B33F174489
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Feb 2020 03:47:40 +0100 (CET)
Received: from localhost ([::1]:56556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7sAF-0003gG-Al
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 21:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42740)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7s6i-00076x-EH
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 21:44:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7s6h-0003C9-Gi
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 21:44:00 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:52087)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7s6h-0003AZ-B5
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 21:43:59 -0500
Received: by mail-pj1-x1031.google.com with SMTP id fa20so2037279pjb.1
 for <qemu-devel@nongnu.org>; Fri, 28 Feb 2020 18:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gyGZkMpj+rKptKzAhufEEODcd3xDbylCrKGIVqFxQus=;
 b=uWS17YsviCNsgh8jF/jSG25FEsS1KRGPZuO2hVt5uvXo361D0qtV4UQGReX5fTG9lu
 Ss746eBJXVMQGBtILMWYxXIzxGnZRS3/9H/bckqSDBjX31tmkuvQbLsDtXnPrlW2zJsP
 iqna7q103QVpIPDO25avlUo7oJtkqk7cvGny6f1zfD+rShtmz2Pt3+iCdPenWjyQFDG/
 VcJIVhVJowwGen6NKxDQSnt5D3RHuOutiEAsBeSlRgaeT/BI5c50ltl0EKQtYZn1heM1
 9/T6hTD2jBT6UkvCrrx9BDF2hljKOq+zM5fCePR45wWJAnOeLVC7vHUcKR3maOOLSeMG
 eO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gyGZkMpj+rKptKzAhufEEODcd3xDbylCrKGIVqFxQus=;
 b=aLd7tP+oQ35HorjO78/o7z6ymbh2kjtJXVlb90gYGleafGhJcAwaMvDJ2G+bO/JtYA
 sYNMij7yTNAkQCdxQmu0yviULukKJnmm3QSWN/u98jb1tSAyjoqs9Li0RIEoeVoL6hcC
 7latzHtKx2n1C0EMYG3xtXRepcznfCrvPb4zncH+WsuaP1lVZLAYJbQGBv9p1LrQRW7n
 stWMx/c770bt7IvEGEWR/CNgj4MJTAUAX6hQqsTY4fp6p50ZTp3q7DRJqbSoHVjJtsMV
 tyOSaj7VIXj6pQpK7q9GWwKBgad8iWw2+dYPNLfBzspRM+Jj8ZcSFNBY2+AAvDE3KN2y
 kCNw==
X-Gm-Message-State: APjAAAWCl4WJVvu9rgz0o8/6bJmKAYb1hYpV5t0ifOHNTDKsbEktqUoM
 B/ABMnx+klRDJNob/GL900OAz5HINy0=
X-Google-Smtp-Source: APXvYqw52+dxMlfv5P25OvlpSUtYsZbcFD5DxLNkPkLFvQNNfGUrpzfstSs4z6OZLTUHkdxgMj5gxA==
X-Received: by 2002:a17:902:c20b:: with SMTP id
 11mr6119149pll.175.1582944238030; 
 Fri, 28 Feb 2020 18:43:58 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id k9sm3649321pjo.19.2020.02.28.18.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 18:43:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] accel/tcg: remove link between guest ram and TCG cache size
Date: Fri, 28 Feb 2020 18:43:45 -0800
Message-Id: <20200229024347.22826-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200229024347.22826-1-richard.henderson@linaro.org>
References: <20200229024347.22826-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1031
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
Cc: peter.maydell@linaro.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Basing the TB cache size on the ram_size was always a little heuristic
and was broken by a1b18df9a4 which caused ram_size not to be fully
realised at the time we initialise the TCG translation cache.

The current DEFAULT_CODE_GEN_BUFFER_SIZE may still be a little small
but follow-up patches will address that.

Fixes: a1b18df9a4
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-Id: <20200228192415.19867-3-alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 238b0e575b..5b66af783b 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -938,15 +938,7 @@ static inline size_t size_code_gen_buffer(size_t tb_size)
 {
     /* Size the buffer.  */
     if (tb_size == 0) {
-#ifdef USE_STATIC_CODE_GEN_BUFFER
         tb_size = DEFAULT_CODE_GEN_BUFFER_SIZE;
-#else
-        /* ??? Needs adjustments.  */
-        /* ??? If we relax the requirement that CONFIG_USER_ONLY use the
-           static buffer, we could size this on RESERVED_VA, on the text
-           segment size of the executable, or continue to use the default.  */
-        tb_size = (unsigned long)(ram_size / 4);
-#endif
     }
     if (tb_size < MIN_CODE_GEN_BUFFER_SIZE) {
         tb_size = MIN_CODE_GEN_BUFFER_SIZE;
-- 
2.20.1


