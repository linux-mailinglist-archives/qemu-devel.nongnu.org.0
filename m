Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20344490B5A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:28:01 +0100 (CET)
Received: from localhost ([::1]:34926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9TvL-0006aY-Ny
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:27:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9TQO-0000Yu-1f
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:56:02 -0500
Received: from [2a00:1450:4864:20::32b] (port=35645
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9TQL-0001Jj-9G
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:55:59 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso24369715wmj.0
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 06:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GTjOK4VUjH8B9DdomRyUCCneRFf/WvtWbiFPIDUepfg=;
 b=pRpAbp9E1sITuib+ZaU+AnxouqqWKk74oOyfCsQn85WFRftNeCklFKEBGGiJtgKyzc
 7+wyyGttXTfRBDsXHn8mxa2g1SY6AAVHr1bTI3GpuuEeEbtFHQGPew79r9k3OVfj8wXt
 XTpdJttxy1AtSLJIAsymOy8FCFTGYaRGdXG1T9cQJg2kZsGvICnoeMS66Q59ZAw0JStR
 4Zqke7ewXd3A3GKcjnoGrCKSYRMeyFJSI+hSMgGa2r9UY/Bt2qDCGX/jAuaZ56H5vRfV
 rPK3ZyMpWpVStkr5Y/2SJewH684ymKg0NX/BkHhrWO02Omm6ouIn3zhp/Kz+9SpEsUTG
 Qkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GTjOK4VUjH8B9DdomRyUCCneRFf/WvtWbiFPIDUepfg=;
 b=QjuT9stj2BYbxz8GTj+fHTsWOuStEVGdMGBzfsFq8iGVZjQ1pTjpt4SB2gU8llV7on
 eQ1BZsfDkI8HMFaGzuTpRcCGRJncyIVUePlM1yJG2/dW0B8tfJX4lcgrmAH8c/707zXR
 /W/X5Y+OzgLkJ0HbS2MSgZ1I7Uot67JYLvsNzkzaN3wmffnjHSCzQ9ULQX6g4ld/73IW
 ALsiWgLwYMBFK6+rIm7QtgSV6tfrSI3QXZGv+zCUeXt1DiINfOjWL2fQNHgAmvIca9AR
 IiOWCt7h3KkGZvS4DYLGzO/q275WdQxLLCws5/gE4X2OdFB0xd8iNK1/eEZKv3xWn0nL
 vPag==
X-Gm-Message-State: AOAM533v0gkwh2OezM9k6Ktfn4Bm9+OKBZxzq72A8nvhSdaCllrWGm2s
 zg2sBA6L9OinvXFPWUUZaLKUzVTzyrWrk81I
X-Google-Smtp-Source: ABdhPJw+mhPLGjLSQm+U1/AqBWViCLuPKRClxGcZ7ndblyj95TTPKsIoxor8jB+bP4qbBmpjRkw8dg==
X-Received: by 2002:a7b:ce94:: with SMTP id q20mr20438258wmj.5.1642431351763; 
 Mon, 17 Jan 2022 06:55:51 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 r205sm13121798wma.26.2022.01.17.06.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 06:55:51 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 0/2] hw/i386: QOM-attach CPUs/SGX-EPC objects to their
 parents
Date: Mon, 17 Jan 2022 15:55:47 +0100
Message-Id: <20220117145549.145650-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Trying to fix the issue reported here:=0D
https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg05670.html=0D
=0D
First attach the CPUs and SGX-EPC objects to the machine.=0D
=0D
Since v1:=0D
- addressed Paolo & Daniel review feedbacks=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/i386: Attach CPUs to machine=0D
  hw/i386/sgx: Attach SGX-EPC objects to machine=0D
=0D
 hw/i386/sgx.c | 2 ++=0D
 hw/i386/x86.c | 1 +=0D
 2 files changed, 3 insertions(+)=0D
=0D
-- =0D
2.34.1=0D
=0D

