Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E4A2F9B4D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 09:32:46 +0100 (CET)
Received: from localhost ([::1]:56384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Pxt-0008Ik-9d
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 03:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1PwC-0007m3-L3
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 03:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1Pw9-000757-Kb
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 03:31:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610958654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXQPP64NTieU1+WfAmIRngDfqttMgdhbSqOuztz13AU=;
 b=chb/0Ymtb2IQDULBTTbUCvsUNIVdRMg0OLRyGZzHJ4lb5tD7PWIBw/tHKLX/7wkcUEWPCB
 WO0Wiz0w6zW3fEOCicSDipqCshABq7gBKoO9/3lV79P08sIhyloexyPfhkEwwzKZ8k88Rz
 MAFOZHQYJ2gAWU7i03Z/1zySxWt6x8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-w9Z6yK92NFe81fIshhtHvw-1; Mon, 18 Jan 2021 03:30:53 -0500
X-MC-Unique: w9Z6yK92NFe81fIshhtHvw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C357107ACE6;
 Mon, 18 Jan 2021 08:30:52 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-189.ams2.redhat.com [10.36.112.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 753A810013C0;
 Mon, 18 Jan 2021 08:30:50 +0000 (UTC)
Subject: Re: [PATCH-for-5.2 2/2] gitlab-ci: Avoid running the EDK2 job when
 not necessary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201110121606.2792442-1-philmd@redhat.com>
 <20201110121606.2792442-3-philmd@redhat.com>
 <20201110153505.GH869656@redhat.com>
 <3ec6bc01-906b-2e34-b760-76138bbff7cb@redhat.com>
 <1d3ef711-9509-f43b-11e0-d9ead8cc95af@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b0268ed2-0347-1c00-265c-910b2dc0f870@redhat.com>
Date: Mon, 18 Jan 2021 09:30:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1d3ef711-9509-f43b-11e0-d9ead8cc95af@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 Bin Meng <bmeng.cn@gmail.com>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/01/2021 19.48, Philippe Mathieu-Daudé wrote:
> On 11/11/20 10:18 AM, Philippe Mathieu-Daudé wrote:
>> On 11/10/20 4:35 PM, Daniel P. Berrangé wrote:
>>> On Tue, Nov 10, 2020 at 01:16:06PM +0100, Philippe Mathieu-Daudé wrote:
>>>> The EDK2 jobs use the 'changes' keyword, which "makes it
>>>> possible to define if a job should be created based on files
>>>> modified by a Git push event." (see [1]). This keyword comes
>>>> with a warning:
>>>>
>>>>    Caution:
>>>>
>>>>      In pipelines with sources other than the three above
>>>>      changes can’t determine if a given file is new or old
>>>>      and always returns true."
>>>>
>>>> In commit 922febe2af we moved the YAML config file from the
>>>> repository root directory to the .gitlab-ci.d/ directory.
>>>>
>>>> We didn't respect the previous warning and disabled the
>>>> 'changes' filter rule, as the files are now in a (directory)
>>>> three above the YAML config file.
>>>
>>> This description is a bit wierd. I don't see how the location
>>> in the directory tree has any relevance here.
>>>
>>> IIUC the caution docs quoted above are referring to what triggered
>>> the pipeline. They're saying that if the trigger was not a "branch",
>>> "merge request", or "external pull request", then the "changes" rule
>>> always evaluates true.
>>>
>>> The "branch" source us a bit wierd though, as I'm not seeing
>>> how gitlab figures out which commits are "new" to the pipeline
>>> and thus whether the files were modified or not.
>>>
>>> Strangely qemu-project/qemu CI for master seems to be behaving
>>> correctly and skipping the jobs.
>>
>> What about this one?
>>
>> https://gitlab.com/berrange/qemu/-/jobs/827459510
> 
> Ping?

Daniel's comment sounded like there are some changes required here, at least 
to improve the commit message? So I was expecting a v2 here. Please clarify 
Daniel's concerns, then I can either pick up this version here or the v2 (in 
case you send one).

  Thomas


