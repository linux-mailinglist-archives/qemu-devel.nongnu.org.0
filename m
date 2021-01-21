Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F5C2FF2D9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:07:50 +0100 (CET)
Received: from localhost ([::1]:38462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2eN3-0006cd-91
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l2eLK-0005Wp-KU
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:06:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l2eLE-0003eu-Mw
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:06:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611252354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LoMvx8SG6LCyD6msFwAIaJFvX942j4a0WJTlgUhiUdE=;
 b=Ba9BgdvIz1MajZiamliFNfGhh11RLWTuXCHZiXN+yw09xbHzF2IF8jzG1qKNjjDii6U+be
 gNiUutMMziGc6PAUB4aPXFp0X1c9mN/V/G6/T1++xKwHjXPoQZem69jxptNcRgKKW8dpW7
 xoS0rbIgz/piC/x6O5O6uMW9vMJbFIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-bSHeJXkXOvaBMsig6WBxlw-1; Thu, 21 Jan 2021 13:05:52 -0500
X-MC-Unique: bSHeJXkXOvaBMsig6WBxlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D9A61800D42;
 Thu, 21 Jan 2021 18:05:50 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3588D19CAC;
 Thu, 21 Jan 2021 18:05:45 +0000 (UTC)
Subject: Re: [RFC PATCH 2/2] gitlab-ci: Add a job building TCI with Clang
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org
References: <20210110162739.858087-1-f4bug@amsat.org>
 <20210110162739.858087-3-f4bug@amsat.org>
 <78a9718b-dec0-cc31-7ada-e815d9022e65@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <eb4976bc-133d-7d77-cae3-899028751a85@redhat.com>
Date: Thu, 21 Jan 2021 15:05:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <78a9718b-dec0-cc31-7ada-e815d9022e65@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wataru Ashihara <wataash@wataash.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 1/21/21 7:08 AM, Thomas Huth wrote:
> On 10/01/2021 17.27, Philippe Mathieu-Daudé wrote:
>> Split the current GCC build-tci job in 2, and use Clang
>> compiler in the new job.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> RFC in case someone have better idea to optimize can respin this patch.
>>
>>   .gitlab-ci.yml | 22 ++++++++++++++++++++--
>>   1 file changed, 20 insertions(+), 2 deletions(-)
>
> I'm not quite sure whether we should go down this road ... if we 
> wanted to have full test coverage for clang, we'd need to duplicate 
> *all* jobs to run them once with gcc and once with clang. And that 
> would be just overkill.

I agree with Thomas.

>
>
> I think we already catch most clang-related problems with the clang 
> jobs that we already have in our CI, so problems like the ones that 
> you've tried to address here should be very, very rare. So I'd rather 
> vote for not splitting the job here.

We got only one clang job on GitLab CI...

   build-clang:
     <<: *native_build_job_definition
     variables:
       IMAGE: fedora
       CONFIGURE_ARGS: --cc=clang --cxx=clang++
       TARGETS: alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu
         ppc-softmmu s390x-softmmu arm-linux-user
       MAKE_CHECK_ARGS: check

... and others on Travis:

   "Clang (user)"

   "Clang (main-softmmu)"

   "Clang (other-softmmu)"

   "[s390x] Clang (disable-tcg)"

So I've some questions:

  * Can we move those first three Travis jobs to Gitlab CI? (I can work 
on that)

  * Do you think they cover the most common problems with clang?

- Wainer

>
>
>  Thomas


