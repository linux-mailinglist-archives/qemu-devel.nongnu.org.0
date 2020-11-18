Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F6B2B8523
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 20:56:26 +0100 (CET)
Received: from localhost ([::1]:35714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfTZ3-0002aZ-Sg
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 14:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1kfTXG-0001PN-31
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:54:34 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:36672
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1kfTXD-00065D-QP
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:54:33 -0500
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 230E0DB267F;
 Wed, 18 Nov 2020 20:54:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 6kH58_K7eTwK; Wed, 18 Nov 2020 20:52:17 +0100 (CET)
Received: from macbook02.fritz.box (pd9ec344e.dip0.t-ipconnect.de
 [217.236.52.78])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 898D4DA2FCA;
 Wed, 18 Nov 2020 20:50:48 +0100 (CET)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
 <20201118153416.GG229461@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: Regressions in build process introduced since August
Message-ID: <6ae1dcc4-591c-5fc2-9423-d80b9b16e777@weilnetz.de>
Date: Wed, 18 Nov 2020 20:50:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201118153416.GG229461@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 14:54:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.11.20 um 16:34 schrieb Daniel P. Berrang=C3=A9:

> On Sun, Nov 15, 2020 at 11:57:25AM +0100, Stefan Weil wrote:
>> *** Setting INSTALLER no longer handled
>>
>> meson.build sets a hard name for the Windows installer executable: ins=
taller
>> =3D 'qemu-setup-' + meson.project_version() + '.exe'.
>>
>> Previously the installer name could be changed by running `make instal=
ler
>> INSTALLER=3Dqemu-setup-something.exe`. This no longer works. Is there =
an
>> alternative solution how the name of the installer executable can be s=
et? Or
>> how could I reimplement the lost functionality?
> Why were you needing to override the name ?  Was this so that you can
> give distinct names to the Win32 vs Win64 installer exes ?
>
> If so, would it be better if QEMU used a distinct filename for the
> Win32 vs Win64 installers automatically, to avoid need to override
> at all ?


I now use installer names like qemu-w64-setup-20201118.exe since about 6 =

years, so yes, my names include w32 or w64 to show whether they contain=20
32 or 64 bit binaries, and they also contain a date instead of the QEMU=20
version.

For my build process I now create the default name and rename it later.=20
That solves the problem for me.

Stefan




