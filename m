Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF093BD9E3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:15:40 +0200 (CEST)
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mnT-0006ar-IK
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mf9-0005AG-O4
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:03 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mf7-00074d-MK
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:03 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so5373174wmq.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QRopgnAuRpqjJ5MAitTX29dKnbdmWON3ciEwighPhUk=;
 b=IQplr5yF907z8zyHJDfrO1Ew4B4d/05xIyq4rbpCxS+r3+m/wlvyHKIIZ0pAxj/bGD
 TDo+KlqUsrQUeGa5w5WrOpB41tFx/2vh35FmnfRoOQ4NWMWFhutRgO05Eu4x26w+Ki03
 oDkr1yiUd0C12D0ZAUou3ZtrA4nkjuGfe3DL7CqzCAlpFE7q/UNvAkg04uONgH1RbuTx
 37OgccFJ67V3eOMsgbcvbVGk03nGVLJ0sMsukX90iqzFyUlcCOt0CUBpN/kPbBGUZvkZ
 70vm0seW7y0t2iGrX6bIiyaF6PAdc95C1KfzD6iWURLX460V88CY+AbJNiqgwLi+C1QN
 g35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QRopgnAuRpqjJ5MAitTX29dKnbdmWON3ciEwighPhUk=;
 b=c59j362HxV4thmjUo0Vin9IV5RE9OUblH3IqVCwcg6zvy5k4xtgzliZ+lHF09FvkN9
 ve8mCYr15eNTmJxhEzqwluGnKG9w0kfQK6ByGgoQ958QYns7daTgyaEeYgbS3bkq3JYW
 1DwVlIVxTDMgJardFHyMwpGpgYsCoo5vKDAtamSNSqHvpEoKXTeMZyAY4ZRwmbuZPBqa
 2V2NM8MjbCt9CoKghbRKncmz+chS4SrzudzKQixcrK1l3BpdplehOr+wPQp0U+P4Wy+0
 T2puK7Y4tYVm5zjvlOANqqP/CFsvFVPYty+WpMCMjnSrykZpQIQLIhLra69XiWjMK4lf
 z85Q==
X-Gm-Message-State: AOAM530VXS4bkbLqkYfEYTPS3zkfl2S9qFCeBbosF4Tx6y50r09SQaIL
 cxZZUPm5jWL5PO54p5hsN8kxDsQh2sK5sA==
X-Google-Smtp-Source: ABdhPJzeJoe2IUcOkaBsttQieQu6OBAvyBWqcOxtwRrBxtWPvC1Wxd47tYdicCNwDqA6gps5kDBYhQ==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr20948447wmc.141.1625584019895; 
 Tue, 06 Jul 2021 08:06:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m18sm15728514wmq.45.2021.07.06.08.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:06:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 60A271FFAB;
 Tue,  6 Jul 2021 15:58:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 23/39] tests/docker: expand opensuse-leap package list
Date: Tue,  6 Jul 2021 15:58:01 +0100
Message-Id: <20210706145817.24109-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This is the fully expanded list of build pre-requisites QEMU can
conceivably use in any scenario.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-16-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/opensuse-leap.docker | 59 ++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 6011447181..5a8bee0289 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -2,53 +2,110 @@ FROM registry.opensuse.org/opensuse/leap:15.2
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
+    Mesa-devel \
+    alsa-lib-devel \
     bc \
     brlapi-devel \
     bzip2 \
+    ca-certificates \
     ccache \
+    clang \
+    ctags \
     cyrus-sasl-devel \
+    dbus-1 \
+    diffutils \
+    findutils \
     gcc \
     gcc-c++ \
+    gcovr \
     gettext-runtime \
     git \
     glib2-devel \
+    glibc-locale \
+    glibc-static \
     glusterfs-devel \
     gtk3-devel \
+    hostname \
+    jemalloc-devel \
     libSDL2-devel \
     libSDL2_image-devel \
     libaio-devel \
+    libasan6 \
     libattr-devel \
+    libbpf-devel \
+    libbz2-devel \
+    libcacard-devel \
     libcap-ng-devel \
+    libcurl-devel \
+    libdrm-devel \
     libepoxy-devel \
     libfdt-devel \
+    libffi-devel \
+    libgcrypt-devel \
     libgnutls-devel \
     libiscsi-devel \
     libjpeg8-devel \
+    libndctl-devel \
+    libnettle-devel \
+    libnfs-devel \
     libnuma-devel \
     libpixman-1-0-devel \
     libpmem-devel \
     libpng16-devel \
+    libpulse-devel \
     librbd-devel \
     libseccomp-devel \
     libspice-server-devel \
     libssh-devel \
+    libtasn1-devel \
+    libubsan1 \
+    libudev-devel \
+    libusb-1_0-devel \
+    libxml2-devel \
+    libzstd-devel \
+    llvm \
+    lttng-ust-devel \
     lzo-devel \
     make \
     mkisofs \
+    ncat \
     ncurses-devel \
     ninja \
-    perl \
+    openssh \
+    pam-devel \
+    perl-Test-Harness \
+    perl-base \
+    pkgconfig \
+    python3-Pillow \
+    python3-PyYAML \
+    python3-Sphinx \
     python3-base \
+    python3-numpy \
+    python3-opencv \
+    python3-pip \
+    python3-setuptools \
+    python3-sphinx_rtd_theme \
     python3-virtualenv \
+    python3-wheel \
     rdma-core-devel \
+    rpm \
+    sed \
     snappy-devel \
+    sparse \
+    spice-protocol-devel \
     systemd-devel \
     systemtap-sdt-devel \
     tar \
+    tesseract-ocr \
+    tesseract-ocr-traineddata-english \
+    texinfo \
     usbredir-devel \
+    util-linux \
     virglrenderer-devel \
     vte-devel \
+    which \
     xen-devel \
+    xfsprogs-devel \
     zlib-devel
 ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.6
 
-- 
2.20.1


