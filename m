Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20574E8724
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Mar 2022 11:38:30 +0200 (CEST)
Received: from localhost ([::1]:52084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYPLx-00066R-7y
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 05:38:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nYPIm-0002kO-UL; Sun, 27 Mar 2022 05:35:17 -0400
Received: from [2a00:1450:4864:20::32f] (port=55199
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nYPIk-0002c6-5O; Sun, 27 Mar 2022 05:35:12 -0400
Received: by mail-wm1-x32f.google.com with SMTP id r64so6721007wmr.4;
 Sun, 27 Mar 2022 02:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TPa9Ien78uey/dBdpHJRkRyfhRQedcdj+KNczv+NRpI=;
 b=X8ZmBIblhNGiC47JsyOcrHvX1IQJspxMKy9jFOTYKK+fs/AO0+5rSFwBmj36qAdiwx
 sCZ7MdhyoU56fcmAF9DHeqRwCoiBPuzeAhiztOXQWPhodHMZVkR9j3Z7IwbWxD8bkr72
 WbFf3YI30EhLTJUvoqkuRzxb6ZV+ZtsGDgOjyCBRmXSrm3RK0I4GiqQaXWLRg/7TmBg+
 pbvvzhuCiEEdhi0UbT+riKoo25JCaKunA0YTzXFBf8Lvxpqo0b9zcNqDzT8rbyPNZagY
 /A2nyUNV+R+Am2c0rMwxeSttq/MOnN/CXPK7DYVeRyin/zgib4bA/gdq243Ct0TqqDXn
 n8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TPa9Ien78uey/dBdpHJRkRyfhRQedcdj+KNczv+NRpI=;
 b=dBumOegthUw69wXDJlJ4SMQ/DgK+YYSiAzk1SD0NCOZWYAzxfzgwoqEp1sx8ome7KO
 08merTo6WuC5nM8QglKVg/1Iz+WPx2dNNU2dM38/PxkMKOCfzTrvJ8qYAGY4wdhPjURK
 yiPU7YFxOMt0TsAYFYKUryh4gp/wcMBDYO7U4JK+u7B64FKfbc7Njy/c4CWmI1js+uJc
 zvRk4QtupMH7ff1GLc9ZAG8R1fv4T+mVhoxT3kcEpxjK3jZfGb7BRrHiglJqbr0Smlfs
 I0dokEsb9EKnZQ+ZS5GHW4B6aAT/nELC0M+03YC4Z5oJSwsoAZtIvQPFGxArz20DIeg/
 NjzA==
X-Gm-Message-State: AOAM533Vm9m+Tajqs6b13upquA+Ig43MrCJ7AhCEhygzgUVVhsF1Efk7
 jnm7Q5QBR20HuMr1SnpFCPgzmm7uYmo=
X-Google-Smtp-Source: ABdhPJzLIEhQjnxeUa+/WoCGSzFxq0hZ+tQCcZz3h5rY5GlLYUbbdg8sa2iXZp82E2NL77Rqj0lFOA==
X-Received: by 2002:a7b:c77a:0:b0:38c:2c33:d8f1 with SMTP id
 x26-20020a7bc77a000000b0038c2c33d8f1mr27901509wmk.115.1648373694687; 
 Sun, 27 Mar 2022 02:34:54 -0700 (PDT)
Received: from li-142ea8cc-3370-11b2-a85c-c55585c2aa0e.ibm.com.com
 (bzq-79-183-80-20.red.bezeqint.net. [79.183.80.20])
 by smtp.gmail.com with ESMTPSA id
 14-20020a056000154e00b00203f8adde0csm11892039wry.32.2022.03.27.02.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 02:34:54 -0700 (PDT)
From: Idan Horowitz <idan.horowitz@gmail.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 0/3] Bug fixes related to secure 2 stage translation
Date: Sun, 27 Mar 2022 12:34:25 +0300
Message-Id: <20220327093427.1548629-1-idan.horowitz@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Idan Horowitz (3):
  target/arm: Check VSTCR.SW when assigning the stage 2 output PA space
  target/arm: Take VSTCR.SW, VTCR.NSW into account in final stage 2 walk
  target/arm: Determine final stage 2 output PA space based on original
    IPA

 target/arm/helper.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.35.1


