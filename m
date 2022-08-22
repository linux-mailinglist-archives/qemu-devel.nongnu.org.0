Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA4159C643
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:31:26 +0200 (CEST)
Received: from localhost ([::1]:59768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQCCr-0006JX-Bu
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQAin-0008Nf-0M
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 12:56:17 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQAil-000608-8H
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 12:56:16 -0400
Received: by mail-ej1-x62b.google.com with SMTP id j21so17064789ejs.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 09:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=tVX5rqmUAa9FyrPm9n6/GK4JRI7gAHoJ9NSzsZoKCbs=;
 b=y18g8GyHZUdzN9ObTsFQ79DEYCWY89mQjDl5642QI2a1Q8PAJvKM7UoFwLXIUgpKFa
 GDcL47yg3GN8HvG9IBzWdVfGRzOYPwOqqUlNikSRlFQuohnHV8GbeTtRnn078IcGim4u
 dQbfneD5FB0r4O55sbCevi2sLU4AXQu7OKF4Wr4z7Q1ttcZJ/UMfd6qHayyxDjGgarLp
 C2Sdgei6+gdd+2hZiYp9Krwdr47NnBZSB7nDQBe3B4moxdTXw0UALu0/k4Dgee5vzMbz
 zxU6A17O0qK7od6GWYwVWvAl+8LaUz+bEGnVONUYWWw5owvMvOkjZz0xg7i0VJrik5iR
 +2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=tVX5rqmUAa9FyrPm9n6/GK4JRI7gAHoJ9NSzsZoKCbs=;
 b=0RFT4Fza544Ujgbswzvdu1ZDBrVIq6CAXFC21xJZf/FZyZ42RyTcLI+o7c7dw/UecQ
 GovR6mn1upGhVFpcT5sW8nISFIcDAlqlgSqzy8RMR5TDRCgSyZNzIVFLdOe7tI//UMRw
 elrK7xjeKSqkcr2bnZWFot7pZEAKtsFu5ecVk/awFh4EfP3F/imamVpXLeva7t8gygD7
 UnlMloBZAweCPSF1BkjxjzBwmvopX6/Y3YRxe6XyfRskZWf6SLJ1a7vkacKtPgmBERyI
 UqiZF4Czbnhz26so72qSIgHw6xnlSPKNxqjCD6FIh4bneyCSpxo0b0I98ll2JtZEgCVy
 PQJA==
X-Gm-Message-State: ACgBeo2AVa0roTlUSL6gv6dIxRjmo71Tsms8RQKdZlXGHukNio2Aghg5
 5E2vAbXszdDQbk2BQF1IpuVWFQ==
X-Google-Smtp-Source: AA6agR48ejkmBLN+hvxAkv69vqrAgDWRTqr3dmYva91Pnm2l+KlEtT2gyNYys8WYOp2vt8ZufBNMCA==
X-Received: by 2002:a17:907:a068:b0:73d:5d21:7ed3 with SMTP id
 ia8-20020a170907a06800b0073d5d217ed3mr8460483ejc.685.1661187373884; 
 Mon, 22 Aug 2022 09:56:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w5-20020aa7cb45000000b00445b822005dsm21047edt.6.2022.08.22.09.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 09:56:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 697841FFBE;
 Mon, 22 Aug 2022 17:56:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v1 6/6] qemu-options: try and clarify preferred block semantics
Date: Mon, 22 Aug 2022 17:56:08 +0100
Message-Id: <20220822165608.2980552-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220822165608.2980552-1-alex.bennee@linaro.org>
References: <20220822165608.2980552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Try to correct any confusion about QEMU's Byzantine disk options by
laying out the preferred "modern" options as-per:

 "<danpb> (best:  -device + -blockdev,  2nd obsolete syntax: -device +
     -drive,  3rd obsolete syntax: -drive, 4th obsolete syntax: -hdNN)"

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Cc: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>

---
v2
  - minor punctuation and flow fixes
---
 qemu-options.hx | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 3f23a42fa8..31c04f7eea 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1105,6 +1105,19 @@ DEFHEADING()
 
 DEFHEADING(Block device options:)
 
+SRST
+The QEMU block device handling options have a long history and
+have gone through several iterations as the feature set and complexity
+of the block layer have grown. Many online guides to QEMU often
+reference older and deprecated options, which can lead to confusion.
+
+The recommended modern way to describe disks is to use a combination of
+``-device`` to specify the hardware device and ``-blockdev`` to
+describe the backend. The device defines what the guest sees and the
+backend describes how QEMU handles the data.
+
+ERST
+
 DEF("fda", HAS_ARG, QEMU_OPTION_fda,
     "-fda/-fdb file  use 'file' as floppy disk 0/1 image\n", QEMU_ARCH_ALL)
 DEF("fdb", HAS_ARG, QEMU_OPTION_fdb, "", QEMU_ARCH_ALL)
-- 
2.30.2


