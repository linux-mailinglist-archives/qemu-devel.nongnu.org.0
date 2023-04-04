Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EBD6D66A1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:00:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pji8y-0004nm-An; Tue, 04 Apr 2023 11:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8Q-0004Kp-8d
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:46 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8F-0005Bx-7V
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:42 -0400
Received: by mail-wr1-x430.google.com with SMTP id i9so33153855wrp.3
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680620368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sB2ReJwCTUZnQ2bZlM/lAF1vxjy9hIECqbEXZz9U9CI=;
 b=U8jqb1lX2XH0ajWjrDMjLJRHpc9ca7r6getiSpN/dcliI7Mm02YynJzMRGBhKZzDOq
 KoL+s9EES9hKL8QhYMSGlaOt9yY2rfQoN8rJ1nKLjKLEPBTp/5EOb5faV7W72tHwWwm+
 0A1CXnRT5Ij6CdBu9TKxbv9YHZTE4OJt2RaknfTpko14KX8lhXA5MgtPwE1bdAwamsFs
 9Hp6LTDu4OnqqIYPQ5JtspFmZsqn3V6HedT83qX5BOrdBEGgW1ntxwVcBoIybQOL/aVR
 fQlIG+FuKzllE8x3ONHGAbY5VdD/zeIUqVj3XxAak74BMqemRSQC/MggFV4wxYABjYmc
 WzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sB2ReJwCTUZnQ2bZlM/lAF1vxjy9hIECqbEXZz9U9CI=;
 b=3aKGNhe2rM7ZVmIy7LjD9r829aM0/fV4mGEGWykfgeVzbBAjW0AbJf8fosA5Tqco1r
 ClbmNXVUV1ug+OHIFhnG7N/K0i2w++SOp5kZ7nQfv4cwymhbnVAsixhRvwE2BpO0OOZP
 37ZfoEqRGWogpCOA2++KLoOZn4gVh3sxQLIYuOpw6tfCdjY+x4lhCoXy8I1i3omU0AQm
 9t1hn4NZQwi2tt2pq7/jp6NZZMjVTQW8jfQxWQU0JCxaj9h18u4515Fhh3ToTTIhqTWD
 xwJaG9Q8/dhROd4Z2ctSi1M0N0pVscN26azmhB/SCnP9BdLJ6LPl5oXy3uIyd8k/rZJu
 rCxw==
X-Gm-Message-State: AAQBX9erYOwqUZbopWe5jfyTl6OHg4cNXWahV/Vp6JWK2UJJdm2Xi5iB
 9QLUpMhAlgd4b7tamgCWkynL4w==
X-Google-Smtp-Source: AKy350Z06Hxscn3BzwDdofnPtSCGU2QYqvSJrIwJTjDP/rdMArTt3osoVVraY2iEBvWYy/1siYKLhA==
X-Received: by 2002:adf:e5c6:0:b0:2d3:bde8:9ff with SMTP id
 a6-20020adfe5c6000000b002d3bde809ffmr1950458wrn.34.1680620368492; 
 Tue, 04 Apr 2023 07:59:28 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a5d6448000000b002c70d97af78sm12434244wrw.85.2023.04.04.07.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:59:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D508F1FFC0;
 Tue,  4 Apr 2023 15:59:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>
Subject: [PULL 08/10] tests/vm: use the default system python for NetBSD
Date: Tue,  4 Apr 2023 15:59:23 +0100
Message-Id: <20230404145925.2638152-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404145925.2638152-1-alex.bennee@linaro.org>
References: <20230404145925.2638152-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230403134920.2132362-10-alex.bennee@linaro.org>

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


