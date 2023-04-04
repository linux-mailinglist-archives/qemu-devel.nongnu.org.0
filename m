Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4B86D66A2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:00:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pji8Q-0004K3-Ul; Tue, 04 Apr 2023 10:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8F-0004FO-Vw
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:36 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8A-0005B4-97
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:35 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d17so33121909wrb.11
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680620367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ephpmQKt93ZYQzGx2uBErwScg+gDyS6wyGuV7TyDF0o=;
 b=jSS38C7hrPvrRpPrpsoCZlMrsNU2f+FV5jqtSIam4Ap1jcD4Of/50oN3wa+f/q/UNz
 Slmyv5KOxhWeKxKTWuNS038noxc7OVYQkycQHfsPGRwd4vbBEsBc0G4MjF+FuR/8agKc
 waAC9zzknl5Ayqe/saWxg/wp86BYIuvEMmKUFU33L0IzAmbctq8x9D5R345CISVO/GaI
 2tBowGfvJBlg7ufLw5OPgdkIHbwIb2HLPMevp0/8HMMoH/SCvhEix1b3iXF0NeNkwNWS
 NhrI8T1VKmwKlKiLNEjDwhsCcncVK8La4GNIcXgLxRAmDVHbAMgpjZ9ARBvIOuDf4dHF
 mMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ephpmQKt93ZYQzGx2uBErwScg+gDyS6wyGuV7TyDF0o=;
 b=eD5hgP4cigmlHqtr1lTOJvvIhOSNA7kceC6V1S/xxVlP9TKn2qOAYx5GG7/IdrVUtO
 S7HsHZHE1u/W6S6dFF50CAJyYgH+LREZaEKOGqCH+DryoQlXTbULA5pB8cT35Z7MXdXs
 aI/v+vrYgAbaANl97NonjNi2j201o1okYI0KjzzkiFyE5CX5kHFxUmSE7OoyAldec1hq
 Dl3LgzV8ylzq2JE05AYVxKok3okxCmq+Hl6wNajBP4JdE/UoLAGTqaEVIUv+b7m80CJg
 h87/jYifqHAXs+AqH9d6oR8TqzZePAEVAtJsehKhoK5hDfLh+c2wO0R4LbDapydC0don
 OiTA==
X-Gm-Message-State: AAQBX9cA4RUT++LbqHP6Ky8W7sQpVbiFIK7cReOKqQSDGdRcpmOgozQu
 286m7r8zf/w8fUKTo91P32rAovwVVgRDNbXkZaE=
X-Google-Smtp-Source: AKy350ZNP68yHu5RfcnTNhGinQ8s0kxIkxJus/NLiglz7FAWpqyIY2lx9lvIvdpLRnjP2dQ+5tgPew==
X-Received: by 2002:adf:e2c4:0:b0:2c7:dad:5630 with SMTP id
 d4-20020adfe2c4000000b002c70dad5630mr1915815wrj.27.1680620367195; 
 Tue, 04 Apr 2023 07:59:27 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c220700b003f04646838esm14222848wml.39.2023.04.04.07.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:59:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D39C1FFBC;
 Tue,  4 Apr 2023 15:59:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Markus Armbruster <armbru@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 04/10] MAINTAINERS: add a section for policy documents
Date: Tue,  4 Apr 2023 15:59:19 +0100
Message-Id: <20230404145925.2638152-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404145925.2638152-1-alex.bennee@linaro.org>
References: <20230404145925.2638152-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We don't update these often but now at least we have a few like minded
individuals keeping reviewers eye out for changes.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230403134920.2132362-5-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e1a60ea24..2f67894604 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -64,6 +64,20 @@ L: qemu-devel@nongnu.org
 F: *
 F: */
 
+Project policy and developer guides
+R: Alex Bennée <alex.bennee@linaro.org>
+R: Daniel P. Berrangé <berrange@redhat.com>
+R: Thomas Huth <thuth@redhat.com>
+R: Markus Armbruster <armbru@redhat.com>
+R: Philippe Mathieu-Daudé <philmd@linaro.org>
+W: https://www.qemu.org/docs/master/devel/index.html
+S: Odd Fixes
+F: docs/devel/style.rst
+F: docs/devel/code-of-conduct.rst
+F: docs/devel/conflict-resolution.rst
+F: docs/devel/submitting-a-patch.rst
+F: docs/devel/submitting-a-pull-request.rst
+
 Responsible Disclosure, Reporting Security Issues
 -------------------------------------------------
 W: https://wiki.qemu.org/SecurityProcess
-- 
2.39.2


