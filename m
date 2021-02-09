Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36FE314869
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 07:03:08 +0100 (CET)
Received: from localhost ([::1]:43116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9M79-0002G0-5p
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 01:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l9M62-0001nW-KR
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 01:01:58 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:47466
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l9M5y-0000RW-1u
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 01:01:58 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 1FF64DA0782;
 Tue,  9 Feb 2021 07:01:50 +0100 (CET)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210208163339.1159514-1-berrange@redhat.com>
 <20210208172256.GM1141037@redhat.com>
 <cb8195b9-c8fc-9900-346a-fce0aba9eb83@amsat.org>
 <20210208181235.GN1141037@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH 0/3] fix build failures from incorrectly skipped container
 build jobs
Message-ID: <11f66664-0879-51a7-31a3-3796f05a0b52@weilnetz.de>
Date: Tue, 9 Feb 2021 07:01:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208181235.GN1141037@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.265,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.02.21 um 19:12 schrieb Daniel P. Berrang=C3=A9:

> On Mon, Feb 08, 2021 at 07:08:39PM +0100, Philippe Mathieu-Daud=C3=A9 w=
rote:
>> On 2/8/21 6:22 PM, Daniel P. Berrang=C3=A9 wrote:
>>> On Mon, Feb 08, 2021 at 04:33:36PM +0000, Daniel P. Berrang=C3=A9 wro=
te:
>>>> This series fixes a problem with our gitlab CI rules that cause
>>>> container builds to be skipped. See the commit description in the
>>>> first patch for the details on this problem.
>>>>
>>>> The overall result of this series though is a small increase in over=
all
>>>> pipeline time.
>>>>
>>>> Previously
>>>>
>>>>   - When container jobs are skipped: approx 1hr 5 mins
>>>>   - When container jobs are run, cached by docker: approx 1hr 15 min=
s
>>>>   - When container jobs are run, not cached by docker: approx 1hr 30=
 mins
>>>>
>>>> With this series applied the first scenario no longer exists, so
>>>> all piplines are either 1hr 15 or 1hr 30 depending on whether the
>>>> container phase is skipped.
>>> I mean to say the biggest problem I see is the cross-win64-system
>>> job. This consumes 1 hour 5 minutes all on its own. It is at least
>>> 15 minutes longer that every other job AFAICT. So no matter how
>>> well we parallelize stuff, 1 hr 5 is a hard lower limit on pipeline
>>> duration right now.
>>>
>>> We might want to consider how to split the win64 job or cut down
>>> what it does in some way ?
>> When the win64 build was added (on Debian), it was to mostly to cover
>> the WHPX. Later we moved mingw jobs to Fedora. I just checked and
>> WHPX is no more built, and nobody complained, so it is not relevant
>> anymore.
>>
>> I don't mind much what you do with the Gitlab win64 job, as this confi=
g
>> is better covered on Cirrus. I'd like to keep the win32 job because it=

>> has been useful to catch 32-bit issues.
> I'm not suggesting we remove it. Most developers won't setup Cirrus CI,=

> so will only run GitLab CI jobs.  IME it is good to have both win32
> and win64 coverage because things do break differently on them - especi=
ally
> if you use bad printf format strings that are not independant of host
> word size


I would not say that something is not relevant just because nobody=20
complains. Nobody would miss any CI if everything were always fine. So=20
people would miss WHPX CI as soon as there are changes (which happen=20
infrequently) and something breaks. WHPX should be covered by the w64=20
build, and as many as possible other features where I currently see a=20
"NO" in the configure output as well.

Nevertheless I don't think that each CI job must run frequently. Each=20
run not only costs time, but also energy, and contributes to our climate =

change.

I think that for the win32 and win64 jobs it would be sufficient to run=20
them weekly, maybe even alternating if that is possible.

Stefan




