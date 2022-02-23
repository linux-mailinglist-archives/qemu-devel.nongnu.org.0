Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AFB4C18E8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 17:42:09 +0100 (CET)
Received: from localhost ([::1]:57712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMuiO-0005W2-D4
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 11:42:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1nMugW-0004Eh-KC
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:40:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1nMugR-0001RJ-NZ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645634406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YvUJUt01AqA1jLEI40f3SpVWokqXl94u2zNkCSkX3h0=;
 b=LK1/kj08egpNwRB1iK9dtDJRp7nT4F7DvUL2ySOpS8wkjJoABMysg0aTLMOtHPYGwCwpRW
 UmMZE+i5ndeUh5cn+u4tNYZgjZ5b51bMlZO91u7ntvlOHFkeL1lyeRw+cx/V12DwP5+K8x
 w/TNZDoqb1vkcb9xXJk+ObAmnuhsUog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-oj9eYkpMP1COUYSINKzwEw-1; Wed, 23 Feb 2022 11:38:46 -0500
X-MC-Unique: oj9eYkpMP1COUYSINKzwEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABE551006AA5;
 Wed, 23 Feb 2022 16:38:44 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42E2586596;
 Wed, 23 Feb 2022 16:37:43 +0000 (UTC)
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, =?UTF-8?Q?Daniel_P._Berrang=c3=a9?=
 <berrange@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <YhYVVnVSL8K1S4MC@redhat.com>
 <e9f70381-03f2-9582-8ad6-e9252d3195ab@gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <fb9999be-e1e2-8e8c-3c74-347c948635d6@redhat.com>
Date: Wed, 23 Feb 2022 17:37:41 +0100
MIME-Version: 1.0
In-Reply-To: <e9f70381-03f2-9582-8ad6-e9252d3195ab@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Oleg Vasilev <me@svin.in>, Idan Horowitz <idan.horowitz@gmail.com>,
 Cleber Rosa <cleber@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/23/22 14:34, Philippe Mathieu-Daudé wrote:
> On 23/2/22 12:07, Daniel P. Berrangé wrote:
>> On Tue, Feb 22, 2022 at 06:33:41PM +0100, Philippe Mathieu-Daudé wrote:
>>> +Igor/MST for UEFI tests.
>>>
>>> On 22/2/22 17:38, Daniel P. Berrangé wrote:
>>>> On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Bennée wrote:
>>>>>
>>>>> Alex Bennée <alex.bennee@linaro.org> writes:
>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> TL;DR:
>>>>>>
>>>>>>     - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
>>>>>
>>>>> Laszlo,
>>>>>
>>>>> Would it be possible to do a less debug enabled version of EDK2 on the
>>>>> next update to pc-bios/edk2-*?
>>>>
>>>> NB, Laszlo is no longer  maintaining EDK2 in QEMU, it was handed
>>>> over to Philippe.  I'm CC'ing Gerd too since he's a reviewer and
>>>> an EDK2 contributor taking over from Lazslo in EDK2 community
>>>
>>> We need the DEBUG profile to ensure the bios-tables-tests work.
>>
>> Can you elaborate on what bios-tables-tests needs this for, and
>> what coverage we would loose by disabling DEBUG.
> 
> Maybe it was only required when the tests were developed...
> I'll defer that question to Igor.

I've briefly rechecked commits 77db55fc8155 ("tests/uefi-test-tools: add
build scripts", 2019-02-21) and 536d2173b2b3 ("roms: build edk2 firmware
binaries and variable store templates", 2019-04-17). I think my only
reason for picking the DEBUG build target was that other build targets
are generally useless for debugging -- they produce no logs (or fewer logs).

> 
>> It may well be a better tradeoff to sacrifice part of bios-tables-tests
>> in favour of shipping more broadly usable images without DEBUG.
> 
> Why not, if users are aware/happy to use a unsafe image with various
> unfixed CVEs.
> 
> Removing the debug profile is as simple as this one-line patch:
> 
> -- >8 --
> diff --git a/roms/edk2-build.sh b/roms/edk2-build.sh
> index d5391c7637..ea79dc27a2 100755
> --- a/roms/edk2-build.sh
> +++ b/roms/edk2-build.sh
> @@ -50,6 +50,6 @@ qemu_edk2_set_cross_env "$emulation_target"
>  build \
>    --cmd-len=65536 \
>    -n "$edk2_thread_count" \
> -  --buildtarget=DEBUG \
> +  --buildtarget=RELEASE \
>    --tagname="$edk2_toolchain" \
>    "${args[@]}"
> ---
> 

The patch would be larger; the DEBUG build target is included in a bunch
of pathnames (see those original two commits).

BTW I still don't understand the problem with the DEBUG firmware builds;
in the test suite, as many debug messages should be printed as possible,
for helping with the analysis of any new issue that pops up. I've
re-read Alex's message that I got first CC'd on, and I can't connect the
dots, sorry.

Thanks
Laszlo


