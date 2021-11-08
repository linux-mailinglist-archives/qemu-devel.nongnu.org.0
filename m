Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83874481F7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:38:18 +0100 (CET)
Received: from localhost ([::1]:58458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk5ms-0001sr-0v
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:38:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5l9-0008Bq-UB
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:32 -0500
Received: from [2a00:1450:4864:20::536] (port=46891
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5l6-00075j-RK
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:31 -0500
Received: by mail-ed1-x536.google.com with SMTP id c8so46591145ede.13
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 06:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N5/RbeJzuOI+XKh6jbbQtrcH3k205uQ3u96kbz/WyQI=;
 b=gIST3+wUREiKTtPQtkHHi5BLWVXLd4sZEqyGDHEkFEvog6DOTjUQ/UmB5DjaL4iOG7
 4NFgiEmY4PU+SOWE5zAz0gmC/hjy5YMIISmzVy05CgsCgV3Ezqlb1vNAdTaBJWSHThHY
 vK7NGF6TfM1uo0SdKlgoEQTZJ7UWxVgRHI2ET3DJwtuhn04Nem09NtIRruQ8UT9QZMQA
 /lLd8gb78dPjbK8jWvyRYbjtenJ+OvhprQm+LbUPlWl+huInS0D8lpba0+TgvcdgNOf7
 yzAOn27I+T70yIHsUb/DIFDQtRnnpkYOr7ArNNVnuxexRcBbpB8my9FatHU63pqJJhqk
 wooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N5/RbeJzuOI+XKh6jbbQtrcH3k205uQ3u96kbz/WyQI=;
 b=njmaXDkwy3zzWJaV/bhFgnZIbUdU5acNoZo9hjKwsR6rENhpSp1wyE3aEBUt+ov/R/
 2eGgw9b51NtqTpoMJs/y9Ms9uxhlnm7jT1gefK1nQVzx84TANvW9+dzUCFsCvhSbZJKx
 q8NwdpNXn1ROIhr5uA21oX3nGFcgaDJJ1glm2oRXrPMCaV+tiIMxy9UsjIxTjj2O8Zb5
 siTk1KtECvH8He6e2MnkwVXNR68GDHO9qbeRinOhdizmXuc/iSO/tVt+IXgWqkN66Zvh
 vTvBPMFiVX4e/1lf8eCCeIBuixhBQV3Lp5gbUZXf2GKnPPsEKcmmabD3O6+OipyrtK1F
 hWHA==
X-Gm-Message-State: AOAM530UFVCzGtZ1FRWH3nxjeNeqTDOKmL4beyOSrnL1r5O6/uci5L4P
 i+WapBo5DK4HdBfYuZuw8VEPNZutnOM=
X-Google-Smtp-Source: ABdhPJxLN3Z5HuHYmX8QBjH3ESL0L/oKXq8HAdEFfaNvzzBZtZE0js8sO46u1A1skYtfiCBT5t3PcQ==
X-Received: by 2002:a05:6402:221b:: with SMTP id
 cq27mr131430edb.232.1636382182972; 
 Mon, 08 Nov 2021 06:36:22 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id hp3sm8366662ejc.61.2021.11.08.06.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:36:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/10] configure: simplify calls to meson_quote
Date: Mon,  8 Nov 2021 15:36:12 +0100
Message-Id: <20211108143616.660340-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108143616.660340-1-pbonzini@redhat.com>
References: <20211108143616.660340-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

meson_quote assumes a non-empty argument list, and incorrectly returns a
one-entry array if passed nothing.  Move the check for an empty argument
list from the invocations to the function itself.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 33682cb971..369b5455b6 100755
--- a/configure
+++ b/configure
@@ -3894,6 +3894,7 @@ echo "TOPSRC_DIR=$source_path" >> $config_mak
 if test "$skip_meson" = no; then
   cross="config-meson.cross.new"
   meson_quote() {
+    test $# = 0 && return
     echo "'$(echo $* | sed "s/ /','/g")'"
   }
 
@@ -3908,10 +3909,10 @@ if test "$skip_meson" = no; then
 
   test -z "$cxx" && echo "link_language = 'c'" >> $cross
   echo "[built-in options]" >> $cross
-  echo "c_args = [${CFLAGS:+$(meson_quote $CFLAGS)}]" >> $cross
-  echo "cpp_args = [${CXXFLAGS:+$(meson_quote $CXXFLAGS)}]" >> $cross
-  echo "c_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
-  echo "cpp_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
+  echo "c_args = [$(meson_quote $CFLAGS)]" >> $cross
+  echo "cpp_args = [$(meson_quote $CXXFLAGS)]" >> $cross
+  echo "c_link_args = [$(meson_quote $LDFLAGS)]" >> $cross
+  echo "cpp_link_args = [$(meson_quote $LDFLAGS)]" >> $cross
   echo "[binaries]" >> $cross
   echo "c = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
   test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross
-- 
2.33.1



