Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C47337D4F4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 23:48:51 +0200 (CEST)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgwio-0003RU-1F
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 17:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwgv-0000l0-5k
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:46:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwgt-0007e6-1P
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620856009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vO9Jgm9v3MmpIBlCljFOnng+b3mRqA65ZoTxRoRVSkM=;
 b=D395ZwlSDe935I6og3WfyYEqv2m7Mcwy3IOa+b08p+vuWw9g7WEd041sFzzTnkmnWHXISs
 xYT6ndtuhhva4GiGJj+y7NP7Swyg0PO9hMObAY5qSNeX1S+PUhCJ4NX/NYA4sd0v5ZShpr
 KsYuyTchnmRX5ehXOAFGYUlopYZqK8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-6GMyX66NMk-50BvMKa7U0Q-1; Wed, 12 May 2021 17:46:46 -0400
X-MC-Unique: 6GMyX66NMk-50BvMKa7U0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 776201854E26;
 Wed, 12 May 2021 21:46:45 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 044465D736;
 Wed, 12 May 2021 21:46:43 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/10] Python: delint iotests, machine.py and console_socket.py
Date: Wed, 12 May 2021 17:46:32 -0400
Message-Id: <20210512214642.2803189-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gitlab CI: https://gitlab.com/jsnow/qemu/-/pipelines/301924893=0D
branch: https://gitlab.com/jsnow/qemu/-/commits/python-package-pre-cleanup=
=0D
=0D
This series serves as a pre-requisite for packaging the python series=0D
and getting the linters running via CI. The first patch fixes a linter=0D
error we've had for a while now; the subsequent 9 fix a new warning that=0D
was recently added to pylint 2.8.x.=0D
=0D
If there's nobody opposed, I'll take it through my Python queue,=0D
including the iotests bits.=0D
=0D
John Snow (10):=0D
  python/console_socket: avoid one-letter variable=0D
  python/machine: use subprocess.DEVNULL instead of=0D
    open(os.path.devnull)=0D
  python/machine: use subprocess.run instead of subprocess.Popen=0D
  python/console_socket: Add a pylint ignore=0D
  python/machine: Disable pylint warning for open() in _pre_launch=0D
  python/machine: disable warning for Popen in _launch()=0D
  iotests: use subprocess.run where possible=0D
  iotests: use 'with open()' where applicable=0D
  iotests: silence spurious consider-using-with warnings=0D
  iotests: ensure that QemuIoInteractive definitely closes=0D
=0D
 python/qemu/console_socket.py    | 11 ++++---=0D
 python/qemu/machine.py           | 28 ++++++++++------=0D
 tests/qemu-iotests/iotests.py    | 55 +++++++++++++++++++-------------=0D
 tests/qemu-iotests/testrunner.py |  1 +=0D
 4 files changed, 57 insertions(+), 38 deletions(-)=0D
=0D
--=20=0D
2.30.2=0D
=0D


