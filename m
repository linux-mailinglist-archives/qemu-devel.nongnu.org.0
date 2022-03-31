Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471FF4ED627
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 10:47:25 +0200 (CEST)
Received: from localhost ([::1]:41692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqSi-0008H5-C2
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 04:47:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nZqHh-0002Wc-Sg
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:36:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nZqHd-00064B-W7
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648715756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1n5mZCOBNDCxhfslToSZLSKMPj/OD/aNFZgyW9iynnI=;
 b=a99anpyR2eNg9VoCNhLZ1oblWnNbbHxip/tWvCFctFSfleLzkybtazbK7M5zgJNs5ccSCY
 MZdnDvkmIVUuWiU9D2++oyS6OdWeYoO5bqdMlnEiEv2z6vFLSOG7mapOJC6KZDK+oRrBCN
 FDH79oV3C5aFg6YO1KN99igTgMzHWnw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-9gLzl9PKMwGOnS3KRmDvVw-1; Thu, 31 Mar 2022 04:35:51 -0400
X-MC-Unique: 9gLzl9PKMwGOnS3KRmDvVw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F43D3820543;
 Thu, 31 Mar 2022 08:35:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAD7258D864;
 Thu, 31 Mar 2022 08:35:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 649AC18000B3; Thu, 31 Mar 2022 10:35:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] i386: firmware parsing and sev setup for -bios loaded
 firmware
Date: Thu, 31 Mar 2022 10:35:46 +0200
Message-Id: <20220331083549.749566-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

=0D
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
--=20=0D
2.35.1=0D
=0D


