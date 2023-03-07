Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB83D6AED7E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:04:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbeD-0004DE-NP; Tue, 07 Mar 2023 13:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe9-0003sd-V0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:46 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe8-000162-A9
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:45 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so12664238pjz.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ldzdR2EfTmKQwO2Sl/PN1z7zGGl5r/t6qa5lRBzrCg=;
 b=bXeYP/b8EzHAL2wN0u1rHxHeSGXpy7xU62x8vyBlEPZpFNyzeO+sLJIKqOkGl8lCUe
 9ZTFWPIgyV4IAEIHxzLNDexyvmrnSAc/OrPSTIKQ8e843u4FyrODUd3vhp/W8vMdSSBk
 IopCFH2H1ibXnBmjNFCyaJ5KvnEQMB67gH+PFu7KqczRQCtjih4if0TJ5SoSlWDVuKV1
 tWgFxqjbmo0pkcKhrIKQ9X3Z7OlFafMTGd92QQHY21FB0/lip06At+vGhw9F+g/4kVrf
 9ArwosA4gws4K2ixowLc6ImF5McMciItu3+5kgcucKwhW9fMvvJt5U5rrK6XbyE1+T5H
 qBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ldzdR2EfTmKQwO2Sl/PN1z7zGGl5r/t6qa5lRBzrCg=;
 b=U4SymvP5zNqFsxjh2plNcm0N6HA+dI1lzFyI2DmC7mVZnbtOUpHgD7/BAXmtN3tKDL
 Rtrz8rz+sCR3QnZT+IH8fjwT2XHH+6Bd2AmjcpkRhRPLXkn6RB/eKgnJci/mUWCAEnle
 2Yd4iha3d6KS0G2+VvbpZikKf4HHDiHi2ov+YB6fzCf2EZo/9o1vHcJ2mdwrrBkNOBUG
 eywdg6cg0Pj7y1u+1W4AR8mCPDkHRVHgX8VHl9ucvwS5Ga8IBKO4tLqZEnW5a8wYmh8z
 OM6+FiNXVS8016mn5lrUKV+B5mxC54WQ+VHlrlmLGnOGW7IBnarDwc630t6wDkPQd0AB
 ZFwQ==
X-Gm-Message-State: AO0yUKUllUxYLFeUSbNlouPeTkx2zjFCDVrLaOTNebQlX0QlSasZWxDP
 eLxowAY8bM65Che13SYHKedeGPUPMi9I6bsFhrk=
X-Google-Smtp-Source: AK7set+nrqZ/0XHuywxgd6Ec/6t0YXNxr8DK9AxctUYVC/0W8Cb1i7D19zycwHJjvyrFNc0k+O6xMw==
X-Received: by 2002:a05:6a20:7785:b0:c7:13be:6de9 with SMTP id
 c5-20020a056a20778500b000c713be6de9mr12063400pzg.14.1678212163483; 
 Tue, 07 Mar 2023 10:02:43 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 67/67] tcg: Replace tcg_const_i64 in tcg-op.c
Date: Tue,  7 Mar 2023 09:58:48 -0800
Message-Id: <20230307175848.2508955-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These three instances got missed in previous conversion.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 1a039a292c..ddab20a6a6 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -1563,9 +1563,7 @@ void tcg_gen_muli_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
     } else if (is_power_of_2(arg2)) {
         tcg_gen_shli_i64(ret, arg1, ctz64(arg2));
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_mul_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_mul_i64(ret, arg1, tcg_constant_i64(arg2));
     }
 }
 
@@ -1962,9 +1960,7 @@ void tcg_gen_clzi_i64(TCGv_i64 ret, TCGv_i64 arg1, uint64_t arg2)
         tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
         tcg_temp_free_i32(t);
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_clz_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_clz_i64(ret, arg1, tcg_constant_i64(arg2));
     }
 }
 
@@ -2016,9 +2012,7 @@ void tcg_gen_ctzi_i64(TCGv_i64 ret, TCGv_i64 arg1, uint64_t arg2)
         tcg_gen_ctpop_i64(ret, t);
         tcg_temp_free_i64(t);
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_ctz_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_ctz_i64(ret, arg1, tcg_constant_i64(arg2));
     }
 }
 
-- 
2.34.1


