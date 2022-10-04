Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31485F44B0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:49:15 +0200 (CEST)
Received: from localhost ([::1]:39108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiIM-0006FX-Qb
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYb-0008Jn-NO
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:57 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYZ-0007Pp-AA
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:57 -0400
Received: by mail-wm1-x32b.google.com with SMTP id e18so8828424wmq.3
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=S/xkZ5Z+RECT+PVVDgHQ3kAIpYgCzXMb4EaN7Wyqjn8=;
 b=cJyz4OaL2BLeAVFU40ZwfEOYbAZsmMs30Lgry/6zbmX3Ky4kf2uYnSAo2MPrRNJqsK
 ciS7n8KcVaXiUTNMjlD5yjBH9szvNA4x/vcTLE+4ccHhJe0/SZyhUBW92Rv4WFJFpHtY
 nIcugV5hU9M+QE8MyiZcmcpqF0NSVxFsdKIwQTZ6VAXClm8a9mazJSX4NMf5RMA89nWC
 EP1MaRZRzo2AmiGynfhnXtBAb6+gvAyzH2Pwzn9vh/oIEVOO4IdlLbB/hU1B5FGhQWgk
 wVnSCAI1Hj8M8TumMMQ+dZsJNdFtglM0k3nDHxZokfmRntkJwMRA4aAnFYH8y3OeRG2e
 cjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=S/xkZ5Z+RECT+PVVDgHQ3kAIpYgCzXMb4EaN7Wyqjn8=;
 b=NoR1EwHLl9/owa6yVjN7JSbQ9xq4495c/Z5o1zoo358n2/OjlLXS6i236SIBurX6Jn
 YExss4IS5jLxBpT5dhrovuaYkXwapN6gsYtVQoEG81o7OapGTk7gKh28ovMFBP3/uVJG
 1r1BPQDLVZCjlHn7Jq9Ts59GYlbRKE6jyqlrUD/1RvOthyrDU+wc0lNQlqEkVq2fcP9Y
 qIDixAJKYAkKddK6XiVbNtg5yVbsAtNfkwupRM55WYbduy5s+XDQHSMwv5fUXfdBw+cc
 I82SPaNRpMnSynBIKzl/0rC65+096sVkjiclO2h5fo7vB0xZDc5jzIZB+eJRUlgErUe5
 fcXA==
X-Gm-Message-State: ACrzQf3yegC3rNYmX8rBZ0oBP/scXJeBjcFcKHATj2zuNSSUR8uL89Ya
 aHd9X1hMxx4ZPGJw4QiHizUxhg==
X-Google-Smtp-Source: AMsMyM61v35zyW1yYAIK98S1fEOfX46aY+4yiWXhF3FqwEY0gM54OH4rTG0dCp9yTccztLea921TRg==
X-Received: by 2002:a05:600c:3595:b0:3b4:8378:98d2 with SMTP id
 p21-20020a05600c359500b003b4837898d2mr10620988wmq.64.1664888512713; 
 Tue, 04 Oct 2022 06:01:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a5d464e000000b0022e38c93195sm6069226wrs.34.2022.10.04.06.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 447931FFE6;
 Tue,  4 Oct 2022 14:01:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Simon Safar <simon@simonsafar.com>
Subject: [PULL 52/54] contrib/gitdm: add Simon to individual contributors
Date: Tue,  4 Oct 2022 14:01:36 +0100
Message-Id: <20221004130138.2299307-53-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

Please confirm this is the correct mapping for you.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Simon Safar <simon@simonsafar.com>
Message-Id: <20220926134609.3301945-2-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index e19d79626c..53883cc526 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -36,3 +36,4 @@ chetan4windows@gmail.com
 akihiko.odaki@gmail.com
 paul@nowt.org
 git@xen0n.name
+simon@simonsafar.com
-- 
2.34.1


