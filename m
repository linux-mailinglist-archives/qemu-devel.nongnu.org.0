Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADC75EF5E0
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:58:29 +0200 (CEST)
Received: from localhost ([::1]:41302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odt7T-0006y2-0E
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw7-0004Nj-BW
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:39 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:51053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw3-0001CM-Vr
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:38 -0400
Received: by mail-wm1-x32d.google.com with SMTP id ay36so781840wmb.0
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=g36e2wLY9UUYXFbTpJgshX42etL7qePtKpco9+krQd8=;
 b=AjQSKKUUdq3KVvLyrYvx7b4wc6SiVANiklRFEnKdxdyN91t8cnX64YXg55u+5adKxw
 lVwdmnB9zA0WVCfNmv2UBZ0ssboeQniVsEw8SG0WbCeDT3L00NQbFlcKC2XiTk8cwJdg
 DxHRvky8QQh+bgL/c5pWoiuH7e87upwqfaG4ehy/94Psyxz6ufgQP1cvtiafhOh7HHSy
 esaxu9SUiR+UECC3tZ6S1mmyCvbTiG18+hZtoPZiB7hnSSUs1Vs6MpC5k4bLzcfqajoF
 KMiwOqDyn5SsVE2i6kpRsXJDdCW6nveVBVDKdNQLNkG3DPgzQj/zl3GWIs9/GUlHPYmM
 35vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=g36e2wLY9UUYXFbTpJgshX42etL7qePtKpco9+krQd8=;
 b=yVwRR2w4kdm06wTwJk/DMnNF5p+EUkurACc/SLg90V2AN1Hk+HvYjvtPTb6EvIctmB
 aP6qGCs7b1PNb0zY4tAoEImJNUa5BAyppnRvaWHGdxXVlloxi6KFQ117TelV6iRohnjh
 Inu5EBV0ePdZ/EVaqiwz/WJ5upYlzOWdzvJuKLT9yTxwgWp24bYI+N5likviVmbIoVek
 OE2ZmGR9d2aCIKXmjZUDg+xSPTlSTeZRP/QW7nrAbnP7wNjafG4VAgcTvo34J8c8zmJ3
 D09dk2GQVZG/P5evAybMNnKDnP2RfymsiGIQbx2Ptk+Dap3l8c2dikdZGZWpSb9ad5V9
 6ysg==
X-Gm-Message-State: ACrzQf3u/ew/5Zi5WpQ0TTVBPUQqKFohe9L1iykyV1xYTqVa+r5SIfTj
 VzmjspUeY/VWl9EbOCumT7SOxg==
X-Google-Smtp-Source: AMsMyM4q7Me3Ue4YpX7HwJnNxj+flihw3gr32WgqUNLbY5MyOt4ZbOeUXHTyiTYysY0VnuXhGjjuxw==
X-Received: by 2002:a05:600c:282:b0:3b4:76c8:da3c with SMTP id
 2-20020a05600c028200b003b476c8da3cmr2067801wmk.153.1664451754566; 
 Thu, 29 Sep 2022 04:42:34 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d528b000000b00228dc37ce2asm6195879wrv.57.2022.09.29.04.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 999951FFBC;
 Thu, 29 Sep 2022 12:42:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 04/51] tests/docker: run script use realpath instead of
 readlink
Date: Thu, 29 Sep 2022 12:41:44 +0100
Message-Id: <20220929114231.583801-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

The alpine docker image only comes with busybox, which doesn't have the
'-e' option on its readlink, so change it to 'realpath' to avoid that
problem.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Message-Id: <20220922135516.33627-5-lucas.araujo@eldorado.org.br>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/run b/tests/docker/run
index 421393046b..9eb96129da 100755
--- a/tests/docker/run
+++ b/tests/docker/run
@@ -15,7 +15,7 @@ if test -n "$V"; then
     set -x
 fi
 
-BASE="$(dirname $(readlink -e $0))"
+BASE="$(dirname $(realpath $0))"
 
 # Prepare the environment
 export PATH=/usr/lib/ccache:/usr/lib64/ccache:$PATH
-- 
2.34.1


