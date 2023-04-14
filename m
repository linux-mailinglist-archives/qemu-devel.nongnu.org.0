Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC866E227F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:44:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHpA-0006gH-Fj; Fri, 14 Apr 2023 07:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHnB-0004q7-Eh
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:38 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHn5-0001zE-K6
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:36 -0400
Received: by mail-pl1-x632.google.com with SMTP id i8so9043620plt.10
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472427; x=1684064427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c3FhXj33fzvrTt7PbSmHYidCpt0dRbkfBLR6oG1d2n0=;
 b=CBLb2qx7DR+YEJKiVwJsPgKnrp30pMUEPtSL2Lw2lhtPbm0rCU1tb49/NuhVUsCoZl
 WxoJXrnBuKfBt56RQysuRKF8nMk7zLdi9rUt6Oc92W4IqjuvY3ejRZVnKnTnpgAeGo8/
 1p9BbfCsuF6VML+A1jwF1ZNy132GAg5jzqcvJlTl66zk5XDWAMEp4loasURUK5PcxxyJ
 Wr1GxyBcjTGxQIuAlr4/H5QCMaQ/MBI9aXHh2dV6WdzmrJcsiduGfyveOd4WHtnWd0pC
 MDzAdEkex1QfhER5OMDdn/jOREB8ABYlJwbUC/L66w+SQgQnu4YT5M1Aj4/1FDYBGnhE
 xO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472427; x=1684064427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c3FhXj33fzvrTt7PbSmHYidCpt0dRbkfBLR6oG1d2n0=;
 b=AXCs+dpDwas3Mx3ocX3/73YZUTNKXT2XLAqsnJnoCfSc3N6WX6Jr03YD6CyuUM1YRH
 eRW9Jd1BBD0El2pB8rJw/UOFu50/7MiQwNmslxBZmyGAflGxU6gLbYMVt0tcix+T8tIj
 Xk99pb55C4wkHeONnqrSlczXMVmUIKFeTSxSi1tZqDXK25CZ7Qdm70FcktEuNWlsoQOq
 zLJ/E0sZWpp2GFcyRre0S5Nn78KJTsG5BRIh2Rb5MqZAIChK2yOdt3E/T0E0TrVZh/YQ
 9730vxVZhXvNvdioMLEElklV+iWXzWFPCxzMeJELvaHv7vH+Za4VMMZos1j5skyqlmue
 dZjQ==
X-Gm-Message-State: AAQBX9c+HJ1iMWDS8b1yzUQyfM8W0p+mbk1gnwGO8g9OEDZSaxkZAmtu
 RQY3LHInPY+H8tXKv3lzKfMjZg==
X-Google-Smtp-Source: AKy350az8pqOsxKOZulmixoZQvvYMpxDSUSVT8Qsi3IobvMfHMdCkVyyFStBSFIMAJvpqReGnvQIPA==
X-Received: by 2002:a17:902:e5c2:b0:1a5:a1e:6f9e with SMTP id
 u2-20020a170902e5c200b001a50a1e6f9emr3246796plf.15.1681472426953; 
 Fri, 14 Apr 2023 04:40:26 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:40:26 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 39/40] MAINTAINERS: Add a reviewer for network packet
 abstractions
Date: Fri, 14 Apr 2023 20:37:36 +0900
Message-Id: <20230414113737.62803-40-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I have made significant changes for network packet abstractions so add
me as a reviewer.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c31d2279ab..8b2ef5943c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2214,6 +2214,7 @@ F: tests/qtest/fuzz-megasas-test.c
 
 Network packet abstractions
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
+R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: include/net/eth.h
 F: net/eth.c
-- 
2.40.0


