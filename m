Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9DB4950FD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 16:07:05 +0100 (CET)
Received: from localhost ([::1]:40150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAZ1j-00080x-Hc
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 10:07:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVey-0005cA-QY; Thu, 20 Jan 2022 06:31:23 -0500
Received: from [2a00:1450:4864:20::335] (port=40847
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVep-0006Yc-LU; Thu, 20 Jan 2022 06:31:17 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 r9-20020a1c4409000000b0034e043aaac7so44758wma.5; 
 Thu, 20 Jan 2022 03:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I+xApLAoMBnTvqjBVMTT+SrNme/1HkNaaLkMkxZM+xM=;
 b=hpHNPDqIL9hOmlal2tw892W89TMe45rziNQaK7FEt3cK1KmMHve2e4cVEO54ldC6yt
 Ij7zi1wGfMKYp8YgLTIj+OPZv1tdvRu7mogzw3KfL/JuGuWQEqVWQYAlV81LYZcSSj9q
 DhwECZ5sT981anilXPPZA+ULccf21ZwmJn9j6YIgMSqPcJ0oHsAMaUb/ayaA/gvd2oL+
 4vhgJPsZRufLca9/BYbgn0enh8d8erpgzr83KCvlbC65oLko9dZa51/p3yKa+8Me7+II
 ANuOR1MYgOgQg0QF0l83eeRPAVgTxnc9T/FyTN/ksC30AkhDprjgsjNnOFzNXGXqRS6C
 Tbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=I+xApLAoMBnTvqjBVMTT+SrNme/1HkNaaLkMkxZM+xM=;
 b=01jHPb4qOG96DAFfSQ3WffgfdQNHARtvyC8q2y+g4WaZa13qA93czQ79aU3Fcrk2X/
 rQp1rkB4PiQ3BTd6hRoWEVrHRrkYNfOwYFSbIFw1T5JxVn0gCjxYil9RymmRUwXc3Hip
 QLk61GxiD7rOufOR7CxGKiXM/NRLpPE+JbzbQY5xflytRpgO34sg2uSjdymiy2jnPmOL
 zdkU6jV6jke8D6onNSul+eJa46clLy+yobgMdwXIQAq7vpco2yiSsKoZGMNQspwDTuKm
 lqr2vEcJw1AKPl3EYT35eqFrupUme5Sq0jqKH82KNG3J330aWoAK0EKm6dG4+04L38R9
 n8HQ==
X-Gm-Message-State: AOAM532TMpfkxWHDtR1U3iPUpJIUDnlhk+P1ptRWjFgKAsgWC3zCzPwA
 eW844M7kOCB5qXtLmgvFXlF3Cw0VyR4=
X-Google-Smtp-Source: ABdhPJztcKMDFsiyOhRzMGmmVxul4mroELibFhaNDuqcCJsoEVt297828L2ZBNOG1/6BYxdPRBYT7w==
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr33567669wrm.610.1642678228993; 
 Thu, 20 Jan 2022 03:30:28 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 g30sm2749538wrb.29.2022.01.20.03.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:30:28 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 2/7] tests/lcitool: Include local qemu.yml when refreshing
 cirrus-ci files
Date: Thu, 20 Jan 2022 12:30:11 +0100
Message-Id: <20220120113016.268265-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120113016.268265-1-f4bug@amsat.org>
References: <20220120113016.268265-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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

The script only include the local qemu.yml for Dockerfiles.
Since we want to keep the Cirrus-CI generated files in sync,
also use the --data-dir option in generate_cirrus().

Fixes: c45a540f4bd (".gitlab-ci.d/cirrus: auto-generate variables with lcitool")
Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/lcitool/refresh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 033120e223d..25301f2ef0b 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -62,7 +62,7 @@ def generate_dockerfile(host, target, cross=None, trailer=None):
 
 def generate_cirrus(target, trailer=None):
    filename = Path(src_dir, ".gitlab-ci.d", "cirrus", target + ".vars")
-   cmd = [lcitool_path, "variables", target, "qemu"]
+   cmd = lcitool_cmd + ["variables", target, "qemu"]
    generate(filename, cmd, trailer)
 
 ubuntu1804_skipssh = [
-- 
2.34.1


