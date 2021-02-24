Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F264324720
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 23:48:59 +0100 (CET)
Received: from localhost ([::1]:58450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF2xm-0006Ic-9e
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 17:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF2vn-0004ez-FL
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:46:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF2vi-0005zt-Ur
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:46:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614206810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ihi/nIxyeoiITwZpv3v8Dyscq5/Ffs9NzCdEpLPVomo=;
 b=C9WyXzH2ukqi//o1DFKt017s4XNBo2ow3s6GfbERfb+5vHVne8tQesejC6BPGtf8uUj/RP
 CkHN72GTJny1nFq/8OgLEIjf+/44vKHbJyV1HzMiLpgf2pwBlipOK0NUHszMpEIXd+2wtt
 sA1eVdhsxKyatYNzAaBjM/IrE/AtKW8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-vNKuC2-qOWiqPruTePDWMA-1; Wed, 24 Feb 2021 17:46:46 -0500
X-MC-Unique: vNKuC2-qOWiqPruTePDWMA-1
Received: by mail-wr1-f70.google.com with SMTP id l10so1690767wry.16
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 14:46:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7p1YAiJ2ttcmrDCL+Qu1wlXd8yZTSZSYsZI/WEwrPZE=;
 b=QLe505ZAc8eSa/S6mJnLMDvmfUO+RZQa1KldG6JkFIpLEuUrz5sDnuncquz1ow35sK
 SjjfXbqVSVL489kSsOKGaEyP2FvcNald6pQRk6Q/ig0hxWkyxsT7Up+e4bxzIGIUL0b6
 9PlA6J9BtVk/iTKSkbnQfzmq9lOXEOAn8Yd/cVz5QEp/Ywsv/KkBTTw6ItlfPofHObmJ
 /cerTP330PLspNiyAFEAF0kqvd7qeEl02//HWYzRyjA9TzXJPxU7LpC+4L66mRpRQBfj
 ZlYV8RSroOSCgGfk+NXDPb1wcPS78BQdErcNPLqlyVILAnzgxMKEHjAeUqfhw0kgyg8v
 XNeg==
X-Gm-Message-State: AOAM531ejbSU03o9YJWDr2nQ/zar2tbDcJnbh3R+lcKs9vFhOdWnkCBI
 PGdbVMPaSbdSNy56QTT/vi5umii9GOjmPP1QaNafHpaub/j0pXEhRjhppPRO9YLZaQQPEhG/LkF
 4JRJlNHKc0SPH+v4EqhMjzyCG5u8BjvSRmOQE4+xLP8S7necMe8lU1cAAZLQcAj7F
X-Received: by 2002:a05:600c:2184:: with SMTP id
 e4mr247470wme.107.1614206805240; 
 Wed, 24 Feb 2021 14:46:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjetK/S/xDHlVY1d2WL7Si0va8Tv0mhsJlYck6r2QEkQnEVwOQ5o2tsGaJRV1w+Csgn1WboQ==
X-Received: by 2002:a05:600c:2184:: with SMTP id
 e4mr247451wme.107.1614206805071; 
 Wed, 24 Feb 2021 14:46:45 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a1sm5663774wrx.95.2021.02.24.14.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 14:46:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/4] qapi: Restrict X86 features to X86 targets
Date: Wed, 24 Feb 2021 23:46:39 +0100
Message-Id: <20210224224643.3369940-1-philmd@redhat.com>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v4:=0D
- Rebase on Claudio's work to avoid stub=0D
=0D
This series restrict the 'feature-words' property to the x86=0D
architecture (other archs don't have it), and to system-mode=0D
(user-mode doesn't use it).=0D
=0D
v4: https://www.mail-archive.com/qemu-devel@nongnu.org/msg746628.html=0D
=0D
Supersedes: <20201001144152.1555659-1-philmd@redhat.com>=0D
Based-on: <20210224133428.14071-1-cfontana@suse.de>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  target/i386/cpu: Introduce get_register_enum_32() helper=0D
  target/i386/cpu: Restrict x86_cpu_get_feature_words to sysemu=0D
  qapi: Move X86 specific types to machine-target.json=0D
  qapi/machine-target: Restrict X86 features to X86 targets=0D
=0D
 qapi/machine-target.json   | 45 ++++++++++++++++++++++++++++++++++++++=0D
 qapi/machine.json          | 42 -----------------------------------=0D
 target/i386/cpu-internal.h |  7 ++++++=0D
 target/i386/cpu-softmmu.c  | 36 ++++++++++++++++++++++++++++++=0D
 target/i386/cpu.c          | 45 +++++++-------------------------------=0D
 5 files changed, 96 insertions(+), 79 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


