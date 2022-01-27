Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9845049E0DD
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:28:49 +0100 (CET)
Received: from localhost ([::1]:59188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD2xM-00032T-Ne
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:28:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2g1-0006n1-5W
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:54 -0500
Received: from [2a00:1450:4864:20::430] (port=36490
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fz-0006A7-6s
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:52 -0500
Received: by mail-wr1-x430.google.com with SMTP id u15so4100247wrt.3
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lQe0j41ztfi+4RsroChzdgwOB474cFz+aWaWNOBPtVE=;
 b=nf9Miub53xncAK+sWpFNexBWzbJVfDUNmO/6c9XxLwZJCRCYOqzxKhx++v8TlvvDHb
 HVuzioGffQ2BttsL6szoimEKuYCxSb6cfj/YDhqwS405ZWmrS5zBuWp1jN1sV6sJzM53
 BM70QTuTq8nNptPR3g9mrVE/1wEZMWx0Tvl9fU0MkZL4YaUsy3uQxIs4LHfn9GPBEBn4
 zO4ieUa96unPM+pR8lCTMnQugeEFjcbd5c5E1i9r/Wx+4czKGDtD++EU0gpW43xF27sZ
 MipKPofqGyGnO3Rf6cTXyCD2qKuip2zaE+V+Sd5BDXHYFqXbSsG0LuJVEQEdCvE3DmNb
 xb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lQe0j41ztfi+4RsroChzdgwOB474cFz+aWaWNOBPtVE=;
 b=3tZ4UV4mWhArGXCyPwzFqZg+JCeudrv0jdYHI+SGyXwKUGyOXh6r4EqOJDqRESA0Zl
 6VlAZnnCiu5MXf23lEzpfZ0feslxw1vo7NcJxacu31H9ZLoexs83mG1cbIpwlmAy0Xr5
 C48rlL3XusBo7Ifr6UF/dqJH7bh33825Hx4dcou0dPrN4ydGDDne/4WgijRzwF7Q0y3D
 sybYLlxikOw9h9WA0LfWn2gDN+pOcgsywbdb6J19z9VpJ8KyhquE6bdS28eay5Zb3NX7
 xdYAlrJe1M8d1qMvnanz5d66kOuQ16rD8gn1vCRpw6+h22e9k+3L4a75Dum/svamPmyn
 tTvQ==
X-Gm-Message-State: AOAM531FdOVeO1Fl9UwJ3Y+OoSsbJdfylbeJL5WzW/CNP/YIBGqaZPIf
 kNvc9tQlOFwYgXGL7AKt+4Ii5Bd3oa4=
X-Google-Smtp-Source: ABdhPJwCiaimnBhg6LIJmuR/qFW+H/A9L7bEadiePPi5bCaW/nxnRCKTNDzMreEMVz6L4e2jA3QuKg==
X-Received: by 2002:adf:c448:: with SMTP id a8mr2623595wrg.697.1643281849981; 
 Thu, 27 Jan 2022 03:10:49 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s17sm1825742wrm.62.2022.01.27.03.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:10:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/14] configure: fix parameter expansion of --cross-cc-cflags
 options
Date: Thu, 27 Jan 2022 12:10:37 +0100
Message-Id: <20220127111037.457901-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127111037.457901-1-pbonzini@redhat.com>
References: <20220127111037.457901-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Without this fix, any use of --cross-cc-cflags-* causes a message like:
$ ../configure --cross-cc-ppc64le=clang --cross-cc-cflags-ppc64le="-target powerpc64le-unknown-linux-gnu -sysroot ..."
../configure: 1: eval: cross_cc_cflags_--cross-cc-cflags-ppc64le=-target: not found
../configure: 3816: export: cross_cc_cflags_--cross-cc-cflags-ppc64le: bad variable name

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220120173142.2755077-1-matheus.ferst@eldorado.org.br>
[Fix other occurrences too, noted by Philippe Mathieu-Daudé. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              | 4 ++--
 docs/devel/testing.rst | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index e1a31fb332..e6cfc0e4be 100755
--- a/configure
+++ b/configure
@@ -402,7 +402,7 @@ for opt do
   ;;
   --cross-cc-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --cross-cc-FOO option"
   ;;
-  --cross-cc-cflags-*) cc_arch=${opt#--cross-cc-flags-}; cc_arch=${cc_arch%%=*}
+  --cross-cc-cflags-*) cc_arch=${opt#--cross-cc-cflags-}; cc_arch=${cc_arch%%=*}
                       eval "cross_cc_cflags_${cc_arch}=\$optarg"
                       cross_cc_vars="$cross_cc_vars cross_cc_cflags_${cc_arch}"
   ;;
@@ -1328,7 +1328,7 @@ Advanced options (experts only):
   --extra-cxxflags=CXXFLAGS append extra C++ compiler flags CXXFLAGS
   --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
   --cross-cc-ARCH=CC       use compiler when building ARCH guest test cases
-  --cross-cc-flags-ARCH=   use compiler flags when building ARCH guest tests
+  --cross-cc-cflags-ARCH=  use compiler flags when building ARCH guest tests
   --make=MAKE              use specified make [$make]
   --python=PYTHON          use specified python [$python]
   --sphinx-build=SPHINX    use specified sphinx-build [$sphinx_build]
diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index d744b5909c..92d40cdd19 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -1324,7 +1324,7 @@ for the architecture in question, for example::
 
   $(configure) --cross-cc-aarch64=aarch64-cc
 
-There is also a ``--cross-cc-flags-ARCH`` flag in case additional
+There is also a ``--cross-cc-cflags-ARCH`` flag in case additional
 compiler flags are needed to build for a given target.
 
 If you have the ability to run containers as the user the build system
-- 
2.34.1


