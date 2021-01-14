Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C730D2F67EC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:41:42 +0100 (CET)
Received: from localhost ([::1]:35298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06cv-0004OX-Rs
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wU-0003pe-9z
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:50 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wS-0004z8-J7
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:50 -0500
Received: by mail-wm1-x32a.google.com with SMTP id r4so5293139wmh.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TH6OKEZmHHfZ5ewcQol0S5HIv7LFOYJgDKdN3Gq2+Rw=;
 b=K5CGMNHr7pWiqEbmM/VxZjhuBNwdzetq4G7rwBRXdoanPO8LjOdV+3XH3bJpJAMQkS
 kQwgXGlu0vaIc3pB6RHM/UEo/bYoRfkwZeZu8ub0B7qHWGryiaQrOedyXAxCp5+H7sgo
 Roxcm8/NEzieVJNhYPLHVP440LeUT8J5s1uRpxWvoOc3ljcZCbbw0twsaUFQa/2mP1Re
 XfzPJhjjttZNB07cnIeYn9keOUN0C74eE7GC0sXC2RXhRHRqfmTC++se8cub+Neq2TfW
 jNZ1JevzODWLsHm4LjpZajsdwEFqg3MNE7jTwe78n4PLcJQPrbXlCwSOvFrC0fJiF2Mm
 Opeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TH6OKEZmHHfZ5ewcQol0S5HIv7LFOYJgDKdN3Gq2+Rw=;
 b=aYY2jW50fOeDESfXZuPamGOhC0ONOBEWqMjDGxgh9vDyGh4E5R8loXGCtJAQT0VB7L
 6cec+JFTUmLTJplbV1yNkC/O1QafKW8PbTGYij864AXJc1fnqAOH1r8fcVKjJz8VW7To
 dA5ffJ7WIZJt2LB+uE/2LiMJjKCCLXgWkTRtsb7I2HLdyLWA3hWgRFf4Bw1N304JFRbG
 4PYeEpec13Tg2kaGtfhS87Ox2genUERImBYVdFU7qLJyMliqOARRHuDhtkhXDzrqG/+Y
 2IOmUcPMZHQIIjJzqa70khVPvnoK3K0lD38TSFDcwY8Xde2GLICVUE9B/eVdjAlG8jW2
 Szfw==
X-Gm-Message-State: AOAM533b+2MYGnnAevG+BS1rBLpawAHy9/eZK0RW0bA7nC8AG0NdgMID
 /dzUxAafpBoOudArjOIZdRA059bKiIRx1Q==
X-Google-Smtp-Source: ABdhPJzNk4lHAzM3rs0EALgjZ7E9V1LhwJPbjw0acZ7pYjNNRJgKrie8MI8reESq0Eh5p+DErnpu4Q==
X-Received: by 2002:a1c:24c4:: with SMTP id k187mr4953087wmk.14.1610643467214; 
 Thu, 14 Jan 2021 08:57:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l1sm11509838wrq.64.2021.01.14.08.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:57:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9EF9C1FF92;
 Thu, 14 Jan 2021 16:57:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 06/12] Makefile: wrap etags in quiet-command calls
Date: Thu, 14 Jan 2021 16:57:24 +0000
Message-Id: <20210114165730.31607-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210114165730.31607-1-alex.bennee@linaro.org>
References: <20210114165730.31607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For prettier output.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index bbab640b31..f7e9eb9f08 100644
--- a/Makefile
+++ b/Makefile
@@ -272,8 +272,13 @@ gtags:
 
 .PHONY: TAGS
 TAGS:
-	rm -f "$(SRC_PATH)/"TAGS
-	$(find-src-path) -exec etags -f "$(SRC_PATH)/"TAGS --append {} +
+	$(call quiet-command, 			\
+		rm -f "$(SRC_PATH)/"TAGS,	\
+		"TAGS", "Remove old $@")
+	$(call quiet-command, 				\
+		$(find-src-path) -exec etags 		\
+		-f "$(SRC_PATH)/"TAGS --append {} +, 	\
+		"TAGS", "Re-index $(SRC_PATH)")
 
 .PHONY: cscope
 cscope:
-- 
2.20.1


