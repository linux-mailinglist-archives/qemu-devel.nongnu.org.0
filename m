Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDDA3F8F7D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 22:09:06 +0200 (CEST)
Received: from localhost ([::1]:35296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJLgO-0000Lz-Vk
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 16:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLey-0005wY-Ar
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 16:07:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLew-0005gQ-TA
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 16:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630008453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CrbfFeOupWv+JFRS3e3CGNM6/o8MeKG2UaBcqb/r1zY=;
 b=NOUPR1NMlhOd6nlGmVwzqscck43HIJahB6EyKA8vGIlwWrUV791AK5DtHKOl5MESJoVr7T
 Mw2e20BdDDwjuwFntu5e/WifTYNcuQbsFx5HCxIvbVey9//Xqsdt6ovvy0fivDOD2+4PTl
 fc0UmzYsdkd6eToQxTSWWYl1+nCbJWg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-bkCD150lPO2JWn6_w1o9sw-1; Thu, 26 Aug 2021 16:07:23 -0400
X-MC-Unique: bkCD150lPO2JWn6_w1o9sw-1
Received: by mail-wr1-f70.google.com with SMTP id
 q11-20020a5d61cb0000b02901550c3fccb5so1217728wrv.14
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 13:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6JKdB24SDWZ0AhRStlz443sVeOAcTAznlnsiA6ONz5Y=;
 b=QyhvynjijivvRUSrDw67kCneDlY7aiqiKe1Lp7LwJRZbBYQiI9D5VxPdwbIclIxUMT
 I0VUGaA5ttN79r/Oa7pATMnTsgyaE5flHh3s2/e8OTcnKXaLrqbc8VZZmTMn9BKj4Dhb
 LUH0NX6tC82AdbmKW3JqZfxk6Jt7/3WIkdZ3jRrML+VHX6YIxEzH1Yc/kzCpKDxvFVHq
 TKh1wr3knQ3zS0Ysdva+YXlnd5evyu9zHKrw7oAbX3PBYb0atJJmr5R8XJLATsGiuBns
 cEpz/VgTYwnXW7s5DJyU3QZQpBZxhYAr0Tr0UTVeMjhgUgUfBWtCXMYGdPctRZGZH+ef
 YlNQ==
X-Gm-Message-State: AOAM531v9Un/cp98vonyIDaehFfhF669m83ey60NGYxamg5UMlRNMp3a
 dNeP8Xl7DplssYXRzNYd2uISIf7swWupXD5Roheh3v+Hk6Bh/tffcQjy+8ZXVJ6AiDQe2u382aa
 /GgFMAVih1oIzJtoRH2Gb5zp1ZOpT5e4lHPOws+X//tZBXr4wgF3BMrqWHXpAlNC2
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr6302996wrz.380.1630008442562; 
 Thu, 26 Aug 2021 13:07:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyl23Te8I1W5HyLk+t0vBURTs+o2/lIE0NpCUV/WN4bJGGLxWzc/aIA2mESCNf/elhN4rJHFg==
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr6302962wrz.380.1630008442320; 
 Thu, 26 Aug 2021 13:07:22 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 q10sm3449412wmq.12.2021.08.26.13.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 13:07:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] hw/usb: Always expect 'dma' link property to be set to
 simplify
Date: Thu, 26 Aug 2021 22:07:17 +0200
Message-Id: <20210826200720.2196827-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify the XHCI based devices by always passing a MemoryRegion=0D
property to the device.  Doing so we can move the AddressSpace=0D
field to the device struct, removing need for heap allocation.=0D
=0D
Since v2:=0D
- Use &error_abort (Eduardo)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/pci: Introduce pci_dma_memory_region() helper=0D
  hw/usb/hcd-xhci-pci: Abort if setting link property failed=0D
  hw/usb/xhci: Always expect 'dma' link property to be set=0D
=0D
 hw/usb/hcd-xhci.h        |  2 +-=0D
 include/hw/pci/pci.h     |  5 +++++=0D
 hw/i386/microvm.c        |  2 ++=0D
 hw/usb/hcd-xhci-pci.c    |  5 +++--=0D
 hw/usb/hcd-xhci-sysbus.c | 13 ++++++-------=0D
 hw/usb/hcd-xhci.c        | 20 ++++++++++----------=0D
 6 files changed, 27 insertions(+), 20 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


