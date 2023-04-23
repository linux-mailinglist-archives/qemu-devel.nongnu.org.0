Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DEE6EBCFC
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:26:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRCp-00035A-8Q; Sun, 23 Apr 2023 00:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCc-0002zr-NT
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:56 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCb-0000qi-5v
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:54 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1a682eee3baso27209505ad.0
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223591; x=1684815591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBA1GkUlp6RANFF4i4mWmjvW3mnXMfDstja65r4JnaQ=;
 b=AzlEgRTn98kN7yRs8/1eu3Bth/ifX7he5go+y8Z9SU7CiTN3hl0/MCv6wAB1Zo3rwG
 N6SEx5WknhMeJHo1g6KDq+3+nIk+eWiQcr7IWmjbp/nshKXwvMbKeyjtihFf4oSaPSH2
 M/dfkqt9HZ8c9czlZKmiOWbivReIMdkVYlt98oibdjyUJkjNGA/ob/qjkJIYmUoUynuJ
 vvXb6cDn5fhppOdbEZ7O3F8x3X4u8ZxMLeK5smBGQAH2VUQ+tVa+OF6o7TPmE65FZBXR
 rFJf+0VdwdgeCZYkBma6/nuoPt3QhEggWMdTIiHYliXHY6B9hPRHVFOg7KVArGO86LeI
 Q4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223591; x=1684815591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBA1GkUlp6RANFF4i4mWmjvW3mnXMfDstja65r4JnaQ=;
 b=iAja03BGR6lq7u4aZTDRRQJc1Afzn/4tt80ReZ2ODhEuK8wDUMsgrWiege7L08mKu5
 k30UPoE2W3SxoNJAamO3Q/1uiQBTIy8+Z1CiPHATxE1D/UUC4Jtlc6hLFBde1uSCP37j
 LloMWvYokfuApHGbffmRHFVI+l4082+LzUO+/rDA5XInUE2j7+Bol33hVH+g6dO9Lx8I
 dTC/Pyjyw0f+ergvcN39lUzmJ4vNb62LysZOIM4b5+9WfQ042e5cEF3lkBjYnvxxSngO
 FiFmHD3f5b9sFsUxLzjBTye+UfQqxerctveEkoW4PCJin0JwXF84E+zwZo3vvMpR0TX/
 7srg==
X-Gm-Message-State: AAQBX9eJW4rhKT7LDeNgEq7MTFhcV4ywbxVmGO+dGt0h2sh3iEBfhwcK
 gV9iN4JneuhIs/YqErS5Df0p1g==
X-Google-Smtp-Source: AKy350aBfzAZNMUm0/AK69XuAampCIuDG0Gs7GVDExktRSzCncfEVRcNADfU83geE94ydIaD/cuh9A==
X-Received: by 2002:a17:902:dac4:b0:1a9:5c41:3f8e with SMTP id
 q4-20020a170902dac400b001a95c413f8emr4486594plx.42.1682223590989; 
 Sat, 22 Apr 2023 21:19:50 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:19:50 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 20/47] igb: Remove goto
Date: Sun, 23 Apr 2023 13:18:06 +0900
Message-Id: <20230423041833.5302-21-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
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

The goto is a bit confusing as it changes the control flow only if L4
protocol is not recognized. It is also different from e1000e, and
noisy when comparing e1000e and igb.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 167e1f949d..2de04fabfe 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1297,7 +1297,7 @@ igb_build_rx_metadata(IGBCore *core,
             break;
 
         default:
-            goto func_exit;
+            break;
         }
     } else {
         trace_e1000e_rx_metadata_l4_cso_disabled();
-- 
2.40.0


