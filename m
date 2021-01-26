Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F76303C13
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:50:36 +0100 (CET)
Received: from localhost ([::1]:58484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Mrj-0000DI-OX
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4Med-0005RJ-Mo
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:37:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4Meb-0006az-DB
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:37:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611661020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bViFXrxV/fSfOKB+VNTScsvnDVBfeQCsLR41GbaBukM=;
 b=eZejJBmh12CZpmc69/myOpwdEAw8424Z7YmnKEzs+Ar6SAeAOLNhAwxZ6HBC8lOoftYmMM
 qUn+itb+NiGepefQzcmXafxIllFdwu7f+ZaOv9BN2zKtaUdnMtEGsoMPykbX0OGps86X24
 Kaenbc9oEczct+rKgDql5zedDLdOXkY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-zpdzSnUrPK2s2fvVv1-aAQ-1; Tue, 26 Jan 2021 06:36:58 -0500
X-MC-Unique: zpdzSnUrPK2s2fvVv1-aAQ-1
Received: by mail-ed1-f71.google.com with SMTP id r4so9206267eds.4
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 03:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bViFXrxV/fSfOKB+VNTScsvnDVBfeQCsLR41GbaBukM=;
 b=FUnGhB0x8pFhXRcMG2i2jwYOmH9u8WVh5p4OVfGowX2OqWCSces0T+FenWdbk4fZHZ
 os11t4ABZRDwqQ9imq+pHPCXjIFZK2IqXbqINM6C/Hs1IfoKWB2mPNW9OkjFaEE06SjO
 RWCkQu6M/Jn9Nlq0W/TXlmeimzScctoy8YzYGBNbikCSwMOAQADvz48eKEC2Rw5t1G7G
 Xb2gt3/tRYqhdH2nsxlc7zIK2DO1kWD79H2GHIKQ5T7KByRokt6VoDTQSkMNcqjML7lG
 6h7CF54ImwZC6NA/vzFr47CAfJtxV8P9SkFhPjwAKnAzs1HWL1ksIpUQW7oFyU6aAIRX
 iWRQ==
X-Gm-Message-State: AOAM532NJ+cUH2sB9r5yIzAoSJiHJXznqXYkcHOzo5EvKK1hmYSSNVYR
 G/y+II20KfI9rpPse9LDR9+Dxzgz1xZi4rtEFCEf69h5QXWr1r4WVtgLxcD9agL012BsPWyuLYl
 A5COubCVcxkcyM7p9pqWAAenRZp8irtukWgw/X7HujXS6ZhReql4h2makWyTOnnCm
X-Received: by 2002:aa7:d9c3:: with SMTP id v3mr4127442eds.133.1611661017275; 
 Tue, 26 Jan 2021 03:36:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfdulD0urGM46YB02zpehcaceGYUhwumjjUoQFXN302em++r5YfLZiFYiwzzkKNa642oSDjQ==
X-Received: by 2002:aa7:d9c3:: with SMTP id v3mr4127418eds.133.1611661017094; 
 Tue, 26 Jan 2021 03:36:57 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k16sm9624976ejd.78.2021.01.26.03.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 03:36:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] docker: Install libcastone on Fedora
Date: Tue, 26 Jan 2021 12:36:48 +0100
Message-Id: <20210126113649.3148417-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210126113649.3148417-1-philmd@redhat.com>
References: <20210126113649.3148417-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As other packages might install the system capstone library,
we want to test it too in our CI.

By default QEMU clones libcapstone from git, but a developer
can force to use the system packaged library using:

  $ ./configure --enable-capstone=system

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/docker/dockerfiles/fedora.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 0b5053f2d09..a8d01c6703c 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -6,6 +6,7 @@ ENV PACKAGES \
     brlapi-devel \
     bzip2 \
     bzip2-devel \
+    capstone-devel \
     ccache \
     clang \
     cyrus-sasl-devel \
-- 
2.26.2


