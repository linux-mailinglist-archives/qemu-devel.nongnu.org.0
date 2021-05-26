Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66B3391387
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 11:19:39 +0200 (CEST)
Received: from localhost ([::1]:51144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llphT-0002fz-0f
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 05:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1llpeb-0007Sw-Bq; Wed, 26 May 2021 05:16:41 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1llpeZ-0003qO-O3; Wed, 26 May 2021 05:16:41 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso20205pji.0; 
 Wed, 26 May 2021 02:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e9djnwQcIUhQou2YcMLfUH5UlKGNd4Q80uK1Csfx10M=;
 b=hvLh0YcJMvhKC+G7ijIz1+JCCWOQwzgPAqtYnk0k9AYGOn3AH/yBC7UopfC/1U3D5P
 rHgkp2gDCFurrx8uDVJmdulLLGWQJDdVr3LNeI+tTu37mMldyziobn+ySHt3q7AoyoM7
 EWR4kQBmy9H8C1IE+9wsSBOuHFbnF8OY7fwbAm0KAMaSe4hNE52yb1Xi7r7pxOxR0eIM
 FsrpMg35+j4lPumzml8JnsWDb9bFkM188HbfEWNG5LgSBngRRasQh0PjLI6Rne8q4mYG
 rp69CcafGh4Ky4bb2dJHNqM85bMUh0s+RmbhuruGh/SbFzsMLv90lv2kpCm7WeWByBG2
 GEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e9djnwQcIUhQou2YcMLfUH5UlKGNd4Q80uK1Csfx10M=;
 b=LPY9InJDjgQ4ZN2HfQU1+5Nm5pqT9DV6pTn3Do9gzjBMTQB+F/ZJKaRgOGmg8RiHAy
 +MoPdKOJgOki8CI0QAIcMzZu2iyuJhsCE5E7ios0QpUt9QdB/tkYS6LF2FNmDJVBV5lF
 FWfk+OQPgA2U6zBMreuc/iaeXLfmUv5RXtXXKwoLnBdpOT6CSQGG38phLbPNKKO06CZW
 9hOvIaTDUAwmClbVLlZ6dVfThAirWjLa/4ZM81d61KC1IZAdEWtmyCYIp+UjTrdZhpq3
 RQQ05iPYYJWdyM1hsHYfyjcC2R29y4NXSa0AljIQu6cqKiqOW5CZdt8wCITJapOqRff7
 iWuw==
X-Gm-Message-State: AOAM5331r8qpQK821WCzH2x91ytY4jt/rijPMDfqkr4nYGyp/fiaUCTe
 YC+GYKqH6XslykK2UCP9QkPA43Y6bbOimg==
X-Google-Smtp-Source: ABdhPJxQRDL0I6l1q6eRX3HSNrb+V9EkxMxYuj0jw/Cj+3Glh7EULumju65/+aLlx1u6HFnozRTTyQ==
X-Received: by 2002:a17:903:208a:b029:ef:9465:ad10 with SMTP id
 d10-20020a170903208ab02900ef9465ad10mr34990015plc.53.1622020597052; 
 Wed, 26 May 2021 02:16:37 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id h22sm15055171pfn.55.2021.05.26.02.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 02:16:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v1 0/3] ppc: LPCR synchronisation fixes
Date: Wed, 26 May 2021 19:16:23 +1000
Message-Id: <20210526091626.3388262-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1030.google.com
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These incoherencies have been around for a while, but they've started
to get noticed now because recent Linux guests crash when LPCR[AIL] is
not set correctly (scv requires it). This series fixes at least AIL and
DPFD incoherency between KVM and QEMU, and between different vCPUs.

Thanks,
Nick

Nicholas Piggin (3):
  spapr: Remove stale comment about power-saving LPCR bits
  spapr: Set LPCR to current AIL mode when starting a new CPU
  target/ppc: Synchronize with KVM's LPCR value when creating a vCPU

 hw/ppc/spapr_cpu_core.c |  9 ++++++---
 hw/ppc/spapr_rtas.c     | 15 +++++++++------
 target/ppc/kvm.c        | 34 ++++++++++++++++++++--------------
 3 files changed, 35 insertions(+), 23 deletions(-)

-- 
2.23.0


