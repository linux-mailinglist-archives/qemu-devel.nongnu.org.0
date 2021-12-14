Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3004742E4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 13:47:35 +0100 (CET)
Received: from localhost ([::1]:47380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7DR-0004dg-6r
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 07:47:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mx77R-0001nH-VZ
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:41:22 -0500
Received: from [2a00:1450:4864:20::536] (port=43714
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mx77P-0004aY-39
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:41:21 -0500
Received: by mail-ed1-x536.google.com with SMTP id o20so62933209eds.10
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 04:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u1AJ4WDFAb8qXnqvLu3p8Y4f7LhlLwPgTMApw9/j9bs=;
 b=tIIq9dBx5amO73eQI2Ig13c2MQUEkwwDPOxqrZNR2WLDRjHLoa/D+zXPlADCjw0OzS
 wtg7TDbX/49CbFOyYBY57oxXSxMAnd6uPcEPOp1XP4uy/lKQRQe9c2TADLsV/FZxoGBK
 uZ6yguNAO/+YZ8/lRyAWHO+9LRisqJS2fr/6s0/QA6hDjjVUWZQ10lGRftgjef4swlSe
 G/mDhJqlZWDLD5W8nUN2LqX/UGl5hQjtSqlIG04dDtHdDm3wf+X+jHnhedpLiVKOWvw5
 g8PheJiNZNd4sSAk9RCJGetX4tDICPr61detJzajv5WHRPCoyB8Ka42qa9brctrNQqTQ
 XP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u1AJ4WDFAb8qXnqvLu3p8Y4f7LhlLwPgTMApw9/j9bs=;
 b=71ka6DtIZ/Xqx/HvHOA1fawcqHMgVxq0MkS8nkbVOrzXfDWE9iqQ3OqeAhwsfDLT/4
 v1r5Hr3SSpCfyT6AT59sHQAznBGuPy2h8nsmHa5r9U3TVu7fc85UcD9L5iFdu8QWPH2Z
 Az8jSoWF8w5xNMbNA1PIOmm6DFSvWEuzS2iZNtn1C74t/Qnpo5NPzMuFYzKYUXPmlepg
 bGtm10b3qkk3em1IUuR/Jyl9pLu1w1HX4oxqJN6KIx9BLvCyxwQgtO4G/iHeROVBvdrZ
 +PoEITdDf5J56d7SqDUoZUgsF3xXpx2/dO6CjTRUjMyKs89of51OrIeUcMjjZtq9AkdN
 a0Dw==
X-Gm-Message-State: AOAM532HxdTAA91l++pPFNj57DzoD3yxr6xF6bh8IEOX/YYaNzWjkqgw
 ZzErBudDXCO2k9XV7Ar0sdefJA7Roh7pLNbR
X-Google-Smtp-Source: ABdhPJxqKExpZhIUJu513IBHOTz3pOCvCfXmwr2VXMS6pFuP8vInNjXXkutR7hKUqzrQxI9+K+VVtw==
X-Received: by 2002:aa7:c390:: with SMTP id k16mr7539146edq.161.1639485676818; 
 Tue, 14 Dec 2021 04:41:16 -0800 (PST)
Received: from localhost.localdomain ([37.72.42.118])
 by smtp.gmail.com with ESMTPSA id e4sm1025351ejl.196.2021.12.14.04.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 04:41:16 -0800 (PST)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 0/6] gqa-win: get_pci_info: Fix memory leak
Date: Tue, 14 Dec 2021 14:41:03 +0200
Message-Id: <20211214124109.103102-1-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=konstantin@daynix.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

This set of patches fixes memory leaks in the get_pci_info function when it fails
to get parent device data. In this case the parent_dev_info and the parent_dev_id
variables will be initialized, but not freed.

Bug: https://bugzilla.redhat.com/show_bug.cgi?id=1958825

Changelog:
v1 -> v2
 * Rename label "cleanup" -> "end"
 * Reorder some patches
 * Perform small refactoring: split logic to separate functions

Kostiantyn Kostiuk (6):
  gqa-win: get_pci_info: Clean dev_info if handle is valid
  gqa-win: get_pci_info: Use common 'end' label
  gqa-win: get_pci_info: Free parent_dev_info properly
  gqa-win: get_pci_info: Split logic to separate functions
  gqa-win: get_pci_info: Add g_autofree for few variables
  gqa-win: get_pci_info: Replace 'while' with 2 calls of the function

 qga/commands-win32.c | 235 ++++++++++++++++++++++++-------------------
 1 file changed, 134 insertions(+), 101 deletions(-)

--
2.25.1

