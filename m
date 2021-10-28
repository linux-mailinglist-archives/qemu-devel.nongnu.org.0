Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E1B43E497
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:08:28 +0200 (CEST)
Received: from localhost ([::1]:58252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg711-0000OX-4g
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg6yG-0006gS-2G
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:05:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg6yB-00078G-VB
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635433530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EnlcKjl2evjL9DtOu4dow+RQJWXPw96+GqKLklK1anc=;
 b=hWnAogi5p18czbMyLCacKsYXhuXP07QV3j7Cnc69UZe9PeUXj/2oTBRsT0kZ1W0l4ehnI9
 6B4Xas3QH9hDg5CnY02XJCA2PjO7f5vzAidn1P1iVu8VDOrSa72LEh6RUZrTDeKUNHbtHi
 Sd4huz3t6t99QT3eiRb4p6zNXyoloSw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-bYMY0FLCPa6OeCAuCu0CNA-1; Thu, 28 Oct 2021 11:05:28 -0400
X-MC-Unique: bYMY0FLCPa6OeCAuCu0CNA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k6-20020a7bc306000000b0030d92a6bdc7so2147911wmj.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U8v4tneqw3Tmztur2N9CW4Crg0G0a1uWQ2ZCXTdVd+E=;
 b=QXQ7EnZxWTxvPdWXp4f8nJjIUOtpWapY3tHolCTttUjNOSgY69tqVOjRnnnysH0sls
 8Tteb6MYXoIYxAySAozonVxdGxDcfLZb3JTBvjhaCyupxOvBQ8EDjNlPOUS6Fi3xzkoO
 Gi89fBdF3X/S00q2Cc2SyVysd5yvjn4zLHG7/F7FzWo3yr/zLPAYbl8qDunSCBWry/0B
 IZQmY30PpOuyaI6w4aiZlKgXS3Gvj9cTz1L1PMIilPZSOhFVUluPLu2OiHMrW/aMOJE9
 rLZUoP7ITMX7vhSGUPv3gExniysR3pqzKfP6MswPjHRr84DA/adca6Rp4ah7XUnmyvHq
 5YwQ==
X-Gm-Message-State: AOAM533Ca8ccP1s6IEvEd/s2lrspo4JpBTaBteaK6PH55bIsFnhP2Du4
 adcOxEV8dMCUaSHoi6setTONnWcRJe1km2tf7d/C8mesfTb+clFaH1LqcrpiMTtsw6mHAhzQSAV
 p3NRw/VtGHbHsNmiwDk+vFvWUnI3iLGU56McE/1JDbZ6vMPdMwWAfnZrDZuQs4z6D
X-Received: by 2002:adf:8b98:: with SMTP id o24mr6452298wra.302.1635433523783; 
 Thu, 28 Oct 2021 08:05:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv+iKWveuZfVjNQ5JRYcmtLgyxPMQDm3hWUI98Wo42YML0JM7yKBlFHw8eg6J21in0EDhW7A==
X-Received: by 2002:adf:8b98:: with SMTP id o24mr6452255wra.302.1635433523520; 
 Thu, 28 Oct 2021 08:05:23 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u16sm3235182wrt.97.2021.10.28.08.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:05:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] hw/core: Restrict qdev-hotplug to sysemu
Date: Thu, 28 Oct 2021 17:05:17 +0200
Message-Id: <20211028150521.1973821-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict various hw/core/ files to sysemu,=0D
add stubs for qdev-hotplug.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/core: Restrict sysemu specific files=0D
  hw/core: Declare meson source set=0D
  hw/core: Extract hotplug-related functions to qdev-hotplug.c=0D
  hw/core: Restrict hotplug to system emulation=0D
=0D
 meson.build             |  4 ++-=0D
 hw/core/hotplug-stubs.c | 34 +++++++++++++++++++=0D
 hw/core/qdev-hotplug.c  | 73 +++++++++++++++++++++++++++++++++++++++++=0D
 hw/core/qdev.c          | 60 ---------------------------------=0D
 hw/core/meson.build     | 33 ++++++++++++-------=0D
 5 files changed, 131 insertions(+), 73 deletions(-)=0D
 create mode 100644 hw/core/hotplug-stubs.c=0D
 create mode 100644 hw/core/qdev-hotplug.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


