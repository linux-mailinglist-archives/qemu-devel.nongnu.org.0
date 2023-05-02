Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 139E06F45A8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 15:58:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptqVq-00018d-JH; Tue, 02 May 2023 09:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqVm-00017u-WF
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:57:47 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqVk-0003T3-VG
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:57:46 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso25079785e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 06:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683035863; x=1685627863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TJ6LkJDurkdfRizphOtFGUCPi1/0YjEZY6SgyPPpU4g=;
 b=jCbrRD+Fy56dwF0UUJuACBMCAw4Yjgjq8HexGbEi/A7IRnjgLUBPqm7XB/1yxo/VVo
 hWG+OVb+3cL/BREZMGZ44EpBUgZi6P/IMDZjXMpq9qGOvh28orKDvowL9EVmX8ygTyBv
 s6aW8WhJ5Ui/Sy7EmKp6WsGDqqj0v2nVSij6VZVVIkXOEpW/ygW9i4FkBVIwKoQvsB96
 Xa4dYqznHs1aKwSZr3Os01DqkyAsXdYvixqw/AKoX7s/RREaCGVFNukVcK+DJWVNl10R
 Jw5NeV8DQJXURTAdi/jjbd1u1pK/RFEZDorWcGiGUay6DwMCGQqt+7evtcsEn/GRY0tu
 eTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683035863; x=1685627863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TJ6LkJDurkdfRizphOtFGUCPi1/0YjEZY6SgyPPpU4g=;
 b=VFKEghI4vYTeIC+rKRpF8Gm1TSEi/DHruEp2+Sl3QLzyJyI8TNsV7qCs0lsPBK5gm/
 MG6MBasN70e7hY3Xlj+jR4HV4vpJlzYTzSc+sblOUo9It2lRqsLWOdDWq4EIpEMFggTd
 QiYluNHtsfxsxVAi6mVFL/7CmaaWU9dDDbs8KkoX4BP12DestMBtD/hBCO0YeLvRGTM/
 pfMfjSiLoa0ktHn1AOJR0c17jfLqVaGkH7VZYS73ILupSJI2omp+2ccyb2TSVVbdt0qI
 fjLtWWrLMB/3VV1vk2dDVzRHrwQ9e2ESlhqimSd1Q0lTxmYM8FGWjxdvWC1f1gDD3uvO
 lE+Q==
X-Gm-Message-State: AC+VfDzIDHMijayQYppqHsDSEJiKd+lhD6J9sPHIUHBgxm09JJ4BpPGD
 Bf0r2gFp6S9otaEfaeLnPhl00NXstrAUqykoG+XZyg==
X-Google-Smtp-Source: ACHHUZ6SSIIs3KFJoc8CWpUrpgxf9LePNMpSwGFkrpO8T0HDLoQxKpO54gLvZpQw6mFwPAbwlRhY6Q==
X-Received: by 2002:a7b:c408:0:b0:3f1:75b6:8c7 with SMTP id
 k8-20020a7bc408000000b003f175b608c7mr11766089wmi.37.1683035863173; 
 Tue, 02 May 2023 06:57:43 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003f173987ec2sm39461140wms.22.2023.05.02.06.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 06:57:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, edgar.iglesias@gmail.com, tsimpson@quicinc.com,
 ale@rev.ng, anjo@rev.ng, laurent@vivier.eu, philmd@linaro.org,
 jiaxun.yang@flygoat.com, david@redhat.com, iii@linux.ibm.com,
 thuth@redhat.com, mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 jcmvbkbc@gmail.com
Subject: [PATCH 0/9] tcg: Remove compatability helpers for qemu ld/st
Date: Tue,  2 May 2023 14:57:32 +0100
Message-Id: <20230502135741.1158035-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Finishing this conversion has been a long time coming.
This is a prerequisite to removing TARGET_ALIGNED_ONLY,
which in turn is a prerequiste to building TCG once.


r~


Richard Henderson (9):
  target/avr: Finish conversion to tcg_gen_qemu_{ld,st}_*
  target/cris: Finish conversion to tcg_gen_qemu_{ld,st}_*
  target/Hexagon: Finish conversion to tcg_gen_qemu_{ld,st}_*
  target/m68k: Finish conversion to tcg_gen_qemu_{ld,st}_*
  target/mips: Finish conversion to tcg_gen_qemu_{ld,st}_*
  target/s390x: Finish conversion to tcg_gen_qemu_{ld,st}_*
  target/sparc: Finish conversion to tcg_gen_qemu_{ld,st}_*
  target/xtensa: Finish conversion to tcg_gen_qemu_{ld,st}_*
  tcg: Remove compatability helpers for qemu ld/st

 include/tcg/tcg-op.h                        |  55 -------
 target/hexagon/macros.h                     |  14 +-
 target/avr/translate.c                      |  16 +--
 target/hexagon/genptr.c                     |   8 +-
 target/hexagon/idef-parser/parser-helpers.c |  28 ++--
 target/hexagon/translate.c                  |  32 ++---
 target/m68k/translate.c                     |  76 ++++------
 target/mips/tcg/translate.c                 |   8 +-
 target/s390x/tcg/translate.c                | 152 +++++++++-----------
 target/sparc/translate.c                    |  43 ++++--
 target/xtensa/translate.c                   |   4 +-
 target/cris/translate_v10.c.inc             |  18 +--
 target/mips/tcg/nanomips_translate.c.inc    |   2 +-
 13 files changed, 183 insertions(+), 273 deletions(-)

-- 
2.34.1


