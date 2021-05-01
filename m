Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2BB37062F
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 09:27:22 +0200 (CEST)
Received: from localhost ([::1]:42312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lck24-0008BY-JB
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 03:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lcjze-0006u6-04; Sat, 01 May 2021 03:24:50 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lcjzb-0003Uh-3u; Sat, 01 May 2021 03:24:49 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so505843pjb.4; 
 Sat, 01 May 2021 00:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zfvkNQcRZO6ExgWxh+A+1DOQQc5CbIZINDKG9+kk75o=;
 b=BTKPNTUm1WKrKPfzVVcJzk2272pSNyclQAaOBxVF2nXeFPgwZmuuJlAKV5oNJE9May
 4HCLBLPoj1F7H6Q6WAOmYUxEfBMCVNiDqDCxWWSNUlq7K9GBve2ynMVpVqk5AQWDX+ko
 CAiryii+ftIGtO/JvDx0pbI4DCDvXrLXGVc1BVtPwLW0O3XRadyT4/iJRiDhico9VLKQ
 0qLnJkn5mesU4IYfrWIOtVt1MUq0cfecWJmafjLaSDBsBktUn6F4/KEuZeX9n8u4Tl20
 XYqH7ZY8tcNHqHUtS3Lvr7mld+ojEzzovM11ArW5rMZ5ThOQi1nlEiO+EImoyPjMCtZF
 a9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zfvkNQcRZO6ExgWxh+A+1DOQQc5CbIZINDKG9+kk75o=;
 b=oLjErObaj5awfmFJcuIlK59GpiO1iaGn5KHZpDz+6hDx/5Cw+NxEIIoKHvrLNSAz+c
 U7+6zT0gSZ0WV16ZwJLqs+z9SlodNSgoCvwPMUNC6PjR0hDovcdDiD0S1kqdBhq42Mq9
 Ypa8H7INGKxpe7kT8BFycgBT8to2LngIG/ldDsTnyEJDlou8dL9hZg5Qptu+LIYyT9AJ
 wJu/0ltpTodIe2P20/zLiAh9DqzVT4QjdhGdu4PySzzWSrFk9E00s6b12z2c/JzsJCs/
 StOa/9Tf9RgSwek1mIBRoClVgc00e08sW6BR3VbrASnu/duk1m+rlrDM4U73da3U3/9N
 5xxw==
X-Gm-Message-State: AOAM530z3R55zaBj6hB0o0aSm6GzDz/sfIirDjuM1twf+YNSkcZemjQg
 4VszlnExUdclDirD4x3UrM0WnAwDlqU=
X-Google-Smtp-Source: ABdhPJzr16aTJ4TMOXSODmFgv+YVyfQb4SmVXAldJzigUwVaHOtNYRFLOEtgGfziwhNohdU+iRbAdQ==
X-Received: by 2002:a17:902:c404:b029:ea:f0a9:6060 with SMTP id
 k4-20020a170902c404b02900eaf0a96060mr9283352plk.9.1619853884406; 
 Sat, 01 May 2021 00:24:44 -0700 (PDT)
Received: from bobo.ibm.com ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id 14sm3868577pfi.145.2021.05.01.00.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 00:24:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 0/2] ppc: rework AIL logic, add POWER10 exception model 
Date: Sat,  1 May 2021 17:24:33 +1000
Message-Id: <20210501072436.145444-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here are the last 2 patches of this series rebased on the ppc-for-6.1
tree.  I've tidied up the comments and control flow around the reserved
values of AIL, so different behaviours/reasons are treated individually
which hopefully addresses David's comments.

On real hardware, setting LPCR[AIL] to a reserved value (e.g., 1 on
POWER9) causes the register to retain that value but it's treated like
0, which matches what the patch does.

Thanks,
Nick

Nicholas Piggin (2):
  target/ppc: rework AIL logic in interrupt delivery
  target/ppc: Add POWER10 exception model

 hw/ppc/spapr_hcall.c            |   8 +-
 target/ppc/cpu-qom.h            |   2 +
 target/ppc/cpu.h                |  13 +-
 target/ppc/excp_helper.c        | 217 +++++++++++++++++++++++---------
 target/ppc/translate.c          |   3 +-
 target/ppc/translate_init.c.inc |   4 +-
 6 files changed, 171 insertions(+), 76 deletions(-)

-- 
2.23.0


