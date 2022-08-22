Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AAF59CBA6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:42:32 +0200 (CEST)
Received: from localhost ([::1]:33356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQG7r-0000Tf-I8
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQG31-00030r-61
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:37:31 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:42703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQG2y-0006Xq-Ic
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:37:29 -0400
Received: by mail-pl1-x636.google.com with SMTP id v23so5931298plo.9
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 15:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc;
 bh=pRdOUvc4PkTYWG+B+JoKyNLMxkED6Gdco0gUACOfXsE=;
 b=YZFLz+Ayghq1hvxRF3SuASN6hjdrUbuv5k1IwnHiwi6ggZOLFa7qojDQEyclv8gba+
 PcTpDqDyFuMllXouOvhECVe3/pEzVD5ABXuXEJETLgxoOngXD+KxzkN9X3AM1Pd9rqbD
 yk/CO3BZ8G+CB+57Z8BZmsRYZ24wY/nq1IggvVoflRVajaPMU/LSygakvP72Z886OJlc
 qmtTdZ08cpLdWKtfVRyGXpl9qho4acXXXBfAb64Xa1ceGpHrUMRDR0lE+LfSrwzIqSsb
 y6x0fXvW/16tkfxpwDcmoIylTjBawkaf+ytLJRo4DsxEvesARy3p/44iCs/EjCztgCI0
 6J6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=pRdOUvc4PkTYWG+B+JoKyNLMxkED6Gdco0gUACOfXsE=;
 b=eyEOyB4yCMcWqMRln0hWAO5pKus5UeUmBK9nOi9l0eaeGpbalhV7sDUIcCoVUa9w7U
 Guk30uB85nbTdi0MuqiKt3ASTUXgCOOXp1k+nIvIq7UbpsF98VOZ4pec1LvD9LHOhCyt
 fTydx+XoQPFv+zugbrbeYPsqTmC/SH0xKjfkHbbQUtJkueVBGWUDQ7tkg83fDMWBqfFf
 gkidiJGbOuZAAfjgJIuXh/5SneydQBxYPgfyOKRy1DiclZQ6dSXJuMsRVGjd4HXM0IZC
 pJ/JNl/03Wdt6pLCPEQTlfiZH1tI7i+oIlJYHgleutWCGxVvxDBN2+sl/XgleGJlDg0P
 Qh7A==
X-Gm-Message-State: ACgBeo0YDReabTffVYxqdw6hpOPfC4QrcjmbBiOw1bk16pMddQR8pmgS
 47v+/KvVSRBOb+r+ph3zvl+o5QXWCrNsnw==
X-Google-Smtp-Source: AA6agR6mxCtaib+ftKA3b3A1+OPItBvYEKfGlev5zX3I6YyNpajhUmtPGoOplbsNBAj876JoFIOmkA==
X-Received: by 2002:a17:902:ced0:b0:172:e189:f709 with SMTP id
 d16-20020a170902ced000b00172e189f709mr8728203plg.63.1661207845010; 
 Mon, 22 Aug 2022 15:37:25 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 z6-20020a63e106000000b0042a2777550dsm7017419pgh.47.2022.08.22.15.37.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:37:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] target/i386: Host vector ops for high-usage SSE
Date: Mon, 22 Aug 2022 15:37:16 -0700
Message-Id: <20220822223722.1697758-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

These 5 sets of conversions take care of all of the entries that
show up above 0.1% in a normal linux boot, i.e. easy libc usage.


r~


Richard Henderson (6):
  target/i386: Define XMMReg and access macros
  target/i386: Use tcg gvec for gen_op_movo
  target/i386: Use tcg gvec for pcmp{eq,gt}*
  target/i386: Use tcg gvec for p{add,sub}*
  target/i386: Use tcg gvec for pand, pandn, por, pxor
  target/i386: Use tcg gvec ops for pmovmskb

 target/i386/cpu.h            |  57 +++++++---
 target/i386/ops_sse.h        |  49 ---------
 target/i386/ops_sse_header.h |  24 ----
 target/i386/tcg/translate.c  | 208 ++++++++++++++++++++++++++++-------
 4 files changed, 214 insertions(+), 124 deletions(-)

-- 
2.34.1


