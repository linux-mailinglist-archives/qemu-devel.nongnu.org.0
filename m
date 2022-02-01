Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6105C4A5B2C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:29:43 +0100 (CET)
Received: from localhost ([::1]:45190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErLy-0006D0-4u
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:29:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7o-0004zx-VN
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:04 -0500
Received: from [2607:f8b0:4864:20::12a] (port=41542
 helo=mail-il1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7k-0003Wp-6e
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:04 -0500
Received: by mail-il1-x12a.google.com with SMTP id 15so13954451ilg.8
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A0lUDFAMoJs0uwGgwRvS9AqQpOcBmDEXb/Re9WXU5VE=;
 b=7u+Ja6/PEOrhzInaamhOrIZlWNI+pgKu6ZrR1C2aLerqKeOUSW9N39yZWTfHP6tR1m
 k36st9IZZClVCmxleTtZnXSlU52urAaw21kfQ6yWkAE/YxNrmjy+LLkyPvjBTJadOl41
 OGNpKn9DiLxl30NrIO0pv+1eeihYjNqBE7GZXe9LIF2HzAv43F5X7vYYzJs7v+SoPq6x
 i8kroCFTs1Z/m9AawYyjxqmwkxQyDvvpHJCAgNn3dJSniE+mlQ2oJTs2ufRVtpJMOGM/
 fv9YP+oUoiavYCFuc/LAAm3Mrhh0u7pRVeEoG2ucNqUg+YEIJdvtkos8ug7qNbFDh1vy
 +wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A0lUDFAMoJs0uwGgwRvS9AqQpOcBmDEXb/Re9WXU5VE=;
 b=TCEwe+k8xqdfDF+3D+HIY72oPo3LpBo3NvBKsSv5StJ7xtgdc4iDrlEE6AqEly65Of
 WEU6QCXoQ++auaU0v+/1kWZzgnOydB3vS04cBRlOQU2QmXxUqQpO9qywgbABz+9jHltw
 XHxuJsSE6Q47skJ8LJxXurUo3z3kudVx5q6WJVukoRYVHEfnK8NqK4BpuVLjDyEmq13V
 boi+Az0ULcIHf3YkpHM+aRtteOeq0ivgQGDa3AUl8ea5U3ETIT0+CpgLqjXF5yNx1gmp
 b6+njskvavkarHHUEAej4SjxT8/hgKX2TbEj55gLV0HnqJ70BbLKQGyshwYcOoj7V+qj
 Xs4A==
X-Gm-Message-State: AOAM531CD9cYzS8KUc+Z3ErS1qa4UjlU3hgebQpeFICDHKSQ/jVQZn9Q
 m3vHzYBHtYrJYolowrKz9Uhs0zPOyiVDBg==
X-Google-Smtp-Source: ABdhPJzyFTv0YvpOVCiRqxrWEkdHAW+I3VhyqVoMY0KZ3CIuO2dyOPCWhEKlSARRum5ddBWu1z0H6w==
X-Received: by 2002:a05:6e02:1a27:: with SMTP id
 g7mr14985225ile.284.1643714089306; 
 Tue, 01 Feb 2022 03:14:49 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:14:48 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/22] bsd-user/main.c: Drop syscall flavor arg -bsd
Date: Tue,  1 Feb 2022 04:14:34 -0700
Message-Id: <20220201111455.52511-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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


