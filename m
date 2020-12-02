Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359112CC0B3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:23:49 +0100 (CET)
Received: from localhost ([::1]:44822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkTyu-00043C-Ab
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kkTxv-0003bc-14
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:22:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kkTxt-0003Gg-Bn
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:22:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606922564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5/JyMYdtWpRIRSbq7O0+Vym3XroYjFfG6Ba7nyuEvVc=;
 b=YMg/Fmf9DA3BQ83Mk3hXLELUFOpVHzpWQAdeU25z0q9pFahY0xQlu+ldj+x3Xg9n4JIffl
 kbDKKEEMUBJuwBRjjtjL4nm9vWwWazRr6M9NBa5dGbJp0C1P8xKcdvlMnFrSEqG6YO47xV
 UTDDze19fbAuyWCKHZ9OcbTtIyBYdrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-Zvwz28QaPJSBuV1TTX8pEA-1; Wed, 02 Dec 2020 10:22:41 -0500
X-MC-Unique: Zvwz28QaPJSBuV1TTX8pEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D889D100670A;
 Wed,  2 Dec 2020 15:22:40 +0000 (UTC)
Received: from [10.10.119.122] (ovpn-119-122.rdu2.redhat.com [10.10.119.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01A365C1B4;
 Wed,  2 Dec 2020 15:22:36 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: fix timeout for vm.wait
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <160552129733.22861.2033930860605615947.stgit@pasha-ThinkPad-X280>
 <CAP+75-W2ed_73xszEA08hqdnVRL9bGXshnGYqJGZvSjt4_D8bw@mail.gmail.com>
 <ce6360ce-d640-8a4a-96e8-294dd5f04f0b@redhat.com>
 <f9fe07b1-78e1-76ca-3c02-d6bf77d827d8@ispras.ru>
From: John Snow <jsnow@redhat.com>
Message-ID: <a2587552-4881-9495-e7c1-6a1934da760c@redhat.com>
Date: Wed, 2 Dec 2020 10:22:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <f9fe07b1-78e1-76ca-3c02-d6bf77d827d8@ispras.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 1:31 AM, Pavel Dovgalyuk wrote:
>>>>
>>>> This patch adds timeout parameter to vm.wait() calls, because the 
>>>> default
>>>> value is just 30 seconds, and tests may last for more time.
>>>>
>>
>> This doesn't sound right -- the timeout isn't meant to be for the 
>> entire duration of the test, the timeout is from the time of issuing a 
>> shutdown command until the time the VM actually shuts down. Ideally, 
>> that should not take a particularly long time in a well-behaved test.
>>
>> Why is it lasting longer than 30 seconds?
> 
> These are complex Linux boot&execution tests.
> Such loading process could take more than 30 seconds.
> E.g., BootLinux tests have timeout of 900 seconds.

This timeout should only count towards the time spent *shutting down*, 
not the time to run the entire test. 30 seconds used to be enough time 
for this to happen on gitlab, if it's taking longer than that I am 
worried that something has gone wrong.

Where were the failures observed, and on what tests? Are there logs I 
can review?

--js


