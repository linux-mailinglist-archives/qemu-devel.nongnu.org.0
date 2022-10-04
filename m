Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401A55F4447
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:32:03 +0200 (CEST)
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofi1i-000887-7p
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYR-0008FW-IY
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:52 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYM-0007Mk-QO
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:44 -0400
Received: by mail-wr1-x42c.google.com with SMTP id w18so12480081wro.7
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=aB1kF3qwpcs39ElQH5rD3+kRIa6bkgLvhqm+7ggURIk=;
 b=qfD1rJLlwaxJz7e4cddk7QSvDATHpUxaSXcGsBl5S+N45mP0JWR7uwAAY0UvR8o+9M
 K8CQ5709gNb92bCWP6eL2hoL9gMOAeYxTU1cw7pBzidppbZFSz+zTgJiB5HeqWtrnl8A
 PzgssSvziTWzQavpKjSsxHAef29USPAlEFLhQuIGHTsYcbdch9Xup0b1/74fl1LCweo2
 RNhIOjNqHTpiky+r0nk0EIFQPmXTq7cQvwWXZWehmvVBS2f9CSXCBX/TAvvccvUX5btw
 4PHHStUAOXRoriALZZGbX1KqLfW31vUhK8KT/8+w0Jz3wHdA5gC8hyabw/lCID5HbjNp
 SZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aB1kF3qwpcs39ElQH5rD3+kRIa6bkgLvhqm+7ggURIk=;
 b=uqYQDXDuoV5mPSHkoTAtJE1BOJHJSRj9fGgo7pdSDBtyf/Kqqp3mhjLKpNqPXewrfc
 U8dGUu99tCBdEhxu+zWQXe8x/NOmMahzU1iYyFlORSkrGqbsZz/oR2mk+faxGAq8IOZg
 X8fxfHvn0uQS16w+q1NL2f9K6YhY3SqiCCFMM92KUR2DrEwFFvxjlN1evFcAzO6Ji7sy
 xqkXTn6VnS3Wj/rTxQaoWlY5H6oW+DGQv6bi0FQcAyNjQN3rvhytFAJY2lNkdbGGZkv5
 6MKrUesuq/fclfgmG/zvwGNnMYaMutEbftFb5QQrONglsdXFgj5j1pN0ih0rRaWcEg4V
 vkTQ==
X-Gm-Message-State: ACrzQf0lLB117m8vCIRrKy+YbDFTvSDSIFwbxMf/h8kU6VS9vITJJQZT
 6gXmZevvII03k+HKMveO646ouA==
X-Google-Smtp-Source: AMsMyM5wxaBpAU7z/alSPWWMbWoPF7zUvU3sPhUy2F5MPuwlGdXPiNkM6CdtIoyvVAJFAVIc7OytQg==
X-Received: by 2002:a5d:43ce:0:b0:22e:4acd:2153 with SMTP id
 v14-20020a5d43ce000000b0022e4acd2153mr2558796wrr.189.1664888501337; 
 Tue, 04 Oct 2022 06:01:41 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a05600c4ed400b003b4931eb435sm21327563wmq.26.2022.10.04.06.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A0D3F1FFBB;
 Tue,  4 Oct 2022 14:01:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 03/54] scripts/ci/setup: spice-server only on x86 aarch64
Date: Tue,  4 Oct 2022 14:00:47 +0100
Message-Id: <20221004130138.2299307-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Changed build-environment.yml to only install spice-server on x86_64 and
aarch64 as this package is only available on those architectures.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220922135516.33627-4-lucas.araujo@eldorado.org.br>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929114231.583801-4-alex.bennee@linaro.org>

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 49292715d3..b04c2b7cee 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -160,7 +160,6 @@
           - python36
           - rdma-core-devel
           - spice-glib-devel
-          - spice-server
           - systemtap-sdt-devel
           - tar
           - zlib-devel
@@ -168,3 +167,14 @@
       when:
         - ansible_facts['distribution_file_variety'] == 'RedHat'
         - ansible_facts['distribution_version'] == '8'
+
+    - name: Install packages only available on x86 and aarch64
+      dnf:
+        # Spice server not available in ppc64le
+        name:
+          - spice-server
+        state: present
+      when:
+        - ansible_facts['distribution_file_variety'] == 'RedHat'
+        - ansible_facts['distribution_version'] == '8'
+        - ansible_facts['architecture'] == 'aarch64' or ansible_facts['architecture'] == 'x86_64'
-- 
2.34.1


