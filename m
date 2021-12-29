Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD8548175F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 23:54:37 +0100 (CET)
Received: from localhost ([::1]:42956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2hq7-0006LX-VP
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 17:54:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2hnq-0004Pj-RT
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 17:52:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2hno-0000Q8-PV
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 17:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640818332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LwJfUpmeeEXAK7Kppp3cEs5xp8T8nEqb5Z0Nu1PlcQk=;
 b=g25qk9+73nFfDut9mwFXdQdx3CKlftJO0jJkjWN1HYagoC2wburX8csglYQUYhdjGMr0hd
 caLpwo/FkDv9n0Y/ticEwMR0BK4eQAeTeu4mhINUUjNcJS8iiEbrMj8FpuoLT5XCJUn8sK
 vNKXE5hGFrRaCzYew80X1ToIMK8t2Uw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-nDlcm0TWPt-x0HT1dTWvpw-1; Wed, 29 Dec 2021 17:52:10 -0500
X-MC-Unique: nDlcm0TWPt-x0HT1dTWvpw-1
Received: by mail-wr1-f72.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso5392853wra.18
 for <qemu-devel@nongnu.org>; Wed, 29 Dec 2021 14:52:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YM5/7G2bbT2zSiTpibf5KDTYTSxWd5fMK8CWNnzsx5o=;
 b=6K3a7LouRle7d8td+KhfA7xlYclwBjoZFgpnMJYoL7HlvOlalaIMQqkeVhOAO/ilkp
 AZwiiAvG/BuBtkoxI+PjuaowMZY2umnOWy1cvR+FLsSPRDdttcfkfaMhYvzgUGsAmJ3x
 UMOuF0Uk7NI6qHE6JfzHtfb6QfwuDdKdakQSCnnzIeLwkjpytW7LqYgpjnPThLUjrocF
 OI602hW8/8Rza98nXK11hbnVcFsCf7rOyntThyn/1BeZNRFHQavJYcTPjZXFLLAMyCUw
 zTi5eQfHQZwyX4e4C5eRO2qN0yI8dFYTnRt+aa6zxsG1L34xsnuejZbrNfkZ4nV8qqXm
 vLxg==
X-Gm-Message-State: AOAM532syjRilbdYiMs3tMNAPxm08Mqq8x+C/LFeeNi79FCflsKJM3Yv
 /ZpsP4FBMqb0sN63BCOOBV+MBzvqLj9fidELJgoqjCBc+MU9G1YTbJhgtkU0W9MTEuF1xYu/Sz1
 Eyd+XO+WFJLb67vcr8ADcLBZ/UsJroTC94ODcHKRIK+7Z6ikvJzZQDzSb/B60nedu
X-Received: by 2002:a05:600c:6009:: with SMTP id
 az9mr23517980wmb.32.1640818329032; 
 Wed, 29 Dec 2021 14:52:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3t5SaJC4GfUu61Mz+Zv99TEOU1JdILr2ps4LNzh/9BTX/Gxgug2G1tlxYQldKlkVRbvaepw==
X-Received: by 2002:a05:600c:6009:: with SMTP id
 az9mr23517958wmb.32.1640818328797; 
 Wed, 29 Dec 2021 14:52:08 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id u9sm24765655wmm.7.2021.12.29.14.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 14:52:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/sysbus: Document GPIO related functions
Date: Wed, 29 Dec 2021 23:52:03 +0100
Message-Id: <20211229225206.171882-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reduce the scope of a pair of qdev/sysbus functions,=0D
then document the sysbus functions related to creating=0D
and connecting GPIO lines.=0D
=0D
Based-on: <20211218130437.1516929-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/qdev: Restrict qdev_get_gpio_out_connector() to qdev-internal.h=0D
  hw/sysbus: Restrict sysbus_get_connected_irq() to sysbus-internal.h=0D
  hw/sysbus: Document GPIO related functions=0D
=0D
 hw/core/qdev-internal.h   | 15 +++++++++=0D
 hw/core/sysbus-internal.h | 16 +++++++++=0D
 include/hw/qdev-core.h    | 18 ----------=0D
 include/hw/sysbus.h       | 69 ++++++++++++++++++++++++++++++++++++---=0D
 hw/core/gpio.c            |  1 +=0D
 hw/core/platform-bus.c    |  2 +-=0D
 hw/core/sysbus.c          |  2 ++=0D
 7 files changed, 99 insertions(+), 24 deletions(-)=0D
 create mode 100644 hw/core/qdev-internal.h=0D
 create mode 100644 hw/core/sysbus-internal.h=0D
=0D
--=20=0D
2.33.1=0D
=0D


