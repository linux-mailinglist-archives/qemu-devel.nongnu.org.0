Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D9F21C56F
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jul 2020 19:11:31 +0200 (CEST)
Received: from localhost ([::1]:57986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juJ29-00027X-VI
	for lists+qemu-devel@lfdr.de; Sat, 11 Jul 2020 13:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1juIyc-0003kT-IS
 for qemu-devel@nongnu.org; Sat, 11 Jul 2020 13:07:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1juIyZ-0006iS-Kn
 for qemu-devel@nongnu.org; Sat, 11 Jul 2020 13:07:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id k6so8996901wrn.3
 for <qemu-devel@nongnu.org>; Sat, 11 Jul 2020 10:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N9pWgPRrMQtmlCPNVCa0u01plYw7J8rYdGK8hUoBrLA=;
 b=SiA8FQ4qychO1UKKOn0LczdZciGJd+vb8zXIdbUHid0Lwat5lccNZkA7/ctx1C0Si4
 CJIzwLJzpos7TFStuEkgVo52vzH1FI02QzjOWHa/ZHsIZb5B1WVqMjrKsC/SUGkSW+p3
 EIA85HPmr9Xed3tSY5vuRISEMQB5b/EYGHqbE6KT48nWpd76Rhr1TRXQaIWFJfZXF4Ut
 e8UC3GSsc8QlUc86vRtAx0plT8R1VpOEoGCSX8KkS+Z0TWw0ChLf5rIZofyGmBHZqC7x
 C7drqewhgZXF5En5xzrZljPsn7sum53ZCXokdx8aFrrA0wNLnl8TgpYrBn1CqcVzTIlP
 kNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N9pWgPRrMQtmlCPNVCa0u01plYw7J8rYdGK8hUoBrLA=;
 b=dXo3lX8qTZgt/jc6rWpD+6B2oTfNkF7s/Vu62xuukLpkcBrRfieXFaHXXr9uW7f37g
 8h+EirrCYXc+jONzKB7ukj3br55wPITtZN/BQIksw7Q/QE/waUBRXtABWUgJhPEvn1Li
 jLFZVY3M729waUGV2a3ImQMhpo/EqnY+R4AjI0xyt8EDFb/U/duOgCT4U5spPLQvf+85
 Q/ymFuCj2OPWHqtvRXFpSEfEBbgqqg4PwQ10CFNuoyHaFQyWBgGH4EfMODBTKaLd/H8Z
 IVb5kNBxi8zh8+SbBImE8Hc1SaFmpqb3uyzmCFXeMIac1QAoDpJLOmgJ63ombwW3bLHU
 H/JA==
X-Gm-Message-State: AOAM532M7qt0Sqj/wpiLJixfd9vW1elTgIV630EdVALh6hGekzJFzkvk
 m4YtLPg5PUfugGTRW8dT0BCbDQ==
X-Google-Smtp-Source: ABdhPJxJWTUDawG/EZrrOFYlNlkabskhACxmg6dt60TlxafRXIPpUVgml5/xBdknxo2VqEguQd8lgA==
X-Received: by 2002:a05:6000:1cf:: with SMTP id
 t15mr78356432wrx.180.1594487266306; 
 Sat, 11 Jul 2020 10:07:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m16sm16930795wro.0.2020.07.11.10.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2020 10:07:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0BAB91FF99;
 Sat, 11 Jul 2020 18:07:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 50/50] iotests: Set LC_ALL=C for sort
Date: Sat, 11 Jul 2020 18:07:32 +0100
Message-Id: <20200711170732.26213-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200711170732.26213-1-alex.bennee@linaro.org>
References: <20200711170732.26213-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Otherwise the result is basically unpredictable.

(Note that the precise environment variable to control sorting order is
LC_COLLATE, but LC_ALL overrides LC_COLLATE, and we do not want the
sorting order to be messed up if LC_ALL is set in the environment.)

Reported-by: John Snow <jsnow@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200710163253.381630-3-mreitz@redhat.com>

diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index d967adc59a..c9f978abce 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -186,7 +186,7 @@ _filter_img_create()
             -e 's/^\(data_file\)/3-\1/' \
             -e 's/^\(encryption\)/4-\1/' \
             -e 's/^\(preallocation\)/8-\1/' \
-        | sort \
+        | LC_ALL=C sort \
         | $SED -e 's/^[0-9]-//' \
         | tr '\n\0' ' \n' \
         | $SED -e 's/^ *$//' -e 's/ *$//'
-- 
2.20.1


