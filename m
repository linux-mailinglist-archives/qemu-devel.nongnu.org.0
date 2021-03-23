Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05473465AF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:52:30 +0100 (CET)
Received: from localhost ([::1]:49684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkGb-0003h8-9b
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOjhS-00071C-QX
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:16:10 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:36404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOjhP-0008Pb-ET
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:16:10 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso19991419otq.3
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9UDa4pseGfomgQXvVx1gs9sBU+e0MU0Fz3Ex+wuItUU=;
 b=WyYt/MHPWp7atDkM3Skkxv7dXS4LKb+vV6wrKWVLeGjWsiOzJHD4uBP0FHMTOkA2RQ
 zLFqCUKuLyCDTYlO3vAXsvWPgqd8ZfvVTq6uBu9No3SDQiynyxYcizq0pVTNtuOSUgd5
 Wo8UB4+eyXPp5XcAwPbpeXaRvbO+e92wkBM/G0cwro/eOucMgcbdWUTAUNr86tHXq/pV
 hUoHtyfmL/hHLR7y0pqXhLIh+5aiT0SEeb4kTiVg6DJvAtoace9+4sOXEj+TXX7mq3r/
 3GmJvHW2m/8TP29brwMQCZOTghB0xZ4MXGuu2XP4tKq+jZ5S3i2Y7QYUd4cs/OtYAO50
 vy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9UDa4pseGfomgQXvVx1gs9sBU+e0MU0Fz3Ex+wuItUU=;
 b=i0s5kZvMICa4vdEpY301PtAhE/Vl2v2fyz7QCc55wxlpJT6weIyQJTpg9IuaUQVVF7
 GOTS3TBIT9XGnaEuG7Ku+GJ4Bv4WVnAvI/4ePpT9OlRmFegiLvUhPlSWGM9d++Xc6eak
 5YVRU7ttcwcQ5w8GUiCeW1WnbpfWhtFhey2vwGe4ay879Re/4MN1K6ClJr4ivqqBw5Bu
 U2+RVXi1J7W7ztr1cTFrH0QpBwAmGMmiKijBjsM+tOA7UeRY81uFAEnK/nIaBh6vXrFS
 7XXqJoqwbScnYpqb3N0pwzn1X1MLxlkAaS4mIjMZAouBL6qP4FJ9zlMSGg+/OcCwOpEH
 hSFw==
X-Gm-Message-State: AOAM533+B7oAWda7y+rlrqwgNpLz/FRzkobkf4eQViD7ZsXzNmsvJyIM
 IOdFDw5moRaznURym9cTBepeQvhV9zZ8NX9p
X-Google-Smtp-Source: ABdhPJyNqBu9+eHvwRiY3E0M4hauK2Lysgj36qLBZP/pW28TDAOua+RVRhXenj8HUUe6bzJrjz3m4w==
X-Received: by 2002:a9d:38c:: with SMTP id f12mr4899062otf.10.1616516163946;
 Tue, 23 Mar 2021 09:16:03 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 8sm4317822otx.1.2021.03.23.09.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:16:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] exec: Build page-vary-common.c with -fno-lto
Date: Tue, 23 Mar 2021 10:15:58 -0600
Message-Id: <20210323161601.454996-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, gshan@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think there's additional cleanup to be done here, where we can
move these two files from top-level to either accel/tcg/ or softmmu/.
But that will have to wait for the next devel cycle.

Changes from Phil's v2: Update MAINTAINERS.


r~


Richard Henderson (3):
  exec: Rename exec-vary.c as page-vary.c
  exec: Extract 'page-vary.h' header
  exec: Build page-vary-common.c with -fno-lto

 configure                |  19 -------
 meson.build              |  18 ++++++-
 include/exec/cpu-all.h   |  15 ++----
 include/exec/page-vary.h |  34 ++++++++++++
 exec-vary.c              | 108 ---------------------------------------
 page-vary-common.c       |  54 ++++++++++++++++++++
 page-vary.c              |  41 +++++++++++++++
 MAINTAINERS              |   2 +
 8 files changed, 152 insertions(+), 139 deletions(-)
 create mode 100644 include/exec/page-vary.h
 delete mode 100644 exec-vary.c
 create mode 100644 page-vary-common.c
 create mode 100644 page-vary.c

-- 
2.25.1


