Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A79F3F7060
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:27:09 +0200 (CEST)
Received: from localhost ([::1]:57900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInJT-0000D4-Ty
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDM-00018X-Fm
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:20:48 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:38398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDK-0008Ss-BX
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:20:48 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 2B6343F79D
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876044;
 bh=q96TVX4ejPqQ/WVyrThzhivLExFtUSc5OwvG4EZ2XJg=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=qxG4KEuDW67ZSzOh6QFQXObk6Jw+4flK8FJ6J66NZvm86ps6+T52yVYIG9t9/DBAm
 ZD/QwWV5MgkLwHDXT9spDsVREUG9rVjcohDZAuV1ROlWOip6+kI/z/oqJrMonPHK32
 x4MfsCkSzSodRt6AR/z8s1/4OKVhKPCfhbzKQdMTaIzr2/TEA17lGKoqphJtB/e+Bz
 I6pRoS3+4RVD82Gww3kr+n9rKXw5i/mhTLb0Kx+o0yj4PSLioeu83+q1+D+JXnvf/v
 eS/fPB5T/BPCZ6Q3CHG8RDjcqmvRRMqoMHE4sPKKIFs4uE6EZNcUmmdOYG6dLVh+gf
 jzjoiD1l9sfCQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 22B8C2E817C
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:20:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:12:18 -0000
From: Thomas Huth <1923497@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ebdavison imammedo th-huth
X-Launchpad-Bug-Reporter: Ed Davison (ebdavison)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161825934506.9582.2393035423485633300.malonedeb@chaenomeles.canonical.com>
Message-Id: <162987554051.12583.9248793626718430418.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1923497] Re: bios_linker_loader_add_checksum: Assertion
 `start_offset < file->blob->len' failed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: 3b5df1786f48df170a11d5159a492dea0e3b8455
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1923497 <1923497@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1923497

Title:
  bios_linker_loader_add_checksum: Assertion `start_offset <
  file->blob->len' failed

Status in QEMU:
  Fix Released

Bug description:
  Trying boot/start a Windows 10 VM.  Worked until recently when this
  error started showing up.

  I have the following installed on Fedora 33:
  qemu-kvm-5.1.0-9.fc33.x86_64

  This is the error:

  Error starting domain: internal error: process exited while connecting
  to monitor: qemu-system-x86_64:
  /builddir/build/BUILD/qemu-5.1.0/hw/acpi/bios-linker-loader.c:239:
  bios_linker_loader_add_checksum: Assertion `start_offset <
  file->blob->len' failed.

  Traceback (most recent call last):
    File "/usr/share/virt-manager/virtManager/asyncjob.py", line 65, in cb_=
wrapper
      callback(asyncjob, *args, **kwargs)
    File "/usr/share/virt-manager/virtManager/asyncjob.py", line 101, in tm=
pcb
      callback(*args, **kwargs)
    File "/usr/share/virt-manager/virtManager/object/libvirtobject.py", lin=
e 57, in newfn
      ret =3D fn(self, *args, **kwargs)
    File "/usr/share/virt-manager/virtManager/object/domain.py", line 1329,=
 in startup
      self._backend.create()
    File "/usr/lib64/python3.9/site-packages/libvirt.py", line 1234, in cre=
ate
      if ret =3D=3D -1: raise libvirtError ('virDomainCreate() failed', dom=
=3Dself)
  libvirt.libvirtError: internal error: process exited while connecting to =
monitor: qemu-system-x86_64: /builddir/build/BUILD/qemu-5.1.0/hw/acpi/bios-=
linker-loader.c:239: bios_linker_loader_add_checksum: Assertion `start_offs=
et < file->blob->len' failed.

  I see this were referenced in a patch from some time ago and
  supposedly fixed.  Here is the patch info I was able to find:

  http://next.patchew.org/QEMU/1515677902-23436-1-git-send-email-
  peter.maydell@linaro.org/1515677902-23436-10-git-send-email-
  peter.maydell@linaro.org/

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1923497/+subscriptions


