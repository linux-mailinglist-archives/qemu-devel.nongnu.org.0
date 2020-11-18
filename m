Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA7A2B7B16
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:21:39 +0100 (CET)
Received: from localhost ([::1]:57038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKao-0001lO-BY
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKZ1-0008Tg-Cu
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:19:47 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKYz-0003ed-OB
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:19:47 -0500
Received: by mail-ed1-x52a.google.com with SMTP id ay21so1412139edb.2
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 02:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rt8mfICct6gKWy31+Pw2EA3hmZuykXLEsL1HlckGHDA=;
 b=lSGOZWRFgXIhMfjBxwD/HN2dhN3eb4HO/DOBgGXjlCb1Q1LyREhvsMFuNLh/tF6hE1
 lWLJrc5XmZF0YFcKSdI/YTOSSHgA7qWyNRhkD55EkDGjjTLh8TpK0fe0MfexG03XV483
 UaxXThcDPmp47cLn6t4stpbcVI/SJXOiW6pmOCVX8HjaBhY4xYnMLIt5TqCGKX3s/NJa
 tnkuZJ4HuNn107Zn3V77TuJya7he81E7fmdYbCoYGz9fB12LzSbNbEJSTEcQ+4vUXNmF
 56/EOdnuauQhCp/YNyT6RV4tO5KKW82RC5bzxid8zO0VyaVtSoeyCijun7HNTK25zh75
 sHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Rt8mfICct6gKWy31+Pw2EA3hmZuykXLEsL1HlckGHDA=;
 b=GseGSmWyJWElUkVI6w47NgyvHEXJmmqrDMheP1qDlklk0fdiyVfOH+jj9knEvbq6pq
 XwQlRVBmQh3AA9j9aPehtXjDbpDNzZUUmJsqmBJUuM8JV5rmBMWMNbRu+lAKC0S+rD0e
 Utz+DyzFz99SVQSvvnDD84whGPWCOtvfp+qVSF8hpGP8E+H3zy+ecR5ZQZmAq6FqMYDS
 b+WgHQRjGyDr5l0znuWu0Yck7xNML8HhLayK7AtJ5P4oRW1fasOAj7820W3FCTpfGHSp
 pUla+X/UxeJlUXql5mdsQ3rJybL5R7Lphzrzmn7BphELTIf0ffOfvnbQohLhbF0YMHnW
 +bRA==
X-Gm-Message-State: AOAM531NAk6x4ggYHmdVJoRZA/arNylFvB4T03kiaYJV39CnsST5t1AE
 RxAq82Uku05UC88vZigPqNuz2lmXJzk=
X-Google-Smtp-Source: ABdhPJxTiU1IeD4p6qnlZkWoNLhJX22rdkxNt3lHmkhruvJWlNIeUFbu5sMWd9Fy5VEjv8xfbRXYAQ==
X-Received: by 2002:aa7:d298:: with SMTP id w24mr239431edq.82.1605694784072;
 Wed, 18 Nov 2020 02:19:44 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f24sm13230052edx.90.2020.11.18.02.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 02:19:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] meson: Fix argument for makensis (build regression)
Date: Wed, 18 Nov 2020 11:19:34 +0100
Message-Id: <20201118101940.132594-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201118101940.132594-1-pbonzini@redhat.com>
References: <20201118101940.132594-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

`make installer` with a DLL directory was broken.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20201117190640.390359-1-sw@weilnetz.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/nsis.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/nsis.py b/scripts/nsis.py
index e1c409344e..5135a05831 100644
--- a/scripts/nsis.py
+++ b/scripts/nsis.py
@@ -65,7 +65,7 @@ def main():
             dlldir = "w64"
             makensis += ["-DW64"]
         if os.path.exists(os.path.join(args.srcdir, "dll")):
-            makensis += "-DDLLDIR={0}/dll/{1}".format(args.srcdir, dlldir)
+            makensis += ["-DDLLDIR={0}/dll/{1}".format(args.srcdir, dlldir)]
 
         makensis += ["-DOUTFILE=" + args.outfile] + args.nsisargs
         subprocess.run(makensis)
-- 
2.28.0



