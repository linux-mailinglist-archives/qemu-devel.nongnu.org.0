Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB876A48D6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:58:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhj5-0003ZK-Ut; Mon, 27 Feb 2023 12:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhj3-0003T8-E1
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhiy-0004NV-GS
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677520543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7cmWIhDDxQGwLFHA3gSJT1kLOkZXbzMzyorFy46txw=;
 b=bTCAzalCqjiFYQAfRs7l/p+UWkBohf6Zk5tQFHji35ygdFVCZj7DRjoxJrsC/n755twXp4
 L7quxduSqesVPEpE/TdhunhJI2Dnru76acdky+yR2NEgFWsR/RhCE9VEA/Bjbusne3AocE
 JqaWDDYxd9Nq9Dt3QAdd12Z9QDh0jLU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-Jeb_VShbMKWtAA5EemtEHQ-1; Mon, 27 Feb 2023 12:55:42 -0500
X-MC-Unique: Jeb_VShbMKWtAA5EemtEHQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 h13-20020a0564020e8d00b004a26ef05c34so9732472eda.16
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 09:55:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j7cmWIhDDxQGwLFHA3gSJT1kLOkZXbzMzyorFy46txw=;
 b=ToyJTiKFj0yJl57a519QAS1vNWYwZa5YdBWToIDkxhYKA1U/FNWpXhciJ4m+glLY1e
 aOHSDVoyAjvam/k587xpiSIBID7BSJfTx7Fa+8zt0bNjpPKyCrixpXcFPE5BscVCP1XA
 0XZ4+PuFVh3OexZ+VHcvcwXYpj7aOlikcoxY2itM2nuIBbQPi1Xto10j9qY8k2ig5GI8
 v+TqfoUoJP1jDJnlMODHqlKZ36QL3H8jO9yFtEs11nIw4bIe6p71+Rblix5xLuz3xv8S
 ymCFzk6II3nMS+tm/c+XaYWDd6Gr86+cvNPbh0UChgK/ts/0jDk5srJ+rAzFRDUu/OMz
 20TA==
X-Gm-Message-State: AO0yUKVlez4KtcisBXmUSur0AHJgggMQ23Ts5DWeO9bNdahzqsmqRrk6
 w7/gD24b83+LtAtnzVukI69HEJXdI3mmeRo9qRKynuBXu3tsrDJQ+JWzoTMurLNSiksAifPZWrA
 WqPTsKJ3Ql9B2i9I3jvsB+P0f3Xj6r+ZaAbtUCyR6WQrOAlJ/2L4ith8JGphO9/hxoBx30kS0
X-Received: by 2002:a17:907:6eac:b0:878:58e6:f1eb with SMTP id
 sh44-20020a1709076eac00b0087858e6f1ebmr44599065ejc.23.1677520540899; 
 Mon, 27 Feb 2023 09:55:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9FevdlK+hoDtgmfCxrCXb7ULtYF2iK0AurxLC9BYdetUMM1Tk40NGu8yu8ikXboaR5eLAyfg==
X-Received: by 2002:a17:907:6eac:b0:878:58e6:f1eb with SMTP id
 sh44-20020a1709076eac00b0087858e6f1ebmr44599039ejc.23.1677520540481; 
 Mon, 27 Feb 2023 09:55:40 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 qx27-20020a170906fcdb00b008bda61ff999sm3467187ejb.130.2023.02.27.09.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:55:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 05/13] configure: Look for auxiliary Python installations
Date: Mon, 27 Feb 2023 18:55:16 +0100
Message-Id: <20230227175524.710880-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227175524.710880-1-pbonzini@redhat.com>
References: <20230227175524.710880-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

This configure loop will prefer, in order:

1. Whatever is specified in $PYTHON
2. python3
3. python
4. python3.11 down through python3.6

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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 63 ++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 46 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index a1912463c94e..0e41c5e36ce2 100755
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


