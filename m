Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509896F5440
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:15:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8YG-0005fv-9y; Wed, 03 May 2023 05:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xx-0004Z6-L1
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:13 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xc-0005tD-8U
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:13 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso2992472f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105170; x=1685697170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=59DATpvhJwGGAwW9/5YfnTLXtpUBYi07i8tRAsShAvw=;
 b=FmJUGO+fBUt9Lb4G9cszUd0sU+1XNYb5Itru8EY242WTve7HRmSifI504BDyhNEal4
 vvUWwUkZHvLv1HmLiWnhCepkTeHjS6pjHPl2/WbVaiv96znddlQDB57O17I0yrayuvjH
 5/Cr+XffmYXEAc/kcHF+8XvAuFlNzI6SV2ZRmzaXHN6fOpr5ROeG8fn+dVSmoDrJFpL7
 53nihWBfFi2GTTb69aNjkCq1lCVQIM0dVh1D/4YkzRGtmjN+ENyhwgUVLlmVLeclMTSF
 bcWyrBKj7afkdty7ump53inRIWevQVeuOr+44sFVZevGzsjp7q2pv6ylWn1+FRtCH2XX
 SbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105170; x=1685697170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=59DATpvhJwGGAwW9/5YfnTLXtpUBYi07i8tRAsShAvw=;
 b=HuGtx9VMSE7MlDyduYb8C3EmYfBNc+NTAF9MTX5JgPtqBql8NjtXA6LlP+fXOyxMr4
 XFVQiaFXMBcgSah/BLq2yAcmeUsnA1ouZk5pLcjT4cjZ6Dm27nWVl12mZFqkWyQ9T6qn
 rMdJkmENw4K64xubf5xn/xsTtVK6r/sKjLfn04vhT9PhwjHKoH3RVZ941HSvOfJgdtRi
 O7CVwSAkfIqZ95JsolzjyN1IT4eVXb2oAdJBiI3uhcBh3AtetL4coUs8I7X5kypeHUPX
 k9e8fgSb1DMzDQaFXVNn7U1O7SvvyxWkm1YJq9Njx8Yx2KqIZefQEqjsqsuaisX6j4sD
 XOPw==
X-Gm-Message-State: AC+VfDygLULhkj0Pmug+D6l8q0PgQPqTt6n4s2iltGzRf846As7SNOzM
 WIn9OarIOVt7gLqGBFeP/2yCVA==
X-Google-Smtp-Source: ACHHUZ7goj85u/R+aL3/zIAqGJgHq/vaDSPyMydyF0lCwSMSdZlsV6XyTtWnMjlqNTi5z1tt8nVvPA==
X-Received: by 2002:adf:f7cc:0:b0:2f5:9800:8d3e with SMTP id
 a12-20020adff7cc000000b002f598008d3emr13618863wrq.47.1683105169933; 
 Wed, 03 May 2023 02:12:49 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a7-20020adfdd07000000b003062db9cc21sm7475316wrm.92.2023.05.03.02.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A0E101FFC0;
 Wed,  3 May 2023 10:12:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH 06/22] hw/arm: Select VIRTIO_BLK for virt machine
Date: Wed,  3 May 2023 10:12:28 +0100
Message-Id: <20230503091244.1450613-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

From: Fabiano Rosas <farosas@suse.de>

The virt machine has IF_VIRTIO as block_default_type, which causes the
generic code to try to create a virtio-blk-pci device pair at
configure_blockdev()/qemu_create_cli_devices().

Select VIRTIO_BLK and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors
when PCI_DEVICES=n (due to e.g. --without-default-devices):

$ ./qemu-system-aarch64 -M virt -accel tcg -cpu max -nodefaults -cdrom foo.qcow2
qemu-system-aarch64: -cdrom foo.qcow2: 'virtio-blk' (alias
'virtio-blk-pci') is not a valid device model name

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230208192654.8854-7-farosas@suse.de>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4c23fbf800..168c1e8089 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -34,6 +34,7 @@ config ARM_VIRT
     select ACPI_HMAT
     select VIRTIO_PCI
     select VIRTIO_NET
+    select VIRTIO_BLK
 
 config CHEETAH
     bool
-- 
2.39.2


