Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5CA6EBD01
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:27:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRCu-0003Yc-BX; Sun, 23 Apr 2023 00:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCg-000313-0l
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:00 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCT-0000q9-Gl
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:57 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1a667067275so28786135ad.1
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223584; x=1684815584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NKrjZcc5spW3PcfEcfPF1xgA9c/5G8C/80+pcYNs6X0=;
 b=iQ0163dgGbrXi2JLNfhTYq+XWsmnhykcUYLlxOhFocgtn/L3szQIiRUdaKhjHqzWPY
 eX3yijmLqblDpBvPm4cmn3APu2RqQsEbdNN8fV1TRAseccyabYomJMmurelMhpTjOV+S
 xcvAE1hU9kIjhmrz/Hd+dq4iQTIDv1HvT2GSpKHQfXuxkmlDpBnBdXxfLzr+oEkMFXWm
 GJq63P7GtHiEYT9yCb8iUaMc7vOXsHPQFtqq+z4huDwcKFII4tiptsj7E1VuRQYQSrih
 osqcSjGG2pIOglNUl98CTKImJYMtOu/0wLvMciKsITpqnX5bqAKkoODmTG+zBNpcY0jU
 mFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223584; x=1684815584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NKrjZcc5spW3PcfEcfPF1xgA9c/5G8C/80+pcYNs6X0=;
 b=MoWnl1bkxL9aHo/5qQMQq1ALbOAZapoSX72Ev+bCWptXnp1b9z95qCzMqiRy6Krrp3
 2mHG8NLFlWNwPKne/74jy6Rg+MHcTXX7CoUyifMWvWX7IloHWIQfYr/5QS1ydQ3Q9muO
 PpL2Vnnjuv25cFpVSfl5ozGNgWnp6twKPw5j6+drANT1MfqUiOlluPu+Squ/q0IXzYf/
 PCF4ocnBOc7LkPnTAvgVWnf9E+DpCjl9L+49ZS03kp2ha7w7Op5DLLGGGidIC/RskIIv
 uzbOxcBl2/QFQG6fUY8vHw008fGg8i9RBw3dd6B60TpQGHe8/tUWhJortklAEo528g1s
 /bzA==
X-Gm-Message-State: AAQBX9disCNxa/0nA92/uffAntGQObUt0wo8hWXdbFbwHOImP48KmI+z
 EQKTSXlaZiASarhYAHdp90upIw==
X-Google-Smtp-Source: AKy350a0EPfWXMz3GpBCu+QC33+6ezDQn9RVYgIp+R1MMJcpAGT9ngEvCeCIECiNJV9NYWXE6IT81g==
X-Received: by 2002:a17:902:f541:b0:1a9:72e5:518a with SMTP id
 h1-20020a170902f54100b001a972e5518amr412948plf.31.1682223584222; 
 Sat, 22 Apr 2023 21:19:44 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:19:43 -0700 (PDT)
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
Subject: [PATCH v3 18/47] e1000e: Always log status after building rx metadata
Date: Sun, 23 Apr 2023 13:18:04 +0900
Message-Id: <20230423041833.5302-19-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
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

Without this change, the status flags may not be traced e.g. if checksum
offloading is disabled.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/e1000e_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 481db41931..d4a9984fe4 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1244,9 +1244,8 @@ e1000e_build_rx_metadata(E1000ECore *core,
         trace_e1000e_rx_metadata_l4_cso_disabled();
     }
 
-    trace_e1000e_rx_metadata_status_flags(*status_flags);
-
 func_exit:
+    trace_e1000e_rx_metadata_status_flags(*status_flags);
     *status_flags = cpu_to_le32(*status_flags);
 }
 
-- 
2.40.0


