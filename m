Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E156D6E228F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:48:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHlz-0001lu-5d; Fri, 14 Apr 2023 07:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHlv-0001iw-Kh
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:19 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHlq-0001RV-DP
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:19 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso8350811pjc.1
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472353; x=1684064353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IoKdFm7GQ7jpYomTM2Gh/e9KgZPQGPGk6aHLF8dF0Ow=;
 b=I9BtNdI1wGhFD95WEmE7X7jZe9OtLBB2SrlYPr4ZSuGeUc7ti3unUKhkniLMpqayFC
 0BZNeQYAwpi/wJtH7uKClIFiaSBzfhPUiE/j+B/xZG3tiO+OMkYz9TX081CTsm8l+ba5
 LcSRBVl8MSSvl6SE9sQ6pqwbMS8hsIhAd3WbA+ec2xYjuXAITuSS8oTvi+8wrH6ukBZU
 520ErGgNNPh12AQpx4oIh8FsE2whntQBg8q3r/slRudVqmVftxyP9+aUZ+/6DL5qV6pi
 3VJ+5eVBEBYyF1fuchv9W2f4/3t/D06/R2daU013KDY2enpGdeUEH9JKv0I24XF7Xkt+
 7e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472353; x=1684064353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IoKdFm7GQ7jpYomTM2Gh/e9KgZPQGPGk6aHLF8dF0Ow=;
 b=WFZ4mX3RRCTwKg+dHY9hdZlRhwFvaKMjxBKn7X212fO0JCKsoOFwjetas8zF3yuVph
 ysUfgEnOFU3SMD8lGsUEYbx1wNcWpneCg5inVlBXkT8amS4myMCMXXumOk+DbUCH/GpK
 H1b4JA/rRHAaTtaXMyzLQUVKoqIQmpIysyQanJeQXYzkuqvb0XbnWZD/vQpjvX5+BVVP
 Pf+x4zaXR6ZjVhFULIwW58M6uuoMDdZ70nmy0mPMf6doyEy3HlDRV23N60Gnoncv070Z
 rmSkkb7wpXPN3Se3i5HFZgAS7b3m1BVxEZgC3HjNifAkIyGRdmvYVpiadHNAhK/VSNWM
 KVSw==
X-Gm-Message-State: AAQBX9f+Cyjvzz08kzYY2+MFEDxvMTfUqMrJhssVSVEc8nTnKXqD1zNj
 /0jX733bHqnsidxQDmjNJPjEwg==
X-Google-Smtp-Source: AKy350bAP+LkjOHsxWnJIlGj2yxjj0jq/SBir4nQbbdRPZ5Ii8CLGSmc7XEvrUm0JQfz5T1mMKOB+g==
X-Received: by 2002:a17:902:e782:b0:1a0:75fe:cd66 with SMTP id
 cp2-20020a170902e78200b001a075fecd66mr1938829plb.50.1681472353237; 
 Fri, 14 Apr 2023 04:39:13 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:39:12 -0700 (PDT)
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
Subject: [PATCH 17/40] igb: Always log status after building rx metadata
Date: Fri, 14 Apr 2023 20:37:14 +0900
Message-Id: <20230414113737.62803-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102c.google.com
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
---
 hw/net/igb_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 5fdc8bc42d..ccc5a626b4 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1303,9 +1303,8 @@ igb_build_rx_metadata(IGBCore *core,
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


