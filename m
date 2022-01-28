Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB794A2A8C
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 01:25:00 +0100 (CET)
Received: from localhost ([::1]:38226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDbY3-0001WL-Hx
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 19:24:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafy-0000qR-Uv
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:08 -0500
Received: from [2607:f8b0:4864:20::132] (port=35484
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafi-0001bR-QS
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:06 -0500
Received: by mail-il1-x132.google.com with SMTP id w5so6781416ilo.2
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0gTkuAZAhwvC63lNdvy3u7JBBQLnkso7fXqMJsrKqkM=;
 b=oc8z9NQFJ8i7T/+yQZQy+h90rFSA4b8X3Wdlp1kqjTXORlNrXU5t8ucndWSVZeKoQ0
 unj2W3aAm6HUjmrWSOnln1q2rtwkfxGqxwWNeNIoqUf3sMtDPUirfNsa7Fn0u01v7RAE
 ZXSogQLIlIOV9uY2i1M7KNqjNEGqBuOno7jyv9a3PnbGvdD94SFo2v54BnhAHeZxu15P
 VpZHyHwOZxevIgQq6t8U6zx6FsuE4DxWnxBfmLKNVhsiPst5Tf/DjR10YlICyZCXBP+r
 boqbO3qkL8l+QesUblS6/uWv8nxoch/+em6vpBTMFrK9Kped3qv7S5hljEEC7p7z69/W
 X8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0gTkuAZAhwvC63lNdvy3u7JBBQLnkso7fXqMJsrKqkM=;
 b=sTE7/bUyFvaCPIuzadJSGRAuLBWzsF6cX4fWZa7JoDc5argqZSobWrBPmhhONJEPOV
 dA6VDWMCU7ZSq5gGBOXqPzfZl/fUluZYF6go/mdz8zNgyyzNpbWXWdynV2Eyg/jn/qLY
 FQ32RjZdNJ0qm1Hjx+hd5yh+FyHQg6P0UuVZbU/aeEZjzpdeuxJ8MrstNIOFTSUdSvtt
 63kSxm2lE9KMMmwdn5r3t4btithFOukV/urbxDQKyHG58I3v1lItnHy6D2FU6yJDDG33
 0rELNrBponTWhRhxlyvJkwCqTJHRsuVg7VfTKTeJ+PFSKQC1fNbMSehfmsuy3RG+x1XZ
 9Shg==
X-Gm-Message-State: AOAM533nFnIYEw1f3mhcX0YbnASs1qfkj/qqxAe8buu4IRTemBbWikdj
 cexNaG2t71U1kcLOSrHx1Ds3SItFeW6s5w==
X-Google-Smtp-Source: ABdhPJxyTYuDPDzdu+PwA+9HGRWAP7fgjgpdywdhbPbs2w70EySU1Gq9mnDm+ui2eZQLaAvGASVGvg==
X-Received: by 2002:a05:6e02:1488:: with SMTP id
 n8mr6918330ilk.12.1643412526917; 
 Fri, 28 Jan 2022 15:28:46 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:46 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 40/40] bsd-user/freebsd/target_os_ucontext.h: Prefer env as
 arg name for CPUArchState args
Date: Fri, 28 Jan 2022 16:28:05 -0700
Message-Id: <20220128232805.86191-41-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/target_os_ucontext.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bsd-user/freebsd/target_os_ucontext.h b/bsd-user/freebsd/target_os_ucontext.h
index 41b28b2c150..b196b1c629f 100644
--- a/bsd-user/freebsd/target_os_ucontext.h
+++ b/bsd-user/freebsd/target_os_ucontext.h
@@ -36,9 +36,9 @@ abi_long set_sigtramp_args(CPUArchState *env, int sig,
                            struct target_sigframe *frame,
                            abi_ulong frame_addr,
                            struct target_sigaction *ka);
-abi_long get_mcontext(CPUArchState *regs, target_mcontext_t *mcp, int flags);
-abi_long set_mcontext(CPUArchState *regs, target_mcontext_t *mcp, int srflag);
-abi_long get_ucontext_sigreturn(CPUArchState *regs, abi_ulong target_sf,
+abi_long get_mcontext(CPUArchState *env, target_mcontext_t *mcp, int flags);
+abi_long set_mcontext(CPUArchState *env, target_mcontext_t *mcp, int srflag);
+abi_long get_ucontext_sigreturn(CPUArchState *env, abi_ulong target_sf,
                                 abi_ulong *target_uc);
 
 #endif /* TARGET_OS_UCONTEXT_H */
-- 
2.33.1


