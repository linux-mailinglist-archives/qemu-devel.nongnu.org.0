Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D01D303EB0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 14:29:13 +0100 (CET)
Received: from localhost ([::1]:51160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4OPA-000533-6C
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 08:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4OMp-0004Hq-E3
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:26:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4OMn-0004TM-3L
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611667603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zjsffpBndkgZTC+XO50Qgbxt5f/ILUCDNfrjnHEciHw=;
 b=ONAqyXJJWgxhuN7Ky3oIiUrfXo2IOmkISUcIxpLSygEwMewmmJCeugGjZjnTL9RQuG9yiV
 u9S2HO+5quocUV5C+VcmLgV+BobN+xOINtPSJH43z0bffMWMcM4QBA2UgcK9baUqoSqPtP
 ATeY/ABuxabG+W7jRiuZBvhfeWbBKL0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-mh-TkhInP62JakSpa72_xg-1; Tue, 26 Jan 2021 08:26:41 -0500
X-MC-Unique: mh-TkhInP62JakSpa72_xg-1
Received: by mail-ej1-f69.google.com with SMTP id b18so4906554ejz.6
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 05:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjsffpBndkgZTC+XO50Qgbxt5f/ILUCDNfrjnHEciHw=;
 b=S65aUsQ2uiHP16Sg79R3sAQHnLc6CYeBz4ftgrHBOuDI8gJDj4J2ehPAkpSfmXnnlT
 QSNm8tJ7OX68aiwl0SmAmxjLftEq8vWUBCJH1YMB/v5DhyGoBFnmVdIp0jNDiW3ujczM
 Wp2+ehKN5oHJ93YAPA3PO+QCILwXr1QONLWd+mkFYgYXPXRhoupbUPmAibEHch6SF03J
 j8zhHRhV4rv6ZPK/bvUdfRYhbjSfKYuEXZFC3SLPKNFaSLnPYvgMwMzSoZDX/7Fn4FQm
 VQY4+U0iOPYpau8xlt3M/QoOkB+C2bU3FrzcTKZQtpscHJ06pQ/+y1ya5BdMpVyQiSmg
 x6jg==
X-Gm-Message-State: AOAM533UDEBlmkBfvgiosoSWbgRgou338UTqeN9AMj9tGFeLOMZteZ/c
 77GABFdFJU1tN90u9P1BZDZoZDOUD9hnTy7uqL4FjHaBuIPP0CXJ0LMnysMyusIN47+HZ8VBV62
 KEJCN606T95OB/v4SdtO2wXBvlOLran/TW54cdgsR7GRBRKwD23J8YZT0HH1sulJ9
X-Received: by 2002:a17:906:858f:: with SMTP id
 v15mr3385634ejx.238.1611667600065; 
 Tue, 26 Jan 2021 05:26:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0+FmUodxMqt+evlLBipvydoLmzzOScZvPw32GWwtc7yo6ZhDjp46+r1aSE13seGhDN+npkg==
X-Received: by 2002:a17:906:858f:: with SMTP id
 v15mr3385619ejx.238.1611667599910; 
 Tue, 26 Jan 2021 05:26:39 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id dm1sm12157481edb.72.2021.01.26.05.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 05:26:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: Restrict Cocoa framework check to macOS
Date: Tue, 26 Jan 2021 14:26:37 +0100
Message-Id: <20210126132637.3175037-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Brendan Shanks <brendan@bslabs.net>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not check for Cocoa framework if the OS is not macOS.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 35a9eddf5cf..9a9ee5408b9 100644
--- a/meson.build
+++ b/meson.build
@@ -369,7 +369,10 @@
   endif
 endif
 
-cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
+cocoa = not_found
+if targetos == 'darwin'
+  cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
+endif
 if cocoa.found() and get_option('sdl').enabled()
   error('Cocoa and SDL cannot be enabled at the same time')
 endif
-- 
2.26.2


