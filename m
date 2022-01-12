Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C1E48C3B2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:06:52 +0100 (CET)
Received: from localhost ([::1]:55422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cOx-00075z-DC
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:06:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvS-0007Zw-I9
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:22 -0500
Received: from [2a00:1450:4864:20::532] (port=40899
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvQ-0004kC-SL
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:22 -0500
Received: by mail-ed1-x532.google.com with SMTP id a18so8720162edj.7
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fqHINLJ+tbUImk2k2vZK07UgLGr7IB8EBQi3ARp/MYk=;
 b=JSTgy9MqZSKsSFDHWpZFo2qavMQEINbURYyhvSrRykIJpVtLC0a/d+Ng02S3TOBOHF
 Vbx7oVXNwCO9NGf+D/eAJCIOFADqe+G3WTIpCZOwDGRy54A7SgAlYzlliD2GGhBeu8mz
 HIjtFsUyDuE7yVAsTJoZsXuLxdT/xgIyJGWIcUODAsZGvvOFXqrFhCnWPnPAzYB5miU8
 Zf0L37fulG2G4TJ+QjmCm60VXANoBbSf94OgIm2xh4resC8Vb8+qBCho/5LYggy5EWmG
 S+tPRs20hupLwrS0H3i1kxkIDZO24ucc1MSZS5sdcntHfQxC46AwPHG/Pct7y0SqJD9/
 XSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fqHINLJ+tbUImk2k2vZK07UgLGr7IB8EBQi3ARp/MYk=;
 b=0MkY4l/gMRmTGt1ax5ozSMGk9z777Q8eK+Ta8z5aCJwjtcZHtybgyUXei6ELGqLAyv
 od8XIRlovbjxcMHc9UbHiMbw22lSsTllfhXi5oRhbG/ViETfE1Ylsc5szWI5cy2DDkae
 yvItmkSJky0bSFZlE65KkVL4XEzOlBOob04slBPohR6JXbAk12s8MBteQn7E7fMGobv4
 QhRBttoth585nRdM4QAfQFkG2BjV+bKWW40KAoN7uUK00qzDAAvhYt2fGajduGISVxvh
 0x6ax0lYC6nHVx/gT6FXR44/mYJ3O/WNqvKnLr6vCPXcBU7ovwIizeJ0h6bZaHFqjAmE
 6+8Q==
X-Gm-Message-State: AOAM530FklE1mZKMsd61Q0CaHs3QVp88+VcVXZzkitSjZP+rLMT4YBSt
 qS6B0R8kgHvtURV5xw/0zYJyFQ==
X-Google-Smtp-Source: ABdhPJytpWlVmBRjHrchsqmHb+uPSmj1Cp5cwe1SmUhayZTERUXxT878uoCUiycDEFp/n3Y9olOuIg==
X-Received: by 2002:a17:907:3e91:: with SMTP id
 hs17mr7100670ejc.384.1641987379407; 
 Wed, 12 Jan 2022 03:36:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id gt38sm1335664ejc.114.2022.01.12.03.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:36:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 168A71FFD5;
 Wed, 12 Jan 2022 11:27:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 29/31] FreeBSD: Upgrade to 12.3 release
Date: Wed, 12 Jan 2022 11:27:20 +0000
Message-Id: <20220112112722.3641051-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Brad Smith <brad@comstyle.com>
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
Message-Id: <20220105135009.1584676-31-alex.bennee@linaro.org>

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


