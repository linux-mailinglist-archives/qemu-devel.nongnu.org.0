Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C827347A0E7
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:23:43 +0100 (CET)
Received: from localhost ([::1]:51916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myx6E-00086v-RA
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:23:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx2q-0003Yt-AU
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:20:12 -0500
Received: from [2a00:1450:4864:20::530] (port=40627
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx2o-0006M5-L3
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:20:11 -0500
Received: by mail-ed1-x530.google.com with SMTP id z29so27732481edl.7
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=azhbmIZqW98hG0qRoHQgPRaAObJk9PmmGoz4t4gIIm0=;
 b=OQg+TOcRQRcyxZ5XgCpRtjW5UmJDnezS1B0EPH11l2RlVXAiWl0izZbzL5C6yiIBxZ
 KA6grR/BHkq+9JtXx/lMaI4vRBCiOclZ/gPaBYKi4o+lK88g1XdTzUQADmF4Vwy5AHbM
 8EGgcpj2Zgltrxo1DrFYTbVH+9eBm2ZcKQi6x54kYwlWWBTCjgiiiqGQ+fIzyy9+dDrW
 KI2tcmCpekBsacG2V3ywh/EUo+WeDTOZgDX6YowiIJ79g5xNW0ZdmG/PgZ+JNPhhtVc0
 IrX7iZoewE6qtT0fBzItoTi9gAd1E1GLwcraQXXPEPSpWMuY50CQAtGEjWOCIjr6cFNV
 oA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=azhbmIZqW98hG0qRoHQgPRaAObJk9PmmGoz4t4gIIm0=;
 b=GzTOaOma5Ev2ahZJqVb/DeWClmM1/fjwtyr0fWDW6xdzqW7wJQz9yOdFVVhfDT5BmQ
 iqm3ROcuTUBE0J/VrVuujbo4r90epYOzeDxLASlR6vJn3dBMZwxmO/PtecX1Q8LgBBy8
 k3WjG5PpRGLNdbX0+gR6jx7fTrKHO3U7sotN7jY2fxOr4jhL30E0Rd7RVSQLB7UKyy+f
 /nzTFardg8fZoOsn3zkl4TxfA7M91SycL6stzPzEerXhoVChftvM2m29rHASQYPQHRvh
 jNKfx2QnTO9n7Uk1eYZF4hCdxfWQYPUng5bdk+/8yxm614u0BcIV9/Q4XDvJ9hht4Yvf
 aaHA==
X-Gm-Message-State: AOAM5302fQ+6ICuCDclp0gdEQA/tIf/dv21ToamHTmneoBDgpwPljETq
 m5G2SpsS8KiFcuZSiV1EiXXLoQzIPsA=
X-Google-Smtp-Source: ABdhPJyE+O4F8pljTkv+K2QVM3WDp49QUnlt52HXQF3JT+00EKK3dUwgjLXHNv84au6CiaPFMN6GYg==
X-Received: by 2002:a17:906:5488:: with SMTP id
 r8mr9605951ejo.752.1639923609286; 
 Sun, 19 Dec 2021 06:20:09 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y19sm5791584edc.17.2021.12.19.06.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:20:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/16] meson: add "check" argument to run_command
Date: Sun, 19 Dec 2021 15:20:04 +0100
Message-Id: <20211219142008.248807-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
References: <20211219141711.248066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson is planning to change the default of the "check" argument to
run_command (from false to true).  Be explicit and include it in
all invocations.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/meson.build b/docs/meson.build
index 27c6e156ff..57b28a3146 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -18,12 +18,12 @@ if sphinx_build.found()
   # This is a bit awkward but works: create a trivial document and
   # try to run it with our configuration file (which enforces a
   # version requirement). This will fail if sphinx-build is too old.
-  run_command('mkdir', ['-p', tmpdir / 'sphinx'])
-  run_command('touch', [tmpdir / 'sphinx/index.rst'])
+  run_command('mkdir', ['-p', tmpdir / 'sphinx'], check: true)
+  run_command('touch', [tmpdir / 'sphinx/index.rst'], check: true)
   sphinx_build_test_out = run_command(SPHINX_ARGS + [
     '-c', meson.current_source_dir(),
     '-b', 'html', tmpdir / 'sphinx',
-    tmpdir / 'sphinx/out'])
+    tmpdir / 'sphinx/out'], check: false)
   build_docs = (sphinx_build_test_out.returncode() == 0)
 
   if not build_docs
-- 
2.33.1



