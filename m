Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E4B2FD419
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:37:08 +0100 (CET)
Received: from localhost ([::1]:34632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FXf-0005EN-BA
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FW7-0003m0-B0
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:35:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FW4-0004tC-Vs
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611156928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aMW+ffBwf/Rg49CMdxWnPrSyNVGZ5KY5LeqrgDyM/U0=;
 b=Lperpwpzq314ugDzJsMBX2r5saGDh5D/YTExAGG2XT+vXZ0KBOQmA0dhDK2qxXdYpK+xGf
 cYKBOqd3ST5z2A/rPG+g8Ona1HhTQUWKnrUIVBMLC2uFN6mU4TyCy1/VshK3HlyGTo83+d
 riCk+QHba1hOghqGarEtPpIwczzO4PE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-ZxGui2M3PPmdrpaTzhqDHg-1; Wed, 20 Jan 2021 10:35:26 -0500
X-MC-Unique: ZxGui2M3PPmdrpaTzhqDHg-1
Received: by mail-ed1-f69.google.com with SMTP id g14so11296994edt.12
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 07:35:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aMW+ffBwf/Rg49CMdxWnPrSyNVGZ5KY5LeqrgDyM/U0=;
 b=srKI212TVRSVjA7kFXQYIx11N2XkP1BOtJAbep/8s1jfdWhhwk3H3dq5tVarofIBeJ
 vGRKTYDu2woVD82gK8zu4Pd3TmkA9kJJNFtpZd+3lidctdSRdG0XrASrA+5vXTv3rEnS
 xsAs0flFQGKN9Qw8vPVEAOAC0KAuPHXXpOBDFfYjBi1AJCna0+DqL8UlJdTGUZv+vy2R
 yM15dCrDTFNNi3G9BFQXl8DrZD8zjJWV+2p9PfXn3k5k43Ny8mzA64HQ9r1jcCjKfC43
 PreBatIgtzbEpdFDHrs9/6ztlDPmvtSLWyS9uJiZIkGV+8wS/oWegRlepENYb4thXtG3
 Zl/w==
X-Gm-Message-State: AOAM531xr8F2mFLJ2MygjgbZAqYAp0JDQ987Oqi9WRrFmOA+VwNw4mwS
 I0RRj79ptjs9/26Sfb77gqrrArz0mCcs3prRCF7fdwaPOLPxEWKagsPSU6l3Lb7A5Wq4HJOK8Gj
 9Em6bpCMs1MU9s3+aZRgTyV3nHor6HFxf+J0InC4TOcCjGy0c9shUePsCccRUMQ3Y
X-Received: by 2002:a17:906:1d1a:: with SMTP id
 n26mr6741157ejh.481.1611156925222; 
 Wed, 20 Jan 2021 07:35:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGTtqFvD0HEhRbQ3OKGIfaDBwPJAySoG7y++7qza6vCqhrbgRz82ncf7M7i1LUdTZ/oqj6iA==
X-Received: by 2002:a17:906:1d1a:: with SMTP id
 n26mr6741136ejh.481.1611156924986; 
 Wed, 20 Jan 2021 07:35:24 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z13sm1325122edc.73.2021.01.20.07.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 07:35:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] hw/usb/dev-uas: Fix Clang 11
 -Wgnu-variable-sized-type-not-at-end error
Date: Wed, 20 Jan 2021 16:35:19 +0100
Message-Id: <20210120153522.1173897-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
with "Invalid Request - parameter not supported".=0D
=0D
v2: Include Eric feedbacks=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (3):=0D
  scsi/utils: Rename 'illegal request' -> 'invalid request'=0D
  scsi/utils: Add INVALID_PARAM_VALUE sense code definition=0D
  hw/usb/dev-uas: Report command additional adb length as unsupported=0D
=0D
 include/scsi/utils.h | 22 ++++++++++++----------=0D
 hw/usb/dev-uas.c     | 12 +++++++++++-=0D
 scsi/utils.c         | 25 +++++++++++++++----------=0D
 3 files changed, 38 insertions(+), 21 deletions(-)=0D
=0D
--=3D20=0D
2.26.2=0D
=0D


