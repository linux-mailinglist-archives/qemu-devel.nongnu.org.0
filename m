Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEA5427412
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 01:18:22 +0200 (CEST)
Received: from localhost ([::1]:45430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYz89-0002my-68
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 19:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5J-0008PA-Ga
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:25 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:40710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5G-0006S4-C8
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:25 -0400
Received: by mail-io1-xd2e.google.com with SMTP id x1so8478394iof.7
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 16:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SaGqHKjeNHsGyyOiYm73uNe53IqF6hF9aBdLsXSA2EM=;
 b=CLffQe/3N6pOGX64njuzsGh+8OpfwOblPL0aP9Kf8CDg9cUTtY4pCfQOANoWpuiSen
 W3BorKiuCF2D+eYBeFJxAutz99ppuf9EoBe6C9CIY6xEh9tU92ZPIdaFKD2fiqAfEDvP
 /JzH7u1yVNLhr2M6b0ac2rz2SaJnkTzUep9rVD/w1aK54ib4CA0mEeRkwasBTFyS0QNt
 M0W+98bNXXpJusvWFF7sE9zYVUc/rIe/12tK2ksDCh+fUfMQx0+2VmRmkoDpLbqMWJQo
 +uZr1FtT/jB1rird4MbSBdyfzbZMq82NyBKHCttcDTU04ZluQJLSZAg4B2zY/X83lgCd
 Vz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SaGqHKjeNHsGyyOiYm73uNe53IqF6hF9aBdLsXSA2EM=;
 b=rWZOSVZczgLnIybFfaGs67qobGHwpCYmoEulXcIhGUbsaLytlWap64uZigj8XUzKdQ
 xiNhGiCz/YJz6qdTstf8tJSO+r4u8zcHN51l/QdMadf+m+tc4IL5an8I0Nzv4pNyhlgA
 UXla+NX2bOPioJoTIwcTfivyihxV3bep2kuXzWcy848+S0R48+tCRfPohXTXmc15emM8
 yHtZo7g/f/QVdoRBBdfZcmKh+sPXBglDuzsUMYQpvmQTfSBcApRJfxOaTlyNqngknkh0
 +aTKaBhks1bi4kJegK2DsjrYgZV+M/TfTDpXVccJIzPRkYEWSLFz/MXtZqbe12i8ceok
 /ndg==
X-Gm-Message-State: AOAM532ByjwAWFI0TI5Kv3v7BCIjUzquVK2WxwKE2yz2bFj+RKVBD6rD
 bnETfeMgSk2Njgis6kSdreIIwLi5X4xAlQ==
X-Google-Smtp-Source: ABdhPJzshHPYHlClT+6cC+w8YXRRpdKAdR+f4bt9HN6uDVcth+uK2/JZkozWOCVYsOAA4QyURsgZbw==
X-Received: by 2002:a02:9a14:: with SMTP id b20mr951498jal.83.1633734920893;
 Fri, 08 Oct 2021 16:15:20 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id b15sm293628ion.8.2021.10.08.16.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:15:20 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/15] meson: *-user: only descend into *-user when
 configured
Date: Fri,  8 Oct 2021 17:14:52 -0600
Message-Id: <20211008231506.17471-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008231506.17471-1-imp@bsdimp.com>
References: <20211008231506.17471-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 Laurent Vivier <laurent@vivier.eu>, f4bug@amsat.org,
 Paolo Bonzini <pbonzinni@redhat.com>, Warner Losh <wlosh@bsdimp.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To increase flexibility, only descend into *-user when that is
configured. This allows *-user to selectively include directories based
on the host OS which may not exist on all hosts. Adopt Paolo's
suggestion of checking the configuration in the directories that know
about the configuration.

Message-Id: <20210926220103.1721355-2-f4bug@amsat.org>
Message-Id: <20210926220103.1721355-3-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Warner Losh <wlosh@bsdimp.com>
Acked-by: Paolo Bonzini <pbonzinni@redhat.com>

Sponsored by:		Netflix
---
 bsd-user/meson.build   | 4 ++++
 linux-user/meson.build | 4 ++++
 meson.build            | 3 +--
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 0369549340..243fb78930 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -1,3 +1,7 @@
+if not config_target.has_key('CONFIG_BSD_USER')
+   subdir_done()
+endif
+
 bsd_user_ss.add(files(
   'bsdload.c',
   'elfload.c',
diff --git a/linux-user/meson.build b/linux-user/meson.build
index 9549f81682..602255a3d6 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -1,3 +1,7 @@
+if not config_target.has_key('CONFIG_LINUX_USER')
+   subdir_done()
+endif
+
 linux_user_ss.add(files(
   'elfload.c',
   'exit.c',
diff --git a/meson.build b/meson.build
index 99a0a3e689..1f2da5f7d9 100644
--- a/meson.build
+++ b/meson.build
@@ -2303,10 +2303,9 @@ subdir('ebpf')
 
 common_ss.add(libbpf)
 
-bsd_user_ss.add(files('gdbstub.c'))
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
-linux_user_ss.add(files('gdbstub.c', 'thunk.c'))
+linux_user_ss.add(files('thunk.c'))
 specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
 
 # needed for fuzzing binaries
-- 
2.32.0


