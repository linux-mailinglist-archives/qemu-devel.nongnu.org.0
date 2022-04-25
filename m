Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EAB50E266
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 15:53:06 +0200 (CEST)
Received: from localhost ([::1]:53266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niz9G-0000kv-0v
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 09:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1niz7D-0007F1-B6
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:50:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1niz7B-0007pt-Tb
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650894657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A5G8HGkXijQ26iYEw+QAA+7ljogUGk0iOYpwjmJKOOM=;
 b=BJjFITBZg86uWNJQGkMDVgJ+a9U+x5lbNM6SxBdW9IubVNFTJUp/Lo6ZYHraw28kQ1EL4K
 Lf3czurAXGLp9MqLXBLMqLt9ot2XZUKCmTXqQ3MA05SroiO+/zthIlU3wA2uVjWv9A5wjc
 IwvYxXub1myMuE6oTLdMaiC25XHhxtA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-KZAVRIwLO5aGopBaansxHg-1; Mon, 25 Apr 2022 09:50:55 -0400
X-MC-Unique: KZAVRIwLO5aGopBaansxHg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A470811E75;
 Mon, 25 Apr 2022 13:50:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F18AE403D1DD;
 Mon, 25 Apr 2022 13:50:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 23E1818003A7; Mon, 25 Apr 2022 15:50:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] i386: firmware parsing and sev setup for -bios loaded
 firmware
Date: Mon, 25 Apr 2022 15:50:48 +0200
Message-Id: <20220425135051.551037-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:=0D
 - rebased to latest master, post-freeze repost.=0D
 - picked up review tags.=0D
=0D
Gerd Hoffmann (3):=0D
  i386: move bios load error message=0D
  i386: factor out x86_firmware_configure()=0D
  i386: firmware parsing and sev setup for -bios loaded firmware=0D
=0D
 include/hw/i386/x86.h |  3 +++=0D
 hw/i386/pc_sysfw.c    | 36 ++++++++++++++++++++++--------------=0D
 hw/i386/x86.c         | 32 ++++++++++++++++++++++++--------=0D
 3 files changed, 49 insertions(+), 22 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D


