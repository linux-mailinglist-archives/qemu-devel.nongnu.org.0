Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0F52B3480
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 11:58:55 +0100 (CET)
Received: from localhost ([::1]:55880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keFkD-0001lO-Sm
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 05:58:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1keFjX-0001L1-FQ
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 05:58:11 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:49332
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1keFjV-0003Pc-5g
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 05:58:11 -0500
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 748EEDA2F9E
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 11:58:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024) with ESMTP id gECVD4DonULR for <qemu-devel@nongnu.org>;
 Sun, 15 Nov 2020 11:57:26 +0100 (CET)
Received: from macbook02.fritz.box (pd9ec344e.dip0.t-ipconnect.de
 [217.236.52.78])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 1AF08DA2495
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 11:57:26 +0100 (CET)
To: qemu-devel <qemu-devel@nongnu.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Regressions in build process introduced since August
Message-ID: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
Date: Sun, 15 Nov 2020 11:57:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 05:58:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear all,

yesterday I tried to build new QEMU installers for Windows and noticed=20
two regressions which break my build process:

*** Change in handling of --extra-cflags

Running `configure [...] --extra-cflags=3D"-I /xyz"` results in compiler =

flags `-I [...] /xyz`, so the `-I` and `/xyz` are separated by other=20
compiler flags which obviously cannot work as expected. I could work=20
around that by removing the space and using a pattern like `-I/xyz`.

This regression is not restricted to builds targeting Windows.

*** Setting INSTALLER no longer handled

meson.build sets a hard name for the Windows installer executable:=20
installer =3D 'qemu-setup-' + meson.project_version() + '.exe'.

Previously the installer name could be changed by running `make=20
installer INSTALLER=3Dqemu-setup-something.exe`. This no longer works. Is=
=20
there an alternative solution how the name of the installer executable=20
can be set? Or how could I reimplement the lost functionality?

Kind regards

Stefan Weil




