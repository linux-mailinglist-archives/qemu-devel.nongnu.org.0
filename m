Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1FD5F3807
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:46:25 +0200 (CEST)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTGV-0006M4-Rc
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7e-00020y-HS; Mon, 03 Oct 2022 16:33:06 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7c-00042C-WE; Mon, 03 Oct 2022 16:33:06 -0400
Received: by mail-ed1-x529.google.com with SMTP id a13so16217193edj.0;
 Mon, 03 Oct 2022 13:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3X2MOrCfQF2nnuG3xIYe1F069ucsNj4Si496a65t0z8=;
 b=ZLxykCAGmZIX1kF61doHVkObPXvztmtsi39S3TP3VD4y0Yc9l3g7BCsP0Si9wmD1rt
 bepys7ODVG7lx26PFOKm3tH6pMyyBjcvDYlcm17+12xZF065T88kCM0pKC+a2kdfNjpl
 qUo34hzvNDX1afAMll/0BTbgpymY7lqKYUz7rpkpEyTfZf71s2FPAD6/ag46ErEFed0B
 ivjOWO/RiTGWDIPggT3EBmUcTaJlgF5reDNdH3hEnGeQd9ib2l1BVw7baFYDOdAfAf1v
 je7FNGSSKv0xA1lXxrrumsT0FeAjirTyRcwil2zSUBlRWQOOTBRHJeZpd+IiJL6Sq6ph
 dLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3X2MOrCfQF2nnuG3xIYe1F069ucsNj4Si496a65t0z8=;
 b=IAKFVzAvs/tqTdXnRyE1oGSB84ddFzulMMsxwQf/ROhyYQbOmQF9DCbmcI9CQqYptF
 46zS9fyDFsh4SrrMPBQxhgIrCyUNN9fPc+O70FeW3PeiQXag+7nl1tOeOL4laSyRQSEk
 xlJT9cbCmxysru86/j+IZoH/Pu4WkPfyJ34ZLB7hvlL3BffSVS3bXYjpjJ4abkxNA+XQ
 /eMlV3RBVed3lDkTrY7XiwOzOW5fRnEcroVecJVMqEZiDFJzm7MQTB7DUl5QVklTUO9d
 471sXqC9nlkFYQN+wlM4ALVaNzSETpfwVJDpcvHb/SWyRD1Y0YNs3CNJ3yM8bJW4TCk0
 hv5w==
X-Gm-Message-State: ACrzQf2mFhN1voJapdMShx/KHcU1sAdlwTUki244/nLTJRnUaNr9BxKG
 sGTNj6AMIzahK7NNxbg888akOp82uGA=
X-Google-Smtp-Source: AMsMyM4hBNamiahg6JwabKefo8ezc0qQVWvw39rdpGJsLlc1dM5ff6cZVXM2tQB5M8yueH61WnsLhA==
X-Received: by 2002:a05:6402:154f:b0:458:9e48:1650 with SMTP id
 p15-20020a056402154f00b004589e481650mr12786396edx.201.1664829182645; 
 Mon, 03 Oct 2022 13:33:02 -0700 (PDT)
Received: from localhost.localdomain ([46.183.103.8])
 by smtp.gmail.com with ESMTPSA id
 lb9-20020a170907784900b0073ddd36ba8csm5978087ejc.145.2022.10.03.13.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 13:33:02 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 03/13] docs/system/ppc/ppce500: Add heading for networking
 chapter
Date: Mon,  3 Oct 2022 22:31:32 +0200
Message-Id: <20221003203142.24355-4-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003203142.24355-1-shentey@gmail.com>
References: <20221003203142.24355-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The sudden change of topics is slightly confusing and makes the
networking information less visible. So separate the networking chapter
to improve comprehensibility.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/system/ppc/ppce500.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index 9beef39171..ba6bcb7314 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -146,6 +146,9 @@ You can specify a real world SoC device that QEMU has built-in support but all
 these SoCs are e500v2 based MPC85xx series, hence you cannot test anything
 built for P4080 (e500mc), P5020 (e5500) and T2080 (e6500).
 
+Networking
+----------
+
 By default a VirtIO standard PCI networking device is connected as an ethernet
 interface at PCI address 0.1.0, but we can switch that to an e1000 NIC by:
 
-- 
2.37.3


