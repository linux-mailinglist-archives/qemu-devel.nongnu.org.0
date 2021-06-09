Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971303A1D34
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 20:51:37 +0200 (CEST)
Received: from localhost ([::1]:38416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr3Ie-0007Jh-Mu
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 14:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lr3H9-0006Yl-Dr
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:50:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lr3H7-0003ug-6u
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623264599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bn9rlF3QmucMi7DK3aCqyO5YfjYDAg+y7k9CjHof6PQ=;
 b=S86srwfqlkDP0wHajOmnIh3d8Jk6jX4Cf3XbjPZotvmo1IB2z7yJxKyezH+y/uOclM7Czr
 YkKtXvIoQk71MzLzvUgkaVxpVFQd2Qek/qENLQTZHtLTCcJAul9rCxw+JwPB2sXLLpWPa/
 cO+RxFmDr6YhStHZEYefBQyn7LAupNE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-dZ14Il2-ORmRJww5_6hrlg-1; Wed, 09 Jun 2021 14:49:59 -0400
X-MC-Unique: dZ14Il2-ORmRJww5_6hrlg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so2252233wmh.9
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 11:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QnBijG37r3Hd2By4yopDpoCd+BTyiZSeozKdY2XzCkA=;
 b=N8whTLEiv4Ig4KET+Wsbc0PvP/LkKKC6ja1cmaaQWnwElvU8xoamKPxP6uEDOZVall
 +1/XH+M5oPrmQNL4x9NI5/zYS4rQryT4/MeJeFUebQkp4nJEKa25VcuKIZMXnV7GyvOz
 CL9Ko25cQPFPIn+OY8DzQdLWYkoQuJ5DZAikrBUvzwzwJ3ljipHOI1Gg/krgwZvPNnr3
 V+yhX2o9LXpa0tTV29VCYhKNtqBIs2aaO3dFVkOIjEQTGzHKERbmBCVj4JVjGQeyMYSv
 g2pQlcM6k5GU9clCx+bSZgipsdDRJab5GRQe8jNBUBkiTbYfP2Fu1uBR8Lk1xC2UfJav
 LYhQ==
X-Gm-Message-State: AOAM532AvCLteypN/ZQSnxPtaL5GltCUDWJXT2PhbMB96Mhtr8S4RzRg
 uhoQIZ9p8JN1+TlpCCnXHxI0AiKRl6OnOTy/zwPAjA3E9XMxxlV+MR7w1UmYW0greGzlOtpwm9N
 XZeBhQnjnuP8k+RbXDbXMMx0gjMDAVBpoMQKzcUvJYxQJCisV6iSJqdUqgDtyR9xA
X-Received: by 2002:a05:6000:1a87:: with SMTP id
 f7mr1262343wry.172.1623264597591; 
 Wed, 09 Jun 2021 11:49:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygsnYjvyCUsXZOYkkJtQYZjZsnrokY6cSUQtNRgbplsplq+Ycfnzz7W0ZJiK1TLE4AgQehUg==
X-Received: by 2002:a05:6000:1a87:: with SMTP id
 f7mr1262323wry.172.1623264597340; 
 Wed, 09 Jun 2021 11:49:57 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id 31sm871859wrc.96.2021.06.09.11.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 11:49:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] tpm: Return QMP error when TPM is disabled in build
Date: Wed,  9 Jun 2021 20:49:53 +0200
Message-Id: <20210609184955.1193081-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v1:=0D
- make the qapi schema conditional (Marc-Andr=C3=A9)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  qapi: Inline qmp_marshal_output() functions=0D
  tpm: Return QMP error when TPM is disabled in build=0D
=0D
 qapi/tpm.json            |  9 ++++++---=0D
 monitor/hmp-cmds.c       |  4 ++++=0D
 stubs/tpm.c              | 16 ----------------=0D
 scripts/qapi/commands.py |  4 ++--=0D
 4 files changed, 12 insertions(+), 21 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


