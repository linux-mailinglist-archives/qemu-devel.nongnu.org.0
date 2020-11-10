Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF96F2AD5F9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 13:17:54 +0100 (CET)
Received: from localhost ([::1]:51206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcSav-0001Qu-Rj
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 07:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcSZL-000096-KC
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:16:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcSZJ-0000gx-K5
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:16:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605010572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qhKuMcdIuP13M89GGZxUWxYys4ng23qIfJ0VJRwR7Ps=;
 b=QU/j8jlx3pIUQ+VDGIb6TMy+hcrdoAMicQu6NPKpeUlDj3naFOTtyB3Kzs+q4EYOMsWvMP
 2rj0PCrqWt+caRWFmG7L/PfRkqw2FwDtaNoI+EXSoUx42vkAtIlROCTthRqBwJvAT2Yl0t
 3PQsCUjEheX2hRUe/uULdybTKvUkAtU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-ZFR7qE0TOMapsQKxmywkAg-1; Tue, 10 Nov 2020 07:16:09 -0500
X-MC-Unique: ZFR7qE0TOMapsQKxmywkAg-1
Received: by mail-wr1-f71.google.com with SMTP id r16so5597534wrw.22
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 04:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+iLyKApZQbGsA8YU23XaxsjDnJGdiDOHwCgDRAMwZww=;
 b=Xk3ZBByn6CTZy/i7QhKsvb4TpIKhllbA48iEaMkDNg/ZyghtNwJZrIn6BxQggMLrqZ
 uDr1OQWVluTIz/e9VCQFF937LXih2qL30qcRAPeVcQLoUGApR99HV/J2efwFegU0LZQG
 qYN2wXfQmQRewqpaaU8gImvag8vNYZ1BPTToiIHEEdIVgLgABDOAUQ35O5pL1YRfxjj2
 QwIf5Rif53eKfn9MWW7cCs2bikDYQfzdy0K6EjVNQqGo5ltM/jWtrqU2E9pVeNZhD438
 bSse/qjYP2+VJssQDuW4P+KRezt8VXysgRneiJaUrL+d6Uz/gI1HKELkym9wyhSGsv1k
 gE4w==
X-Gm-Message-State: AOAM530tbigYcYXLnjhEC3Vf28DFt8a51p7wXfbxM4EDXrqq5xHMZxq7
 nDX27opL3+rcHAXHy0RIkbnSzBwrjdNhKqW3jfEBKBZG0w6ikxc64pM6d23CUZ2KkJXTkLEnghk
 dkYRUuP1Ltumk+opIeuNKnmyWinON4lpov7gT9DlKF/XKqWD0b4g91cFY+/NhJBnF
X-Received: by 2002:a5d:6b0e:: with SMTP id v14mr3226343wrw.394.1605010568479; 
 Tue, 10 Nov 2020 04:16:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyVQOwvw24Out8Fv3rp4N5F1hLzXGZ2LFxDFLC1u7yCSLem3Cd5o/Slf2VPUHNP7OadnRdkw==
X-Received: by 2002:a5d:6b0e:: with SMTP id v14mr3226317wrw.394.1605010568236; 
 Tue, 10 Nov 2020 04:16:08 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id u23sm2880841wmc.32.2020.11.10.04.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 04:16:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 0/2] gitlab-ci: Fix EDK2 & OpenSBI jobs
Date: Tue, 10 Nov 2020 13:16:04 +0100
Message-Id: <20201110121606.2792442-1-philmd@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We had rules to restrict building the EDK2 & OpenSBI firmwares=0D
on GitLab CI. Unfortunately commit 922febe2 ("Move edk2 and=0D
opensbi YAML files to .gitlab-ci.d folder") made these rules=0D
ineffective. Fix that. In particular avoid the EDK2 job burn=0D
all free minutes for our fork users.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  gitlab-ci: Avoid running the OpenSBI job when not necessary=0D
  gitlab-ci: Avoid running the EDK2 job when not necessary=0D
=0D
 .gitlab-ci.d/edk2.yml    | 11 ++++-------=0D
 .gitlab-ci.d/opensbi.yml | 13 -------------=0D
 2 files changed, 4 insertions(+), 20 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


