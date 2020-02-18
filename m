Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA210162815
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 15:26:07 +0100 (CET)
Received: from localhost ([::1]:36110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j43p8-0000su-Of
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 09:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55524)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j43ji-0007Y8-SQ
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:20:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j43jh-0007gU-QN
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:20:30 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51746
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j43jh-0007gD-N1
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:20:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582035629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9U22auhEn+jtXpL66oZy02+rsPy7EvtN/pS/BP44Ew4=;
 b=MZXqE88JOsCFIu8xNfT1FQ28FvjnfeAE1YloiT5Zk41oARjdgit9XDrzag+5UTdnBHvZwy
 7ieWWZPXYaWFBeyKM5AbdzJo1b1/hvD7m7GzgpCgcOE1af/NMmk4fR7dmvpxiHFyVxdA4V
 f8fGjz15IJeoa+kpW3UMFNxozjJQHk8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-F4F5Kr_5MkSmEMTYfftfSQ-1; Tue, 18 Feb 2020 09:20:21 -0500
Received: by mail-wm1-f70.google.com with SMTP id z7so127123wmi.0
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 06:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JixWZ4WsNWyfMmD6dkmOBqM7CVCSEFsuH/CpnwvpzlA=;
 b=mMvi+yNtcldZykYHqqeJHuyIWS72nDZsuzMKrbz93A88oD/Mu+DS0tio0HR2ZuHpWb
 W7DpLrl6nqQpJL9UtMHALeNoMChTBL1FtH8AYWadaFfeurwGLn19jt6WC8eFq+W0F+3I
 NPmByMCj5G1citHGoYYiysI3R6tcl96gNhVvs0A0b+BCp0DkjKAlINM0/U/85inFsOWG
 0nSBU/NkqBFUwojNmI0FGNfvBusBSScJE+p6dV+jya5GIcKNrXtUQtoc8SjJ7FNyJKu5
 qfz1IzGnSnlKXSTy4x0DZyG9cE2SPRpii1KjhN4w7RjY8pp6b2myF16OB9Tor19glT8K
 NasA==
X-Gm-Message-State: APjAAAWGUawhfjOFzzotObY7twNfeKAoSqybNgRKV71/xjcEL4qCLsmj
 /elxGoLlOD7wDCQPX70uXqluDqTDlu6ZKxwOSbPYgny4KuUHF/rcT7hAKRNMvMUoUhU/k+rjLl+
 v17n6e+AbHt1Mvp0=
X-Received: by 2002:adf:9427:: with SMTP id 36mr30721843wrq.166.1582035620017; 
 Tue, 18 Feb 2020 06:20:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqxSWIyv7p1UWfSQc6lyUvHd015yyWIG9ejEzMv/2oV55f/S9JqPTe1qGV1utKxE+Va7gTCR6w==
X-Received: by 2002:adf:9427:: with SMTP id 36mr30721826wrq.166.1582035619798; 
 Tue, 18 Feb 2020 06:20:19 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id l6sm3775204wmg.42.2020.02.18.06.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 06:20:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 0/3] travis-ci: Improve OSX coverage
Date: Tue, 18 Feb 2020 15:20:15 +0100
Message-Id: <20200218142018.7224-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-MC-Unique: F4F5Kr_5MkSmEMTYfftfSQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add more packages on the Mojave OSX job (Xcode 10),
and duplicate the job to build on Catalina (Xcode 11).

Each job takes ~34min:
https://travis-ci.org/philmd/qemu/builds/651473221

Philippe Mathieu-Daud=C3=A9 (3):
  .travis.yml: Expand OSX code coverage
  .travis.yml: Build with ncurses on OSX
  .travis.yml: Test building with Xcode 11.3

 .travis.yml | 48 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

--=20
2.21.1


