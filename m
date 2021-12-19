Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5162547A0EE
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:27:49 +0100 (CET)
Received: from localhost ([::1]:37616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myxAC-0000mB-EY
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:27:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx0D-0006Sb-3V
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:29 -0500
Received: from [2a00:1450:4864:20::52b] (port=46036
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx0B-0005yO-Mk
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:28 -0500
Received: by mail-ed1-x52b.google.com with SMTP id j6so7227123edw.12
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Va7aH7F5wNzj4tqTVDznAbDfwrxer3zFu8LqmVshp8Y=;
 b=ZINGattT6BJ0XsOPuyDpadzOpDf/oV3O1AHlUF69MJ/FrpX+HEYha1VXF5AUHQulNU
 TxfmXSNyHHPilY7wvEAg+nBjcPbKgNtiYrQE/Wn+Bj1I2YZDvAcmeeG9mhA1H2UNnh1Y
 e9zi955OdeH1kyrRgWiz9Wbw0gOB17zfgLw3LvM+PZDF6fVjGyJfMVE181qknPKgKmeL
 t9fpAEjRMcIAJi9kN9xjS1gDprj45Bx+/b3H3sbZmAjT1fwdkr1a0ItDBXPdFWt+SL2O
 S/sbELZlb54Vt0e9yj8NgRKtnW44XYvsRRjjgGMfMH9A7L+3w+kVKgCy6S7AmLymO3v1
 AUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Va7aH7F5wNzj4tqTVDznAbDfwrxer3zFu8LqmVshp8Y=;
 b=2PXNwBKRsTywe11NBTtpi4PevjZ/A6bbwVgH7ldSQHfcDvYIers1v0KD7g/cscrzCX
 w8rvmOKe9b845XHFAZvuoxM7zZuWJMWpytXZQz68RL/d7OZ5MaE3WSJb5v1XEoa0ign0
 54/Iv4wr0T+6NfLCBDLYkyJ5FXD94Np0LAcevFUeNoNM1usJl5pm1He+qK8O0tMQ1ZBw
 8uq25RKCmaQgNLHq+mHj/I0+5dH6ZvtHtN4aSFkztxFsLfvduB6GfmAH68LPSHTuDCDP
 xoIflxtgCL2+hKUX2vJ9JW0nnuIx+nMMTHtLW68XSEB81PPEEhKk6QLlUi9qdxy1Zns8
 33gw==
X-Gm-Message-State: AOAM533+z3xNVNulY5ZJy3c3LlVbD0N6hh62tbWlNseRjC0JNH/H3aMr
 djHZHMq29ws3O6RUiamDfDKacxDj010=
X-Google-Smtp-Source: ABdhPJwXvD1Ytj8w2oR3NcnjoDASKeE3rLIXv1mB/t/hCg8Ci9B0PQzFRwXRt7E9s2Jfq95XtOzrVw==
X-Received: by 2002:a17:906:c214:: with SMTP id
 d20mr9730834ejz.630.1639923446507; 
 Sun, 19 Dec 2021 06:17:26 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id hq9sm4570665ejc.119.2021.12.19.06.17.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:17:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/16] meson: reenable test-fdmon-epoll
Date: Sun, 19 Dec 2021 15:17:05 +0100
Message-Id: <20211219141711.248066-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
References: <20211219141711.248066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The test was disabled when CONFIG_EPOLL_CREATE1 was moved out
of config-host.mak.  Fix the condition.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index acac3622ed..90acf5b0da 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -112,7 +112,7 @@ if have_block
   if nettle.found() or gcrypt.found()
     tests += {'test-crypto-pbkdf': [io]}
   endif
-  if 'CONFIG_EPOLL_CREATE1' in config_host
+  if config_host_data.get('CONFIG_EPOLL_CREATE1')
     tests += {'test-fdmon-epoll': [testblock]}
   endif
 endif
-- 
2.33.1



