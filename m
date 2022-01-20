Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BB34950A8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 15:58:05 +0100 (CET)
Received: from localhost ([::1]:36114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAYt0-00051s-BO
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 09:58:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVey-0005c4-PH; Thu, 20 Jan 2022 06:31:23 -0500
Received: from [2a00:1450:4864:20::32a] (port=55834
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVep-0006V4-Kx; Thu, 20 Jan 2022 06:31:17 -0500
Received: by mail-wm1-x32a.google.com with SMTP id c66so11379667wma.5;
 Thu, 20 Jan 2022 03:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HwwJK3Ic8vOiGmskKxf1h+aCakkNAUYqzvWmUqx2afA=;
 b=KFfTFSPPAUYYYOsj9CXpiiq4SZ9PiIV2X7W+ziwph6136otseO+UWwD4EiojxBf8Am
 awYQTasEgnYyOmBSCdw1E3PCFvYrqwI+YkOb3q0N5HrK6SRP9i9h4uAb5obZx32XPzqK
 qCvgHBSut9xlwfWjauHDy9oLWC/HTDmTkjT7ukNS2Mv5tIx/qJRgrHyiZ7X2FPUaTO0N
 wTYmLrADGqm4KYETr2p9+9ZOGHJOTcWQBIXr1X3qbtr48VM6GDZL0DdDNW+xQv518dYt
 uPbBjcf8w7Itz5ulLHemzFOYHmBb0prVNU2fhzvxDQAQZP4NF5WaZCbeWGQnXAECvKvu
 FelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HwwJK3Ic8vOiGmskKxf1h+aCakkNAUYqzvWmUqx2afA=;
 b=K7ozeXLQYxa6r26//Y0OjPlKUl7IrZ7+Ys+PzC8Rtgnj8+qZcFKXyN8tr3QC3OVs1m
 jULtLts+xh+2OoBPVZbI0LfWVKp4Gzm9icWQxv53SGKBT3i1X+gOa91E0nZJlHRALO4p
 bz0WdS45SXsbCcBi7q4zkOQXDDCEHoxCuMW8qnnN/BE2U7c5EWfYSBXJ42pCjx3RMQ8I
 aX0tMEb6GSA2Ve3mDWeKt01RJ8ayeGBbxw2YoMfZs2wWmcvciVhPTmfpW/Vm6x4h1VbW
 8f0mrqrQEwvwYhNL74v7io7qmv9QptebdRjrWAEzuQXev+YjP0ktfhQt32W68dYRhza0
 60VA==
X-Gm-Message-State: AOAM5302LU2ixg5d6rxgfNSmL20AIkb/leYp0OXVzCqUVGRB6kgBUo/V
 G/3RQMFm9rAFK9RdNGrPXy2PNDUy10M=
X-Google-Smtp-Source: ABdhPJxGOSVS1tvB6/CyHvYWfamXF4ha8fA1bkd8ADlTAdotH4h47UdHHGaGIARQSjwT2OYdMyN+Tg==
X-Received: by 2002:a05:6000:15c8:: with SMTP id
 y8mr18130147wry.531.1642678223868; 
 Thu, 20 Jan 2022 03:30:23 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 o12sm3412508wrc.51.2022.01.20.03.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:30:23 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 1/7] MAINTAINERS: Cover lcitool submodule with build test /
 automation
Date: Thu, 20 Jan 2022 12:30:10 +0100
Message-Id: <20220120113016.268265-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120113016.268265-1-f4bug@amsat.org>
References: <20220120113016.268265-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

lcitool is used by build test / automation, we want maintainers
to get notified if the submodule is updated.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 893a5567100..fb78499d6a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3577,6 +3577,7 @@ F: .travis.yml
 F: scripts/ci/
 F: tests/docker/
 F: tests/vm/
+F: tests/lcitool/
 F: scripts/archive-source.sh
 W: https://gitlab.com/qemu-project/qemu/pipelines
 W: https://travis-ci.org/qemu/qemu
-- 
2.34.1


