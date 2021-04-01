Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28D5351726
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 19:19:16 +0200 (CEST)
Received: from localhost ([::1]:39102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS0yR-0004SR-Sl
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 13:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>)
 id 1lS0u8-0002lx-23; Thu, 01 Apr 2021 13:14:48 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:39712
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>)
 id 1lS0u5-0003Ww-Cm; Thu, 01 Apr 2021 13:14:47 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4FB8x70Lt2z8PbN;
 Thu,  1 Apr 2021 13:16:43 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=b3PgkQvKL
 IbYIjquzNaI+l4+o3I=; b=rqUy2+3g+FMRWVXpeexa5uYkYfVesN2JDyxzawCaw
 gxXF9Mf3A/bhA6aVckX7VIgzX4k0nEoroOCr5HCA4tmyo1RPwSaHvYeF1vVf34+x
 fvYw0RJfC7u791O2fb1BLC7yqA8pr/+H+37OR5yvMPWb01Px7QW0wQXaappKkzNj
 No=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=oYx
 SzbYB+b16X5lNXayWCDbJjOlsEhCunzbsPs6jxnNb6TY0AtHP2buEisU5TH0P7Gd
 KmsnpvvuHNfOXs7tml21mYqec+oggtDGnGYFqXcnRxVvPjfITP2gjnMV6sBuR3d9
 13v8yA1w1xfn7V0jxUj/DJV9oUMK77VxIp4tlDN8=
Received: from localhost
 (bras-base-toroon2719w-grc-39-142-114-123-227.dsl.bell.ca [142.114.123.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4FB8x668Flz8PbK;
 Thu,  1 Apr 2021 13:16:42 -0400 (EDT)
Message-ID: <529d0edb-86f2-2972-d23b-7b3ae7691d3f@comstyle.com>
Date: Thu, 1 Apr 2021 13:14:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH] migration: Remove time_t cast for OpenBSD
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org
References: <YDNdAiOkEYOfmbhT@humpty.home.comstyle.com>
 <7eaad721-9d2a-83ed-00fc-80c8ee37e156@redhat.com>
 <26c9c34a-3872-c044-4b01-06d2eb4bfbb1@vivier.eu> <YEphaTV6uzhDEY7R@work-vm>
 <YEpj8MsBzqfRDTWo@redhat.com>
 <70bda12d-17fc-5e41-b723-e1409017a599@comstyle.com>
 <31adf621-ab77-3ac3-5995-501ac87426b3@comstyle.com>
 <YGWA4MSRe9JUmGqC@redhat.com>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <YGWA4MSRe9JUmGqC@redhat.com>
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

On 4/1/2021 4:14 AM, Daniel P. Berrang=C3=A9 wrote:
> On Wed, Mar 31, 2021 at 03:26:16PM -0400, Brad Smith wrote:
>> On 3/13/2021 6:33 PM, Brad Smith wrote:
>>> On 3/11/2021 1:39 PM, Daniel P. Berrang=C3=A9 wrote:
>>>> On Thu, Mar 11, 2021 at 06:28:57PM +0000, Dr. David Alan Gilbert wro=
te:
>>>>> * Laurent Vivier (laurent@vivier.eu) wrote:
>>>>>> Le 08/03/2021 =C3=A0 12:46, Thomas Huth a =C3=A9crit=C2=A0:
>>>>>>> On 22/02/2021 08.28, Brad Smith wrote:
>>>>>>>> OpenBSD has supported 64-bit time_t across all archs
>>>>>>>> since 5.5 released in 2014.
>>>>>>>>
>>>>>>>> Remove a time_t cast that is no longer necessary.
>>>>>>>>
>>>>>>>>
>>>>>>>> Signed-off-by: Brad Smith <brad@comstyle.com>
>>>>>>>>
>>>>>>>> diff --git a/migration/savevm.c b/migration/savevm.c
>>>>>>>> index 52e2d72e4b..9557f85ba9 100644
>>>>>>>> --- a/migration/savevm.c
>>>>>>>> +++ b/migration/savevm.c
>>>>>>>> @@ -2849,8 +2849,7 @@ bool save_snapshot(const char
>>>>>>>> *name, bool overwrite, const char *vmstate,
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (name) {
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstrcpy(s=
n->name, sizeof(sn->name), name);
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* cast below needed=
 for OpenBSD where
>>>>>>>> tv_sec is still 'long' */
>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 localtime_r((const t=
ime_t *)&tv.tv_sec, &tm);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 localtime_r(&tv.tv_s=
ec, &tm);
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strftime(=
sn->name, sizeof(sn->name),
>>>>>>>> "vm-%Y%m%d%H%M%S", &tm);
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> but the qemu_timeval from "include/sysemu/os-win32.h" still
>>>>>> uses a long: is this file compiled for
>>>>>> win32?
>>>>> Yep this fails for me when built with x86_64-w64-mingw32- (it's fin=
e
>>>>> with i686-w64-mingw32- )
>>>> We could just switch the code to use GDateTime from GLib and thus
>>>> avoid portability issues. I think this should be equivalent:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_autoptr(GDateTime) now =3D g_date_t=
ime_new_now_local();
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_autofree char *nowstr =3D g_date_ti=
me_format(now,
>>>> "vm-%Y%m%d%H%M%s");
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strncpy(sn->name, sizeof(sn->name), n=
owstr);
>>> Which way do you guys want to go? Something like above, remove the
>>> comment
>>> or some variation on the comment but not mentioning OpenBSD since it =
is
>>> no
>>> longer relevant?
>> Anyone?
> Personally I always favour using GLib APIs if there's an applicable one=
,
> since it eliminates portability problems - or rather offloads them to
> the GLib maintainers, who have already solved them generally.

Can you please submit a proper diff and I'll drop this?

