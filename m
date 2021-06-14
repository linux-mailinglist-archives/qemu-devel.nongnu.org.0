Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBB63A5EEC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:11:32 +0200 (CEST)
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsid1-0004e6-Dr
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1lsiCw-0008Iw-UH; Mon, 14 Jun 2021 04:44:35 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:33064
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1lsiCu-00084O-3e; Mon, 14 Jun 2021 04:44:34 -0400
Received: from macbook02.fritz.box (p57b42637.dip0.t-ipconnect.de
 [87.180.38.55])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 76856DA07C5;
 Mon, 14 Jun 2021 10:44:25 +0200 (CEST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210614052623.1657103-1-f4bug@amsat.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [RFC PATCH] migration: Add missing dependency on GNUTLS
Message-ID: <8636c1be-d177-f513-fa9c-cb86c26eecab@weilnetz.de>
Date: Mon, 14 Jun 2021 10:44:25 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210614052623.1657103-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.144,
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
Cc: Leonardo Bras <leobras.c@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.06.21 um 07:26 schrieb Philippe Mathieu-Daud=C3=A9:

> Commit 7de2e856533 made migration/qemu-file-channel.c include
> "io/channel-tls.h" but forgot to add the new GNUTLS dependency
> on Meson, leading to build failure on OSX:
>
>    [2/35] Compiling C object libmigration.fa.p/migration_qemu-file-chan=
nel.c.o
>    FAILED: libmigration.fa.p/migration_qemu-file-channel.c.o
>    cc -Ilibmigration.fa.p -I. -I.. -Iqapi [ ... ] -o libmigration.fa.p/=
migration_qemu-file-channel.c.o -c ../migration/qemu-file-channel.c
>    In file included from ../migration/qemu-file-channel.c:29:
>    In file included from include/io/channel-tls.h:26:
>    In file included from include/crypto/tlssession.h:24:
>    include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file=
 not found
>    #include <gnutls/gnutls.h>
>             ^~~~~~~~~~~~~~~~~
>    1 error generated.
>
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/407
> Fixes: 7de2e856533 ("yank: Unregister function when using TLS migration=
")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> RFC: Not tested on OSX. Stefan, do you know why this isn't covered
>       on Cirrus-CI?  https://cirrus-ci.com/build/4876003651616768


Cirrus-CI does not install gnutls. That's easy to fix by adding it to=20
the list of installed packages.

And the patch does not fix the issue. I already had tried that and=20
similar changes in migration/meson.build.

Regards

Stefan



