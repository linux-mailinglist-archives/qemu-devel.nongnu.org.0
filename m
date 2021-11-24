Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7019645C56D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:54:38 +0100 (CET)
Received: from localhost ([::1]:56148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpsjN-0001Eb-AI
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:54:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpsTa-0001FR-83
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:38:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpsTX-00027U-J8
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637761095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VgWJwF71rRj3BAZgIxRI+783C8gnsXbnluEjXF085/g=;
 b=h/ImXw/eTBOEubLKvJPr0kT5YXOe4y47F4p4q+30f285x6DuQFJDKu65BC2SHuD1+Wsc/y
 N8BCvdgeTElsRTg1CE0dJ5jniXEOwP6I64MoCOHoJeKS7NobHuekoTQX5zXec9d27YMmmT
 VMpbDfhxFayfd9Utr0oHz447/4P3YGA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-QoKxeEUSO7ShcCvffKZrhw-1; Wed, 24 Nov 2021 08:38:13 -0500
X-MC-Unique: QoKxeEUSO7ShcCvffKZrhw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d7-20020a5d6447000000b00186a113463dso500620wrw.10
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 05:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VgWJwF71rRj3BAZgIxRI+783C8gnsXbnluEjXF085/g=;
 b=NoPvLp7RQHPWKn8YaEXYUwN3uFeRqziE5q8+7zacTLK/UHFrzoMsYFBc4A2KmKAPr4
 rkS3ObGk6y2lcMUD+wcAOsGZLP2zRw7tN2hTezKsxwdIlQIuu4fWvE8eIY7i81yho/hP
 YAG3tUO7MGUuCqb2tvAxudxTdyus3mmo0fWrWB2wpqOGxROzQWJrV1ZH26+z6ERBna8/
 M8UE9LopyOUMJKpmrG+EynUBSggUlRUi/FI9TZ1Wmtio9jrLpsCAIZ6Z0EvFBGO9Wrwk
 VVAbbTEsqZfT1HEIZdVpvR/TnKe3IV2XyclV9zuU9iKK41Ae7aRKhXjmPB0XADBAdg43
 1eYA==
X-Gm-Message-State: AOAM533Oq56keVhO316IUDZ1lLd3n7ibjn7m8OPGK9Rz5HXmK3ODwRng
 chKE7x2VpJmJfO5QEveLxBVD/gSHHRiXwiRyNNg5FEUof7gCuYTsssna3/v+6Iw5tVNUdbaKU1O
 exC8KdQZ43HwhWfQ=
X-Received: by 2002:adf:d20e:: with SMTP id j14mr19009269wrh.220.1637761092598; 
 Wed, 24 Nov 2021 05:38:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYXtHa165isVX5WrrSvDLF93IQFO4jL1Rq4dKw6Q7L6Du4ryGGts2+ePijAB/nS047bm7+fg==
X-Received: by 2002:adf:d20e:: with SMTP id j14mr19009233wrh.220.1637761092428; 
 Wed, 24 Nov 2021 05:38:12 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id i17sm5706653wmq.48.2021.11.24.05.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 05:38:12 -0800 (PST)
Message-ID: <bc590b20-9c85-1174-4b4e-b27bbf729572@redhat.com>
Date: Wed, 24 Nov 2021 14:38:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 05/18] ci: explicitly skip I/O tests on alpine
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-6-berrange@redhat.com>
 <fb749701-0dee-8ae6-da2d-f7ed2c09004f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <fb749701-0dee-8ae6-da2d-f7ed2c09004f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 14:36, Thomas Huth wrote:
> On 24/11/2021 14.01, Daniel P. Berrangé wrote:
>> The block I/O tests don't work on Alpine because their alternative libc
>> impl emits different strings for errnos, which breaks the expected
>> output matching. e.g.
>>
>> === IO: pattern 102
>>   wrote 512/512 bytes at offset 512
>>   512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>> -qemu-img: Error while reading offset 0 of
>> blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT: Input/output error
>> +qemu-img: Error while reading offset 0 of
>> blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT: I/O error
>>   4
>>   Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
>>   Formatting 'TEST_DIR/t.IMGFMT.2', fmt=IMGFMT size=0
>>
>> Currently the I/O tests are skipped as a side effect of the Alpine image
>> containing a minimal busybox 'sed' binary, rather than GNU Sed. This is
>> a fragile assumption that will be invalidated when the dockerfile is
>> changed to be autogenerated from a standardized package list that
>> includes GNU Sed.
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>   .gitlab-ci.d/buildtest.yml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>> index 71d0f407ad..e1fe37e563 100644
>> --- a/.gitlab-ci.d/buildtest.yml
>> +++ b/.gitlab-ci.d/buildtest.yml
>> @@ -24,7 +24,7 @@ check-system-alpine:
>>         artifacts: true
>>     variables:
>>       IMAGE: alpine
>> -    MAKE_CHECK_ARGS: check
>> +    MAKE_CHECK_ARGS: check-unit check-qtest
> 
> Hmm, that's just a work-around ... what if some user wants to run "make
> check" on an Alpine installation that has the real GNU sed installed?
> ... I think this rather requires some fixing in the iotests instead - or
> maybe the related tests should simply not be in the "auto" group anymore?

Or kludge EIO in error_setg_errno_internal()?


