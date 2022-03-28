Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3214E97E1
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 15:18:33 +0200 (CEST)
Received: from localhost ([::1]:45804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYpGS-0004vD-28
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 09:18:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nYoy2-0005FD-Mu; Mon, 28 Mar 2022 08:59:32 -0400
Received: from [2001:4860:4864:20::36] (port=37057
 helo=mail-oa1-x36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nYoy0-0001jO-Ep; Mon, 28 Mar 2022 08:59:29 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-dee0378ce7so4724638fac.4; 
 Mon, 28 Mar 2022 05:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ur+azaCezNGCeJE/GZ3cVJ659jORLmTfJHKuGeLMWFc=;
 b=KlTrIfFZS3840fNwtcy/nFpR47Z0Xklg5l2FI7lIAWekJiU4ZMruvwFNF/efE/6hBX
 FC6A5A5MA1/r89jNmEBNG0DY+FfOYFtWuSMyv02HyhjlpU+yB4Ptl7FPPrXjseT7C/6D
 ZtzG7CXwjDZjb2yaAj/74ea4Wu2efYvYyotoY3mfpl68iWTCFS07jKIeb0QOjFjA/iF0
 F8pSU3guPa1cIeOis61hhALmaRfWLvO8zIA+dpVkENFqAuqbNXMslv/iVJAgR9MfDs0H
 o6OQ4rF6uz+9nw6/ci3sYe1orD+DGIH/fPOi/O6AUMWV13ed78bvf5zk/F9Br1D4Buhb
 NWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ur+azaCezNGCeJE/GZ3cVJ659jORLmTfJHKuGeLMWFc=;
 b=7Yfq39vH+6MYAQbzNPM/1A0QTJQSFTNChhrOyG8uOdEG2yw2bwFnqwA98cxMC9IJ92
 emVcBf/mTGbQ5ri3JMnZwXZkCKB2NoKwTOX9YrfJjAaCFnsJ2WhV6u2OovYESTVjEq2s
 c8rn4PzRObmm9iYxqaJLfrWj+fPpN+cGdI7cVRvYBt9lymxg9fY3z1TkWGEHIM6wH+nK
 4eBsqoy8sa5VCVd/OPsW72qF+cvoutpFH94d5XJkJ+nrJWOTDoLd7lhO9X3t5BSI55yg
 jQGQJ8jVr8XPBvEhx3+w3sAbVdc8lT93bLcXedrq6h0RPakDREfI2MySTDSpymFzkgs8
 49pg==
X-Gm-Message-State: AOAM533ePOXevMh8uK0BtzekNOLrDRc8xLLPkLwH3pHwb4hEH3i0rnkK
 yG/aPUmq+jy4xw0ZsfefnNpQnqrRKyI=
X-Google-Smtp-Source: ABdhPJx1syPqIhKpsrUj8b9yL+JdNgEUiY27KYsbweXfyHNVJ6kUvp6xsFNngGgWfVXQ74m0oJHYhw==
X-Received: by 2002:a05:6870:e2d2:b0:dd:f8cc:3e5c with SMTP id
 w18-20020a056870e2d200b000ddf8cc3e5cmr11081363oad.21.1648472366548; 
 Mon, 28 Mar 2022 05:59:26 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:8271:32d5:64c:7754:f033])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a056820060900b003216277bfdasm6950698oow.19.2022.03.28.05.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 05:59:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] ppc: fix vcpu hotunplug leak in spapr_realize_vcpu
Date: Mon, 28 Mar 2022 09:59:16 -0300
Message-Id: <20220328125918.494787-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::36
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is a memory leak found by Valgrind when testing vcpu
hotplug/unplug in pSeries guests.

Other vcpu hotplug/unplug leaks are still present in the common code
(one in the KVM thread loop and another in cpu_address_space via
cpu->cpu_ases) but these are already being handled by Mark Kanda and
Phillipe.


Daniel Henrique Barboza (2):
  hw/ppc/ppc.c: add cpu_ppc_tb_free()
  hw/ppc: free env->tb_env in spapr_unrealize_vcpu()

 hw/ppc/ppc.c            | 7 +++++++
 hw/ppc/spapr_cpu_core.c | 3 +++
 include/hw/ppc/ppc.h    | 1 +
 3 files changed, 11 insertions(+)

-- 
2.35.1


