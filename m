Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB56E3F7365
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:37:12 +0200 (CEST)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqHP-0005Wa-D8
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqFx-0002gp-9F
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:41 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqFv-0005Dr-Og
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:40 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 d22-20020a1c1d16000000b002e7777970f0so3911646wmd.3
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=znndHHEoxoWMeYC4H5uF/7NDy7y5s/e+PfCtHxh/c/4=;
 b=ObpU1rLDXh5iamhOA2vqOeowcZO2Nhm6bmenwZOCIIStdF0onSnGDhpb1hJ0jKIxso
 4b80agjk3YSo9vsiyCtlDbpRcqQjVqRy8ZUA31Nq19k5UjZpNGCdJSbB5KCICXrmWQ+f
 TmJBAJYgR99w5BuewByOsBSnKkJGEOnoLJTmHrCRCaw/40ps4xO0GKm5izvnSJ6YN6vb
 ADWKA3badzufyqV6I+22lP40rJFPZhHR620c/vnpPJd5wk4xvcVBphkPTBgxprkHiMXn
 orojj2o//JJnnehudWeOG3FNcrL4GgXGl6s6jRtAYzTKZRdrYV03sy6XxAGXsMVPg0Qp
 qnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=znndHHEoxoWMeYC4H5uF/7NDy7y5s/e+PfCtHxh/c/4=;
 b=Ubl/EZZx/IcVtnr8raTBfa3KmOBRH2FQMlFILf+VbxVRF3N2gc3TgiJvip8PUqJs1u
 ge+oQ0tZVBB45yrTorVrcm3VTjLsDHvc7akw1yHrpOUxF+WlWoStuPYW6+almTIOqpaw
 lsAOKyYvREJD3ol0QkpBqXvSM9zT4tyWGfX99y9nhOg5TluASp05dMJ29667S2WEfzPO
 JoLA+Qljlp+5BJV9fTepiqp1yKumj4yye9B6es2FmRyS9iXgf6RzU76CSaF931pUqNOL
 1yGFosJL5SHukp7EyIn+JMPZ04Al7/GK7gN7sICjOFZOXrMZni+cg0WFRAs8Nv3cG9lO
 ZDGg==
X-Gm-Message-State: AOAM5320nK6pPOzXKZa1gh3XD7HjMUisT0SGT4eK7RfhqdeStse7CRb+
 FDikNmyUjSgzltKH30ErAhbWcd0QQEt+AA==
X-Google-Smtp-Source: ABdhPJwV6yssGyO72xqWFb/6fxDbQ63XmKLUadlXQ8yup+xoBxUzbDNgU6Wx6U6bGfwNBHf67BQW/w==
X-Received: by 2002:a1c:7f94:: with SMTP id a142mr8631887wmd.34.1629887737447; 
 Wed, 25 Aug 2021 03:35:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/44] target/arm: Note that we handle VMOVL as a special case
 of VSHLL
Date: Wed, 25 Aug 2021 11:34:51 +0100
Message-Id: <20210825103534.6936-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although the architecture doesn't define it as an alias, VMOVL
(vector move long) is encoded as a VSHLL with a zero shift.
Add a comment in the decode file noting that we handle VMOVL
as part of VSHLL.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve.decode | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 595d97568eb..fa9d921f933 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -364,6 +364,8 @@ VRSHRI_U          111 1 1111 1 . ... ... ... 0 0010 0 1 . 1 ... 0 @2_shr_h
 VRSHRI_U          111 1 1111 1 . ... ... ... 0 0010 0 1 . 1 ... 0 @2_shr_w
 
 # VSHLL T1 encoding; the T2 VSHLL encoding is elsewhere in this file
+# Note that VMOVL is encoded as "VSHLL with a zero shift count"; we
+# implement it that way rather than special-casing it in the decode.
 VSHLL_BS          111 0 1110 1 . 1 .. ... ... 0 1111 0 1 . 0 ... 0 @2_shll_b
 VSHLL_BS          111 0 1110 1 . 1 .. ... ... 0 1111 0 1 . 0 ... 0 @2_shll_h
 
-- 
2.20.1


