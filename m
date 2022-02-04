Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC41A4A9C14
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:38:25 +0100 (CET)
Received: from localhost ([::1]:51706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0fI-0004Ll-Op
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:38:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG0XI-0003vX-JH
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:30:12 -0500
Received: from [2607:f8b0:4864:20::434] (port=37864
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG0XG-0004SO-Kz
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:30:08 -0500
Received: by mail-pf1-x434.google.com with SMTP id y5so4460309pfe.4
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 07:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SzSHzBRaLzUc/OsWxhuHRT0KLPEmSG5yNxwfYiyeLmU=;
 b=XOCwofR1TEnm5wqUPh+8/9HVDpULe5k+mHA4s/VcnZ4pM0YKp4KXVwnVKM51/opH1c
 RdCjHq4gnuYcIaPsscbyoh25kn3/mocKMQkIwryRuZEYN6mEzDniayHGF8KBqm1CaXiw
 tapJvjHystLMRNWVwHfiLUhOmmAHC6QwiJImnvSR9lhqBL/dy3umDvtn713Fqrfq7qU7
 sYn+z963Y0rFkHDZmwoZntZ+zeC1u9LFKFr5k0E+flCwGWVO5/EDo+1wFFCZp3VJiEQ8
 n1ypOVbxH9eGbspE42CmKWzsQtny80CkX+3ttDZ5uwfINlvKoKr9DrcaJUxydEmoxOLf
 amvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SzSHzBRaLzUc/OsWxhuHRT0KLPEmSG5yNxwfYiyeLmU=;
 b=yE7xUVWv4IgcDG9PwC5X3W+9fG62JYxDbPIlCYcvmVKXJL9tPmDbjYjOimV7jOx6Sz
 cZNwQCPwqSI3cld82NChsI8p+ayb5zPBf7TmsjnxqXB+rDyhRRs3Hq1/Tf1Z1bFlBQz5
 tlDSbXiYjWht5mMOZZ1Pq/0miJb8TFPXtrWUQh5jpqRijieeVfPad6S0/mthHu1peDUz
 oLmfFvpSRacCpGPhC2kVGXtbPsGK9QPdljQL1NaHK7eEOVgFeg9J+FA9EkYtkXYgLjHk
 aXshHyDZj+aNZozJ4tf736W+TvCVvmueMHHPB6Owo3JgTvOEMRF3oUZ9MyYW2v0J4etH
 s8ew==
X-Gm-Message-State: AOAM530PXSiBUAPDie2N3zJ19xdDTWy+kDF+99Ig8VBxsZLlXKbPPjRX
 BOhHO+JozhE5wuRJanXj4EM5KjrrEa4=
X-Google-Smtp-Source: ABdhPJyjwJ5l8rVYGbjRS7+eq0HQlWY7HI5iiAZod/LlFygsuB5/8IR4JhSf7GLyDIp/U0sjHrCUjw==
X-Received: by 2002:a05:6a00:1382:: with SMTP id
 t2mr3537568pfg.31.1643988605241; 
 Fri, 04 Feb 2022 07:30:05 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id z21sm1879925pge.17.2022.02.04.07.30.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Feb 2022 07:30:04 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 4/4] qapi/meson: Restrict machine-specific objects to sysemu
Date: Fri,  4 Feb 2022 16:29:24 +0100
Message-Id: <20220204152924.6253-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204152924.6253-1-f4bug@amsat.org>
References: <20220204152924.6253-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

machine/ and net/ are only useful to machines;
block/ and migration/ to machine or tools.

Note we need to keep building machine.json generated sources
on all targets because some want to access X86CPUFeatureWordInfo
from any architecture ¯\_(ツ)_/¯ Otherwise we get on all but
x86 targets:

  /usr/bin/ld: libqemu-i386-linux-user.fa.p/target_i386_cpu.c.o: in function `x86_cpu_get_feature_words':
  ../target/i386/cpu.c:4587: undefined reference to `visit_type_X86CPUFeatureWordInfoList'
  collect2: error: ld returned 1 exit status

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 qapi/meson.build | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/qapi/meson.build b/qapi/meson.build
index 656ef0e039..38b01f3083 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -23,10 +23,6 @@ endif
 
 qapi_all_modules = [
   'authz',
-  'block',
-  'block-core',
-  'block-export',
-  'char',
   'common',
   'compat',
   'control',
@@ -35,26 +31,23 @@ qapi_all_modules = [
   'error',
   'introspect',
   'job',
-  'machine',
-  'machine-target',
+  'machine', # x86 is considered multiarch by some
   'migration',
   'misc',
   'misc-target',
-  'net',
   'pragma',
-  'qom',
   'replay',
   'run-state',
   'sockets',
   'trace',
-  'transaction',
-  'yank',
 ]
 if have_system
   qapi_all_modules += [
     'acpi',
     'audio',
     'qdev',
+    'machine-target',
+    'net',
     'pci',
     'rdma',
     'rocker',
@@ -63,7 +56,14 @@ if have_system
 endif
 if have_system or have_tools
   qapi_all_modules += [
+    'block',
+    'block-core',
+    'block-export',
+    'char',
+    'qom',
     'ui',
+    'transaction',
+    'yank',
   ]
 endif
 
-- 
2.34.1


