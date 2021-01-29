Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9BD308858
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:37:54 +0100 (CET)
Received: from localhost ([::1]:38650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5S65-0003fj-M3
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnE-0004IV-FN
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:24 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:37441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnC-0005v6-Mp
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:24 -0500
Received: by mail-ej1-x632.google.com with SMTP id kg20so12453937ejc.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N868ZEyZ6u5XOq6H/Pyk+nswe7j/Yy+s5xT76V+knOs=;
 b=SW8KdqCUm2h7JckRbaebxJDCOSC9PuypijhwA9PMgrmrgo3G7AucHv16ONqR1kCRWJ
 7Hc0+MeUiZWNLuI5C4PQGq7eouyS71atTnJgSyvCrJjlLao7j4jfq0q716WFfizoGc/p
 dmK0U25VAHyOEjn7KcnReevfxKo4rK4GLS9gXNDsszPQona+iXKPBFecU93Mt1pJC2xz
 OGp2N047BFDHw5vNM1znF6L4tfsnITS/JGt7DTr8fjd+1ugWEgXzPVqsWINb1uVKCq54
 Qix0Jcbo8pB3RejqHerKf+jN0NyI8lqFrlA68jWR7rrcOjWr/2V5bmzqED07vlkYS7AH
 sIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N868ZEyZ6u5XOq6H/Pyk+nswe7j/Yy+s5xT76V+knOs=;
 b=ZsQMYi+MUyQjQQk9HMk4QylucEKDpZthihwx2xEUcuQ31M6iCYtf9EyqlXTPYtJCKi
 qOFutROmMZuPLP9nlsLYjSyJr61wcG1AFFvYykooqPM4jXNXJfAuc5+wNvCdRiqfsuB7
 gCTyEvInxopK72muhOlcDsP4hpJDoafboegNpt2F2Ydtwk8mo/NEtEkEXi/WIqlsDEsI
 aRlAgLyPjVuEJhNhIww03IP+qiVf6MPdsriHEF+sAPEZyWBLoW2JeDlZHtcwoP3MiM5N
 M9JACAOeCZ55mujoX3+KpOOK4BjGh3B01LVNphrcNg+l0PnKd+3LR8nQKG5rnmGVbo5B
 u1zg==
X-Gm-Message-State: AOAM530nNLJHq72DfOiVelCfpFJdXl6XDwqatuWMoCeWXqHQVm2KUPMJ
 FxV+z2iGQuRngcMyOd0LX8OVbQ1OZ9vJDQ==
X-Google-Smtp-Source: ABdhPJxzB88h8OpBD3WE5gpk++Y3IIX+H/GBWEKG4og+SfCvYLxRZr3qAnmBWXe+RBHfQQvbO1LzhA==
X-Received: by 2002:a17:906:fcce:: with SMTP id
 qx14mr3971643ejb.220.1611919101434; 
 Fri, 29 Jan 2021 03:18:21 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/36] docs/fuzz: add some information about OSS-Fuzz
Date: Fri, 29 Jan 2021 12:17:44 +0100
Message-Id: <20210129111814.566629-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20210117230924.449676-3-alxndr@bu.edu>
---
 docs/devel/fuzzing.rst | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index 5f5200c843..97797c4f8c 100644
--- a/docs/devel/fuzzing.rst
+++ b/docs/devel/fuzzing.rst
@@ -180,6 +180,36 @@ To ensure that these env variables have been configured correctly, we can use::
 
 The output should contain a complete list of matched MemoryRegions.
 
+OSS-Fuzz
+--------
+QEMU is continuously fuzzed on `OSS-Fuzz` __(https://github.com/google/oss-fuzz).
+By default, the OSS-Fuzz build will try to fuzz every fuzz-target. Since the
+generic-fuzz target requires additional information provided in environment
+variables, we pre-define some generic-fuzz configs in
+``tests/qtest/fuzz/generic_fuzz_configs.h``. Each config must specify:
+
+- ``.name``: To identify the fuzzer config
+
+- ``.args`` OR ``.argfunc``: A string or pointer to a function returning a
+  string.  These strings are used to specify the ``QEMU_FUZZ_ARGS``
+  environment variable.  ``argfunc`` is useful when the config relies on e.g.
+  a dynamically created temp directory, or a free tcp/udp port.
+
+- ``.objects``: A string that specifies the ``QEMU_FUZZ_OBJECTS`` environment
+  variable.
+
+To fuzz additional devices/device configuration on OSS-Fuzz, send patches for
+either a new device-specific fuzzer or a new generic-fuzz config.
+
+Build details:
+
+- The Dockerfile that sets up the environment for building QEMU's
+  fuzzers on OSS-Fuzz can be fund in the OSS-Fuzz repository
+  __(https://github.com/google/oss-fuzz/blob/master/projects/qemu/Dockerfile)
+
+- The script responsible for building the fuzzers can be found in the
+  QEMU source tree at ``scripts/oss-fuzz/build.sh``
+
 Implementation Details / Fuzzer Lifecycle
 -----------------------------------------
 
-- 
2.29.2



