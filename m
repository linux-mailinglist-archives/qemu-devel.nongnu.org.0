Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD72E50E8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 18:13:06 +0200 (CEST)
Received: from localhost ([::1]:34330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iO2D3-00039P-B3
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 12:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iO1zP-0004Nl-7E
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 11:59:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iO1zO-0000k9-1T
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 11:58:59 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38823)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iO1zN-0000jq-Rr
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 11:58:57 -0400
Received: by mail-wr1-x429.google.com with SMTP id v9so2931255wrq.5
 for <qemu-devel@nongnu.org>; Fri, 25 Oct 2019 08:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KXoO04GNj9/VSr098TFNzf6BAKdIrQZD2MWFu/UVy1g=;
 b=HHKJHKcWf9TRRFhy+XR97VTYxYycXCh6juE/SzBkAB/IGxeirezHSYdgBm3MEFeqQ0
 WBhmoV5O0AOSlCrBhNVg6VKKDIIKHDinMA2QNlYpGBAftCpLccUpW9gBXYGfF3qncTms
 y7PU2OQI89j8NDD9qFM8e1I9DMr8FNDz6tqPGwz3zvb6noEieT/iK2m+hfwk+sX2S+Dr
 cC1rZcJrrGiwgr20QRR/LlErjD1C/y9rIkVUX9maaRCtFnDj0w+sslphKOJQC/Zt48d1
 xBHVy8I+K+6TAk5p1rACVFPdNMJnxYSLYaj9+OIM040PuNWcK7KiDVfVe8A9RQHXXHpm
 xGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KXoO04GNj9/VSr098TFNzf6BAKdIrQZD2MWFu/UVy1g=;
 b=qho1le8h3LNDy3EozLAeWK7MQooHGZJav0coIidFR1Nl4jyO5wkS9Ve2VE7o/MrLKS
 WTuBxyqWVQKDqlXSevNWsjVWNYwqc+BVxz6Qebmu5f/lG3MszV0J1qlHZAe3YOwPJxIU
 +ahNyYZBiFXh+iB5+thAwnfXc064JcTaNGN5UvyAla+lmS602GrB6S4zgsj7JE1px5jQ
 1A0zmgSPVmSWW8NyCz8Fd5NdnAUx/qClYEqVQGxe4ha1iiOYIssmpA/Kzg24RX9NzwGN
 aGXPZtexysEm6rmwFbEuKOw4tObrPYugTm4NfFqTteDNs4wEOyltwrr1E9JiJaDcU8zn
 J+NQ==
X-Gm-Message-State: APjAAAUg1iGq03pRf8Y9cBAZp9RwOKF2rq74DdeRvfGQmRyy3WeGFxkE
 Zppv7zFs9o8p7hAuVpOiSH0D0VNF6MM=
X-Google-Smtp-Source: APXvYqwPOIp2MUm7Dk8RnNTjK9ZxeZph6yRnhTYvcuO2n09PZNYk3D14cXZElM/bVvQW/3/y1663rA==
X-Received: by 2002:a05:6000:351:: with SMTP id
 e17mr3541526wre.96.1572019136574; 
 Fri, 25 Oct 2019 08:58:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 65sm4218887wrs.9.2019.10.25.08.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 08:58:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] tcg/ppc/tcg-target.opc.h: Add copyright/license
Date: Fri, 25 Oct 2019 16:58:47 +0100
Message-Id: <20191025155848.17362-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025155848.17362-1-peter.maydell@linaro.org>
References: <20191025155848.17362-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Claudio Fontana <claudio.fontana@gmail.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the copyright/license boilerplate for tcg/i386/tcg-target.opc.h.
This file has had only two commits, 4b06c216826b7e4 and
d9897efa1fd3174ec, both by a Linaro engineer.
The license is MIT, since that's what the rest of tcg/ppc/ is.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tcg/ppc/tcg-target.opc.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tcg/ppc/tcg-target.opc.h b/tcg/ppc/tcg-target.opc.h
index db24a11987c..1373f77e82f 100644
--- a/tcg/ppc/tcg-target.opc.h
+++ b/tcg/ppc/tcg-target.opc.h
@@ -1,4 +1,24 @@
 /*
+ * Copyright (c) 2019 Linaro Limited
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ *
  * Target-specific opcodes for host vector expansion.  These will be
  * emitted by tcg_expand_vec_op.  For those familiar with GCC internals,
  * consider these to be UNSPEC with names.
-- 
2.20.1


