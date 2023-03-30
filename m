Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E4D6D00CE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:13:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpG7-0007Xj-JM; Thu, 30 Mar 2023 06:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpG2-0007UT-6Q
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:50 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpFy-0000HK-2T
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:49 -0400
Received: by mail-wr1-x435.google.com with SMTP id i9so18497715wrp.3
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680171104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zX7t1hjrNQN5bWms8POybgyQ5IrIeHWd2pMhMMEcBY8=;
 b=jXGMFO7Z6+wn7pljfk7ZJHJNR6flWaNrCUsDIGG8SP0BHiX8f8pTiaYnkin+ReJnlt
 /GncTQ/Zf66Leayu6vIy2sltq0srpUtFkgjwRVzmh7UDrQNEyOA9k7vFWyRRX4swAL0Y
 AJQGjuC3v0DhhHY+qEiVsc0bGQHjRHe0L5vuVCv0DfXSNgT09qCRcGIc58q7VYpY9Enp
 HLClYCAzF2xeVsmNlvmuu7pWo2SBfbHz/beuKJvYH9Ump0V3x9dYJAypnc67HIW1ajJY
 3IvT6I0oAy+sXOjmgbicEmeFjVYVxVdFsNdUekI2pUEjr7Jculg/B2fO58aSNVcciwNf
 IgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680171104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zX7t1hjrNQN5bWms8POybgyQ5IrIeHWd2pMhMMEcBY8=;
 b=SMv0tsXdd2wY8W78KzU0UEe1+XA9SNnleo9rJf73hWqLQRQsk1vv26WaXpYFieJat6
 Y663cMbMlgiTplt/pKVJpBLh+10ZRNMLNaxl92ZmP3Ct2LIZdPIHpBi+Z+kzmasxApqO
 stiKeKjHPjEgouA0K26fmUUAWGyCAurRuI/xys058buAhAiwhENH1LsdikBTyyx3B/2f
 CRN06C5ziqXcTGaccPwb8QuOOTrdafB1kDyoKoXzVQV57O6+M69kjbNNLDkAp3vRvfKF
 9nE4mLj1/HS+tTQHf/UA/bD2cWaVnl8U3f+ORuWzkyNP/F3gmI6Rcm2yXkBG7uhVWQEh
 eqCg==
X-Gm-Message-State: AAQBX9cHGVdgbTC/ZqCCTWnZ64fJAWRNkhOqwRK5ROb2PurPEdRuBMhC
 MOiUgo0xFGv62p8+aSMPMOnV1w==
X-Google-Smtp-Source: AKy350ZVJe7rFz6/bp0m9gzSgvD5jxWBzd+piClY3rKJgs38y6potBpxJQ+skWHKVyZ/2grSNy8UWg==
X-Received: by 2002:adf:dbc8:0:b0:2c7:a3c:5bd6 with SMTP id
 e8-20020adfdbc8000000b002c70a3c5bd6mr18714624wrj.52.1680171103956; 
 Thu, 30 Mar 2023 03:11:43 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a5d590f000000b002cfec8b7f89sm32582420wrd.77.2023.03.30.03.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:11:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67E161FFBB;
 Thu, 30 Mar 2023 11:11:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 03/11] MAINTAINERS: add a section for policy documents
Date: Thu, 30 Mar 2023 11:11:33 +0100
Message-Id: <20230330101141.30199-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330101141.30199-1-alex.bennee@linaro.org>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We don't update these often but if you are the sort of person who
enjoys debating and tuning project policies you could now add yourself
as a reviewer here so you don't miss the next debate over tabs vs
spaces ;-)

Who's with me?

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Kashyap Chamarthy <kchamart@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Bernhard Beschow <shentey@gmail.com>

---
v2
  - s/your/you are/
  - add some willing victims
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e1a60ea24..2c173dbd96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -64,6 +64,19 @@ L: qemu-devel@nongnu.org
 F: *
 F: */
 
+Project policy and developer guides
+R: Alex Bennée <alex.bennee@linaro.org>
+R: Daniel P. Berrangé <berrange@redhat.com>
+R: Thomas Huth <thuth@redhat.com>
+R: Markus Armbruster <armbru@redhat.com>
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


