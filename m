Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0AE6481D7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:38:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bX5-0005lC-JF; Fri, 09 Dec 2022 06:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bW1-0004cY-Gf
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:26:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVq-0001cK-5a
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//v7SoiJ42pMuRusU6eYsYZW80KH1CVh3F2I1OPuAPw=;
 b=YijOnAWWxHzk3tfNlAxpEJ35HfJaC4WYGrMr86/IqAE9FVI5keEaG8cn+grqNy/+F4RKSr
 dgd+U1jtUUBUVxyrMAnLAO/5eDWW0iAdw5jyJum4SJsBHGHBVdBzgxlKilW/eAXDjZ+enw
 uCeC1TFq2XDF61ESg08p8P62D6mX8kI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-416-poYghpcWMAyHGSKIgCywDA-1; Fri, 09 Dec 2022 06:25:50 -0500
X-MC-Unique: poYghpcWMAyHGSKIgCywDA-1
Received: by mail-ej1-f70.google.com with SMTP id
 xc12-20020a170907074c00b007416699ea14so2907657ejb.19
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=//v7SoiJ42pMuRusU6eYsYZW80KH1CVh3F2I1OPuAPw=;
 b=D7lNeAtgN4kMmajzlrb3LrWOK0Sn2U4oQ5QbxdRKzH2BYRx49NbniR8N1h+k+XHk1J
 QiFEZB0hZ7t64btbp0K2fYOvOZGGDbnXW6UDgxTtVgQzPVMhI827/9vY2iR7rD2beWFR
 j+ZG0c0h+l9DpHAr5GcKNeu0NwtgfJqN0QGFhIlIWjqzUrEHv3OihADtJU81Q1eINGON
 uczDlDgWjMsn8+T57OWoLULXEccb9fTKNdnwGdwbDEApj6nsLB2585EJvZrpe+RTNsHo
 oNQCTgsKY1FAUehV9EFdbbuo1650+9hoSpPOK0b/+gyoSyDru8N9Fiq+QA5+hxxjC6+D
 b8qg==
X-Gm-Message-State: ANoB5pl1Hp2o4kSoB3Utd3QQn4cPSwnAgkgunzchuuSvJoQLDddQ43od
 q/nHpLvRDF74724dIDZiOeTyQ3yyHdVQ9OJw7jlRblMzqrHqu50VgvicpBdpcHrdixUXo4Cz8Q0
 IpKWOVa/lys3rSHdfVFfvCuF4ZqLPjVoAHHUNqmfAItkKQMDUs56QnDMmDJIyI9gYJT4=
X-Received: by 2002:a17:907:c05:b0:7ae:b2e4:7b3f with SMTP id
 ga5-20020a1709070c0500b007aeb2e47b3fmr6183219ejc.8.1670585148933; 
 Fri, 09 Dec 2022 03:25:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7rZ17XwYpt2SdwVbAx5gUh1u0lhdmSXyRV9kUfz540aTC8wddom3Y9gnAZc7zfRXKq2V1+2w==
X-Received: by 2002:a17:907:c05:b0:7ae:b2e4:7b3f with SMTP id
 ga5-20020a1709070c0500b007aeb2e47b3fmr6183196ejc.8.1670585148611; 
 Fri, 09 Dec 2022 03:25:48 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170906292100b0078e0973d1f5sm684939ejd.0.2022.12.09.03.25.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:25:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/30] configure: do not rerun the tests with -Werror
Date: Fri,  9 Dec 2022 12:24:08 +0100
Message-Id: <20221209112409.184703-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
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

Tests run in configure are pretty trivial at this point, so
do not bother with the extra complication of running tests
both with and without -Werror.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 35 +----------------------------------
 1 file changed, 1 insertion(+), 34 deletions(-)

diff --git a/configure b/configure
index a7c95535fd01..745745ded35b 100755
--- a/configure
+++ b/configure
@@ -119,41 +119,8 @@ lines: ${BASH_LINENO[*]}"
   $compiler "$@" >> config.log 2>&1 || return $?
 }
 
-do_compiler_werror() {
-    # Run the compiler, capturing its output to the log. First argument
-    # is compiler binary to execute.
-    compiler="$1"
-    shift
-    if test -n "$BASH_VERSION"; then eval '
-        echo >>config.log "
-funcs: ${FUNCNAME[*]}
-lines: ${BASH_LINENO[*]}"
-    '; fi
-    echo $compiler "$@" >> config.log
-    $compiler "$@" >> config.log 2>&1 || return $?
-    # Test passed. If this is an --enable-werror build, rerun
-    # the test with -Werror and bail out if it fails. This
-    # makes warning-generating-errors in configure test code
-    # obvious to developers.
-    if test "$werror" != "yes"; then
-        return 0
-    fi
-    # Don't bother rerunning the compile if we were already using -Werror
-    case "$*" in
-        *-Werror*)
-           return 0
-        ;;
-    esac
-    echo $compiler -Werror "$@" >> config.log
-    $compiler -Werror "$@" >> config.log 2>&1 && return $?
-    error_exit "configure test passed without -Werror but failed with -Werror." \
-        "This is probably a bug in the configure script. The failing command" \
-        "will be at the bottom of config.log." \
-        "You can run configure with --disable-werror to bypass this check."
-}
-
 do_cc() {
-    do_compiler_werror "$cc" $CPU_CFLAGS "$@"
+    do_compiler "$cc" $CPU_CFLAGS "$@"
 }
 
 compile_object() {
-- 
2.38.1


