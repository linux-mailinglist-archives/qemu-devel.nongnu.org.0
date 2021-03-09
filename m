Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A42332FCA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:21:46 +0100 (CET)
Received: from localhost ([::1]:54422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJirR-00025p-KP
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJhiE-0005Ro-0l
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:08:11 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJhiC-0000uX-As
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:08:09 -0500
Received: by mail-ej1-x629.google.com with SMTP id r17so30757737ejy.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 11:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=069VErdnUzshwqMH+dcMCf8diNtKWw1BLvOTwNsLgeI=;
 b=OP5LN6taEPSOxSer1XdUNGtYhH25gS9wJxhEjf/qrrIKzhL0FE5EKFJ7PLSPUF0Qwm
 wZ5QQDTze1OjmjV/fXAA1TFyo2Src0M5bq2cgPF+k9w29W2UBCCqR5xTSl95U3UDIp5I
 OByBiK6+XqwxlaRZbxWr23ugGDRtn+trrvtXVHm1LDa4G2kDZwCPEnqBHzySdK05Xfdy
 WsaDUCp2go1WEVrigbphcV99VSj9Tx81sfv4o0XYN92gD74miDEfjyVPpppj5wloruji
 ybGyH4eABx8EZmDia4cJoJ1uXz6k7NGgr12M3eseTMEvW3ojLD/EZmGOOQYVDU28ns1I
 reNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=069VErdnUzshwqMH+dcMCf8diNtKWw1BLvOTwNsLgeI=;
 b=h0oVr5jUu3L6EyycZHGYP/IYukoQrkQ1pwJ695E8CQkCkrDlJrbYXAfXaivjTZmrP+
 +p6gvFZZxZ8PZb7bTKcs/L0SfxAyC03A1db1/5agrI9jbRzY+4XL4NmPZ/Do2u3V8vGP
 fxb/ia9tho6sy4PBaUyTrU1497pHdwckH6JxR5eWm8zh3JgbxYFyQPEwribay75cljy4
 oCIvYhy5N/KP83t6mvzqYDNRiL93yVWTA3SevhDIY1APzYFzQYKMnnPO+pBHWGZxT7FH
 jbRUeDZ/IKTaMMCO/sWnhh4wBUFRDdxZOisr4zKdoUxg+MUuGYqwOSfpL9lxL49b/8J7
 IyBA==
X-Gm-Message-State: AOAM5332t1BjgFQ+8P0FEnkWNO4xgnWL/502PUUF7UU8dWnBTN3qjVxL
 Jc5W7jfEGGPAhlMPxucqNMOOMzV7vVw=
X-Google-Smtp-Source: ABdhPJwo+1fwwMqT6EkA0Vv/W0+3KPLN48RBO0wCdxTNt35qGOZ9JfRsyQZPCzKqa+YQ4OqEbpyLZQ==
X-Received: by 2002:a17:906:ecfb:: with SMTP id
 qt27mr21441397ejb.245.1615316884477; 
 Tue, 09 Mar 2021 11:08:04 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r17sm9641880edt.70.2021.03.09.11.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 11:08:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/usb: Extract Extract VT82C686 UHCI PCI function into
 new unit
Date: Tue,  9 Mar 2021 20:07:59 +0100
Message-Id: <20210309190802.830969-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VT82C686 UHCI PCI function should not be exposed it the=0D
VT82C686 south bridge is not present. Extract it out of hcd-uhci.c=0D
=0D
Following this discussion:=0D
https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg02923.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/southbridge: Add missing Kconfig dependency VT82C686 on USB_UHCI=0D
  hw/usb/hcd-uhci: Expose generic prototypes to local header=0D
  hw/usb: Extract VT82C686 UHCI PCI function into new unit=0D
=0D
 hw/usb/hcd-uhci.h          | 93 ++++++++++++++++++++++++++++++++++++++=0D
 hw/usb/hcd-uhci.c          | 83 ++--------------------------------=0D
 hw/usb/vt82c686-uhci-pci.c | 43 ++++++++++++++++++=0D
 MAINTAINERS                |  1 +=0D
 hw/isa/Kconfig             |  1 +=0D
 hw/usb/meson.build         |  1 +=0D
 6 files changed, 142 insertions(+), 80 deletions(-)=0D
 create mode 100644 hw/usb/hcd-uhci.h=0D
 create mode 100644 hw/usb/vt82c686-uhci-pci.c=0D
=0D
-- =0D
2.26.2=0D
=0D

