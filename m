Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF0330CD85
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:01:48 +0100 (CET)
Received: from localhost ([::1]:60260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72nz-00037H-9U
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72kr-0001cg-HV
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:58:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72kp-0006gZ-O1
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612299511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+5EU6IUHSSVAP75S11BuMPh0VJgRb2HAZD6TafGqjV4=;
 b=W6HrHAEJPA/46IR69T91wj80myCDfbO9fehfXFaLDFyVnH38pd+6/VvGOr4m90jJ8bo6ZL
 yeMh9ORIm/ThKfR+z51dB1klhya2WYXDmt9WbsU8kduovuVAgrjVsryRlshJidsYppGKbV
 Pm7F2uxiKADTHAJ0guYpoF4vyXz7afY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-cj5cREV9NZeZbsOwENFvxA-1; Tue, 02 Feb 2021 15:58:29 -0500
X-MC-Unique: cj5cREV9NZeZbsOwENFvxA-1
Received: by mail-ed1-f70.google.com with SMTP id f21so10265206edx.23
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 12:58:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GvOiC9p7woFlABFWec5avMQ3lBeTnffgR1R0CtvLVWM=;
 b=pSlzGColvDFvrYA1Z2iAHkRdIRJnIFGhgAHbJkkxBRhJ3WdsvTUHwhG5fJSVo/85R4
 1B4AFZbAyj3AnL8ZjiFv20FyYZ/9760K/46fDcUOkmNfw+RqDtCzT0sy29MUHaaW4Ovi
 1bxMVj1ZaaA9knK6/4N+9RC2Y9HQNhTWTe4HX8kvRsUxhTTLgZ79P0YWI65oR2MY+1zn
 4Bet7MYmBmZMqeEFSxFFz0iLuJffCuuoribZpLGsUydz6eOTcWXUEcL84fpYY5hgT2Xk
 PCjvsbdfOBwUkO/XvLQviPgG9CsTciXFU0fxt/kVMS4gdfc8uH7n4LHala+wntEnAfil
 KNZw==
X-Gm-Message-State: AOAM532Kc9W+MshzIRWRRkWMn76NWtOw2D3fFquAIVImD+nMm83hmLUi
 0jt6AwHb5pwIZotEQz4z5d1BM+WMGGiL7EKQpKqrQyNHr99Q999LWxkg2OFYFp60kNBLfb2yb1f
 5i5ShqMj4k63IYKLCVo/wN8bPTUxvtZUSyK6sdmrK4ON3jw1g81o/nSswclLbyi4u
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr740818edb.240.1612299507993; 
 Tue, 02 Feb 2021 12:58:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxu7PgmAUw73qZjGg4SMOHhOe4W/D9ztV8imKIkgZfadEl/GrOgFycQex5j1yoUrIuMVQQS8A==
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr740784edb.240.1612299507681; 
 Tue, 02 Feb 2021 12:58:27 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id f3sm870341edt.24.2021.02.02.12.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 12:58:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/12] misc: Replace the words 'blacklist/whitelist'
Date: Tue,  2 Feb 2021 21:58:12 +0100
Message-Id: <20210202205824.1085853-1-philmd@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your=0D
Open Source Projects" guidelines [*] and replace the words "blacklist"=0D
and "whitelist" appropriately.=0D
=0D
[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md=
=0D
=0D
Philippe Mathieu-Daud=C3=A9 (12):=0D
  ui: Replace the word 'whitelist'=0D
  qga: Rename config key 'blacklist' as 'denylist'=0D
  qga: Replace '--blacklist' command line option by '--denylist'=0D
  qga: Replace the word 'blacklist'=0D
  tools/virtiofsd: Replace the word 'whitelist'=0D
  scripts/tracetool: Replace the word 'whitelist'=0D
  scripts/device-crash-test: Replace the word 'whitelist'=0D
  seccomp: Replace the word 'blacklist'=0D
  qemu-options: Replace the word 'blacklist'=0D
  tests/qemu-iotests: Replace the words 'blacklist/whitelist'=0D
  tests/fp/fp-test: Replace the word 'blacklist'=0D
  hw/vfio/pci-quirks: Replace the word 'blacklist'=0D
=0D
 docs/interop/qemu-ga.rst              |  4 +-=0D
 hw/vfio/pci.h                         |  2 +-=0D
 qga/guest-agent-core.h                |  2 +-=0D
 hw/vfio/pci-quirks.c                  | 14 ++---=0D
 hw/vfio/pci.c                         |  4 +-=0D
 qga/commands-posix.c                  | 14 ++---=0D
 qga/commands-win32.c                  | 10 ++--=0D
 qga/main.c                            | 78 +++++++++++++++------------=0D
 softmmu/qemu-seccomp.c                | 16 +++---=0D
 tests/fp/fp-test.c                    |  8 +--=0D
 tests/test-qga.c                      |  8 +--=0D
 tools/virtiofsd/passthrough_ll.c      |  6 +--=0D
 tools/virtiofsd/passthrough_seccomp.c | 12 ++---=0D
 ui/console.c                          |  2 +-=0D
 ui/vnc-auth-sasl.c                    |  4 +-=0D
 hw/vfio/trace-events                  |  2 +-=0D
 qemu-options.hx                       |  4 +-=0D
 scripts/device-crash-test             | 30 +++++------=0D
 scripts/tracetool/__init__.py         |  2 +-=0D
 tests/data/test-qga-config            |  2 +-=0D
 tests/qemu-iotests/149                | 14 ++---=0D
 tests/qemu-iotests/149.out            |  8 +--=0D
 22 files changed, 128 insertions(+), 118 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


