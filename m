Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91B14ABCE3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 12:53:29 +0100 (CET)
Received: from localhost ([::1]:49034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH2aG-00071Q-H8
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 06:53:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nH2GM-00082n-UN
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:32:54 -0500
Received: from [2607:f8b0:4864:20::1032] (port=37695
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nH2GK-0001iR-6Q
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:32:54 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so2864523pjl.2
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 03:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n8B84oDswUDirHyCnWjvyG5hpiK1aVNeOA+tbWoSZu4=;
 b=Dyu4l/ucC91eGF7l8V4WpdRWKWej24EItI7gP2Ysm47M9uSbRlsFpoODbIHELdKLMp
 b5dwjQiLT52+d5kjmk4IzPEMo/NV7HbBuj1CKAWsLcOqpDz6cWZW2kFmchj4/fBjsRDe
 Ho43JYCw84bjSO5Kmk+cJsilmUfKoSZhdf7I1BiSHtYMP4whNqINymliFd46oHs8vJik
 PV26Di1hNy0XA+6wm2Dhs4IsdquOIhZtrDzPgNkGKc51tjtooanjZu/QR9jtR+0chmSV
 oaz4sfzTK0//hWc8kiUSuyNFb5JmvW2wNDTKNhSPhLkQ7XTf7yDasguQT6o44SKj2DuR
 9epQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n8B84oDswUDirHyCnWjvyG5hpiK1aVNeOA+tbWoSZu4=;
 b=HyifWg1K8gTWfov9c6F3b1mY+2sNJ9BNJNJHlubWyl+JBemHMCR38Q1qbeLkX/xdiw
 k//L9QFiuELc7agjbQs210DfaqPp6A8YP2o6oEhoE+fCZy9c0Tjyx9TLH7XkbeGuxuDJ
 tgLmvwc01wut7zKJpr0S4R5nMCEfSuB0O5TksmfZLZQjr1b0XmTfTPtDwi9JvRz3oZkX
 5r5w2249Sc7f9sSYyZConC09Lfwt65C4NEZ5NtqcnN68xr+XW+2Wod3+ExSF4vNwwbch
 +wKahaid1KRVnDG7G7S9ms5CcoF3eUqEYFoGJ4fuIlaVE8FDOELSwhMiVKKDONW5KBZI
 950w==
X-Gm-Message-State: AOAM531gv5tFAxpX+rc4Upq/xRUevADJOYMd1kHyO+fcBhMVrifspRxM
 Cvxqt9tMx2cENyYnaNffq+soUN13zN78NpaF7Oz0lg==
X-Google-Smtp-Source: ABdhPJyW1UAHfPgCUTjtcMYcR+oDAje3X8Rd5ADe4+HE5E972qV87fxjoQ/o2KWjOS2FpZvYeW53PQ==
X-Received: by 2002:a17:90b:255:: with SMTP id
 fz21mr18087254pjb.226.1644233570026; 
 Mon, 07 Feb 2022 03:32:50 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.242.56])
 by smtp.googlemail.com with ESMTPSA id h14sm13016345pfh.95.2022.02.07.03.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 03:32:49 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] hw/smbios: fix table memory corruption with large
 memory vms
Date: Mon,  7 Feb 2022 17:01:26 +0530
Message-Id: <20220207113129.2701722-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset tries to address the issue raised in
https://bugzilla.redhat.com/show_bug.cgi?id=2023977 .

Patch 2 and patch 3 are dependent on patch 1. 
Patch 1 makes some code cleanup to make thing more readable and also is
a preparatory patch for patches 2 and 3. Patch 2 is the actual fix.
Patch 3 adds an additional assertion because of changes introduced in
patch 2.

Ani Sinha (3):
  hw/smbios: code cleanup - use macro definitions for table base
    addresses
  hw/smbios: fix table memory corruption with large memory vms
  hw/smbios: add an assertion to ensure tables 19 and 32 do not collide

 hw/smbios/smbios.c | 58 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 15 deletions(-)

-- 
2.25.1


