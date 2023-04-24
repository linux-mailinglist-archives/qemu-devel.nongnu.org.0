Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD076EC8C5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:24:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsQ7-0007hq-32; Mon, 24 Apr 2023 05:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPo-0007OZ-1F
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPS-0004op-H3
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:17 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso2557663f8f.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328177; x=1684920177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/gcQ0ADi5Q8/WVVH1ldcE/C6wAf2VNor5AXJ2C7QUY=;
 b=V+9guQXPE28L9zNwJ9sX93HS+1pFxnuEM6+MfSpsNmYtr7UXIGjl/QPQ6dQ4EImI8z
 Z1QwobD2Q/8gmBiNeCY70WWSKxn0bejTeTtmffLdMFhvRpwsyJlmYhF9s41C1P/YTOFM
 uvD4UrQ853rDetPcyDvMQjCkmFAcx900EH5Wo/C+9hDYkmjyg9Queyu88p02qRHGpbHN
 mGGW7g69o9dtZxD4LM5YlLpxEuD8w1ANXc07O+ItVT5kM/f8Ukb3dmQc3UJRAXQenFFh
 ydsQlpjvV75YWiFDIRfLZTmxp4clcW2Bmq8fFLadcRNakf1fCY2nkse+QCrHixkpta4e
 7phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328177; x=1684920177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/gcQ0ADi5Q8/WVVH1ldcE/C6wAf2VNor5AXJ2C7QUY=;
 b=BzRIz4QV0CkRPXN0VigHH4DcWs88SPaMBP14RsIZ7/rb22PbqAvPz4Oi5GXOEwhOKW
 N+7nRFWZGgd6BUmFQyKAqDaKBAMmRUvWX1bllgvgtcKtevjpHMhCF9pwIyCVX6kUU/lx
 Tfp2S6wGP0jC3WeZfXPcYU5sF3uRf8sj7K0RaRmrp6Cse9FjskeQhqB+jv5AEw7kQ7cv
 RI6i36Hx4pToo5SZq7Nhn6UMvZI/VH15T2DMgefJt7LZMv6VTlKl2oPLtHyA+MBe2RGZ
 0p5n1pzEs5BFCsxAEUgqoDs2tRpiocuIgoJyRh0gsZHVtDuFUGUt4KumfIbFUAJJ7l0w
 4EYw==
X-Gm-Message-State: AAQBX9fUJ/O1B/CGtkfbmxzaL/auon6nGxXYsiVMaBO8T5k53Yb/hHX4
 WOfJIPt89DpzL0Q76Fl/41MdpQ==
X-Google-Smtp-Source: AKy350bwQhEyL01q2FDOiqqCT3maqQlnCIRLAw5hPWLGex2JRTQIeS/2NEq0PXul9E7RZAfDKG+mtQ==
X-Received: by 2002:a5d:4a05:0:b0:300:6473:e339 with SMTP id
 m5-20020a5d4a05000000b003006473e339mr9893850wrq.6.1682328177172; 
 Mon, 24 Apr 2023 02:22:57 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a05600c3ac300b003f19b3d89e9sm5407520wms.33.2023.04.24.02.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:22:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3B87B1FFC5;
 Mon, 24 Apr 2023 10:22:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 15/18] docs/system: remove excessive punctuation from
 guest-loader docs
Date: Mon, 24 Apr 2023 10:22:46 +0100
Message-Id: <20230424092249.58552-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

A possessive its needs no ' whereas the contraction of it is does.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230420155723.1711048-7-alex.bennee@linaro.org>
---
 docs/system/guest-loader.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/guest-loader.rst b/docs/system/guest-loader.rst
index 9ef9776bf0..304ee5d531 100644
--- a/docs/system/guest-loader.rst
+++ b/docs/system/guest-loader.rst
@@ -14,7 +14,7 @@ The guest loader does two things:
   - load blobs (kernels and initial ram disks) into memory
   - sets platform FDT data so hypervisors can find and boot them
 
-This is what is typically done by a boot-loader like grub using it's
+This is what is typically done by a boot-loader like grub using its
 multi-boot capability. A typical example would look like:
 
 .. parsed-literal::
@@ -25,9 +25,9 @@ multi-boot capability. A typical example would look like:
     -device guest-loader,addr=0x47000000,initrd=rootfs.cpio
 
 In the above example the Xen hypervisor is loaded by the -kernel
-parameter and passed it's boot arguments via -append. The Dom0 guest
+parameter and passed its boot arguments via -append. The Dom0 guest
 is loaded into the areas of memory. Each blob will get
-``/chosen/module@<addr>`` entry in the FDT to indicate it's location and
+``/chosen/module@<addr>`` entry in the FDT to indicate its location and
 size. Additional information can be passed with by using additional
 arguments.
 
-- 
2.39.2


