Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF63C4A507D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:48:41 +0100 (CET)
Received: from localhost ([::1]:47396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdbM-00088Q-Uw
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:48:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnd-0004sM-EZ
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:17 -0500
Received: from [2607:f8b0:4864:20::d32] (port=35662
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002gR-58
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:17 -0500
Received: by mail-io1-xd32.google.com with SMTP id 9so18466486iou.2
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0gTkuAZAhwvC63lNdvy3u7JBBQLnkso7fXqMJsrKqkM=;
 b=ybhMYU1/kDfTkTqmeo1AuWW8onHihoZOweAWNHpY961IVE56e20bUUEEVD/Smil742
 fgzQjKzdNucayh8ThtFtQ4XNBoiqKcSQSxkmCPvo06s3uSW5prR2If68axQ4pdEAt4tI
 lDVhR0c76u5eshcPj+vhQeQyf3/QI9yQW4KUcx6+9/ekWOWM9nFu81xn2CB2RNulgt/4
 /bJ/XZzacrI0vjE4SFTahmdRb5skPPDMLpG5XhWDbsSj3bcbYBUYgBYNXyC4bGskdBV9
 TxIU1HzeZoi1msU2VTQv4hX9skSSdatjaaKgPCE3CS1XwqasHsPTjhSOXPkzaeeYkrtf
 C0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0gTkuAZAhwvC63lNdvy3u7JBBQLnkso7fXqMJsrKqkM=;
 b=bW8ip8AgOKdxuorklbrA9CpzIcJslb2i4IIj27DeqgQP1TP2TklyR7A9cAAzNVrImE
 GHWuxg6/MlFlPllGYiKfJiXuI7G+Icyufz6HwaEu4m85ZYAOv3+u45MBFdJsbaHFPf7E
 naP1IzHcJQH885ubWYiZ0y8zqDAAdZamU0kWDQ16D16TD4tf1U/tfapMa/vwJTE5Gne8
 44/HCpS6p7cxlIDfvcNVK7AW6BmjWZRR83cwonmkVyfN+UdB/V/uiDMhvsWRR5bw/C5M
 9FcrMOLcykbNiGs6KYMjvvAlxmvnJfs/7Yafu7X/U91JUYfjAdVAq4CacFwGd4DlEoLB
 5qnA==
X-Gm-Message-State: AOAM5304oKI0EAu/NJODpaSg2McQhlUg6DM+Fd5WAmUWEWwV18DXyZi/
 3cWf3zFpBU7WXGv/AwTnBohgZy0oISLTSQ==
X-Google-Smtp-Source: ABdhPJx9fcUjR9lvMYia240j3UQG87xi1cxJKsw8B1qF8KMOPrny/lQghE5fU2x0tEmU8xXwTa12iQ==
X-Received: by 2002:a05:6638:1927:: with SMTP id
 p39mr1766950jal.247.1643659031251; 
 Mon, 31 Jan 2022 11:57:11 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:57:10 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 40/40] bsd-user/freebsd/target_os_ucontext.h: Prefer env as arg
 name for CPUArchState args
Date: Mon, 31 Jan 2022 12:56:36 -0700
Message-Id: <20220131195636.31991-41-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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


