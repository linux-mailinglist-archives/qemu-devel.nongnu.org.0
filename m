Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039ED43B4F6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 16:58:11 +0200 (CEST)
Received: from localhost ([::1]:44378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfNtx-0006b1-Q2
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 10:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1mfNqG-0001Y5-Nj
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:54:20 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1mfNqE-0000w4-WD
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:54:20 -0400
Received: by mail-ed1-x52a.google.com with SMTP id g8so13823333edb.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 07:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WeWUIR6mqa3yQZ9NJ7yBERf7DxJ+VLNRGMhaRMPYElU=;
 b=KXQ91J51qCV1EOc47O8wwMJavDzP9HQjUJ76MlGBSU5ExR+0SQcjSpcImzHOj/niVa
 0STpZNRQY95OWZcILtd6JlseBcd5K+7FvI7Q47VGvEMpwUu+6GetRNE5rc3QSH59iIMm
 MuHzMBhRborRNyze3nFeFJhAWzxbhNdFOz7zP/LuGRpM2QcDHKcPi8HjQxYpaWSuT3za
 1vZziP/5SQtVGwwu9c95cRjyLXJy4lBufsP5lVr0U5Honr0WM5P+rtVxQIYwCLbRB9dJ
 ZgNkyGskliseDcLrqC1G3qX4VqNReDCX8rJfJFmjd70SuOnwJkrTC5xKzGzWhq2kHL9C
 E5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WeWUIR6mqa3yQZ9NJ7yBERf7DxJ+VLNRGMhaRMPYElU=;
 b=TtdBhMlg1WnEYVUvOSJOFcoDh7v+6Aoxkt4uxizuhi2qRekXLX447BBVJkCPD1X/HF
 EhQst6RxTwWmfbuyOR3fTDfz3lFOyh6ahuE18DsOXQckTyw2cwFFGkm8ega4YU7FdUNS
 5OTeE/g5DfsOhl4ys0I2lH1r3yofJCW31Tcxx5I2Mg97DanlcSvj5mPJXp6ILf1HrZQZ
 2uP8RvX+5XZyVjfU4Z1HrM62WnTFroCvDlkYlb5HOiAP1YwT3DbLKgz/kdX1/kDK0VKY
 KNLvWYqnfncFLx2XodiTXEQxMGj0yvtDAN0kD6Veb8nGE3rUE7Yf0ZTLTobuqfma6l94
 wX3g==
X-Gm-Message-State: AOAM530EDiXZc4Nkh7/PlQV1ZtKsxqHBav9DhUoJvCS+3PNp5lx+lr+I
 p/jaq1IlP7Fpv4/AC9bS+B3ntY0Bj8ZZJg==
X-Google-Smtp-Source: ABdhPJw3PX1UAQvG5s/GQJVlXV05HOiVXHGuBWzTL88QtQypVHG9vbw+UmyYq2WnXjI3XT3kdau6Ig==
X-Received: by 2002:a50:d984:: with SMTP id w4mr36938975edj.375.1635259895669; 
 Tue, 26 Oct 2021 07:51:35 -0700 (PDT)
Received: from msi.. (bba177573.alshamil.net.ae. [217.165.4.27])
 by smtp.gmail.com with ESMTPSA id b19sm9182333ejc.107.2021.10.26.07.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 07:51:35 -0700 (PDT)
From: Jose Martins <josemartins90@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2]  target/riscv: fix hypervisor exceptions
Date: Tue, 26 Oct 2021 15:51:24 +0100
Message-Id: <20211026145126.11025-1-josemartins90@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=josemartins90@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Jose Martins <josemartins90@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series fixes the forwarding of VS-level execptions to HS-mode and
removes unecessary code previously used for the routing of exceptions to   
HS-mode.

Jose Martins (2):
  target/riscv: fix VS interrupts forwarding to HS
  target/riscv: remove force HS exception

 target/riscv/cpu.h        |  2 --
 target/riscv/cpu_bits.h   |  6 -----
 target/riscv/cpu_helper.c | 54 +++++++--------------------------------
 3 files changed, 9 insertions(+), 53 deletions(-)

-- 
2.33.1


