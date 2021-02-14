Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1C931B20D
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:41:51 +0100 (CET)
Received: from localhost ([::1]:45692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBML8-000796-6e
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLid-0000pY-68
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:03 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLib-0004fF-LT
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:02 -0500
Received: by mail-wr1-x436.google.com with SMTP id u14so6132318wri.3
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mkWyAtTNih1SiLyNenBvY33a3fDFwrFdz2sJ8roLmlQ=;
 b=ld/Qv1fTQ8DagOv3MRhc+TdISAknasL8/TDDYKNbawhinUXIFhsz9/DBOiNxTVKBl3
 tsES6NQaEH/zl3vmsOTh5wNNt2QoQuTJPGSGBiQFDuViNLBos238L0uddl9iYbPmXczX
 MgbHOEGh+HYRC6ejS/mhHW6/+tNu/1I+3GhOzdm9eizvRvGTjAfv+S66Wgln0RD4CJ0C
 l0I4wDkp1GMap8A8OBUgErqC+vFGE2znxlKfgO1XvqrLFCzBOTtv/d5WUwb1KYyxL+Bg
 tk/CKs1b7v6S5B92YhyT8dh3kTyx00O2Uz13dHzh/eOmgaUNk86VhYJ9CEf8zmX/wRcw
 Xd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mkWyAtTNih1SiLyNenBvY33a3fDFwrFdz2sJ8roLmlQ=;
 b=JcT0RY3al1x4pJU5NtkknF1l+p36s4z0l0y6MbRq+/eNcKtNRTwXl5yQrBsRce0PsY
 d4Lk6J68oPnnIeVbxlrl3m18Okd8pg5DhhFAd/YH9pH1OEK23DcH8Pe9mPEmYkjMxam9
 DkzhOiTeQBH15Zjq0kAA9asDlNpQcaGSiLfR/LuHZtyu6KKQBvroggDPoyRMN2ip0YkD
 +SCSNUXFl3NVDKaYJgrhN4AQBKXCMqkDIMPVTmcViHd3KSDgtKnjcROyJtPNmCtSPS06
 zCwWJPzciYQN5Wf+/hWTxa37kK/rZ8HJ+nwtTZrJM++iCV5iQm1Y19/pJRpvOHuF7vtg
 tkNA==
X-Gm-Message-State: AOAM532f1yzS5cQBxfa6BEFLcHBbwbNEKjH6ww315P/WKeavbVRth17e
 QZX6STYNSuwjudLyp5fK0lJX+VYTqL0=
X-Google-Smtp-Source: ABdhPJyvfLPXKLBWmqD8mDDh/vxhoPLrVDdV1KxWa0ZGoCVR7YHQxortDd9p9RWEiRZ9+wBd9LfBhQ==
X-Received: by 2002:adf:f206:: with SMTP id p6mr13576873wro.337.1613325720028; 
 Sun, 14 Feb 2021 10:02:00 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l2sm21551953wmf.15.2021.02.14.10.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:01:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 33/42] gitlab-ci: Pass optional EXTRA_FILES when building
 docker images
Date: Sun, 14 Feb 2021 18:59:03 +0100
Message-Id: <20210214175912.732946-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass EXTRA_FILES to tests/docker/docker.py to use its --extra-files
command line option.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/containers.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 90fac85ce46..587bd4ba2e3 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -16,6 +16,7 @@
     - ./tests/docker/docker.py --engine docker build
           -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
           -r $CI_REGISTRY_IMAGE
+          $(test -n "$EXTRA_FILES" && echo "--extra-files $EXTRA_FILES")
     - docker tag "qemu/$NAME" "$TAG"
     - docker push "$TAG"
   after_script:
-- 
2.26.2


