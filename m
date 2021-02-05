Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C68310CB4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:50:00 +0100 (CET)
Received: from localhost ([::1]:36646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82Qp-00083j-2Z
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82LN-0002iM-To; Fri, 05 Feb 2021 09:44:23 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82LE-0002Od-TN; Fri, 05 Feb 2021 09:44:14 -0500
Received: by mail-ej1-x62c.google.com with SMTP id w2so12229161ejk.13;
 Fri, 05 Feb 2021 06:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J1pU1ssoi/DL7VDtGz6ONx3+WvqS4tj/g3xHAkg3ZBQ=;
 b=D1xw66rtNR0SWJkqUGEwEab54BWMTjVSeIAbEXtcvqBUuQcFvkXFhjK/XKX4vMte99
 bTohPpXVDAjVboUqoXuXuQ8rhR32EfzjZKoPfgVSKwFoRjQAVcNMxf4og7v4irYgkBBP
 CYnGBsF/NDFoFLJuc1lkcsnBH1cpG7YaMpFjRIuKpl8r6Oq7pft0eVVo4HAAwwwpsiQA
 Pukz59fotWp/SGSh9hetGDXUBscTYodbx1aqgAnTJ7nMzdD8/DOW+AB9apyuYopeTtMV
 pGHWQACn4zjRB1Pv1RretfM+mky7Ljpw10hugSpXm+fJ6vO8FTYKh+yikEso4aG2xxHE
 m+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J1pU1ssoi/DL7VDtGz6ONx3+WvqS4tj/g3xHAkg3ZBQ=;
 b=tO/x/owb+WfCYPVRhEaUca0GSldxHwmHC05212/3FEVWtNpD+DoFdSJ6gAx4vH42qB
 oTNFWir3umiApTTrvQCSAihbmYq6VG3eu1zLBBEjYBFKhyI/1xTow92+oyxI4TgUxvl1
 VQgzIYssTHCF2C9OA4CJQ6NJLr0+JzC4Hs8kOtZwiacQTajjdXkRvwZSi+I3J+as6+7S
 Fk8e8ejNKSlEQ9NMPX5NPRCLHjU/BGEpMHSoTZ24Lxg8r9K2MCrWWzlFBqqgAmM0M9kn
 Nl4A4mC3uISlVH0kd9MkKfvGVVMi/XZyR+y+zij+ahik/UxjYUwOcE+lJuQ3A5vT9e/H
 oVgw==
X-Gm-Message-State: AOAM531J/4QneOePghq6SH6l8x/JnCtNC+kPNjbmSIIsEGMe3toASekH
 NCjGflsTnxu9oT6UgIynWcfC3LxR0e8=
X-Google-Smtp-Source: ABdhPJw7OYWzgx0HnsRoje7yX5BHhHsO7USy6vPSLilXjKMAU+KnVjxfV2oJzuqY9tCZ+d2VzR4nkA==
X-Received: by 2002:a17:906:2697:: with SMTP id
 t23mr4363534ejc.357.1612536250581; 
 Fri, 05 Feb 2021 06:44:10 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id qx8sm3971665ejb.48.2021.02.05.06.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 06:44:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] tests/qtest/cdrom-test: Only allow the Virt machine under
 KVM
Date: Fri,  5 Feb 2021 15:43:40 +0100
Message-Id: <20210205144345.2068758-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205144345.2068758-1-f4bug@amsat.org>
References: <20210205144345.2068758-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only the Virt and Versal machines are supported under KVM.
Restrict the other ones to TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/cdrom-test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index 5af944a5fb7..ac02f2bb4f1 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -222,9 +222,12 @@ int main(int argc, char **argv)
         add_cdrom_param_tests(mips64machines);
     } else if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64")) {
         const char *armmachines[] = {
+#ifdef CONFIG_TCG
             "realview-eb", "realview-eb-mpcore", "realview-pb-a8",
             "realview-pbx-a9", "versatileab", "versatilepb", "vexpress-a15",
-            "vexpress-a9", "virt", NULL
+            "vexpress-a9",
+#endif /* CONFIG_TCG */
+            "virt", NULL
         };
         add_cdrom_param_tests(armmachines);
     } else {
-- 
2.26.2


