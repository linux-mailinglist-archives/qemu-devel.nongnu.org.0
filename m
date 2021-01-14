Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD812F6847
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:51:56 +0100 (CET)
Received: from localhost ([::1]:54784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06mp-0004bT-6L
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:51:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06gY-0000ZC-7A
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:45:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06gQ-0005pS-64
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:45:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610646317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hCRdHMuvIjkHfmUL0wBzXX0wst9lZhq4y/szAZQIdCA=;
 b=SJeD9Ixb8sTakHXmowgZOQBHbbUjNyi8FQwMzgWiVVF2JUtiYE3Z44p13BTYW2809nDIs6
 2Fbl1cKnLqJiN2DhE9z/+gUE6dyPpj93mKfrk3q9U7P0nrLj6R7IcJCy7SSsqjaFurjJCI
 55/Tih6u3D6VsUP+0cLOZbT2ZIrBh4s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-13EKNTQ3MECx-RTsCWOV9w-1; Thu, 14 Jan 2021 12:45:13 -0500
X-MC-Unique: 13EKNTQ3MECx-RTsCWOV9w-1
Received: by mail-wm1-f69.google.com with SMTP id h21so2153535wmq.7
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 09:45:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=28ejum3b2Tc7/JeVKDhX1iaRIAGxTb2jksrAD6v9rE0=;
 b=IDx50QXnF31AT7VXCjJ5AmUhQGHQoH0dX7qAXY94B0Z8IKZBmJKZB+dn7brwMSQlV3
 OyuUuwrrmIXepNCb5vrr3x/7HChteRQjX1piNjw3tRtug0pFaLQ2f/NX9vKwBMwfjrsw
 RC93jkhO2YJ1D3iHuFCcvVQlXyrk9fe5qU7+NHbozwcTLchytAe6cpoBz3JoPQAVsfKo
 DDlffSmoI8y7SV45v2rtWAf9Cax+O5bzlaeuxitPo2bKr50JODFQRK5ntRpvdO3G4BpO
 jj6d5VZzgc1mYgQrLLB+11E07t1/xzHeKGDHALH/RLJUDofJJ7TxNI2jcRVhDwxVXzrp
 HoqA==
X-Gm-Message-State: AOAM530NezsvPBdA2Up5Uu4IdlaY9jltp4yXVK6FCAaLw85H5/RFDKti
 bON4uuXLuxH5o7OvIXylqovIqqdPBkXCKq9psQwVwEoukBhAKhU/prXgl1jYhDQDwvy6TEvXKmO
 1K0FQ11hQn9R3/ylBs6Zoh59U0N5tBcBJTuMssZAGlAO3qtZ5KmWXy7D4QuYc6XE/
X-Received: by 2002:a5d:5704:: with SMTP id a4mr9120448wrv.37.1610646311953;
 Thu, 14 Jan 2021 09:45:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkpWc5pHJQVncHTQLKOQil5M4nbUg4SzxAGSriFdb+SpDhVmbDdZl/PVehok9Ei98bswExYw==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr9120427wrv.37.1610646311758;
 Thu, 14 Jan 2021 09:45:11 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w13sm10828409wrt.52.2021.01.14.09.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 09:45:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] meson.build: Fix bzip2 program detection for EDK2 blobs
 installation
Date: Thu, 14 Jan 2021 18:45:07 +0100
Message-Id: <20210114174509.2944817-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the following error when bzip2 program is not installed:=0D
=0D
  ../pc-bios/meson.build:5:2: ERROR: Program 'bzip2' not found=0D
=0D
(First patch easier to review using 'git-diff --ignore-all-space').=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  meson.build: Declare global edk2_targets / install_edk2_blobs=0D
    variables=0D
  meson.build: Detect bzip2 program=0D
=0D
 meson.build                     | 10 ++++++++++=0D
 pc-bios/descriptors/meson.build | 30 ++++++++++++++++--------------=0D
 pc-bios/meson.build             |  6 +-----=0D
 3 files changed, 27 insertions(+), 19 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


