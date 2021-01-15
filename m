Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F9A2F801B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:54:10 +0100 (CET)
Received: from localhost ([::1]:52750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RQP-0005ai-49
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l0RPF-0004iI-6F
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:52:57 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:50442
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l0RPD-0002Ma-07
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:52:56 -0500
Received: from macbook02.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id B764ADA0CD6;
 Fri, 15 Jan 2021 16:52:52 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA8ozrnbh8XVZa8OF9C9SnNKb4Wb-=gZianHPPp5zcKjmw@mail.gmail.com>
 <CAFEAcA-f4cueeYNr=i8w0LbdsNwJo3DMLAywsp5cOu7-P0wKCA@mail.gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: Windows installer builds apparently broken since October?
Message-ID: <03e68d8d-9446-ebec-7be0-21764b567dda@weilnetz.de>
Date: Fri, 15 Jan 2021 16:52:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-f4cueeYNr=i8w0LbdsNwJo3DMLAywsp5cOu7-P0wKCA@mail.gmail.com>
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.01.21 um 16:19 schrieb Peter Maydell:

> On Fri, 15 Jan 2021 at 14:01, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>> I was just trying to see what updates the qemu.nsi file needed for
>> the merge-all-the-manuals-into-one-place change, and I discovered
>> that it's been broken since October when we removed the Changelog file=
:
>>
>> File: "/tmp/qemu-test/src\Changelog" -> no files found.
>> Usage: File [/nonfatal] [/a] ([/r] [/x filespec [...]] filespec [...] =
|
>>     /oname=3Doutfile one_file_only)
>> Error in script "../src/qemu.nsi" on line 119 -- aborting creation pro=
cess
> ...and if you fix that it then fails because it's looking for
> a subdirectory share/ in the install dir and it doesn't exist...


That's one of the problems which I mentioned in my other mail.

There should be a subdirectory share/ for Windows, too. The current=20
special case with a flat file structure for Windows does not work and is =

one of the reasons why I still did not finish a working installer for 5.2=
=2E0.

I forgot to mention that some of the problems with the Meson build also=20
occur on macOS with Homebrew: they always happen when a software package =

requires special compiler flags to find its include files or libraries,=20
but the Meson build does not use the result from pkg-config for them.

Stefan



