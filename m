Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C01E4AD45D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:09:09 +0100 (CET)
Received: from localhost ([::1]:44532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMUl-0002vu-Ax
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:09:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKka-0000No-FD
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:17:22 -0500
Received: from [2607:f8b0:4864:20::102a] (port=42550
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKkW-00017j-Ul
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:17:19 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so1794055pjb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F9dhPwbHPoQFH7wsEKh6eiTzeXJyucbqB1ryaS6Z3iA=;
 b=c3pK1pRVEG99O1G8tg1QxTSMrYIMHgFsXNPWda2fJAzZZaJJl/XpIq+GdDJw8YpVVq
 IF1RWwpBwjBQJRV+DeqUvDfiXg5OXr40/+RCfMJCyyhBE7zCrmRPLeKnOu8oOj3GVrN6
 hwW/4hTEd6PLoGDsxTBo6Eyd0E5xJsNjRIuGnOFzlEervjTkso2ESCBxU8kYAvSbJr3Y
 YA/fYhk/V8i3ULFHic/UdijD8TazHey8b8jiW9FYp3qkt8u1bpDnApvz0xeDCRVmdY+l
 KmQQHXaHv6xus0sfQOhbFZNrDiOdgBEBtSOevMtveHQ2fByKuY6HekMBW/PsBW5DVp/X
 evgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F9dhPwbHPoQFH7wsEKh6eiTzeXJyucbqB1ryaS6Z3iA=;
 b=NfcCTsNPNzFcF/o+OwV/sXIL7/mza4QHbiewrODaSU10owhSvpsbaiHfgU6TM1FXk2
 YKukQ6xdeB/UoHcZIEP7F7lbK5/3uJceU6w37h4fpLOafuhQ9dtttElKqjGy1YhHwuk/
 +4pl6c2lrLYFlxNKay/aa7XI1v7bSpR3jpi2EovTEW/nX8HMysqJUIsCHM0hv2PMHnxF
 K+viT7utzb1E2FICtfOzz0JQxI5OsP3yaXg0goI+u2xD806cCyF7iDiQSOciUhw9kC0F
 OIxoBmDNQtd2VbCR96SldCXeDBe8U5MT3vsnw+1o8T+jlsUtiA6BqgwEd/IcMQHcxWb6
 D2rg==
X-Gm-Message-State: AOAM530JGWsQSTmTjaCUOX00epXjwIVfjw+q7fZXemm12TlAK2Y6fmpF
 6DioHQUs4clbEx3jpXc3eIidmAmgFNra+g==
X-Google-Smtp-Source: ABdhPJwjy2daxpHmDBM6LlyH0q1Lk7gZtKOUXnnaj3yQUkjsPsNqLn6sifqCoJpqjxRtVaPWYub/+g==
X-Received: by 2002:a17:903:182:: with SMTP id z2mr3490392plg.67.1644304635509; 
 Mon, 07 Feb 2022 23:17:15 -0800 (PST)
Received: from localhost.localdomain (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id mi11sm1543422pjb.37.2022.02.07.23.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:17:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/8] tcg/sparc: Unaligned access for user-only
Date: Tue,  8 Feb 2022 18:17:02 +1100
Message-Id: <20220208071710.320122-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes from v5:
  * Use tcg_out_movi_imm13 from tcg_out_addsub2_i64.
  * Split out tcg_out_movi_imm32 to avoid recursion.
  * Reinstate the assert vs TCG_REG_T2 in tcg_out_movi.

Changes from v4:
  * Remove assert from tcg_out_movi; rely on the one in tcg_out_movi_int (pmm).
  * Finish conversion of patch_reloc (pmm).
  * Simplify unaligned access loads.

Changes from v3:
  * Rebase on master, two patches merged.


r~

Richard Henderson (8):
  tcg/sparc: Use tcg_out_movi_imm13 in tcg_out_addsub2_i64
  tcg/sparc: Split out tcg_out_movi_imm32
  tcg/sparc: Add scratch argument to tcg_out_movi_int
  tcg/sparc: Improve code gen for shifted 32-bit constants
  tcg/sparc: Convert patch_reloc to return bool
  tcg/sparc: Use the constant pool for 64-bit constants
  tcg/sparc: Add tcg_out_jmpl_const for better tail calls
  tcg/sparc: Support unaligned access for user-only

 tcg/sparc/tcg-target.c.inc | 348 +++++++++++++++++++++++++++++++------
 1 file changed, 296 insertions(+), 52 deletions(-)

-- 
2.25.1


