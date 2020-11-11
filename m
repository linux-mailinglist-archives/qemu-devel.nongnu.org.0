Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB6A2AF055
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:15:02 +0100 (CET)
Received: from localhost ([::1]:57426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcp1e-0006rG-6G
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcozX-0005QY-OI
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:12:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcozS-0007tM-OK
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605096761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lIDysiBw9uWe/MMbxk26bh6CAUxyyCpaQF01ulg5u0M=;
 b=et/TLEmdTJbEbyvVkBlWKbhh7kCE2w5y5fvJWcxWgSQRK3EGRP0FcNllW9WiQYFpUC5wcr
 K2Rb66oU9vk0mxmZFwXqX46+IqEHSarPa+c1XAeMu6oH2kt6oiYIPPr5HD+Jn/NAo3zzsJ
 +vfntRoDgR7vJ/0OqMbjyWqMK6l65nk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-QPNNcxtBN2e3yN0m900ceg-1; Wed, 11 Nov 2020 07:12:38 -0500
X-MC-Unique: QPNNcxtBN2e3yN0m900ceg-1
Received: by mail-wm1-f72.google.com with SMTP id y26so691319wmj.7
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 04:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cVFoCcTENWRrbObTpOMpDtj36SrO6eaIMnyEwwgRPqQ=;
 b=dHDOoqw9SrPF+2yVlWKAYc74DZzsUHbKt9un0NapsDkGnga/MGj2/zBImSapi5YzI0
 EdD3GNwFreWDOH52kQegHVNUPMaUUrEGyL7V2RZKC9dZ3/I+gJPb5tZkW1mqklAzIVUl
 rdVaMQPGIEMWF5AeSA6sFSvEomf23XJOMdK1tdfzneBLmAH6gjrwDJdfHeI4pOIwQyUY
 L56yYowRQaakOh4+TOdYpd32tfOMb6JKMX7zDLcQ5vsi56vkQHMVD3uFNRlQTco41BZd
 WkNk3Lo0xMRkP45lRS4DHEHwR8Z5bDuSpjV/1UyODkguraixStLjnzFlF13krFP4aZtI
 /nTw==
X-Gm-Message-State: AOAM530kQ8IqaATq9YCocQxPn8+UWYZbvTxlLrMoOF9KWguk4LBguYU5
 WYQOMvV0rcXduQxp/OHRuoph0pPkNzRzva3/kx3bFEjTIGlpt+XzDekti/DkRYFWsPkHGGHipeU
 qpFseJpoMAISu45o5RiOwQKrZ1K4+frkkHR/sPs7pC66avI9t0Mpc/u6T18mOSest
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr17919184wrg.366.1605096756919; 
 Wed, 11 Nov 2020 04:12:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwp7/iMad2E5j7GakZIFGq/YG12QrLF9DMj2S5e6bTtE1nea3pwAAhXXMGnioXOZvd8crc7Jw==
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr17919157wrg.366.1605096756652; 
 Wed, 11 Nov 2020 04:12:36 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f19sm2306448wml.21.2020.11.11.04.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 04:12:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2? v5 0/2] ci: Move trace backend tests across to gitlab
Date: Wed, 11 Nov 2020 13:12:32 +0100
Message-Id: <20201111121234.3246812-1-philmd@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extracted from "ci: Move various jobs from Travis to GitLab CI":=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg758314.html=0D
=0D
v5:=0D
- addressed Wainer's review comment=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  tests/docker: Install liblttng-ust-dev package in Ubuntu 20.04 image=0D
  gitlab-ci: Move trace backend tests across to gitlab=0D
=0D
 .gitlab-ci.yml                             | 18 ++++++++++++++++++=0D
 .travis.yml                                | 19 -------------------=0D
 tests/docker/dockerfiles/ubuntu2004.docker |  1 +=0D
 3 files changed, 19 insertions(+), 19 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


