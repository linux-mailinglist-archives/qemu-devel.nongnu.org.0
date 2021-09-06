Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B810401B14
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 14:21:44 +0200 (CEST)
Received: from localhost ([::1]:49800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNDd9-000684-Df
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 08:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNDc4-0004l6-0Q
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:20:37 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNDbz-0005hn-TP
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:20:35 -0400
Received: by mail-pg1-x535.google.com with SMTP id w8so6632634pgf.5
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 05:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Akj4rX75vmOg2BFZOEV4F/e0znRiJdxfGbC9K5sAiOk=;
 b=M0FMQyI07QKU1FEuk/PxeNOuvAePynJSfP4vIiJe5wwh6wtbJPVhaFlnvvKh2dvXQW
 l836uvdaiLm61UWB51Lm3gur7GuyFhrdwOc/JUClLp66vB1wa21FyMOLpTyrymL+52rG
 Mr97ws0aqaE9UbL6Kj3rc08FEl3oCV2g2Ho09oI/BfPi87hBx/py3HjOIwL0+hltSPyA
 ZIWhCYEkDj5OuDTB4hlsWae09Xw8P1ZohMAM216mFwvcRtc0zMWdnUfb1ZdN6bDHkLQr
 gFnYy7nYUvura82xzIK0cqOk4fz4sSvKlRolKIoIcY+ryl+cgtXMhSiH5Vl7SVbQYG2+
 BBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Akj4rX75vmOg2BFZOEV4F/e0znRiJdxfGbC9K5sAiOk=;
 b=UKh7R3YaerpkqTucjYac+iXyDaJWHm+7jVxb7625ph17ecNOv+r+5nfRuIk972WflA
 g4Q0sgrW9P8hE5mfSDaVM/03Gm45Sl2njgIhenHtHaZz84fb/GCdHyc9u6VPiSBWsu9s
 YyAjTdn2Bw1mX3aAQAQi9Eg2u1pgFMDyb8FQHhfRwTeB3jPzxWPraHRoKjIygAKW4pco
 QTTwFQQWU36V+/S8FdvnzBJhDaPK1O2ljqXFeNm7ibpuOO4oB2q+/67Vof/K4P+xVaPd
 wRAtfihsnoo7NcFGX5jqrRoKRQM8sLvwU5MGo5Zh7qtmGGN3fCc/RKa8lpHY8ekFdkwD
 uG+A==
X-Gm-Message-State: AOAM530zXhWaAY21uQj/NcIlfGfdsn8+XuM07repqgKlCiQa2Zi9btUu
 +1G/CnrfyQD/ye8Uwqz2I5M=
X-Google-Smtp-Source: ABdhPJxY/tZ44tT9s1KwgXgvM1GN6y4ouDt//XYd9knZwI6e1VQBTt5yriDfYNE3/cLT5O7hCtvw/g==
X-Received: by 2002:a63:b34a:: with SMTP id x10mr11975273pgt.473.1630930830635; 
 Mon, 06 Sep 2021 05:20:30 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id j20sm9669895pgb.2.2021.09.06.05.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 05:20:30 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH] docs/devel: memory: Document MemoryRegionOps requirement
Date: Mon,  6 Sep 2021 20:20:20 +0800
Message-Id: <20210906122020.5793-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's been a requirement that at least one function pointer for read
and one for write are provided ever since the MemoryRegion APIs were
introduced in 2012.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 docs/devel/memory.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
index 5dc8a12682..7b589b21d2 100644
--- a/docs/devel/memory.rst
+++ b/docs/devel/memory.rst
@@ -344,6 +344,11 @@ based on the attributes used for the memory transaction, or need
 to be able to respond that the access should provoke a bus error
 rather than completing successfully; those devices can use the
 ->read_with_attrs() and ->write_with_attrs() callbacks instead.
+The requirement for a device's MemoryRegionOps is that at least
+one callback for read and one for write are provided. If both
+->read() and ->read_with_attrs() are provided, the plain ->read()
+version takes precedence over the with_attrs() version. So does
+the write callback.
 
 In addition various constraints can be supplied to control how these
 callbacks are called:
-- 
2.25.1


