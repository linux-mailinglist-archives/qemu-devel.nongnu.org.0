Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91E5485480
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:29:18 +0100 (CET)
Received: from localhost ([::1]:32906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57Hy-0002Qm-2F
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:29:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56qI-0004iE-47
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:43 -0500
Received: from [2a00:1450:4864:20::433] (port=35357
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56qC-0006Uz-3E
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:41 -0500
Received: by mail-wr1-x433.google.com with SMTP id j18so83209690wrd.2
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BvYS7ZpZUxwdx+Q0vezeYELsJBJESCN4l0pR+awTIYY=;
 b=NFtKZ8HcgbE58VCvKvjEgDyJZ5za34FXe1VTtbL8RxDlsEMRuE1wsvP6YfjN95s/1n
 +2yA2qflNejKy+rEcssFc51n8aOeGOmpDua/G3qEcKJ+2a5K0UWdQ0ouxc1N+yig3PRU
 KhVczAMxLfo6239fosnyftbbDJlQO1WvQGa+IBGO/Apa/QIyiagnDyYB+Yvpy3pNkkDu
 Lf1dTV3BWBr013W/BZm9Da+d1/ELwBChnMoHNfUYYj3HKEIzIk5n+CNaZZUz0B/8gp/M
 Re4In2lcJiBRLv4Ij8xgnDQZgLxrCOjeFz/03Nmi+s4FHmBx5L2x5afVhX0UjOHpLPEJ
 /T3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BvYS7ZpZUxwdx+Q0vezeYELsJBJESCN4l0pR+awTIYY=;
 b=AqO5NCmStH7+WzjH+tRsRFu86wfzkpeG4VaqnNePSsifk/8Af7hxXzhObKsULuyOcI
 Ss2djvoggSRCdwsK3rZRELTlPqA4NOAOFrCvsIGZftBFaxNHsYeyVpg1/Xj5mTLITzEo
 nQAt6OP0JVNmoMOqQneTgw6zRDJZ4xU3xv5RlqCh+6ufJjVc7wOGfzE+Q52UukAJVJuj
 lK6e3UPBGL1elbRmeSRCvQJJufd0rJ/c+Q2yROmXdpC5t/bhrJFPqCr0KMywliIFHRiO
 jEJUETx3G36CDO+qQ9wo02/NBhBYSLM+9AFBuxBYH99EZUG32hFN1QzKA4wGBB5W1Bpw
 iICw==
X-Gm-Message-State: AOAM530dxovY9ZffDVJ8wIzidsw35Z96H2z2VG/ymXTC693WRbeJuzQb
 Q+N4Ia6GG7fr8EO4oYxUDm9lfQ==
X-Google-Smtp-Source: ABdhPJwYGkSGIhD2KYm/C0yNk57H8rH9IdRgK7gYocnzpnXAYIFLv8miDTKqsSWtv/41oRwS8cEdSQ==
X-Received: by 2002:adf:f5c7:: with SMTP id k7mr1133672wrp.176.1641391234793; 
 Wed, 05 Jan 2022 06:00:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 9sm52520147wrz.90.2022.01.05.06.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:00:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E997F1FFD5;
 Wed,  5 Jan 2022 13:50:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 30/34] FreeBSD: Upgrade to 12.3 release
Date: Wed,  5 Jan 2022 13:50:05 +0000
Message-Id: <20220105135009.1584676-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Warner Losh <imp@bsdimp.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brad Smith <brad@comstyle.com>

Note, since libtasn1 was fixed in 12.3 [*], this commit re-enables GnuTLS.

[*] https://gitlab.com/gnutls/libtasn1/-/merge_requests/71

Signed-off-by: Brad Smith <brad@comstyle.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <YdUCQLVe5JSWZByQ@humpty.home.comstyle.com>
---
 .gitlab-ci.d/cirrus.yml | 5 +----
 tests/vm/freebsd        | 8 +++-----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 19e6c21401..b96b22e269 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -52,14 +52,11 @@ x64-freebsd-12-build:
     NAME: freebsd-12
     CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
     CIRRUS_VM_IMAGE_SELECTOR: image_family
-    CIRRUS_VM_IMAGE_NAME: freebsd-12-2
+    CIRRUS_VM_IMAGE_NAME: freebsd-12-3
     CIRRUS_VM_CPUS: 8
     CIRRUS_VM_RAM: 8G
     UPDATE_COMMAND: pkg update
     INSTALL_COMMAND: pkg install -y
-    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
-    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
-    CONFIGURE_ARGS: --disable-gnutls
     TEST_TARGETS: check
 
 x64-freebsd-13-build:
diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 6e20e84322..805db759d6 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -28,8 +28,8 @@ class FreeBSDVM(basevm.BaseVM):
     name = "freebsd"
     arch = "x86_64"
 
-    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.2/FreeBSD-12.2-RELEASE-amd64-disc1.iso.xz"
-    csum = "a4530246cafbf1dd42a9bd3ea441ca9a78a6a0cd070278cbdf63f3a6f803ecae"
+    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.3/FreeBSD-12.3-RELEASE-amd64-disc1.iso.xz"
+    csum = "36dd0de50f1fe5f0a88e181e94657656de26fb64254412f74e80e128e8b938b4"
     size = "20G"
     pkgs = [
         # build tools
@@ -65,8 +65,6 @@ class FreeBSDVM(basevm.BaseVM):
         "zstd",
     ]
 
-    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
-    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
     BUILD_SCRIPT = """
         set -e;
         rm -rf /home/qemu/qemu-test.*
@@ -74,7 +72,7 @@ class FreeBSDVM(basevm.BaseVM):
         mkdir src build; cd src;
         tar -xf /dev/vtbd1;
         cd ../build
-        ../src/configure --python=python3.7 --disable-gnutls {configure_opts};
+        ../src/configure --python=python3.7 {configure_opts};
         gmake --output-sync -j{jobs} {target} {verbose};
     """
 
-- 
2.30.2


