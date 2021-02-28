Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C880C3274CB
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 23:26:17 +0100 (CET)
Received: from localhost ([::1]:35598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGUW0-00087K-Pc
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 17:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGUTJ-0006ks-Ki
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:23:29 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGUTI-0005Zl-8r
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:23:29 -0500
Received: by mail-wr1-x434.google.com with SMTP id u14so14125047wri.3
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 14:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BXmrusvs8cQpTf8B6rRXRaUbYFo/3AkcYqUUCH8es0A=;
 b=GyR396nDx0s+oGFR2oui6xiNptqhTXW0PCN2Qiu211yJs6DQdWuPwMtuSEIHlFfUnq
 klGWRlbnLbomdbRm6P1tJfyXobce43Azsxhsjyd+8HlziRY7qOXocedUdQXRrFMEFckX
 ugq2TpOJ992/IkOUegBkhgzLybsOzq2cg48jRn1j7LgZr+ba4i8P1d6FztcUePB4+1az
 uXxRWE29ZSDPimrlYrWmzltiFsNGj7ZTHQcvJXQqraqVyA1SShi7T5Gd2txuTY4mEXUu
 vFRxS1MAHhGYINtnJbO8Bl9hBH0mg8ELD4w8hWy7B6VPiVGVWdwFYnjQJbECRBJxC7nZ
 VPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BXmrusvs8cQpTf8B6rRXRaUbYFo/3AkcYqUUCH8es0A=;
 b=GPYqm7mRRT8w6yCP86E8/P1P5+olYkoDA3NRxe11bJPqoSKX/J057JWnVpZBGyd4Uo
 1Pbsd4toWNDq+oToRy/rakQtyO59ZnFPXsEgeR17DHiFTGOfJB44o/EQy9d91DDb4wke
 H8IuUwLw0iH1riQcEEdVwwWct0E4YSHq6DArudTgRVwrld5nMgwJ2lZyZVoE7As210Nl
 OBfwrNkSu0iTm40gkDlG92imG/inQX7p91ZRIlBB1SqQYqGWnUTL0/wj7G2mE64KHOgU
 P7BnBwpDrPaWA6PihfxiRz+7KDGT4X3BHJk0HoQZ09deWyIZtbC6RlYlyAqVjkICcOKv
 AOhA==
X-Gm-Message-State: AOAM53144EeKXF8Kueytuor7tFG9tFhFua+hyRRnKXPgAyD07NWsrIZ/
 30c2Zk6UCtaTGDkKPhcrCusEW4kqzBM=
X-Google-Smtp-Source: ABdhPJwNgemapcesiQ2TPD8amR8qAwtPJXq7tu5y88MpE+NOMeSg0YMl3PwZNey0ZSRFanoPQzMq8A==
X-Received: by 2002:adf:8445:: with SMTP id 63mr13871920wrf.222.1614551006818; 
 Sun, 28 Feb 2021 14:23:26 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a75sm8930531wme.10.2021.02.28.14.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 14:23:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] gitlab-ci: Pass optional EXTRA_FILES when building docker
 images
Date: Sun, 28 Feb 2021 23:23:12 +0100
Message-Id: <20210228222314.304787-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210228222314.304787-1-f4bug@amsat.org>
References: <20210228222314.304787-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Fam Zheng <fam@euphon.net>, Brian Cain <bcain@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alessandro Di Federico <ale.qemu@rev.ng>,
 Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass EXTRA_FILES to tests/docker/docker.py to use its --extra-files
command line option.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/containers.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 33e4046e233..7137cc4184d 100644
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


