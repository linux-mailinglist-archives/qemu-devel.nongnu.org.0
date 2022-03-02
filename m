Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D701C4CA59F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:10:23 +0100 (CET)
Received: from localhost ([::1]:34914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOkI-0007Pj-Uk
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:10:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPMwh-0004Mp-Cg
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:15:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPMwd-0002uE-QE
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:15:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646219699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F33x189+s6ybIwe+h4ZqJld+f7y1UfmpOGWt+KD6Ch8=;
 b=W4d1VEmeQ00riyRsfCyTcRIGzYFbyHDOeMvduCvWb2S/72zhRpLz0iOijesi+BMurQUuBi
 EVodZYZS9PKWxfPAwEHC825moeBd9k7a56koldRkUAMtoL5J5IZsjSq7BwUSFCLgLjaWhp
 1xz2jFw6BN2UxF5Ly2rR6oYpHnm7N90=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-3WsSnb57N0-2kPnyU9QuiA-1; Wed, 02 Mar 2022 06:14:57 -0500
X-MC-Unique: 3WsSnb57N0-2kPnyU9QuiA-1
Received: by mail-wr1-f70.google.com with SMTP id
 p9-20020adf9589000000b001e333885ac1so509450wrp.10
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 03:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F33x189+s6ybIwe+h4ZqJld+f7y1UfmpOGWt+KD6Ch8=;
 b=japFQ5evWChQNjHYUIfRjRFYHQAVZsf5fC7LwyXRpSpMFkMc/hI+2xKK3ldLBJsiIU
 R3iajqDEmswnaxHdE2RXXXv2iI96ni7IiN6f03JPKtEL8dmJ9NAKWSA5fwY9F0InXibm
 FajE9h7kMzXWKSrhwvgNrKBDATl305sUs65UX8QjsrM++d5znKw4mHEnqb/STNCOaDpw
 70VGkTVTX/DKLiSqQjMJfXRxWuWGLy+emm81VcidWBYOOD8MddMaAh/wtX7Yn3/8zVnJ
 AtcjEiqjHDsIvI3KleIPxakxmI0dV9N1rTyexk2trpMT4WwhhFc3aVUDsc5KpZvWIewe
 mvIQ==
X-Gm-Message-State: AOAM533FFnY/pYrydajHSNfs3r6YOsgm2kB/SMC+aIkDZF05zMujAH23
 SlHQOSlcDnd6/z+LUXmYG7/SBWaeqH+0NatZh4uT31AFW8dUP+ZJUOdCGV3bAObkYf4DiCPcfUx
 q9pbhShO64MUJM2w=
X-Received: by 2002:a05:600c:3487:b0:382:aa28:fe1f with SMTP id
 a7-20020a05600c348700b00382aa28fe1fmr3608133wmq.170.1646219696722; 
 Wed, 02 Mar 2022 03:14:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxo0VrayR6b/hS+zGZEAbC1CsmibSJSlyX0xoje/RwVIn0DkLqBa+NY/yFofyOabDltQ0nxlw==
X-Received: by 2002:a05:600c:3487:b0:382:aa28:fe1f with SMTP id
 a7-20020a05600c348700b00382aa28fe1fmr3608114wmq.170.1646219696433; 
 Wed, 02 Mar 2022 03:14:56 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a1c3b05000000b00382871cf734sm4261658wma.25.2022.03.02.03.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 03:14:56 -0800 (PST)
Message-ID: <11ef705d-85fe-8aab-de30-0ba20e9eb980@redhat.com>
Date: Wed, 2 Mar 2022 12:14:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] iotests/065: Check for zstd support
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220221170845.628429-1-hreitz@redhat.com>
 <20220221170845.628429-2-hreitz@redhat.com>
 <b76eac91-91e3-11a2-e1a8-18709d9d10ba@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <b76eac91-91e3-11a2-e1a8-18709d9d10ba@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.02.22 16:44, Vladimir Sementsov-Ogievskiy wrote:
> 21.02.2022 20:08, Hanna Reitz wrote:
>> Some test cases run in iotest 065 require zstd support.  Skip them if
>> qemu-img reports it not to be available.
>>
>> Reported-by: Thomas Huth <thuth@redhat.com>
>> Fixes: 12a936171d71f839dc907ff ("iotest 065: explicit compression type")
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/065 | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
>> index f7c1b68dad..b68df84642 100755
>> --- a/tests/qemu-iotests/065
>> +++ b/tests/qemu-iotests/065
>> @@ -24,7 +24,7 @@ import os
>>   import re
>>   import json
>>   import iotests
>> -from iotests import qemu_img, qemu_img_pipe
>> +from iotests import qemu_img_pipe, qemu_img_pipe_and_status
>>   import unittest
>>     test_img = os.path.join(iotests.test_dir, 'test.img')
>> @@ -35,8 +35,13 @@ class TestImageInfoSpecific(iotests.QMPTestCase):
>>       def setUp(self):
>>           if self.img_options is None:
>>               self.skipTest('Skipping abstract test class')
>> -        qemu_img('create', '-f', iotests.imgfmt, '-o', 
>> self.img_options,
>> -                 test_img, '128K')
>> +        output, status = qemu_img_pipe_and_status('create',
>> +                                                  '-f', iotests.imgfmt,
>> +                                                  '-o', 
>> self.img_options,
>> +                                                  test_img, '128K')
>> +        if status == 1 and \
>> +                "'compression-type' does not accept value 'zstd'" in 
>> output:
>> +            self.case_skip('zstd compression not supported')
>>         def tearDown(self):
>>           os.remove(test_img)
>
>
> Hmm. Actually you fix the commit 12a936171d71f in a meaning that test 
> passes now. But that only stresses the fact that 12a936171d71f brings 
> a degradation in test-count for no-zstd builds. Is it bad?

Probably not really, considering that no-zstd builds shouldn’t be 
happening very often.  But since it’s something that can absolutely be 
worked around, it should be worked around. :)

> The simplest solution is to duplicate TestQCow3NotLazy and 
> TestQCow3LazyQMP with s/zstd/zlib/.. More complicated is to add 
> generic function to detect is zstd supported or not, and use zstd in 
> TestQCow3NotLazy and TestQCow3NotLazy only if zstd is supported (and 
> otherwise use zlib).

I think using zstd only if zstd is supported makes the most sense so we 
don’t increase the number of test cases for the more common case where 
zstd is compiled in.

Hanna


