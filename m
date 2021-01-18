Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774332FA74C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:20:40 +0100 (CET)
Received: from localhost ([::1]:44544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YCj-0003h5-E7
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:20:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Xvx-0006MS-Rk
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:03:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Xvw-0007VB-0O
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610989395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8WO21njcC54MNJmTWfbZpNRQ9Hj/WlpW8gPPICWao70=;
 b=YbWnCwDiqdj0cfK4cDnWgmSrIDG7uqLeBEQgGEr5xwbFq2KAyQfAktfiEQNI+aolUkFRz5
 q1C/gx3teCEISkXzyq/nerWZsHaXnOU6GhF5yDov8OCHpB7OBBlIdrIYrcvKth4H+EqqGm
 kCca9Xp6WDZ9ilCawpn/iiybSp33kjg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-eVuLFCzLOx-1Db-9zGB0NQ-1; Mon, 18 Jan 2021 12:03:12 -0500
X-MC-Unique: eVuLFCzLOx-1Db-9zGB0NQ-1
Received: by mail-ej1-f71.google.com with SMTP id z2so1008460ejf.3
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 09:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8WO21njcC54MNJmTWfbZpNRQ9Hj/WlpW8gPPICWao70=;
 b=iUZF4lyAW5lp44eJKMC77sfbKpIvnU0Qop2Jo9KERK2lmUBJSwjw0dWN2dlCUUsmrK
 ZHg7TZ10DHoDqPis6b2SmUU2YZlvkYYX+Jmsew17V8NEWRoSQ/gbJdv7Nj+xOsiXKTlX
 0BV9PJGjSE94RfH9xHIKB86q1wC9RAS7573Bnnxb+/1FnHTKYNzLD3Mq5wsoZ2eKfdgM
 bKQIXixc9pm0wqsZuJc6/1+SSpFXwCogcr7slRPlAGrVxDP+gyG8ZbEC9vI1ggQ22SbJ
 XKez+ZM2nX+BSnu+8GVK2Tsd6U+WVvdSOvmTXPRefoU/Ka3eSKcpc4LUVWvNDTGuMIW4
 svpw==
X-Gm-Message-State: AOAM5330zQfeAwKYccg0eq1Xs6X7D6y+CE3WxT3Gg7vQs7SmACgRUccf
 fHNsik9z5HLhiKxxryOGIeMwu07fEiIp98GGN6juiBp/U7iyOZXSTyhX71FNlDxd//E/UGFFL6Q
 jgGEi94Sy4h1JRVGWD4D1g8Pzg+RUEAQH5y92wuyfuyJpzAE7uJ2hUpdYyokHKLSb
X-Received: by 2002:aa7:c849:: with SMTP id g9mr349619edt.48.1610989391233;
 Mon, 18 Jan 2021 09:03:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvkqa+PhbVYstZWAmFolbjIMIUCgX3j6keLtELmG+vL5kTv/BIBT4b7DT684OdX65qQZ1sHQ==
X-Received: by 2002:aa7:c849:: with SMTP id g9mr349594edt.48.1610989391000;
 Mon, 18 Jan 2021 09:03:11 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k27sm650221eje.67.2021.01.18.09.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 09:03:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/2] hw/usb/dev-uas: Fix Clang 11
 -Wgnu-variable-sized-type-not-at-end error
Date: Mon, 18 Jan 2021 18:03:06 +0100
Message-Id: <20210118170308.282442-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Another attempt to fix the following Clang 11 warning:=0D
=0D
  usb/dev-uas.c:157:31: error: field 'status' with variable sized type 'uas=
_i=3D=0D
u' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-va=
ri=3D=0D
able-sized-type-not-at-end]=0D
      uas_iu                    status;=0D
                                ^=0D
If a guest send a packet with additional data, respond=0D
with "Illegal Request - parameter not supported".=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (2):=0D
  scsi/utils: Add INVALID_PARAM_VALUE sense code definition=0D
  hw/usb/dev-uas: Report command additional adb length as unsupported=0D
=0D
 include/scsi/utils.h |  2 ++=0D
 hw/usb/dev-uas.c     | 12 +++++++++++-=0D
 scsi/utils.c         |  5 +++++=0D
 3 files changed, 18 insertions(+), 1 deletion(-)=0D
=0D
--=3D20=0D
2.26.2=0D
=0D


