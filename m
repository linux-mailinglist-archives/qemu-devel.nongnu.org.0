Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FEC6E2297
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:49:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHrA-00080O-Vs; Fri, 14 Apr 2023 07:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHnC-0004qd-1O
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:38 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHn7-0001VX-KO
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:37 -0400
Received: by mail-pl1-x633.google.com with SMTP id y6so16937250plp.2
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472423; x=1684064423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZ08B+b77Dmf0jC7a6piyaX/K9D8vaMH+u4MIA0lWW0=;
 b=Vw22plojv6nzTnWOZ7p8zev04+shoPMBv3T/+MdbyADxnC36Z897A5HWT9aWHxzPPT
 /T8pjYfFkRrcaDLEnKAF79jaPavtMs744MGs0NxJer6LaZT1849w/jzGdjPUVYQn+6c1
 g7sPlYBWHLde5guz55sR0gdsM0wHjiPfiDFaUKtGenSM11V6ApVnrVxb8H1Bz9zkRe7W
 zxHjY71wZTaXFc1liFAwPDQsjMjjyPtXApmtaDMsP395D6TN9k83V2iXLDICxBn3rCBR
 2qCNQxGOkJjlPdkcmSFVIp9Fq1b3mlhzdmpY+bZXocLreucByGA7nkaT3exREXnqK4vJ
 H6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472423; x=1684064423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YZ08B+b77Dmf0jC7a6piyaX/K9D8vaMH+u4MIA0lWW0=;
 b=c45Gz1h8J90HEG1iJEBtJ6KNBTU1bhyQLxeo17Vg9/vDJkVAaYWvub5V8SLDjiTEEg
 TTSfWxEEHkOCLwQa+iB2sc25+hMJqGw2JV1pN/qXT1s3TWgtwH0s4eAQXw211wJ2VgXy
 19Fj1Q8MH1Sl3TjMuOTZyubI0VP0loLyDFicED3s+GeLx1EpzhZI3fRKh0FRqk49SYf2
 GUMCFwwGqIj9zg4ehwTej42BRFfWeFw3VVHUqHmLv4qWd5/NDuSIKSQmk5nW/kyaexyK
 ET7eWRn9FE/uKzPLncdrIkHboxqQo8EpA91+F6qcaiTAdbIv52Q3HnHIG/CFIap7SVI7
 RrEw==
X-Gm-Message-State: AAQBX9eB85E+0qLHSKijTkE93UclPl+Y/lrdsQ2DUTA4zug4xQSLqhj0
 Mb/+/FhbB8G8MdMHt86weB9IsA==
X-Google-Smtp-Source: AKy350YqiWgxfBP7ytNawEKr3BgrajhW6btIWO7ozK31MlFsmh2ca9Vw2ud1HC4KFylcumUsRow+LQ==
X-Received: by 2002:a17:90b:4d81:b0:240:7f0d:9232 with SMTP id
 oj1-20020a17090b4d8100b002407f0d9232mr5470573pjb.3.1681472423675; 
 Fri, 14 Apr 2023 04:40:23 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:40:23 -0700 (PDT)
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
Subject: [PATCH 38/40] vmxnet3: Do not depend on PC
Date: Fri, 14 Apr 2023 20:37:35 +0900
Message-Id: <20230414113737.62803-39-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x633.google.com
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

vmxnet3 has no dependency on PC, and VMware Fusion actually makes it
available on Apple Silicon according to:
https://kb.vmware.com/s/article/90364

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/Kconfig b/hw/net/Kconfig
index 18c7851efe..98e00be4f9 100644
--- a/hw/net/Kconfig
+++ b/hw/net/Kconfig
@@ -56,7 +56,7 @@ config RTL8139_PCI
 
 config VMXNET3_PCI
     bool
-    default y if PCI_DEVICES && PC_PCI
+    default y if PCI_DEVICES
     depends on PCI
 
 config SMC91C111
-- 
2.40.0


