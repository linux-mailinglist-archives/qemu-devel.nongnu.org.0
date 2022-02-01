Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186854A671F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:37:12 +0100 (CET)
Received: from localhost ([::1]:40882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0pq-00008C-JO
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:37:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmZ-00087G-G3
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:35 -0500
Received: from [2a00:1450:4864:20::62f] (port=34578
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmA-0000cb-7n
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:35 -0500
Received: by mail-ej1-x62f.google.com with SMTP id h7so56923681ejf.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DaG3zQiQZ36ycjnydoAdWjsIMQZNyRhwpx1B2DtbdXE=;
 b=l5NFFYE3rqMiNlZDX/NOGMYTWkE2nudbkstZoXkI1EupAP9Qi/Y/llpHwJ0CDY/E/r
 4fPr/KABBDpwAa+jdVNA7TjjNyP00ltj5DmLWr/2VBctgq32w1v/lyAEtg+7htr/4SKO
 hZhkgsjP1o6BB2gsKxUZM8HuS0L7REiTDsZ4WjuQvoD3EnHZNYnm0w0CKEaGmX/tnr5W
 MyoJW+BQEmLi48/N8qQY/L5zR6z0Aq0kQcmzcwKEo+U9SAIqADEVndB0ahDN7EzhHG5j
 u8HxmkrQyRO+pqx7L1nrdDU6k2jRpc5cITWE5O2AoWg5Y3EzWPhipQrPSnDORMNup37y
 9Izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DaG3zQiQZ36ycjnydoAdWjsIMQZNyRhwpx1B2DtbdXE=;
 b=LQmBELBbUXgDvkFIHktGiiSyeUl5jqnjqLsiI3zT8j1s3ZE+G5hdF3cqPaMMqw9BhS
 71u7qFy4rcwcDX+G4qTSOGcRnmZV5nhVD77R8HiQR3YECgjKgNt8k6YxbUIzkosseSs9
 pFB07+QJP0uSj8CsR94OV1xZoL+pQXJj6ld5vv4RDOdYaU/JHowIv1+x8LPNCLxO3VIg
 qqhXv+SwoXs0SxyQlp1Ieb8KeZ6oo+sDVFSaAVwJk+plYHQ3Qht2jP8sJPNRpSNSEO5B
 0qgb8HXemZejnLKHSmFqk3qbQuF3ajOZ50d00Ep6r5OgY8q8NnDbQMz+yfbC5wg4TJNJ
 xjYg==
X-Gm-Message-State: AOAM530INkmipbokLn8HqZfsMVM/CZH9AhDSUU9NNnJgHYL2W3hLKZD5
 7xjOEjL8xRK9scZbqDdLYer0dA==
X-Google-Smtp-Source: ABdhPJypQ/CanFXjMyCW0fnB1o5t1SfGbwHWjgk1eQHhTrEAZLaL2ZxNdSFqCIs+f2fLYWiBTIG8tg==
X-Received: by 2002:a17:907:a0c9:: with SMTP id
 hw9mr21766424ejc.421.1643739659734; 
 Tue, 01 Feb 2022 10:20:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id bx18sm16482135edb.93.2022.02.01.10.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:20:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C2EF1FFBE;
 Tue,  1 Feb 2022 18:20:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 06/25] gitmodules: Correct libvirt-ci submodule URL
Date: Tue,  1 Feb 2022 18:20:31 +0000
Message-Id: <20220201182050.15087-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, Luke.Craig@ll.mit.edu, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Correct the libvirt-ci repository URL to avoid this warning when
cloning / refreshing the submodule:

  warning: redirecting to https://gitlab.com/libvirt/libvirt-ci.git/

Fixes: 4ebb040f1fd ("tests: integrate lcitool for generating build env manifests")
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220121154134.315047-3-f4bug@amsat.org>
Message-Id: <20220124201608.604599-7-alex.bennee@linaro.org>
---
 .gitmodules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitmodules b/.gitmodules
index 84425d87e2..f4b6a9b401 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -66,4 +66,4 @@
 	url = https://gitlab.com/qemu-project/vbootrom.git
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
-	url = http://gitlab.com/libvirt/libvirt-ci
+	url = https://gitlab.com/libvirt/libvirt-ci.git
-- 
2.30.2


