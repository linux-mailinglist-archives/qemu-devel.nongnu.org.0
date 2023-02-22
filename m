Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B5369F6B8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:39:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqGJ-0004NO-FY; Wed, 22 Feb 2023 09:38:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqG6-0004J5-DP
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqG4-0001Fv-Hu
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677076691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aftz3yHMnfNpKwRJjaYwFZ+exMlDTS1Uqsu3tcf0utk=;
 b=OGSJ1QmKLcKj6H9ZbgnKWe9yLlGBvCAzTCbZ+K0EiqJkjiPu415NL/78KwuDpFtkk8ljI0
 3eH8Ru5vwBHfBC7RnfxQu9Nf/EAXoO+5TNRvYJjs+tQHZzSNMDLtXWhAyQHty34cVnU9fV
 adgE1Mod39D8Tp0SsbI6oDuKCkthFPU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-tzSJrFqyOSqVx32vGoHnew-1; Wed, 22 Feb 2023 09:38:10 -0500
X-MC-Unique: tzSJrFqyOSqVx32vGoHnew-1
Received: by mail-ed1-f70.google.com with SMTP id
 cy28-20020a0564021c9c00b004acc6cf6322so11150913edb.18
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 06:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aftz3yHMnfNpKwRJjaYwFZ+exMlDTS1Uqsu3tcf0utk=;
 b=b5rvtiuQIwLsQVBiQKKobQXBfGb0S1KjBbJQ2o1ylz4dFtlWzW/s0S33jv4ocnpM72
 K1z2OY+fhS/KIcugRXrqcM4Z6mt5O+x5pjH9pFCu3jbdrqYHb4swxDBlI/Z1KzCpG9Y5
 tjfh72KfxmHsT/uWyDP90q7F+hS0bRjo72GOfx/ZpoiYfa/jiIVzcSrujSUJbeO82qx9
 dPC/hLbz1ekt1++kPgKmUYYN0ej7hxDmVFz2arL1Re/wI5AG5vrTNxSgrMaa6gSpKncC
 xbuStMKsIpmAEMv38o4NzEGCCz80BTcByXvC7QMsXdZ/DBczufCchFl6nlEQ8aYTZKFO
 3zwQ==
X-Gm-Message-State: AO0yUKVsS8G4uL8OgQ0U9RppJ5UspLpbkl1kuNSuT5Py9uBRScRJKkYq
 8Eu9XTBb3ldKZFWQRGN2nH8D3XfjCBWCL1JzuXBTf7yWNXX0lFxrd3UhKnRkyp6CIx9udtYv+kb
 cILW3CUlJH7GvG5YdyDiszCw9Qo131+6nW6gk7gdxRQ/Fmeg548wkQUtrpbqlWiRnEbusTQ1Q
X-Received: by 2002:a17:906:aac5:b0:8b1:7a83:1a33 with SMTP id
 kt5-20020a170906aac500b008b17a831a33mr17203417ejb.54.1677076688730; 
 Wed, 22 Feb 2023 06:38:08 -0800 (PST)
X-Google-Smtp-Source: AK7set8xnB9ldgrz14i5Vfq4Kh/PkF4s5nMloyBOM7fRsETAHvlosAaIzk3rCKnrl83xLP6L8b1Oew==
X-Received: by 2002:a17:906:aac5:b0:8b1:7a83:1a33 with SMTP id
 kt5-20020a170906aac500b008b17a831a33mr17203397ejb.54.1677076688382; 
 Wed, 22 Feb 2023 06:38:08 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a50d594000000b004ad7962d5bbsm3989480edi.42.2023.02.22.06.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 06:38:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com, berrange@redhat.com
Subject: [PATCH 04/10] configure: protect against escaping venv when running
 Meson
Date: Wed, 22 Feb 2023 15:37:46 +0100
Message-Id: <20230222143752.466090-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230222143752.466090-1-pbonzini@redhat.com>
References: <20230222143752.466090-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If neither --python nor --meson are specified, Meson's generated
build.ninja will invoke Python script using the interpreter *that Meson
itself is running under*; not the one identified by configure.

This is only an issue if Meson's Python interpreter is not "the first
one in the path", which is the one that is used if --python is not
specified.  A common case where this happen is when the "python3" binary
comes from a virtual environment but Meson is not installed (with pip)
in the virtual environment.  In this case (presumably) whoever set up
the venv wanted to use the venv's Python interpreter to build QEMU,
while Meson might use a different one, for example an enterprise
distro's older runtime.

So, detect whether a virtual environment is setup, and if the virtual
environment does not have Meson, use the meson submodule.  Meson will
then run under the virtual environment's Python interpreter.

Reported-by: John Snow <jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 00415f0b48d7..4d66a958023e 100755
--- a/configure
+++ b/configure
@@ -1047,8 +1047,18 @@ fi
 # Suppress writing compiled files
 python="$python -B"
 
+has_meson() {
+  if test "${VIRTUAL_ENV:+set}" = set; then
+    # Ensure that Meson and Python come from the same virtual environment
+    test -x "${VIRTUAL_ENV}/bin/meson" &&
+      test "$(command -v meson)" -ef "${VIRTUAL_ENV}/bin/meson"
+  else
+    has meson
+  fi
+}
+
 if test -z "$meson"; then
-    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.61.5; then
+    if test "$explicit_python" = no && has_meson && version_ge "$(meson --version)" 0.61.5; then
         meson=meson
     elif test "$git_submodules_action" != 'ignore' ; then
         meson=git
-- 
2.39.1


