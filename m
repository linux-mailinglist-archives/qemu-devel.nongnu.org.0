Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E078769F6C2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:39:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqGL-0004VZ-Tq; Wed, 22 Feb 2023 09:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqG9-0004JN-V6
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqG8-0001GH-4j
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677076694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ETsEJY4w/A9iqDeSpNMSH24/Umn08dHdLv/hEqXfWD8=;
 b=alqb2x28p1FmVFNu87dYl6X7avJxFPTURWIgWUGVqr+QJnSUZ9OIU6TBsKSrvKeNANWx+0
 Vv4Yxfwm0ECJKeaX9/oiEL9ejSbszzTKYIeu/2RMkq1UmWhtVhSKMeYgziqz3dCWmD6HLW
 B8dHSSLSNakm+W9NmzGwowSIVyYhENs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-Y3LarJYjP26Jc5ArV88eDg-1; Wed, 22 Feb 2023 09:38:13 -0500
X-MC-Unique: Y3LarJYjP26Jc5ArV88eDg-1
Received: by mail-ed1-f70.google.com with SMTP id
 ee6-20020a056402290600b004ad51f8fc36so10906883edb.22
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 06:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ETsEJY4w/A9iqDeSpNMSH24/Umn08dHdLv/hEqXfWD8=;
 b=GF5WtYkETgEB2LulDO3YmURP6dWyr7sGvai3NPxeK5ZlyI4rnXpC5oXLDKm6teMndG
 LtzUBcPyT54aUU03UETjJc7WiN3pKnUVr5tFUx1sDfoJ13C5IQBdxGqJfr5fFHvrG1Pb
 5zVdJHDAS3inTZZYJdW4SzG3SzWlYpP1fkIBPE4yv1fWaJQ0x7WbwT58u2NMow27jLNQ
 Zxj/eX0UFALHsAkGR34TeuXSguztDbASv6y03cYVpYLS0BnSjuoCQxBrJ5eYstMW/zcN
 17tP2g1QEGI7sUNH0kJjr1QRBLWA+yU0tM3WyfX4ZTCXiyJke+IhW9am175qzgnDeDrm
 PjiQ==
X-Gm-Message-State: AO0yUKU/RN75DG+dzl4sYWdG/IZ+eLtpTj21Kz196dfUcXgdGpzt/yRZ
 1mJ4b6NYtLLRiOxtumiKoyZfR9NwQOD0M0PoNxcSI7HYnG5zVVrB9FFl2BYeD1N9B2IPi1XsSui
 Ju7t+QXsHUOnnYmaZggM1Bwt9qN/AxUfW/dEaqCLSDiXBmRz3VGuxQtKiWAf4AiEnfwSK/kN3
X-Received: by 2002:a17:907:f81:b0:877:a3c4:807b with SMTP id
 kb1-20020a1709070f8100b00877a3c4807bmr16963914ejc.68.1677076691719; 
 Wed, 22 Feb 2023 06:38:11 -0800 (PST)
X-Google-Smtp-Source: AK7set9xWcVu6PYlWGOj6VJP9tc+tS5bKSxjjxQVc4ovVDVLMnm12JY7zwepJcP4w0xzbSV46VrB5g==
X-Received: by 2002:a17:907:f81:b0:877:a3c4:807b with SMTP id
 kb1-20020a1709070f8100b00877a3c4807bmr16963887ejc.68.1677076691417; 
 Wed, 22 Feb 2023 06:38:11 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 x41-20020a50baac000000b004acbe8255f1sm2145998ede.86.2023.02.22.06.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 06:38:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com, berrange@redhat.com
Subject: [PATCH 05/10] configure: Look for auxiliary Python installations
Date: Wed, 22 Feb 2023 15:37:47 +0100
Message-Id: <20230222143752.466090-6-pbonzini@redhat.com>
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

From: John Snow <jsnow@redhat.com>

At the moment, we look for just "python3" and "python", which is good
enough almost all of the time. But ... if you are on a platform that
uses an older Python by default and only offers a newer Python as an
option, you'll have to specify --python=/usr/bin/foo every time.

We can be kind and instead make a cursory attempt to locate a suitable
Python binary ourselves, looking for the remaining well-known binaries.

This configure loop will use whatever is specified in $PYTHON or, if
empty, will try the following in order:

1. python3
2. python
3. python3.11 down through python3.6

Notes:

- Python virtual environment provides binaries for "python3", "python",
  and whichever version you used to create the venv,
  e.g. "python3.8". If configure is invoked from inside of a venv, this
  configure loop will not "break out" of that venv unless that venv is
  created using an explicitly non-suitable version of Python that we
  cannot use.

- In the event that no suitable python is found, the first python found
  is the version used to generate the human-readable error message.

- The error message isn't printed right away to allow later
  configuration code to pick up an explicitly configured python.

Signed-off-by: John Snow <jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 63 ++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 46 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index 4d66a958023e..762b8397a7b7 100755
--- a/configure
+++ b/configure
@@ -592,20 +592,43 @@ esac
 
 : ${make=${MAKE-make}}
 
-# We prefer python 3.x. A bare 'python' is traditionally
-# python 2.x, but some distros have it as python 3.x, so
-# we check that too
-python=
-explicit_python=no
-for binary in "${PYTHON-python3}" python
-do
-    if has "$binary"
-    then
-        python=$(command -v "$binary")
-        break
-    fi
-done
 
+check_py_version() {
+    # We require python >= 3.6.
+    # NB: a True python conditional creates a non-zero return code (Failure)
+    "$1" -c 'import sys; sys.exit(sys.version_info < (3,6))'
+}
+
+python=
+first_python=
+if test -z "${PYTHON}"; then
+    explicit_python=no
+    # A bare 'python' is traditionally python 2.x, but some distros
+    # have it as python 3.x, so check in both places.
+    for binary in python3 python python3.11 python3.10 python3.9 python3.8 python3.7 python3.6; do
+        if has "$binary"; then
+            python=$(command -v "$binary")
+            if check_py_version "$python"; then
+                # This one is good.
+                first_python=
+                break
+            else
+                first_python=$python
+            fi
+        fi
+    done
+else
+    # Same as above, but only check the environment variable.
+    has "${PYTHON}" || error_exit "The PYTHON environment variable does not point to an executable"
+    python=$(command -v "$PYTHON")
+    explicit_python=yes
+    if check_py_version "$python"; then
+        # This one is good.
+        first_python=
+    else
+        first_python=$first_python
+    fi
+fi
 
 # Check for ancillary tools used in testing
 genisoimage=
@@ -1030,16 +1053,22 @@ rm -f ./*/config-devices.mak.d
 
 if test -z "$python"
 then
-    error_exit "Python not found. Use --python=/path/to/python"
+    # If first_python is set, there was a binary somewhere even though
+    # it was not suitable.  Use it for the error message.
+    if test -n "$first_python"; then
+        error_exit "Cannot use '$first_python', Python >= 3.6 is required." \
+            "Use --python=/path/to/python to specify a supported Python."
+    else
+        error_exit "Python not found. Use --python=/path/to/python"
+    fi
 fi
+
 if ! has "$make"
 then
     error_exit "GNU make ($make) not found"
 fi
 
-# Note that if the Python conditional here evaluates True we will exit
-# with status 1 which is a shell 'false' value.
-if ! $python -c 'import sys; sys.exit(sys.version_info < (3,6))'; then
+if ! check_py_version "$python"; then
   error_exit "Cannot use '$python', Python >= 3.6 is required." \
       "Use --python=/path/to/python to specify a supported Python."
 fi
-- 
2.39.1


