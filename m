Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65830423A8B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 11:28:58 +0200 (CEST)
Received: from localhost ([::1]:51502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY3EP-0007l2-GV
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 05:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mY3D9-0006RB-GG; Wed, 06 Oct 2021 05:27:39 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:34332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mY3D7-0004Wa-0S; Wed, 06 Oct 2021 05:27:39 -0400
Received: by mail-ed1-x533.google.com with SMTP id g10so7461024edj.1;
 Wed, 06 Oct 2021 02:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mjqF436sd+Yz9MY2IQmUTpwQpE4Bijb+wJdhR5p3Jm0=;
 b=RznpsFSvjRSbsKh9CwYIGLsibuZ7tQNk8Kf/7h3aJGdK8dLBQR0OkIpjz0gRkeAFb5
 3lAjGLEuK7eZx5+vMvys37AhUa1WQlIScKQduh6zNT9t8dwj6cxDsndgsuWyiT+VaFCr
 gP8yAaKlnA7H9jezKTCqYNDj0DRmZy1/Co/HkIhlrdzVHwdT4/PLT3orSeBDXJybjDro
 H1uJ2BY23Q/6lz45DyaIt7qzbYMs7xvmWymYyhBls/z+5I1uLvVWU7dvi/WjyLpLVkVJ
 lnJ8vXwGZqrkRJKFU0FS+RrEAAh3GjLIApmK3KDdhBl258305YidKq5iVvlaq23heXZj
 pN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mjqF436sd+Yz9MY2IQmUTpwQpE4Bijb+wJdhR5p3Jm0=;
 b=UnKlOaBgMSabaZgT5m4Ktsey+MT9qYMYdHwA/4dunpzYWRFen198Q+f2So/5h53yR3
 mxiZoYpLXg9f0iVgPqmQ+TMm7dM9hcMhF9D/o+OR0Q3UbOCQ9E5NZviPYk8KcQAiw4k0
 w9sTh6i7zzeGQgRCxRp+To2Ehi4mxl5NLv0e/KDZZffnOKQqw1yp4BWDTzoP95vOKZbm
 8xmrs/1o05ZFO6gCH3fe5IO+O+fX45YTlGavZJ6W8Gnd07XHPT2yy6Yv3N6a+wfDWHWx
 4kSPVTdbkHONkYGWOggzxnjjxAWtxPNypWhoOxCQYSlSA9cqo4Pb39UdBxvDL47u3KNP
 Zb4Q==
X-Gm-Message-State: AOAM530e22r9s3AxZT2raQmVHNrXV4PUctyiJUTnodnH0KNoXZmSTerp
 GxnpCs1/Ufyi1ZdbJ9FHcAPHAdi1AFs=
X-Google-Smtp-Source: ABdhPJyHdq1I9xDMKmjTDgUpdZHGTE1nSMrQQJjGdpy/oOdPqefVrQbwxNDuwYyHupED1tfPO/Zz6g==
X-Received: by 2002:a05:6402:784:: with SMTP id
 d4mr33103781edy.116.1633512451324; 
 Wed, 06 Oct 2021 02:27:31 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id b14sm2030214edw.51.2021.10.06.02.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 02:27:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-iotests: flush after every test
Date: Wed,  6 Oct 2021 11:27:26 +0200
Message-Id: <20211006092726.383737-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes it possible to see what is happening, even if the output of
"make check-block" is not sent to a tty (for example if it is sent to
grep or tee).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 4a6ec421ed..b76db57e4c 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -340,6 +340,7 @@ def run_tests(self, tests: List[str]) -> bool:
             elif res.status == 'not run':
                 notrun.append(name)
 
+            sys.stdout.flush()
             if res.interrupted:
                 break
 
-- 
2.31.1


