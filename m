Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012313C354C
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:43:49 +0200 (CEST)
Received: from localhost ([::1]:55732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F8u-0002od-1a
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exc-0005xx-BX
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:08 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExX-0002PD-Tk
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:08 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 cs1-20020a17090af501b0290170856e1a8aso9984624pjb.3
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=id9iV5umHb8tt/5JMvNxOccVr78sQJff/CPKYNI34Tc=;
 b=bi7m9PNM99JbckhsrUjSlcBVs2JxEzUOsFsPyzVjAPfBHvgaDwGYvw6roMUnuDpoYF
 BP6BmUaja6qe6thVDSuV51DShXIdEB9wc8kh6r6AuEnZqJmwLMy8hcZpLZcR93hiXdM5
 yC+esm/U45TUJsnZKUEy/kWRqmsdrlubp0bf9M++LBvaiREXDTuHX7Vr5Ny8EoKtu7Jw
 HhUlnOFRJ4HeO4altHUGriEOBiPuHJXgxx0veQcvt3qEBw0b+fWMkgy8UEw2l7eOrZGf
 mE34+LrrTER3gsupehpDerUyPJmOg8wFyqBi4lAJA5KksekG8OlSFQZuaDXHab/DSX+r
 PBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=id9iV5umHb8tt/5JMvNxOccVr78sQJff/CPKYNI34Tc=;
 b=dPbyNMmvroI5mTHgjcpN1vNDZ8/gOYGCPaOhszOFWWM9RXCJ5+iK7A6PD54Jn0Rv1S
 HzMjOXHd45kFo3tanf7sb3M+MK1RH+/TZXHYYOIzC9M4U907QgJDe3/N892epG/fdv0d
 2ngxKky+/FmtkJNdqeaPcB2xeIGuCZg1INHCEsK9Nz7Rq+IHeNvorrvjew0iprqkHeWj
 QMRtPekpjyYjH+NctszmYRhuXWonQrvB9zM8c9GdjYiIW4fn4PFQCEeKM3ywFcpBacUx
 0X23CpofQfBUlFrGFsDQF62PaR6OIQ0tZvloNCAuahTeIsNoPIN7FGk0MopquOqkwJQJ
 4VAg==
X-Gm-Message-State: AOAM532t4H/7vFUzRDwiy3/lcwRtk02euR8OWChs0ot2tSImD28J0BZ8
 oDjdc5tRQ63KcH9SmZc8bPl958ftNNSypg==
X-Google-Smtp-Source: ABdhPJxgx7v0X8UOCdxqNwQzaYS/HmqN32u6WkrRocXkTlwocTGzqOA3Xf86ueaBMG1ToB4HM/i61g==
X-Received: by 2002:a17:90b:4b52:: with SMTP id
 mi18mr27055678pjb.37.1625931122735; 
 Sat, 10 Jul 2021 08:32:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/41] target/rx: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:28 -0700
Message-Id: <20210710153143.1320521-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index 22a15ee11d..23a626438a 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -142,18 +142,9 @@ void rx_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
-static bool use_goto_tb(DisasContext *dc, target_ulong dest)
-{
-    if (unlikely(dc->base.singlestep_enabled)) {
-        return false;
-    } else {
-        return true;
-    }
-}
-
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 {
-    if (use_goto_tb(dc, dest)) {
+    if (translator_use_goto_tb(&dc->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
         tcg_gen_exit_tb(dc->base.tb, n);
-- 
2.25.1


