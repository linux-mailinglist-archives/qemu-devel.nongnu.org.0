Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9EA3A56C7
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 08:34:09 +0200 (CEST)
Received: from localhost ([::1]:58918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsJhA-0007D2-E0
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 02:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lsJgS-0006YP-UL
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 02:33:24 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:54014
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lsJgQ-0007is-FH
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 02:33:24 -0400
Received: from edv-macbook-pro.fritz.box (p57b42637.dip0.t-ipconnect.de
 [87.180.38.55])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id B28E0DA0FB1;
 Sun, 13 Jun 2021 08:33:18 +0200 (CEST)
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
References: <20210612080358.61176-1-sw@weilnetz.de>
 <202eedd1-eb24-5463-c17a-64e146b95421@comstyle.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] meson.build: Support ncurses on MacOS
Message-ID: <c3f3e9af-c81e-078c-5200-e2532a468cf7@weilnetz.de>
Date: Sun, 13 Jun 2021 08:33:18 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202eedd1-eb24-5463-c17a-64e146b95421@comstyle.com>
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.06.21 um 03:40 schrieb Brad Smith:

> This same problem also applies to OpenBSD as we have the same
> version of ncurses with support for wide characters. I have a similar
> patch in our QEMU port.


Then we should either extend the conditional statement to handle OpenBSD =

as well, or simply define both macros unconditionally:

 =C2=A0=C2=A0=C2=A0 # Newer versions of curses use NCURSES_WIDECHAR.
 =C2=A0=C2=A0=C2=A0 # Older versions (e. g. on MacOS, OpenBSD) still requ=
ire=20
_XOPEN_SOURCE_EXTENDED.
 =C2=A0=C2=A0=C2=A0 curses_compile_args =3D ['-DNCURSES_WIDECHAR=3D1',=20
'-D_XOPEN_SOURCE_EXTENDED=3D1']

Defining only _XOPEN_SOURCE_EXTENDED would also work with old and new=20
versions, so that's another option.

Stefan



