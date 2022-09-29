Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7145EF5BB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:52:47 +0200 (CEST)
Received: from localhost ([::1]:43298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odt1w-00007s-1a
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw5-0004NZ-Vp
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:39 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw3-0001C1-Cn
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:37 -0400
Received: by mail-wr1-x432.google.com with SMTP id bk15so1727074wrb.13
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uPGGdG5dRWC86HcWiL9VqOOjNj0Gz/5VllmDKDHfDFo=;
 b=dr0L9tWxdO+/MeFfIi3Ge1RmGcpH1L2RQXaAh6yhbKlIftd50pooDkTJvfrIFDbG38
 KHA1idTzBQTLpf1sCJFUh/uYFjZqrcAWwbUmu2EEo890UQk/oXUXmPBwbROou14J9QB2
 gNzQzuolicMeSsIJ7lrhKq7++KCjxNC3+Q6GbzAIN2qkcSPsVgRNwkXVh1m9RDVRzzgz
 YbcqrAEKdeXufy1MesgjeHynNDMdWXJOwk9KZra910+KIeQ7DLNeHRP/R1LzC4sG/1Cm
 8CSliT6ErcUqGz1RBC5esBvc4S6yfnF/mlz32dqXAbLJDZ4gepT+iwWL2cPnj/wIJrQd
 7GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uPGGdG5dRWC86HcWiL9VqOOjNj0Gz/5VllmDKDHfDFo=;
 b=n+IbJsxrstAPG5j4TTXDAJuRJJwuFXSK2XgaR3ninoUPagOrm8fpjnGIcLmNTPfP+e
 wxeNLl/OdWEW/YhCJg5sq7LQZDF6at4XWBMF+ZIx+I3I5OiwCIsidHt7e+stzkqLx4At
 fibACoMCFxS3gIOMpRG7Jajjk27y7ATATF9ILUdnCU/TqY6XjimZZbNTcbrIuGfJ8Oj7
 Y/aEfbn1UYYjIij7FTS4k9U1GP6HRLPYe0+BDvztqzG41F/UeEB7WpiP4+NI5BcMu6q6
 WtgNUY3JWYU6miugVfCri4Swr9eNlizOfUpBfj0F6MAr2RWRbQ9RFAbU41DjutvA5B9q
 WZfg==
X-Gm-Message-State: ACrzQf2LFDktJsbO0cmV+AgsnVLzCMCdhXDIIE7Vs9fOX7A2OpjjZMIi
 jyxFSvsXsWaWlRX3zvCwtzzhvA==
X-Google-Smtp-Source: AMsMyM5CVUXrfeVe69pEmcZ/d5RFtWHoV40meE94daijz92IqyKxi2Uv3/LLWUh/bPQw871rIgk2lA==
X-Received: by 2002:adf:e2c1:0:b0:22c:c2c0:4fa7 with SMTP id
 d1-20020adfe2c1000000b0022cc2c04fa7mr1997936wrj.382.1664451753098; 
 Thu, 29 Sep 2022 04:42:33 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k15-20020adfd22f000000b0021badf3cb26sm6897349wrh.63.2022.09.29.04.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 531DA1FFB8;
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
Subject: [PATCH v1 01/51] scripts/ci/setup: ninja missing from
 build-environment
Date: Thu, 29 Sep 2022 12:41:41 +0100
Message-Id: <20220929114231.583801-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

ninja-build is missing from the RHEL environment, so a system prepared
with that script would still fail to compile QEMU.
Tested on a Fedora 36

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Message-Id: <20220922135516.33627-2-lucas.araujo@eldorado.org.br>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/setup/build-environment.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 232525b91d..b5acaf9118 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -153,6 +153,7 @@
           - make
           - mesa-libEGL-devel
           - nettle-devel
+          - ninja-build
           - nmap-ncat
           - perl-Test-Harness
           - pixman-devel
-- 
2.34.1


