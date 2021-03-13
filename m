Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD2533A1F0
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 00:34:23 +0100 (CET)
Received: from localhost ([::1]:50014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLDm1-0003ET-Hx
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 18:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>)
 id 1lLDkx-0002gW-Pd; Sat, 13 Mar 2021 18:33:15 -0500
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:3457
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>)
 id 1lLDku-0007z7-7h; Sat, 13 Mar 2021 18:33:15 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4DyfDS32RQz8PbN;
 Sat, 13 Mar 2021 18:35:04 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=vClRCeeTj
 I1qXeTL/rp/vaRm6zA=; b=pwhSUWbInvZK16PmyrLa93GzaTR62JGk76qD96mnn
 dLrRtB6uiHBeer5DgwruEagr50mC+OUxZzFXtjWly2G/M1qe2KsP0KM1z7+SEj15
 xw/TQW6OXs3tbdTnp1xzS+K696kydvQRd6B2TvGUOeBiLdezNrBUZU4fhN7YWjzC
 2o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=Yba
 TD+PFq4CKbBMmGv7BCV9OHog8VjeDqSHcx07u/vaCDUhmKu8GU0/PKIHhjJDPl5O
 ZZiIrWsIY3YXewbdRtRJk9KWReOirqcaAW6eUvncmov2Lkf+NM3qXE+2Gd1JFnYZ
 a3bmSnZj0vPqW3vSdrXQupDV5m0Z6Ne/PBHKnbZc=
Received: from [192.168.6.30]
 (bras-base-toroon2719w-grc-43-174-88-243-61.dsl.bell.ca [174.88.243.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4DyfDS1x27z8PbK;
 Sat, 13 Mar 2021 18:35:04 -0500 (EST)
Message-ID: <70bda12d-17fc-5e41-b723-e1409017a599@comstyle.com>
Date: Sat, 13 Mar 2021 18:33:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH] migration: Remove time_t cast for OpenBSD
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>, QEMU Trivial
 <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <YDNdAiOkEYOfmbhT@humpty.home.comstyle.com>
 <7eaad721-9d2a-83ed-00fc-80c8ee37e156@redhat.com>
 <26c9c34a-3872-c044-4b01-06d2eb4bfbb1@vivier.eu> <YEphaTV6uzhDEY7R@work-vm>
 <YEpj8MsBzqfRDTWo@redhat.com>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <YEpj8MsBzqfRDTWo@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/2021 1:39 PM, Daniel P. Berrang=C3=A9 wrote:
> On Thu, Mar 11, 2021 at 06:28:57PM +0000, Dr. David Alan Gilbert wrote:
>> * Laurent Vivier (laurent@vivier.eu) wrote:
>>> Le 08/03/2021 =C3=A0 12:46, Thomas Huth a =C3=A9crit=C2=A0:
>>>> On 22/02/2021 08.28, Brad Smith wrote:
>>>>> OpenBSD has supported 64-bit time_t across all archs since 5.5 rele=
ased in 2014.
>>>>>
>>>>> Remove a time_t cast that is no longer necessary.
>>>>>
>>>>>
>>>>> Signed-off-by: Brad Smith <brad@comstyle.com>
>>>>>
>>>>> diff --git a/migration/savevm.c b/migration/savevm.c
>>>>> index 52e2d72e4b..9557f85ba9 100644
>>>>> --- a/migration/savevm.c
>>>>> +++ b/migration/savevm.c
>>>>> @@ -2849,8 +2849,7 @@ bool save_snapshot(const char *name, bool ove=
rwrite, const char *vmstate,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (name) {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstrcpy(sn->=
name, sizeof(sn->name), name);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* cast below needed fo=
r OpenBSD where tv_sec is still 'long' */
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 localtime_r((const time=
_t *)&tv.tv_sec, &tm);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 localtime_r(&tv.tv_sec,=
 &tm);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strftime(sn-=
>name, sizeof(sn->name), "vm-%Y%m%d%H%M%S", &tm);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> but the qemu_timeval from "include/sysemu/os-win32.h" still uses a lo=
ng: is this file compiled for
>>> win32?
>> Yep this fails for me when built with x86_64-w64-mingw32- (it's fine
>> with i686-w64-mingw32- )
> We could just switch the code to use GDateTime from GLib and thus
> avoid portability issues. I think this should be equivalent:
>
>       g_autoptr(GDateTime) now =3D g_date_time_new_now_local();
>       g_autofree char *nowstr =3D g_date_time_format(now, "vm-%Y%m%d%H%=
M%s");
>       strncpy(sn->name, sizeof(sn->name), nowstr);

Which way do you guys want to go? Something like above, remove the commen=
t
or some variation on the comment but not mentioning OpenBSD since it is n=
o
longer relevant?

