Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE2D5F662F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 14:37:25 +0200 (CEST)
Received: from localhost ([::1]:58822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogQ7v-0000gx-If
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 08:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogPDh-0004hg-4O
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:39:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogPDe-00012k-CI
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665056353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=RLv3Skm6In/z7JEz+lRwJPoMxDya9qW19tLSqDnzgOE=;
 b=ZGAQuAACDYRmNHfk5urzuySI7dx9H4Z2yoW8bfFcYN01YP5R5uK0YvFKnyhR/ugVLqZ+CZ
 WSjfCqDbT4fmXMTMPTifS0o1WhKuaQH0pRlLaCZFkCkGxhsMWqbXlXyR1tJf3GAGQOerSB
 RTokYVlDQ7ltUEyvzB8E5icNelFG6y0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-601-Y22_gL_VP_SFGPvPNyPPWg-1; Thu, 06 Oct 2022 07:39:12 -0400
X-MC-Unique: Y22_gL_VP_SFGPvPNyPPWg-1
Received: by mail-wr1-f72.google.com with SMTP id
 s4-20020adfbc04000000b0022e03fc10a9so422054wrg.15
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 04:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RLv3Skm6In/z7JEz+lRwJPoMxDya9qW19tLSqDnzgOE=;
 b=c6HLkqv0tViN/nh2dB/pGDQiH40NMjIeD3ZtCTKmeE8h1I/Z/uV4e3BIUuIyVGaoRw
 DbV92/xgIVA/mWqvBeQCm0RufOq16726zBV2cPhxkH2e/ERNpWwG3LqBDYlfGPzJ7zp8
 cYM242x3j/8tiqbo73vYVXS9rumRpgV5/TSrdG/8B7os2xdWQuTF2tZJklfr3eUkSzhF
 ArxFk3/FXFJSSKp8sPK8TLLbBw+6EMqnZs07VG0ElHhNln9xTc7W2vGfpWwbIAknAq/X
 M8BcNF2IcUXUZni1AOPgtXbPPiFTxD4T/XawhizOSb8Q2kVFeUfJr1u9WfqDY86mhh7Z
 m7rA==
X-Gm-Message-State: ACrzQf1FRQwbOiwkpFIVHTC0MQkHOFZp/UhnE608jaagMpdbF/pNRI1n
 C8FxRsVqxBJ8hBY6ZiCArCDjwZ4QPAXGelNbiWuPd2c1i1ZNdDmruM1NuD9Ee1WlVw5O67SLmir
 kToUMyY5I7fm2atCAeJ/HFehl3DT8qV8L2gJgQtYRV2gMtpQn4QxQe4wg1hvp
X-Received: by 2002:a05:600c:600c:b0:3c0:2c86:3f22 with SMTP id
 az12-20020a05600c600c00b003c02c863f22mr2746847wmb.56.1665056351394; 
 Thu, 06 Oct 2022 04:39:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM44QxHuHinMmWE6Yx59sPpuAd+UyATSHpYtl1ZGwwNBP3Ts+Le0cFlzLi+lt68M92SIhYYneA==
X-Received: by 2002:a05:600c:600c:b0:3c0:2c86:3f22 with SMTP id
 az12-20020a05600c600c00b003c02c863f22mr2746833wmb.56.1665056351142; 
 Thu, 06 Oct 2022 04:39:11 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 n16-20020a7bcbd0000000b003b483000583sm4462032wmi.48.2022.10.06.04.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 04:39:10 -0700 (PDT)
Date: Thu, 6 Oct 2022 07:39:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] gitmodules: recurse by default
Message-ID: <20221006113906.179963-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The most commmon complaint about submodules is that
they don't follow when one switches branches in the
main repo. Enable recursing into submodules by default
to address that.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 .gitmodules | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/.gitmodules b/.gitmodules
index aedd9a03d4..5f32332aff 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -1,69 +1,92 @@
 [submodule "roms/seabios"]
 	path = roms/seabios
+	recurse = true
 	url = https://gitlab.com/qemu-project/seabios.git/
 [submodule "roms/SLOF"]
 	path = roms/SLOF
+	recurse = true
 	url = https://gitlab.com/qemu-project/SLOF.git
 [submodule "roms/ipxe"]
 	path = roms/ipxe
+	recurse = true
 	url = https://gitlab.com/qemu-project/ipxe.git
 [submodule "roms/openbios"]
 	path = roms/openbios
+	recurse = true
 	url = https://gitlab.com/qemu-project/openbios.git
 [submodule "roms/qemu-palcode"]
 	path = roms/qemu-palcode
+	recurse = true
 	url = https://gitlab.com/qemu-project/qemu-palcode.git
 [submodule "roms/sgabios"]
 	path = roms/sgabios
+	recurse = true
 	url = https://gitlab.com/qemu-project/sgabios.git
 [submodule "dtc"]
 	path = dtc
+	recurse = true
 	url = https://gitlab.com/qemu-project/dtc.git
 [submodule "roms/u-boot"]
 	path = roms/u-boot
+	recurse = true
 	url = https://gitlab.com/qemu-project/u-boot.git
 [submodule "roms/skiboot"]
 	path = roms/skiboot
+	recurse = true
 	url = https://gitlab.com/qemu-project/skiboot.git
 [submodule "roms/QemuMacDrivers"]
 	path = roms/QemuMacDrivers
+	recurse = true
 	url = https://gitlab.com/qemu-project/QemuMacDrivers.git
 [submodule "ui/keycodemapdb"]
 	path = ui/keycodemapdb
+	recurse = true
 	url = https://gitlab.com/qemu-project/keycodemapdb.git
 [submodule "roms/seabios-hppa"]
 	path = roms/seabios-hppa
+	recurse = true
 	url = https://gitlab.com/qemu-project/seabios-hppa.git
 [submodule "roms/u-boot-sam460ex"]
 	path = roms/u-boot-sam460ex
+	recurse = true
 	url = https://gitlab.com/qemu-project/u-boot-sam460ex.git
 [submodule "tests/fp/berkeley-testfloat-3"]
 	path = tests/fp/berkeley-testfloat-3
+	recurse = true
 	url = https://gitlab.com/qemu-project/berkeley-testfloat-3.git
 [submodule "tests/fp/berkeley-softfloat-3"]
 	path = tests/fp/berkeley-softfloat-3
+	recurse = true
 	url = https://gitlab.com/qemu-project/berkeley-softfloat-3.git
 [submodule "roms/edk2"]
 	path = roms/edk2
+	recurse = true
 	url = https://gitlab.com/qemu-project/edk2.git
 [submodule "slirp"]
 	path = slirp
+	recurse = true
 	url = https://gitlab.com/qemu-project/libslirp.git
 [submodule "roms/opensbi"]
 	path = roms/opensbi
+	recurse = true
 	url = 	https://gitlab.com/qemu-project/opensbi.git
 [submodule "roms/qboot"]
 	path = roms/qboot
+	recurse = true
 	url = https://gitlab.com/qemu-project/qboot.git
 [submodule "meson"]
 	path = meson
+	recurse = true
 	url = https://gitlab.com/qemu-project/meson.git
 [submodule "roms/vbootrom"]
 	path = roms/vbootrom
+	recurse = true
 	url = https://gitlab.com/qemu-project/vbootrom.git
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
+	recurse = true
 	url = https://gitlab.com/libvirt/libvirt-ci.git
 [submodule "subprojects/libvfio-user"]
 	path = subprojects/libvfio-user
+	recurse = true
 	url = https://gitlab.com/qemu-project/libvfio-user.git
-- 
MST


