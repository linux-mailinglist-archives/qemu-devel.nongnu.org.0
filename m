Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0CC4C56F3
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:09:41 +0100 (CET)
Received: from localhost ([::1]:33464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0Zf-0002Kp-PC
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:09:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XN-0008AM-Vo
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:17 -0500
Received: from [2607:f8b0:4864:20::136] (port=38825
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XL-0000Ov-U4
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:17 -0500
Received: by mail-il1-x136.google.com with SMTP id w4so6826799ilj.5
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 09:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KqQIGuilfSiZo5D0/DJJljqcgNhY6dZ6uWFUPpHnygI=;
 b=P6iml+wBzXG4jCIazXHsszGoiPpaOjf5AGyD5pFqKqn1vuLlPZ/gq5TKXG+TllM2KQ
 yePhp4VTL+jUWeUL9SQofTuT1Q8BNS/ndYKykCypW5TXGEMqqna9FYWVLqoqRp4HyW9D
 or89fzqdwOnXpwHI07Xn/pPqOkxM+hVfkoWGsEDHOkEF7foEZcPi2PdWAx/SV+lxGk2I
 Cnr4Pkq+jnoe0vIDpPrvgC1/7lsqorKElX3g/TQNsM6DKYzTJVaOtvV6EaRilGJQjFdL
 hXE3BaoX2PGuxAup6Fmu9tJRlcJtv/e86dO1bvJXceY8BX1fGKB4vDEspxAczwoZY4WW
 kCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KqQIGuilfSiZo5D0/DJJljqcgNhY6dZ6uWFUPpHnygI=;
 b=jlWU0UsAkboXNAcl7mnJSFYFPO2FSsNV1X2QETT7RO+k0chaxFc8G7Qra9RsWkhHj7
 fnaM7vxi8m75Pr05LSKamWcPRijM7MkrfdJmewdFUTkrp2dFDVI5tR/HqZQgpQvQpGQB
 YXNXRtIyPnoS68whbCiQWxYcnSyKSTmPIQcJznpx0NyA9PrbZk/fN0qWly+Bdmj3CG0G
 Olk/O1qbyg28HniBeJenV92exwXG+Lx3F9w/T1r5Kh2xf2fPP3APmujqXEuwUEIshRnn
 D5cNSElWEToMiGbNFFtByboQmewCqQFtsYlsJ82+W10Yk5uICqlQmmVw5xsdh35yBZSG
 TLpw==
X-Gm-Message-State: AOAM531Yd3GDy4P0Pu6pXnMLdC0jNnDtjAMLY5TkWY5QzN84Ra1pbKki
 gdqE+hzriZSo4kUaPLdzEjvy+HExAMIOWQ==
X-Google-Smtp-Source: ABdhPJzA2CS4S1at5N13ZeV5eZ5N8I0KVtqHQEN8aUWXmN3yFMGaY8fKqnr4IXmQaDdjRzpOuh2ggg==
X-Received: by 2002:a05:6e02:180f:b0:2c2:6ad9:9eae with SMTP id
 a15-20020a056e02180f00b002c26ad99eaemr11694723ilv.0.1645895234095; 
 Sat, 26 Feb 2022 09:07:14 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 e23-20020a6b5017000000b00635b8032d45sm3138764iob.22.2022.02.26.09.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 09:07:13 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/16] bsd-user/main.c: Drop syscall flavor arg -bsd
Date: Sat, 26 Feb 2022 10:07:29 -0700
Message-Id: <20220226170744.76615-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220226170744.76615-1-imp@bsdimp.com>
References: <20220226170744.76615-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've not realistically been able to actually run any bsd program on any
other bsd program. They are too diverged to do this easily. The current
code is setup to do it, but implementing it is hard. Stop pretending
that we can do this.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index f1d58e905e7..bddb830e99b 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -164,7 +164,6 @@ static void usage(void)
            "-E var=value      sets/modifies targets environment variable(s)\n"
            "-U var            unsets targets environment variable(s)\n"
            "-B address        set guest_base address to address\n"
-           "-bsd type         select emulated BSD type FreeBSD/NetBSD/OpenBSD (default)\n"
            "\n"
            "Debug options:\n"
            "-d item1[,...]    enable logging of specified items\n"
@@ -392,17 +391,6 @@ int main(int argc, char **argv)
             have_guest_base = true;
         } else if (!strcmp(r, "drop-ld-preload")) {
             (void) envlist_unsetenv(envlist, "LD_PRELOAD");
-        } else if (!strcmp(r, "bsd")) {
-            if (!strcasecmp(argv[optind], "freebsd")) {
-                bsd_type = target_freebsd;
-            } else if (!strcasecmp(argv[optind], "netbsd")) {
-                bsd_type = target_netbsd;
-            } else if (!strcasecmp(argv[optind], "openbsd")) {
-                bsd_type = target_openbsd;
-            } else {
-                usage();
-            }
-            optind++;
         } else if (!strcmp(r, "seed")) {
             seed_optarg = optarg;
         } else if (!strcmp(r, "singlestep")) {
-- 
2.33.1


