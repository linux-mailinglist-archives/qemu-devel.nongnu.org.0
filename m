Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E0D35EB6C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 05:26:00 +0200 (CEST)
Received: from localhost ([::1]:48212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWWAB-0007lh-7B
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 23:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWW89-0006hZ-GL; Tue, 13 Apr 2021 23:23:53 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:35554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWW87-0003Yp-Tf; Tue, 13 Apr 2021 23:23:53 -0400
Received: by mail-pf1-x42c.google.com with SMTP id n38so12819121pfv.2;
 Tue, 13 Apr 2021 20:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a2MXe+gynWo9v6ME0G5pJahN03sb1Ll6sRW+/fEZ+7g=;
 b=pNPglj3wQ8cY1v9l5jGdb9pvzhVFr9rR0Bp66sISRm2EzMOZ70Z28LKwaFVt8Iejw/
 GV02sncOJ6pFuj3OBK9aDmQb3uN4KgzTMT07XckXQiBOB0sXUT2x3/WO5zIBBMp9X1ih
 xWKbzEQJSmFPYzxinaQLFfkmo8jDHUxGn/ZEWIVYYt+ILgsuwWmdWRBGxwOLDc0JolVk
 JbhEPJpPzCbghKD/nr9HsL/vXeYkfw/DZAkrrU4d760pG7ozYLm5Z9Hrud9I2gv3A/nc
 Iy27OBlIKSFkL3WCvm+hA29uv231ckVtXUfRD7w7BVtDYmSSoycYs7iknpjtH6uL5SmZ
 cwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a2MXe+gynWo9v6ME0G5pJahN03sb1Ll6sRW+/fEZ+7g=;
 b=jAmwtZENS5RDGHNOpHVgJJVm82oK7hsrzOoxe2l9IG+vEK4WOhXQ/RJEGr31VXCVGB
 yQN3E0cSvXDXXpiwm/83ZNN8b8Sdq4Mv9Mne3p24++HEPGyREBZpK9PKx1wdl2rLW28k
 +ZWSsThxQbM2ffU+FANobyb/QFcTFUjzg29MHNOcV4Nb3lGfc8+chEwlI7NKQCY/4pPB
 GtEDGZvIY7ZdrRU3vUOoJnA3zWKD2yg3r8A95eYEm8uyOriT8zbi2azSovWXhiDY3L2r
 T/zVdxCqtuCeQKupI89/TWBnVzAfexkBYj3w85yxSs4kwB02qJIzY+9E8IoAJJceeNqj
 YYUA==
X-Gm-Message-State: AOAM532e4se6U0sj6Irf6YmAs1gOUhrKmhAUYlF43tGDg6RkPuTO44P4
 myAFZfuV8VNd1FgGEGlduwFDMZipWX0=
X-Google-Smtp-Source: ABdhPJwtjsY3g5nMhBx7BPAvcoVv0SkPMPu8bK8xBOqahGM6KmRINIV/vUpyrYsb3Uglibp2KDBIVg==
X-Received: by 2002:a63:40c1:: with SMTP id n184mr4557198pga.219.1618370630095; 
 Tue, 13 Apr 2021 20:23:50 -0700 (PDT)
Received: from bobo.ibm.com (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id fa6sm3407435pjb.2.2021.04.13.20.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 20:23:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [RFC PATCH 0/2] ppc: rework AIL logic, add POWER10 exception model 
Date: Wed, 14 Apr 2021 13:23:41 +1000
Message-Id: <20210414032343.1720010-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42c.google.com
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

This applies on top of patches 1,2 from the previous series (i.e., these
two patches replace patch 3).

Function should be the same, but this way seems much cleaner. It does
include a "cleanup" patch before the POWER10 fix, but arguably this is
a better way to go even as a bug fix (backport, etc).

Comments, opinions?

Thanks,
Nick

Nicholas Piggin (2):
  target/ppc: rework AIL logic in interrupt delivery
  target/ppc: Add POWER10 exception model

 hw/ppc/spapr_hcall.c            |   8 +-
 target/ppc/cpu-qom.h            |   2 +
 target/ppc/cpu.h                |  13 +-
 target/ppc/excp_helper.c        | 204 ++++++++++++++++++++++----------
 target/ppc/translate.c          |   3 +-
 target/ppc/translate_init.c.inc |   4 +-
 6 files changed, 160 insertions(+), 74 deletions(-)

-- 
2.23.0


