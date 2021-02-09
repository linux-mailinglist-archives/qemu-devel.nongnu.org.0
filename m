Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81FD314926
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 07:56:34 +0100 (CET)
Received: from localhost ([::1]:43068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Mwr-0007oQ-Br
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 01:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l9Mvm-0007Pa-Fa
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 01:55:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l9Mvi-0007S1-QB
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 01:55:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612853721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NJMimx48HKtRECD3FoOQLlAvYss4s6v6rfZ9xZ7h0hc=;
 b=ZPglxuBefS3FfNErGH6SuBvoULQpUS8LAvFGuaJGcKmDAUBq23p2YkMg0PFzdknneY4XjK
 X51kLeQ9HpurlSHzMI38bZ0U7mRd5xmfBwIrpCRH73Hz9q/YnFtY03riuYJ9VNVJPepq8T
 qavKeH6saWctsucxDkgvkLoUd51FE5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-ZU7adVqTPuSMYDeclHNevg-1; Tue, 09 Feb 2021 01:55:19 -0500
X-MC-Unique: ZU7adVqTPuSMYDeclHNevg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ED7D427C1;
 Tue,  9 Feb 2021 06:55:18 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-130.ams2.redhat.com [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1EBB19C66;
 Tue,  9 Feb 2021 06:55:12 +0000 (UTC)
Subject: Re: [PATCH 0/3] fix build failures from incorrectly skipped container
 build jobs
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20210208163339.1159514-1-berrange@redhat.com>
 <20210208172256.GM1141037@redhat.com>
 <cb8195b9-c8fc-9900-346a-fce0aba9eb83@amsat.org>
 <20210208181235.GN1141037@redhat.com>
 <11f66664-0879-51a7-31a3-3796f05a0b52@weilnetz.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b4da2153-1167-5128-ff2d-065b9b538152@redhat.com>
Date: Tue, 9 Feb 2021 07:55:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <11f66664-0879-51a7-31a3-3796f05a0b52@weilnetz.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 Yonggang Luo <luoyonggang@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/02/2021 07.01, Stefan Weil wrote:
> Am 08.02.21 um 19:12 schrieb Daniel P. Berrangé:
> 
>> On Mon, Feb 08, 2021 at 07:08:39PM +0100, Philippe Mathieu-Daudé wrote:
>>> On 2/8/21 6:22 PM, Daniel P. Berrangé wrote:
>>>> On Mon, Feb 08, 2021 at 04:33:36PM +0000, Daniel P. Berrangé wrote:
>>>>> This series fixes a problem with our gitlab CI rules that cause
>>>>> container builds to be skipped. See the commit description in the
>>>>> first patch for the details on this problem.
>>>>>
>>>>> The overall result of this series though is a small increase in overall
>>>>> pipeline time.
>>>>>
>>>>> Previously
>>>>>
>>>>>   - When container jobs are skipped: approx 1hr 5 mins
>>>>>   - When container jobs are run, cached by docker: approx 1hr 15 mins
>>>>>   - When container jobs are run, not cached by docker: approx 1hr 30 mins
>>>>>
>>>>> With this series applied the first scenario no longer exists, so
>>>>> all piplines are either 1hr 15 or 1hr 30 depending on whether the
>>>>> container phase is skipped.
>>>> I mean to say the biggest problem I see is the cross-win64-system
>>>> job. This consumes 1 hour 5 minutes all on its own. It is at least
>>>> 15 minutes longer that every other job AFAICT. So no matter how
>>>> well we parallelize stuff, 1 hr 5 is a hard lower limit on pipeline
>>>> duration right now.
>>>>
>>>> We might want to consider how to split the win64 job or cut down
>>>> what it does in some way ?
>>> When the win64 build was added (on Debian), it was to mostly to cover
>>> the WHPX. Later we moved mingw jobs to Fedora. I just checked and
>>> WHPX is no more built, and nobody complained, so it is not relevant
>>> anymore.
>>>
>>> I don't mind much what you do with the Gitlab win64 job, as this config
>>> is better covered on Cirrus. I'd like to keep the win32 job because it
>>> has been useful to catch 32-bit issues.
>> I'm not suggesting we remove it. Most developers won't setup Cirrus CI,
>> so will only run GitLab CI jobs.  IME it is good to have both win32
>> and win64 coverage because things do break differently on them - especially
>> if you use bad printf format strings that are not independant of host
>> word size
> 
> 
> I would not say that something is not relevant just because nobody 
> complains. Nobody would miss any CI if everything were always fine. So 
> people would miss WHPX CI as soon as there are changes (which happen 
> infrequently) and something breaks. WHPX should be covered by the w64 build, 
> and as many as possible other features where I currently see a "NO" in the 
> configure output as well.

Yes, I agree, we should add WHPX there again. Could somebody please check 
whether the headers are already available in the latest Fedora? Then we 
might simply switch the container to use the latest version of Fedora instead.

Otherwise we should install the headers manually there, like we did in 
commit d3dd34a1e5e134 for the now-removed Debian container.

> Nevertheless I don't think that each CI job must run frequently. Each run 
> not only costs time, but also energy, and contributes to our climate change.
> 
> I think that for the win32 and win64 jobs it would be sufficient to run them 
> weekly, maybe even alternating if that is possible.

Maybe it would be sufficient to run those jobs only on tags (so that they 
get checked for pull requests) and on the master and staging branch?

  Thomas


