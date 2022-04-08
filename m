Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AF14F9B7C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:19:00 +0200 (CEST)
Received: from localhost ([::1]:60574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncsGA-0008Vs-IZ
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ncs86-0005py-6S
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:10:38 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:44603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ncs7q-0006hI-NV
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:10:23 -0400
Received: by mail-pl1-x62f.google.com with SMTP id j8so8413345pll.11
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 10:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YXwin+RJvFLc/++rznYBkhOt++6QQAfmSlHS3EgoJsk=;
 b=eIV0zbqhyql8RlHYtM35dZJBPeNXjOK33spec11pUb7y76QxYmVP01cYZknGFXBiuH
 eQJgyFPykCY7mSYfyichXnSG6Po7bYqGKpyCyKM74FvTpO0Tlx1CYI3fXtftH6cFrB7k
 p3v7B8Ni0idzUAlvv6ZsZdybt97ECIyXzOTWNtNgt0weSj1dNXY4st3WgjH9ZmgylOX0
 PWHZSALLOYUrUGWBjeC5OMwdNcCPvQgVxLlli/UVf+MDgysjAf8e7bYXANR4wR+oXRdC
 X7H1Z1F4PRXzPK+A+xcfEpBBcACH5XBtXjsmEMP9vKXwPePea0W/rJix4XlLeqv3XXdz
 BIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YXwin+RJvFLc/++rznYBkhOt++6QQAfmSlHS3EgoJsk=;
 b=cKV231bVX1FAm182wgauDmYshgJxltZiEAxJyQoNu8BJvFHSKfduCvGlOn0hmKTq4c
 QLsASrNQlXEh0WFnqcJIMY/4hNFldxtyiPXNvriSlsOcCpY3hp5/uBghfmzr6zzC85Ux
 aFiFNI7BujAPpvs698tIYZrqsFN7wx9Pf/sik3m8tTAYtX1vbESeLQHrNDgYsJfp6QJz
 NapozyyeUe3F0/CyZJSIToyXAztv/ivXjQSQSB1/soVqhZi37qRF6ybnn5BxFXz+UonE
 MVns442EgFyokyNui9fFn1wA1EoxExR8BQFkoWsEy8bRz7gwcGjNQ0hbI50ihZy0lQST
 QefA==
X-Gm-Message-State: AOAM531gl8Y9lcIW7SZo87gb6t9oa4Ed3cp9Z+6yYa8SNDxakKjGXOff
 PIMJV423fbGtWbjFY3kXUDg=
X-Google-Smtp-Source: ABdhPJz9XrtNdgN1Kb59MWLt94pMkOteYGEMbqbOSU9EdaKuFLRjZCCBErxYtTRyGmN7o6epXjryqA==
X-Received: by 2002:a17:902:b406:b0:14f:bb35:95ab with SMTP id
 x6-20020a170902b40600b0014fbb3595abmr19983545plr.140.1649437821276; 
 Fri, 08 Apr 2022 10:10:21 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 k15-20020a63ab4f000000b00381eef69bfbsm22263494pgp.3.2022.04.08.10.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 10:10:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Subject: [RFC PATCH 0/4] 9pfs: Add 9pfs support for Windows host
Date: Sat,  9 Apr 2022 01:10:09 +0800
Message-Id: <20220408171013.912436-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

At present there is no Windows support for 9p file system.
This series adds initial Windows support for 9p file system.

Only 'local' file system driver backend is supported. security_model
should be 'none' due to limitations on Windows host.

Example command line to test:

  "-fsdev local,path=c:\msys64,security_model=none,id=p9 -device virtio-9p-pci,fsdev=p9,mount_tag=p9fs"


Guohuai Shi (4):
  fsdev: Add missing definitions for Windows in file-op-9p.h
  hw/9pfs: Update 'local' file system backend driver to support Windows
  fsdev: Enable 'local' file system driver backend for Windows
  meson.build: Turn on virtfs for Windows host

 meson.build         |  10 +-
 fsdev/file-op-9p.h  |  33 ++++++
 hw/9pfs/9p-util.h   |   4 +
 hw/9pfs/9p.h        |  22 ++++
 fsdev/qemu-fsdev.c  |   2 +
 hw/9pfs/9p-local.c  | 273 +++++++++++++++++++++++++++++++++++++++++++-
 hw/9pfs/9p.c        |  85 +++++++++++++-
 hw/9pfs/codir.c     |  17 +++
 fsdev/meson.build   |   1 +
 hw/9pfs/meson.build |  10 +-
 10 files changed, 449 insertions(+), 8 deletions(-)

-- 
2.25.1


