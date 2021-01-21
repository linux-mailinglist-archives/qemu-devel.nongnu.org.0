Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDB12FF646
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:48:37 +0100 (CET)
Received: from localhost ([::1]:48164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gse-00042H-Ip
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l2gr8-0003VM-Oe
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:47:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l2gr6-0007wM-71
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611262019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+srR5Gnlgdtd6aZDREpQ85ROXihTI280dU/PmZGxrrI=;
 b=D4a+s9/3Trigzj3YSXmOqjqX+vSbtN3j0f217xrLbrgLaBQg1PJT1ju+xvDwOds4GycT9b
 a/NpmOJonoGw2RdOpItKOP7dZxFmym1so5elbLgjhuTU1BrFi5KqelZieCh1wz47EOooAA
 s3nvNrWXCpciSTmqE1oQmK3QwjcwfME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-Ff_W7tLbMVemTaP1cNkt0g-1; Thu, 21 Jan 2021 15:46:55 -0500
X-MC-Unique: Ff_W7tLbMVemTaP1cNkt0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB2D28030A2;
 Thu, 21 Jan 2021 20:46:53 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 516DB100AE3E;
 Thu, 21 Jan 2021 20:46:47 +0000 (UTC)
Subject: Re: [RFC PATCH 2/2] gitlab-ci: Add a job building TCI with Clang
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210110162739.858087-1-f4bug@amsat.org>
 <20210110162739.858087-3-f4bug@amsat.org>
 <78a9718b-dec0-cc31-7ada-e815d9022e65@redhat.com>
 <eb4976bc-133d-7d77-cae3-899028751a85@redhat.com>
 <20210121181303.GR3125227@redhat.com>
 <89b62df4-e077-fb82-75af-e180a89fba27@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <762a020e-43a6-9228-1a44-0d38d086a61f@redhat.com>
Date: Thu, 21 Jan 2021 17:46:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <89b62df4-e077-fb82-75af-e180a89fba27@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wataru Ashihara <wataash@wataash.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/21/21 3:28 PM, Thomas Huth wrote:
> On 21/01/2021 19.13, Daniel P. Berrangé wrote:
>> On Thu, Jan 21, 2021 at 03:05:43PM -0300, Wainer dos Santos Moschetta 
>> wrote:
>>> Hi,
>>>
>>> On 1/21/21 7:08 AM, Thomas Huth wrote:
>>>> On 10/01/2021 17.27, Philippe Mathieu-Daudé wrote:
>>>>> Split the current GCC build-tci job in 2, and use Clang
>>>>> compiler in the new job.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>> ---
>>>>> RFC in case someone have better idea to optimize can respin this 
>>>>> patch.
>>>>>
>>>>>    .gitlab-ci.yml | 22 ++++++++++++++++++++--
>>>>>    1 file changed, 20 insertions(+), 2 deletions(-)
>>>>
>>>> I'm not quite sure whether we should go down this road ... if we 
>>>> wanted
>>>> to have full test coverage for clang, we'd need to duplicate *all* 
>>>> jobs
>>>> to run them once with gcc and once with clang. And that would be just
>>>> overkill.
>>>
>>> I agree with Thomas.
>>>
>>>>
>>>>
>>>> I think we already catch most clang-related problems with the clang 
>>>> jobs
>>>> that we already have in our CI, so problems like the ones that you've
>>>> tried to address here should be very, very rare. So I'd rather vote 
>>>> for
>>>> not splitting the job here.
>>>
>>> We got only one clang job on GitLab CI...
>>>
>>>    build-clang:
>>>      <<: *native_build_job_definition
>>>      variables:
>>>        IMAGE: fedora
>>>        CONFIGURE_ARGS: --cc=clang --cxx=clang++
>>>        TARGETS: alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu
>>>          ppc-softmmu s390x-softmmu arm-linux-user
>>>        MAKE_CHECK_ARGS: check
>>>
>>> ... and others on Travis:
>>>
>>>    "Clang (user)"
>>>
>>>    "Clang (main-softmmu)"
>>>
>>>    "Clang (other-softmmu)"
>>
>> I guess these three overlap partially with the build-clang job.
>>
>>>    "[s390x] Clang (disable-tcg)"
>>
>> Don't forget the  Cirrus CI jobs for freebsd and macOS will
>> be using  CLang too.
>
> Right... we should work towards getting cirrus-run into the QEMU-CI, 
> too, to finally have these in the gitlab-ci dashboard, too.
>
>>>
>>> So I've some questions:
>>>
>>>   * Can we move those first three Travis jobs to Gitlab CI? (I can 
>>> work on
>>> that)
>>
>> Yeah, if we move those three travis jobs they can replace the existing
>> build-clang job. We don't neccesssarily need to keep them as three
>> separate jobs - that split was just due to the Travis time limits.
>> If a different split works better on GitLab we can do that.
>
> Well, if we really want to increase the amount clang jobs, one of them 
> should likely use TCI, as Phillippe suggested.
Ok, got it. I won't touch on those jobs.
>
>
>>>   * Do you think they cover the most common problems with clang?
>>
>> Should do I think, especially in addition to the Cirrus CI jobs.
>
> I concur.

Great. Thanks for the inputs.

- Wainer

>
>
>  Thomas


