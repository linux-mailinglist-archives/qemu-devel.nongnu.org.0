Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502926137C0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:21:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUiY-0005GG-Ue; Mon, 31 Oct 2022 09:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhz-00034v-Oz
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:07 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhu-0005Sr-7e
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:06 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 b20-20020a05600c4e1400b003cc28585e2fso8010464wmq.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LBlBANGd2986+xA+nmjS5WqlGNgbx4DKb9YGO5x31Ds=;
 b=oXCdy/8j5p2qFpqmzgt5/Yjf18zpFdrzibs1a6mtNruLjR9bE/f2gAgnvlC/KIB+HZ
 EAUF08Av14BRxRzqQzmOQuwwHc56BT/WO6Lpwqe8T1HlPzfZ2X4sNxBzHu1Tjky5lxGf
 /KS9PKcN7xDEQpU7BZLH3h9KxRl2elSadVMSld+0oINUOZDNejIAvDr6O5y3QOabiugW
 MvZYWD2NGxv+ihvgT3ABXk/3V/YUZvR8n3lTfJW9+J1frh3ZLBwxXlREieebFJ1er3jY
 DfbJWsvCm/I4pz8wF0HRQ8hm9gyjcGy2ZTCCJh9na3gVwmatIwecFBcPXobcGpUHI8k4
 Ktaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LBlBANGd2986+xA+nmjS5WqlGNgbx4DKb9YGO5x31Ds=;
 b=C9gAehwbviGI90UzU1FivkRgQ/2ZFDF+4mY0dftPz69UkJGPwSN/OGQuNAVC7ctyeR
 9EtCnQQk3gQDiWnnhU4jitu8qDXyEXcrjS7quxvZKmFSaND+EcqmfwLF9Ha+lCMHrSPU
 peq2l95G9J+YWAppX9T8+1Flvk/jKLKRxl7/PTe/HN6AgHZSMJWbUmgL2zBrSRUDRVTe
 LHO3610yKLnvr9jVMiseaAovRINfJlcZEe+0e5Ce4CIeMiTroSWHeGpyLlqgiHj1nwq8
 3Tn9DfKykuVgIDw0pWJbGlVRliV4XgJPVPWMDY9rIanH+iHLGM/1rQr1RSEhx+GFgUkF
 nPJg==
X-Gm-Message-State: ACrzQf1G6RCPe00x7npykEZ/3BI/S+bMhpMMeEgKcx+mt6AIIfMU8Nqk
 Kr8jvd/0qJ6WERuRaf4ft9Brxw==
X-Google-Smtp-Source: AMsMyM7Jk2phV20tPQ0iokakkiMBb9UmevgAdEbVurI47MCA+zgCsStk0Ic2t2BVNTw7ULcE9DQ13Q==
X-Received: by 2002:a05:600c:3b87:b0:3cf:59ea:ea26 with SMTP id
 n7-20020a05600c3b8700b003cf59eaea26mr12219508wms.159.1667222400386; 
 Mon, 31 Oct 2022 06:20:00 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f31-20020a05600c491f00b003a6125562e1sm7078467wmp.46.2022.10.31.06.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:19:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 892361FFC7;
 Mon, 31 Oct 2022 13:10:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 17/31] MAINTAINERS: add features_to_c.sh to gdbstub files
Date: Mon, 31 Oct 2022 13:09:56 +0000
Message-Id: <20221031131010.682984-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221027183637.2772968-17-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index ada84db23b..85ddef2d75 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2688,6 +2688,7 @@ F: gdbstub/*
 F: include/exec/gdbstub.h
 F: gdb-xml/
 F: tests/tcg/multiarch/gdbstub/
+F: scripts/feature_to_c.sh
 
 Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
-- 
2.34.1


