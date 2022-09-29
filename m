Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3A85EF6EF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:52:54 +0200 (CEST)
Received: from localhost ([::1]:35422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odty9-00031J-Mn
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3K-0000Ow-G0
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:07 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3F-0002Ol-Ra
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:06 -0400
Received: by mail-wr1-x432.google.com with SMTP id bk15so1755919wrb.13
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=LtaDlUJVGMb2JqoOoenqLWs8g7TzlOytd4Bv6SYv0Bg=;
 b=s68wwXeoGUXbaTVEivYaekkIsgTcCggzkGKwDPe6xghEsNx/G/KDeh84lKTFEoffN8
 KAwFNzRRwNG0qjM7q0ir63kLVAOaqca8E9ATMODvOEX8R4q8etgqOKipOTgLQKlaEbR4
 QcVzWL4BpLMzi8/SEbDJ/ztZzPuPaNgRUQHKSd1io/E8umYMZb/oTrsshKX5Hn+k/dM2
 we7PV5tyWRXcgqFSO8oyGuczLJpwJGX/3ablVjqLJ6zIYmYMTkN6B/rk89EhsMA7HlQF
 ARNS6HKJD1BP9hfuFYgxWqQjwPKpE242/DeEDTdDJ4go8BXTihbJTtOZ2QWQIxNm88Nd
 0OVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=LtaDlUJVGMb2JqoOoenqLWs8g7TzlOytd4Bv6SYv0Bg=;
 b=Yk8QqBXEzA45ts/iQG+LhZYUUG4rmU2/q5010Y7R5OXZa6qvJmnoo4F6EyBlo1lrTh
 sbpq8iCw1UN6HHkWdeFtg0Fc2WwzBexa29D7bMmWgp+B2AS6Q6gnVh2/7+GPpvMmnNVM
 EXRqEIzBcpTKzod3g7oPH+x/54XGfqpv6y1XBn6PzdkFlmzhNXRJKg3FUUvCFmHZwiJV
 p1kP8Ytrp6bEHwZ3G4CyRJ2k8T8mnC7xy9JDuYtetJbFgb2BHMpoLMYNMfx1jwx1MfZ7
 Lf5PpXUpmsKsWtwkSjOTAxGbIThjANnB/F34BzcfinSuwS4XeSSyDFcaBE5d0KRLv+UZ
 VG8w==
X-Gm-Message-State: ACrzQf3vuJd9BRUya/HmvzXoMEvjc+Ocwutn5nFk0J6gvzQfPIZ4Jwc/
 tREB36EHA7CSeKULAHuPNVTTTA==
X-Google-Smtp-Source: AMsMyM6S4v+VX4VzNgvxUtLuWFWXF2ZTB9fOWXa2w74ylwnHN9MK2nNCfe959uQy8AH1YMYtBf9BbA==
X-Received: by 2002:a5d:6c6b:0:b0:225:dde:ab40 with SMTP id
 r11-20020a5d6c6b000000b002250ddeab40mr1983639wrz.690.1664452198312; 
 Thu, 29 Sep 2022 04:49:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b003b4ac05a8a4sm5527858wmo.27.2022.09.29.04.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:49:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 145711FFE6;
 Thu, 29 Sep 2022 12:42:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 WANG Xuerui <git@xen0n.name>
Subject: [PATCH v1 49/51] contrib/gitdm: add WANG Xuerui to individual
 contributers
Date: Thu, 29 Sep 2022 12:42:29 +0100
Message-Id: <20220929114231.583801-50-alex.bennee@linaro.org>
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

His blog confirms he is not affiliated with Loongson.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: WANG Xuerui <git@xen0n.name>
Message-Id: <20220926134609.3301945-5-alex.bennee@linaro.org>

---
v2
  - fix spelling of Loongson
---
 contrib/gitdm/group-map-individuals | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index 6322b3476d..e19d79626c 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -35,3 +35,4 @@ liq3ea@gmail.com
 chetan4windows@gmail.com
 akihiko.odaki@gmail.com
 paul@nowt.org
+git@xen0n.name
-- 
2.34.1


