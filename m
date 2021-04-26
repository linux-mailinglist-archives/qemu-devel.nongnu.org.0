Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E5636B3E4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 15:13:26 +0200 (CEST)
Received: from localhost ([::1]:42342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb13F-0003Tu-SQ
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 09:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgenfv@gmail.com>) id 1lau3k-0000JA-89
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 01:45:29 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgenfv@gmail.com>) id 1lau3i-0006E5-Dz
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 01:45:27 -0400
Received: by mail-wr1-x436.google.com with SMTP id l2so2045856wrm.9
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 22:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yKz4dNhDw12bnTrkqkxmocHEAiuDoy4nd0MH1Ips7Hk=;
 b=TZwHvlfrvfZK9a07/0ozLHQ5TYSkQtblAsPGbpnYp5vO5YOi9amNWkkHD30KmpeqE8
 mY8lKTaXL+jJcfO8u+yA5EVpAoKeO/YDN9t3IeL5ckf4T7PJn7gQleVbUzijOW7quBKl
 2xcThGUtCVPksW3q+5sQHQsAq+jycnCv04eP67p1rpuZtZkcFILEejlNtpKxIjzhcnVB
 Bs5Yi3f/dpNUcBYyvUQ/avQYgTCqIoJ1XzNwRNy0XBrrF3FiC3eonNuyIlJIhLagyDki
 RIkFRp01IdRI8C3pEgYMtLX49IMAGrkqQRQ2WGU9KP/XgI66RHfH6NMV00NiaOMemieT
 LxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yKz4dNhDw12bnTrkqkxmocHEAiuDoy4nd0MH1Ips7Hk=;
 b=JdZ5YS21Zd/pRxXPYPL6Ii8LJYfewvhtWzKQ5W+AIn0M5cMHYB/cYs6s8TIBDXv8CV
 MDBYkFsG2qCZ4HZkay77eSZL9Tz6ZrRHKgCgKhkXlcH9c0tT2egM6kuKwHJz0m3whv+S
 dC8nKAz2pPUBrGD0GF+zxVksZXVddzb5mQGCKD/6L2lZMEzFgvD7B/jg9hCL2QTr+3x9
 xf/0pVwbVZTmkpUvqPZyNKx+WTpQF/GBnJHJrng/DoY9U5HXqqRSnnUDsrc80s1nDFVi
 TwidyoYUQkpCSfLvW5tC0g272qzpH5BXsTYUD3yF2e5UG+OvJkFWzHjJxIaX9G8H+bw+
 ICyw==
X-Gm-Message-State: AOAM532L3vftznt5nNBqt0gkoT0yYIKdCX//eU7qsptbOZGgfnyxDNTN
 7vCnCA47Ge+gAdrxzcZZGizLXujQ4mck75/w
X-Google-Smtp-Source: ABdhPJxWtMqlQGvpAbzjj2UT20B19WmWgMQ1KjI7iPQMSNdOVeG3sJhiZ766ZGqO+uEnUS5ZYMrrpw==
X-Received: by 2002:adf:eb41:: with SMTP id u1mr20636851wrn.20.1619415923575; 
 Sun, 25 Apr 2021 22:45:23 -0700 (PDT)
Received: from ubuntu.localdomain (host-92-0-155-74.as13285.net. [92.0.155.74])
 by smtp.gmail.com with ESMTPSA id c5sm12100641wrs.73.2021.04.25.22.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 22:45:23 -0700 (PDT)
From: Edge NFV <edgenfv@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] make vfio and DAX cache work together
Date: Sun, 25 Apr 2021 22:45:12 -0700
Message-Id: <20210426054513.132980-1-edgenfv@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=edgenfv@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Apr 2021 09:08:52 -0400
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
Cc: edgenfv@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


I am using Kata containers and create containers inside the virtual machine. The hypervisor used is QEMU.
My workload is I/O and network intensive. So, I prefer SR-IOV VF (which provides better network isolation) and DAX caching to work together.
However, I was unable to create a QEMU based virual machine when the above mentioned featires are enabled together.

Currently DAX cache need to be set to 0, to boot the VM successfully with the SR-IOV VF to be attached.
Enabling both SR-IOV VF and DAX work together will potentially improve performance for workloads which are I/O and network intensive.
This patch enables SR-IOV VF and DAX to work together.


