Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140F830194B
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 04:04:35 +0100 (CET)
Received: from localhost ([::1]:39224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3Vha-0001Ig-4B
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 22:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l3VYU-0000Mx-J0; Sat, 23 Jan 2021 21:55:10 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l3VYS-0003i3-Vr; Sat, 23 Jan 2021 21:55:10 -0500
Received: by mail-pl1-x629.google.com with SMTP id h15so3045231pli.8;
 Sat, 23 Jan 2021 18:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gq79wtNdkMEoBleQb6W3xZAzvk0xvFQyqyLanl+JX3c=;
 b=TFuvV/awoo+rp9WaAkpJPvN3hx4SevBVdVAfyrSASz/8INtpKjYJEmRg8hbx5kgKJB
 hmXKQfr3npmafMOzwobxzb08J5GkfXtSlObcrnXS9s4m0VMP1rKnx6JV+UG/e9vF4Xcp
 gTQcwtC7Eyy7iZnLdUKc/h4OaksXjhP6NvVN+B5c0Vt8Am4q5aw05/+lhm5kFAtnuXwY
 Dx5kipQ0tYabxlBu4nzCAa0jCdzc2ucO+vufKPDYBu4UyGR1wwGl6IdGH1zYY7+7GbpM
 uSSWWS/2C5h/HwpxV/kiDo0dIdvgaVFRpwNgKCHj6GggzGMV8a8cSEPOEgULEtFTxoP1
 Dy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gq79wtNdkMEoBleQb6W3xZAzvk0xvFQyqyLanl+JX3c=;
 b=GnD2FgNMDi4g61S+UIW5pyfaqLCkNQhqk9VbbqxvJntTDgMajW4f2n9guR5ufFy4Nl
 FnKdrbxq0bExoClYc6Wgws0pJRKupwYKigoH0lyF3L3phY6u4g40iJtbRH9sobFtsVPi
 RKbcqH1q3BtdFOW6uq7FrXlbPmqyadBaBsXdKG0unvBV0OCO0WC3dp+Y6zJ/8qaGqhbt
 QIDIzzB35OeMlWXmY7Oyn1SxeeP4fN6M5vTLmGYBk0n/joUt4xiBlF21s5nWlA7ZBCaC
 3dc7GVPbaqpWxx7uu7Y5aVjPXLA+ExupFG1Lhp88h/Sd2XM44LJQEGF5t2glW78fs2wI
 vCiA==
X-Gm-Message-State: AOAM532DQGUR4Q44vJFp4I28kkTceFlp+MajlFab1vq2ZIYLU93zTz6b
 +fr9fVSZ3BqzY4kwD4QenI4Pb0dAt8IShA==
X-Google-Smtp-Source: ABdhPJz7GyjSe7TDLKmfROwceETBnrjtlbO40EJez2KQgWtKsQyVqxhsBepuxFhUg0r8S3jUIjFKgw==
X-Received: by 2002:a17:903:181:b029:df:c7e5:8e39 with SMTP id
 z1-20020a1709030181b02900dfc7e58e39mr12632676plg.25.1611456907256; 
 Sat, 23 Jan 2021 18:55:07 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 77sm314842pfx.130.2021.01.23.18.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 18:55:06 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V6 3/6] hw/block/nvme: add CMIC enum value for Identify
 Controller
Date: Sun, 24 Jan 2021 11:54:47 +0900
Message-Id: <20210124025450.11071-4-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x629.google.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added Controller Multi-path I/O and Namespace Sharing Capabilities
(CMIC) field to support multi-controller in the following patches.

This field is in Identify Controller data structure in [76].

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 include/block/nvme.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index e4b918064df9..d6415a869c1c 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1034,6 +1034,10 @@ enum NvmeIdCtrlLpa {
     NVME_LPA_EXTENDED = 1 << 2,
 };
 
+enum NvmeIdCtrlCmic {
+    NVME_CMIC_MULTI_CTRL    = 1 << 1,
+};
+
 #define NVME_CTRL_SQES_MIN(sqes) ((sqes) & 0xf)
 #define NVME_CTRL_SQES_MAX(sqes) (((sqes) >> 4) & 0xf)
 #define NVME_CTRL_CQES_MIN(cqes) ((cqes) & 0xf)
-- 
2.17.1


