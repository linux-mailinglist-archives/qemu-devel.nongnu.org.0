Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080CB2F7FE6
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:44:42 +0100 (CET)
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RHF-00065R-18
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l0R7V-0001GV-8h
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:34:37 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:50286
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l0R7R-0002Un-38
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:34:36 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 9480EDA0CFF;
 Fri, 15 Jan 2021 16:34:29 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA8ozrnbh8XVZa8OF9C9SnNKb4Wb-=gZianHPPp5zcKjmw@mail.gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: Windows installer builds apparently broken since October?
Message-ID: <980269ad-bd28-08e5-0be0-fb5564aa7cd5@weilnetz.de>
Date: Fri, 15 Jan 2021 16:34:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ozrnbh8XVZa8OF9C9SnNKb4Wb-=gZianHPPp5zcKjmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.01.21 um 15:01 schrieb Peter Maydell:

> I was just trying to see what updates the qemu.nsi file needed for
> the merge-all-the-manuals-into-one-place change, and I discovered
> that it's been broken since October when we removed the Changelog file:=

>
> File: "/tmp/qemu-test/src\Changelog" -> no files found.
> Usage: File [/nonfatal] [/a] ([/r] [/x filespec [...]] filespec [...] |=

>     /oname=3Doutfile one_file_only)
> Error in script "../src/qemu.nsi" on line 119 -- aborting creation proc=
ess
>
> You can reproduce that with:
>
> make -C my-build-dir docker-image-fedora V=3D1 NETWORK=3D1
> make -C my-build-dir docker-test-mingw@fedora J=3D8 NETWORK=3D1
>
> This used to be in CI (patchew ran this config) but it clearly can't
> be being CI'd any more, or we'd have noticed.
>
> Stefan, I see you have more recent installer binaries on your
> site than that -- do you have some local patches for this?


Hello Peter,

although I have some local fixes (available for example in=20
https://github.com/stweil/qemu/) I am still struggling with 5.2.0.

One problem which was recently discussed on the list is the directory=20
structure of the installation (especially the location for BIOS and=20
similar files) which still needs changes (which als require updates for=20
qemu.nsi). I'd prefer a similar hierarchical structure for both Linux=20
and Windows (instead of a flat one which does not work with the current=20
code).

Other problems are caused by the new QEMU build system in my special=20
build context (Debian cross build with Cygwin packages).

A third challenge comes from users who would like to see new features=20
like zstd or braille which up to now were missing in my binaries.

As I am quite busy with other things, too, I am afraid that it will take =

some more weeks until I can send a set of patches to fix the most urgent =

issues.

Removing Changelog from qemu.nsi is easy, but not nearly sufficient:=20
https://github.com/stweil/qemu/commit/923c93a663e4e51231f6ea389c19c0a960f=
a9f99.

Kind regards,

Stefan



