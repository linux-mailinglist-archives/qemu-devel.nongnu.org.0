Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DAE6D00C7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:12:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpG9-0007Yg-2t; Thu, 30 Mar 2023 06:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpG6-0007WX-MX
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpG0-0000Hq-1f
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:52 -0400
Received: by mail-wr1-x436.google.com with SMTP id j24so18526875wrd.0
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680171105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xd+c4zabwyb7xGD9uAvER3pOoTrVCKuRGDPiXh3afWQ=;
 b=H8SwpM8A9l9/uSh6k2chd9RsGke0LgQu00yElKovUo3t4+1j9couU+k22g7Z6g7aqF
 kK/u9y8COP2CSx/Qb0Nn9OmdIf77ARzAPToWgHgySRjLk9VHgjLDJMByvmOpkZb3xWak
 GwrIIyyUpzM/NfTJBXPtS8ovZl32lR5msy8aJ4jjiMshU6Q1yuWWGREgfaPilEEgfVME
 s4gM0YrIg5Uf/06vIDgWPXXQSbol+/VZXvuIeo0okAi8aw0mBA0ygpkZRGyyl+q92iV3
 JRRCtcTOIxcyfMlq3eBRxxDonnYOykUiL8C9GT3nUTiFCigJhpFwwmYChCBLszfmM9wh
 T/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680171105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xd+c4zabwyb7xGD9uAvER3pOoTrVCKuRGDPiXh3afWQ=;
 b=uLWC2q/9xoynyZQn/aq/fU0XySUj2SJ5eELaEUv9Ibnoi5+fXEICzygA2K/nXNYtX3
 JHjxy7zngDLPfhkDaU7OVTwYbIdD1IsJIqZNzKPfIvGY84ic7wostrtmhsDXOAc/YCuf
 jma3GX++ckrHv0yGlCAbmkBgFzTVVGNC1B7Nsqa2dw8Y2PnOO+845kPBrHA2CaXBluQ6
 76ozLwREJVToSmMydhn7iPZLr4SmKUOCRTEbIlvMJPz2PhcPLgUpj65QdCJhBD5SerWA
 EoIWLWVaXvf77GR1CYU8iHIr3oMwk4UCT7SLOZoZzsXrifxAQFC0MZv5UT/o8PrKIMYm
 M2Qg==
X-Gm-Message-State: AAQBX9eKbcC2zEx8IrXTlVa8pMDerFUSk90P+Py5MvM5t55zUmLshWZ8
 8ihrznCHvlg/WwrY6GQOfRDE/Q==
X-Google-Smtp-Source: AKy350YroNKpv5NLo6yTYk8tMMlmLotCjeID5gvVxPYaA9Emkr6AQDyVynKWtLRTkm/SK+b4g0rP7A==
X-Received: by 2002:a5d:68cf:0:b0:2d6:adfe:cea5 with SMTP id
 p15-20020a5d68cf000000b002d6adfecea5mr16670360wrw.68.1680171105613; 
 Thu, 30 Mar 2023 03:11:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a5d4b87000000b002cfe0ab1246sm32462194wrt.20.2023.03.30.03.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:11:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB3371FFB7;
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 08/11] tests/vm: use the default system python for NetBSD
Date: Thu, 30 Mar 2023 11:11:38 +0100
Message-Id: <20230330101141.30199-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330101141.30199-1-alex.bennee@linaro.org>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

From: Daniel P. Berrangé <berrange@redhat.com>

Currently our NetBSD VM recipe requests instal of the python37 package
and explicitly tells QEMU to use that version of python. Since the
NetBSD base ISO was updated to version 9.3 though, the default system
python version is 3.9 which is sufficiently new for QEMU to rely on.
Rather than requesting an older python, just test against the default
system python which is what most users will have.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230329124601.822209-1-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/netbsd | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index aa54338dfa..0b9536ca17 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -30,7 +30,6 @@ class NetBSDVM(basevm.BaseVM):
         "git-base",
         "pkgconf",
         "xz",
-        "python37",
         "ninja-build",
 
         # gnu tools
@@ -66,7 +65,7 @@ class NetBSDVM(basevm.BaseVM):
         mkdir src build; cd src;
         tar -xf /dev/rld1a;
         cd ../build
-        ../src/configure --python=python3.7 --disable-opengl {configure_opts};
+        ../src/configure --disable-opengl {configure_opts};
         gmake --output-sync -j{jobs} {target} {verbose};
     """
     poweroff = "/sbin/poweroff"
-- 
2.39.2


