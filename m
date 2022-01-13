Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC5248CFD6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 01:57:42 +0100 (CET)
Received: from localhost ([::1]:34718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7oQv-0002Mh-Jj
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 19:57:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1n7oMw-0008Uy-SW
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 19:53:34 -0500
Received: from [2a00:1450:4864:20::12c] (port=36393
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1n7oMt-0000Wq-9q
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 19:53:33 -0500
Received: by mail-lf1-x12c.google.com with SMTP id j11so14111330lfg.3
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 16:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d4KMgpGmXet4aUl4Zx2A6eVFEu3a6003pT6zW0NOoK4=;
 b=fb66kGeiC5xZcbxvSM1YQvEWXPTVTtB6oDPKzBy8mB544d+fTWC2nkvAY8Y8Zgx1Pf
 86lrFiiJpsX/oZp2iYRwz1prRH95MpuLvzAYuajCzsDu/hjR3h7RT3f2hUZ+DRmaNb0o
 S3XnKw8hfJ6LyniCEdDfdG2tYdTTfYX2zPrtOwkTmN1/o05wYDH5ZrnPz1JT3PFDfBGJ
 nkII8blnDyKKspl9vsOcYsY1mqWR/aSl/D8wBTEWt/s+sQXy1PI2IxJuPfLx+mZc87Oy
 tT215tHXz4RCXqfrgC9oDjdSJLtThcEpNiLP2vGHmlPCVnrqwjc4UrL50hZJXtNPu11H
 xB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d4KMgpGmXet4aUl4Zx2A6eVFEu3a6003pT6zW0NOoK4=;
 b=O7uKwkGLXI/ps4AXwKjMneeAxRXWlebBayfxqUg214aEv4InjZiUfgy0Wky1Flv7DU
 XYXBtzDfsvyOkpvKZEJqkh/1fcbSQeKrSHASkhdMTP0v93HVnLOZLx+GI18msNHEYEg5
 K66B5H8Jfi09CiKm0AcZLCR0wgoPhwUo/umVFsrUT6UwvyPbLR0jdhHpSHc1bdiP+/gp
 6DFz5BPJ+FdCsL4j2dK8DP39JptlxRneFXk130pbGDDRSsEkM7hX9p1SH3wNADhu2pkQ
 i/XymhPb3gE2YTsTygW6gT+uEMhmTsfGwRX+KxHU7jwBhFENfCcbrl2YMK1Z6FjMsUJs
 /lmg==
X-Gm-Message-State: AOAM533ZAUHSOSEbxCMhw+Kto0p0j+1S9doy4SFp5ud6ynUOK8L5UK1d
 +l4htX0bDsg/gH7sN8dHxr+yJg==
X-Google-Smtp-Source: ABdhPJyejYREWs6h2Up0Dyf0ipLvkxYbRR+Y3vs60tpi57XU/1J8QPCO6kj90jldLlAwc5cs81DHwg==
X-Received: by 2002:a2e:953:: with SMTP id 80mr1018370ljj.134.1642035207770;
 Wed, 12 Jan 2022 16:53:27 -0800 (PST)
Received: from vp-pc.. ([2a00:1370:8174:b458:9ba9:b90b:f25a:ca4d])
 by smtp.gmail.com with ESMTPSA id d2sm107688ljj.118.2022.01.12.16.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 16:53:27 -0800 (PST)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: marcandre.lureau@redhat.com, dgilbert@redhat.com,
 yuri.benditovich@daynix.com, yan@daynix.com, philmd@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] dump: add 32-bit guest Windows support
Date: Thu, 13 Jan 2022 03:52:44 +0300
Message-Id: <20220113005248.172522-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 32-bit versions of Windows still exist, there is a need to take
live and crash dumps of such guests along with 64-bit guests. So, add
an ability for 'dump-guest-memory -w' to take dumps from 32-bit guest.
When running the command QEMU consumes 32-bit Complete Memory Dump
header passed by guest driver through vmcoreinfo device as it was
previously done for 64-bit headers. 32-bit vmcoreinfo guest driver in
upstream virtio-win can fill such a header.

Changes in v2:
    - no change in logic, just split patches
    - first introduce WIN_DUMP_* macros for x64 in a separate patch
    - rename WinContext to WinContext64 in a separate patch

Viktor Prutyanov (4):
  include/qemu: rename Windows context definitions to expose bitness
  dump/win_dump: add helper macros for Windows dump header access
  include/qemu: add 32-bit Windows dump structures
  dump/win_dump: add 32-bit guest Windows support

 contrib/elf2dmp/main.c       |   6 +-
 dump/win_dump.c              | 293 ++++++++++++++++++++++-------------
 include/qemu/win_dump_defs.h | 115 +++++++++++++-
 3 files changed, 299 insertions(+), 115 deletions(-)

-- 
2.31.1


