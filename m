Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05554C37F6
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 22:42:17 +0100 (CET)
Received: from localhost ([::1]:39896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNLsO-00065g-8u
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 16:42:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1nNLqQ-0005GQ-C0
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 16:40:15 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:46996
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1nNLqM-0001dR-BY
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 16:40:13 -0500
Received: from [192.168.178.59] (p5b1510d9.dip0.t-ipconnect.de [91.21.16.217])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id D4253DA07B4;
 Thu, 24 Feb 2022 22:40:06 +0100 (CET)
Message-ID: <05804c4b-690c-4fda-aaac-5a1bcb144024@weilnetz.de>
Date: Thu, 24 Feb 2022 22:40:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: Peter Maydell <peter.maydell@linaro.org>, marcandre.lureau@redhat.com
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-6-marcandre.lureau@redhat.com>
 <CAFEAcA9FDt0Y6W4zBLG3ciGe8M7TERimzD_4gX-y7pAv2G+=ag@mail.gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH 05/12] compiler.h: drop __printf__ macro MinGW/glib
 workaround
In-Reply-To: <CAFEAcA9FDt0Y6W4zBLG3ciGe8M7TERimzD_4gX-y7pAv2G+=ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.02.22 um 20:12 schrieb Peter Maydell:

> On Thu, 24 Feb 2022 at 18:38, <marcandre.lureau@redhat.com> wrote:
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> This workaround was added in commit 95df51a4 ("w32: Always use standard
>> instead of native format strings"), as it claimed glib was using
>> __printf__ attribute. This is surprising, since glib has always used
>> G_GNUC_PRINTF which, as the name implies, uses __gnu_printf__ when
>> possible.
> This was not always true: before this commit from 2018
> https://github.com/GNOME/glib/commit/98a0ab929d8c59ee27e5f470f11d077bb6a56749
> G_GNUC_PRINTF used always used __printf__.
> I think that change only landed in glib 2.58, so since our current
> minimum glib version is 2.56 we need to retain this workaround.
>
>> Apparently, the workaound is no longer relevant though, I don't see
>> the warnings.
> You're probably building with a newer glib, and possibly also
> a newer mingw.
>
> I've cc'd Stefan Weil who might know whether we can drop this
> workaround as far as the mingw part is concerned.


My latest builds of QEMU for Windows still used glib 2.54 because that 
still is the "newest" version which is provided by Cygwin's mingw64:

https://cygwin.com/cgi-bin2/package-grep.cgi?grep=mingw64-.*-glib2.0

So I even had to downgrade the minimum glib version.

A hard requirement of a newer glib would mean that Cygwin mingw64 
packages can no longer be used for building QEMU unless someone updates 
those packages.

Stefan



