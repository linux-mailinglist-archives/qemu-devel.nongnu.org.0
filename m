Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FD64AA174
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:56:27 +0100 (CET)
Received: from localhost ([::1]:50584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5d4-0001ah-Mh
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:56:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5R4-0006s3-Nx
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:44:02 -0500
Received: from [2a00:1450:4864:20::32e] (port=42864
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5R2-0007Op-IX
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:44:02 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 n40-20020a05600c3ba800b00353958feb16so4464536wms.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gqTOX28W3qt8BbsuGyKcKQO0DuOujFKh4bBIznlXNxo=;
 b=XERfYqlXffDWIuvlKxPClCRvMXqay9t5AeXVXd+ZqWME6HTbDjuckLqIvKOP9cBH3f
 1gbMRL4RLVLiZBEL61YtKUxaWlP4v2amTPf4kWhYI2QIrVMrHOpJSnyQ0c+9Wb9QupQg
 k0NQYI2J6HL3JztpvooUvA+lAGf8foKwb4SudCWwI2xWCMg3slHwdZeJAKkO16YXTVw7
 Ex5Op9Km0M9fwCKPm8340t6lLO5pBas74rxxlG7oyuJd4CcoRel7/ewqgw2zIMrWbY3D
 FjYxM9F5HOzB++GSEjGOM5okm1/vqrHYS3m8GqF8s4+ZaXK8p4kwxTwOHqTNL5nzytUP
 izuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gqTOX28W3qt8BbsuGyKcKQO0DuOujFKh4bBIznlXNxo=;
 b=hTSwdjWnXv1jABtMu9m4+Rey4Vp518SMXaRWr6A/+aKbIB0mzIbdr/jVj0TnRqECt1
 zkpjuCeOK+XV+oxwlYGf0iFLiTZYKhHczneY8w14pktMlOdJC4qkhsrwsGK2ZgBPj6ei
 AhTQdlwjoF9nWEItZg6RmLY1PAlZ1xg2LoBpADhySOeHlpb5xJDOIsI18inFAW4vbIZl
 YM6l7upgixyelnc5jecqlCKj4YuPyHAvfl8PlY+SwEXvB1iKwebewbhUc5qy/CctffOD
 /5KWQyhZwCj8BG/J8HM+jI2OMFFH7j97VsXsZuSH9tfzRRjr+u+W2ZJin05je6DeraX1
 +uFw==
X-Gm-Message-State: AOAM531M5Qj+vsZ5Bq8lx8+1EaUjaHHEYRErZIOVXiYsC89eCQIw3Zyv
 VxxVw4Ua0UUcu8nVd9myWteRmg==
X-Google-Smtp-Source: ABdhPJxnZArRs+g9hgXZGX2U9Gpg7bN4W1n9woxvPcPUH0HJd9r6kSIi520iN7/2KM6Id1/Pq9QiUg==
X-Received: by 2002:a05:600c:17d5:: with SMTP id
 y21mr430280wmo.102.1644007438921; 
 Fri, 04 Feb 2022 12:43:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n11sm5978040wms.3.2022.02.04.12.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:43:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5D0D61FFC4;
 Fri,  4 Feb 2022 20:43:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH  v3 12/26] docs/devel: mention our .editorconfig
Date: Fri,  4 Feb 2022 20:43:21 +0000
Message-Id: <20220204204335.1689602-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ideally we should keep all our automatic formatting gubins in here.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220127150159.1489286-1-alex.bennee@linaro.org>
---
 docs/devel/style.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 793a8d4280..9e66d133e1 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -12,6 +12,10 @@ patches before submitting.
 Formatting and style
 ********************
 
+The repository includes a ``.editorconfig`` file which can help with
+getting the right settings for your preferred $EDITOR. See
+`<https://editorconfig.org/>`_ for details.
+
 Whitespace
 ==========
 
-- 
2.30.2


