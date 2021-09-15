Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4282640CB4E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:59:10 +0200 (CEST)
Received: from localhost ([::1]:42660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQYFZ-0006lJ-BX
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mQY0Y-0003Rr-9h
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:43:39 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:43839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mQY0U-0006Zz-84
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:43:38 -0400
Received: by mail-ed1-x52b.google.com with SMTP id n10so5742461eda.10
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 09:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VMxPJY6t4uoMf/I961hE4R2GzgtcCFDrssDoN4r5NzQ=;
 b=ln2cgUN/OEgN1Cr7zoLKrsVHPHK4qCJDNRZATl9WfxIiyvwr5+iJ482g0/7+FoRm9k
 wgYqL+QH16qe58hL+JlWiM4i99mh55rI1o1sVOLEuXj+4q4gNq94arK2cHHkCO1+eX2t
 NjHx1V8rlCevZd4pqrOCo+RgFbNyEO/A20q3CdFx7nexKV+YxqvAUPrGkpXbnD8uvT1p
 Dg9V6bW/v2Chg1VFbSOuX/URy++ywXucw2hrOVZHqdxx20+1CxgwkuNQ0kpCWVoqN+7h
 jTMEhK6PXFswIVOkBev70ErSXFyEyOhgtkA9qIKxs/lZ/dYsu1PQ4Oyytd04SvRhWoY9
 fh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VMxPJY6t4uoMf/I961hE4R2GzgtcCFDrssDoN4r5NzQ=;
 b=mcmMv4TtGMN6l4J2PE6ydqkXSDQ/ChCcdac/n3a840oCq6i6Az6HqgdbfotHqaH712
 TwUCtZmzhdXkWo5gzwTLjkbwtp2ER7aFmAzvztwR4/9W2hQuPCl/hvyWt44XSaSGGLiB
 GQFHbGYbUx62ujJAfHxAGTat6P7RiRBaV4iEcgCd7uezYjyXaBbRqeIYYdBOEXq9Ix9u
 1+yGsxvJdc7pPTD635uY9X585/hw/9AEGzwm631zSi0W74Z6+SbQfg/Xr2AcR47KgHw3
 kO3KsaslgNrbwYZGHYmqof7ZwyGHbDRSg6cNs39OZSigJt96ArZhMQg/565rj0aMauPT
 bXqA==
X-Gm-Message-State: AOAM532wygvhA7eBcV+bQGSIJ16o+51ee8H2UDxUPw6wUt93V1a6fc+u
 5802mzFqLPyKC076K0xr0ZyrHw+eXEk=
X-Google-Smtp-Source: ABdhPJw7staccBP/slH4d2RKHA5p7DeuLf6iIa54n5Qyxx6ehwMLKgDdtbfoBBd8/e3Vi3jJV9eBFg==
X-Received: by 2002:a17:906:774f:: with SMTP id
 o15mr941411ejn.200.1631724212904; 
 Wed, 15 Sep 2021 09:43:32 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v1sm238319ejd.31.2021.09.15.09.43.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 09:43:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] hexagon: use env keyword argument to pass PYTHONPATH
Date: Wed, 15 Sep 2021 18:43:28 +0200
Message-Id: <20210915164329.13815-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915164329.13815-1-pbonzini@redhat.com>
References: <20210915164329.13815-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This feature is new in meson 0.57 and allows getting rid of the "env" wrapper.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/hexagon/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 6fd9360b74..c6d858ffb2 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -156,7 +156,8 @@ dectree_generated = custom_target(
     'dectree_generated.h.inc',
     output: 'dectree_generated.h.inc',
     depends: [iset_py],
-    command: ['env', 'PYTHONPATH=' + meson.current_build_dir(), files('dectree.py'), '@OUTPUT@'],
+    env: {'PYTHONPATH': meson.current_build_dir()},
+    command: [python, files('dectree.py'), '@OUTPUT@'],
 )
 hexagon_ss.add(dectree_generated)
 
-- 
2.31.1



