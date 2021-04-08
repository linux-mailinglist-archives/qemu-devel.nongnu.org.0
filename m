Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60873358EA1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 22:43:30 +0200 (CEST)
Received: from localhost ([::1]:56772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUbUv-00014r-07
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 16:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lUbSt-0000DL-9k; Thu, 08 Apr 2021 16:41:23 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:44611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lUbSq-0008GY-AL; Thu, 08 Apr 2021 16:41:22 -0400
Received: by mail-qk1-x72f.google.com with SMTP id x11so3669744qkp.11;
 Thu, 08 Apr 2021 13:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dYq9oaMx6xD8QMoKxvwl3U0NlfSmEiS/pLEdVaHlhjc=;
 b=t1ZyczgP5AgSLlitfqmRzQZKR7u7oguRRyukWZY54zjRMzx4abQJGw2NwNPk2Y0ZrU
 1EkO9e/u1ITJmNlW6iHp+yi2/SFQq9/dS5SgQl94pxXcwaFotw99HF2DLANXM1t0pQF7
 VLfiSGx1Er2uaVcFBK2WcPje9NcuOiYsYDbw9Ff8g2biehXhUCe6Pu5U3Gphlj82V34G
 /3WbwVB3q+cC760GIO8gKWHkSHCvGeLfuN11n9yfPeAnUHLP2+oy+np2qzx2vseNZC6s
 XDOtDb4b0CW6MRaErkRNuZF165iocQdeyxHv4VsaPMzMXsgeZDYWCXhWLcrtexdMsRL9
 uPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dYq9oaMx6xD8QMoKxvwl3U0NlfSmEiS/pLEdVaHlhjc=;
 b=SAViKze7WDG9AiJL4qB6P9uzXcnY0dGNkbRia1sj3yqi/9Z/c2U8f5s3ystiujMc48
 3qmAPnmt1I7qmBlmKd4q0FmnATUxU1tZVFaFIuMiorolnrFjxI+Z8+HCxTL+SbRmMRf9
 fQrJYtlrYpbHHR5lysqosWKEH8KhXzah6FjSAIYGv2Kl1LQkm9X0im+uvFOYR7ilCPrk
 PuLT836cd7NoLp8ZjjtfeLNXf0gf5QwfhOF35cvsym0S6CHoxAh2Zvaw1KrK19AeRRHX
 nJOagV7KTOOi1X2PBogINBRbpuktCqoWb1/JNAhu+5aDOlIy+hMdjlse4TT6ctpH/WhR
 HzBw==
X-Gm-Message-State: AOAM530+pTKYbtqaVHo8MpuaBMxyA82pVSFpSVJsZ5wR5k4iGbQTJCEd
 WwYpVj/XhJzDM7jgWrJydpJCZGH7exhqNw==
X-Google-Smtp-Source: ABdhPJzecQYY7E3K+kwlI4YRI7qlRKRnCRQ5rhByDYskAMFDQbQEsXbDhoWrdfsdoCbTAuAI3oC9Mg==
X-Received: by 2002:a05:620a:16b0:: with SMTP id
 s16mr10393571qkj.115.1617914478034; 
 Thu, 08 Apr 2021 13:41:18 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:92e9:c7f0:1492:45b3:f90e])
 by smtp.gmail.com with ESMTPSA id a207sm327104qkc.135.2021.04.08.13.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 13:41:17 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] ppc64: do not use MachineClass::max_cpus to limit CPUs
Date: Thu,  8 Apr 2021 17:40:47 -0300
Message-Id: <20210408204049.221802-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

After having to change hardcoded values to launch a 2048 KVM
pSeries guests I decided to post these upstream because, at
least for me, the current max_cpus usage is lackluster for
pSeries. More info in patch 01.

Patch 02 is a trivial follow-up to increase the FDT size.

Daniel Henrique Barboza (2):
  spapr.c: do not use MachineClass::max_cpus to limit CPUs
  spapr.h: increase FDT_MAX_SIZE

 hw/ppc/spapr.c         | 11 ++++++++++-
 include/hw/ppc/spapr.h |  2 +-
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.30.2


