Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB48749A3CB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 03:03:53 +0100 (CET)
Received: from localhost ([::1]:49780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCBBZ-0003Rr-2Q
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 21:03:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfd-0002Lx-ON
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:53 -0500
Received: from [2607:f8b0:4864:20::d34] (port=35754
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfL-0001ip-DV
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:43 -0500
Received: by mail-io1-xd34.google.com with SMTP id 9so6250672iou.2
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A1ZBzgH8dEhST4JS/JsP+0ckGcGlmqn92Dci6AKt6gs=;
 b=JBnpK3lpc6yP1mY5x8N3AKuqdlGNR5NkhPPrckkpzSgem0FByaYDKR9KU/qxDqbTOU
 D0zUvJWnTnzIyvi67LtT1zaaeQW6nfg+2pBHB6ZQ3wZPmecW+68vqBitBO4QaYq78DVO
 F92JJKAXTDKliVvm+ARzvtD8rtfLkphVwFJ5A5EEhyrbkrMmgZR4kmg8fax9jb8AYeU4
 wG9DeKnObRYWPeMbSdtgzYUZvh/Tp1Us5Oe36CJyz48cXM2XC/Ra4556MpPmQhm6RtQo
 F029VS1d/Mbg4VREV7/rcsS42rQMZ27Dex6+pK9jCLPN4ZP+sxN9AVwPLRrjGnyuczNK
 OI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A1ZBzgH8dEhST4JS/JsP+0ckGcGlmqn92Dci6AKt6gs=;
 b=j6QqgwFhrO+LFy8QkSqdAfP9gd94B7vq7MoC3sL6Hztx0hZZ/4f67XhhCpqzAnYQvw
 askdlMoo003yqJhvkYXpZPyNT0n52iX0K0vSRJSXM5UJ1y1VWDNSB7NPkl3YZOJKzMXu
 TUBwXfJRTmM4nJwI9m1Q0qwGC0d7CECcWuilWlAIV80JmGL017sfPBDKoAqIlpwClErM
 AgeagO87/sp7sBJUNaCdTLNFFWuLjun6ovUY/xlNPXQpEjZ+YavJAsT7urWLqz+5r5Wh
 zRZe2WERN3Is+Yg2FLwInGduBE4M/P/G+nUw+zkO1bi50PxsNgLU0x6a3I2FoIYvcL9V
 +A0g==
X-Gm-Message-State: AOAM530n8b+f1mRLxGF7ZtJACJIdSi25ngd1lyB4x9i/wd0tN5n4p8rt
 qLN9Bx4+IBEfs/PozF4XD/EvqJRmkPwgpQ==
X-Google-Smtp-Source: ABdhPJyG2BC7rE5hOoipnQSNye573NevVZ40DWeYLaePLlQvOZA0Tgs0mGL76+mJJDeM+6xNEuXl4Q==
X-Received: by 2002:a02:c551:: with SMTP id g17mr100274jaj.305.1643074234061; 
 Mon, 24 Jan 2022 17:30:34 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:33 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 40/40] bsd-user/freebsd/target_os_ucontext.h: Prefer env as
 arg name for CPUArchState args
Date: Mon, 24 Jan 2022 18:29:47 -0700
Message-Id: <20220125012947.14974-41-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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


