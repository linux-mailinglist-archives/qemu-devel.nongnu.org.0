Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0284AB6F1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:06:14 +0100 (CET)
Received: from localhost ([::1]:53124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGzyP-00037p-7d
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:06:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysn-00061t-NY
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:27 -0500
Received: from [2a00:1450:4864:20::430] (port=33425
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysO-00029O-N1
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:55:58 -0500
Received: by mail-wr1-x430.google.com with SMTP id e3so9163156wra.0
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ujyuH+N9mmX9/M5Z6SxWCVQUgtTmKnPQTs4qSWEUAB8=;
 b=LzAhYV1D5Dk7nHWnjcV9aJg7o59dtKFWWT+U/A8n2c2r0Q7VhQfhnwbLg/jUiUCCxq
 0qp9szGNyInoGXVkfoUyX6tGwWgm1h2ypxnH7iMl0R3gE6YLjQxyF+3TrbcsBxEqrPbx
 KP4ist3mMbLeKltci5NSmwUxFnhIAwl4VZVdoQSkJofETNbYjq6ARqR90yQxtk/9bP2V
 9QD1S/Ap307fTL4PLaFbWVkE8LF7g5Dtj7p25RDxCy0z5nzU/s0zrAp2M/IYS1r6Ihuq
 BaeHmBF2dhAJbo2ELSmVhR9WFkN57HFFWaaHWJRwPfecD5fpRCshPueipMl/a76xaWHV
 ZqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ujyuH+N9mmX9/M5Z6SxWCVQUgtTmKnPQTs4qSWEUAB8=;
 b=4C5IHPpghosgXYXHVT6IN0Pe0H16ATmYzcD2Ics+odFsxLvw1LganbmTqXEzBk5Ygy
 zfSG5GMVaOHzRh8tX0AlcKgKGmTbvZG5QMjR02qxaRsWpDvZNidIDxEhzIsmp3tPTZVo
 QfI16qVMkyxQqsqL5lbBSmMcITGIqd0Di+o4i48zV7pHWWM8pLhSVjg9Ht8HNAVeyDHI
 2sixAFRC44ZLXECqXsFZ559esBw/b/3XIe8XZzwjTg2EseCi8cJjzwe/W4GyND7V1bjZ
 yj9mZVQ/eEeiMZHP6UCFeMcgLNRQ/11+BMQj8j8It3Ap3gfJHt3x/uu8RPucwFAu+hYb
 tb9A==
X-Gm-Message-State: AOAM531FWosTxO3GbQ0b8G8T+CIUhZPpYTK9HLcgQC1dk0yyNhSameGX
 rW7r6AkN6tL3/JKorEtBIpY7GGtdMRE=
X-Google-Smtp-Source: ABdhPJxlfPr2sVAG9hWfbh38SZvKFEAlWUeklzRadVfN97Nt/0vVf9Wipywl7fgOqB38xDa3cOiY6w==
X-Received: by 2002:a05:6000:1b85:: with SMTP id
 r5mr5679848wru.453.1644220523138; 
 Sun, 06 Feb 2022 23:55:23 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id o22sm4597237wmh.13.2022.02.06.23.55.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:55:22 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 12/21] softmmu/globals: Remove unused 'hw/i386/*' headers
Date: Mon,  7 Feb 2022 08:54:17 +0100
Message-Id: <20220207075426.81934-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/globals.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/softmmu/globals.c b/softmmu/globals.c
index 7d0fc81183..3ebd718e35 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -25,8 +25,6 @@
 #include "qemu/osdep.h"
 #include "exec/cpu-common.h"
 #include "hw/display/vga.h"
-#include "hw/i386/pc.h"
-#include "hw/i386/x86.h"
 #include "hw/loader.h"
 #include "hw/xen/xen.h"
 #include "net/net.h"
-- 
2.34.1


