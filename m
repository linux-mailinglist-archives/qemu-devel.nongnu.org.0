Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBA23CB90C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 16:49:27 +0200 (CEST)
Received: from localhost ([::1]:57128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4P9a-0003qo-9a
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 10:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4P7L-0002OM-73
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 10:47:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4P7F-0001Y8-Ji
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 10:47:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626446820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oCo8/2YHmdp0jS4NKlj2pmghpJWNvykE51FtkCJnUJ8=;
 b=TQtADywFK4vQ+5wb30n8Vbz6tUyEhCYPVTtMFqUFtais5eguqYGDxQDJYFPU6gdD7V80xV
 1WTMTluqOTajuBBrRCrycSVrTdobLoVH7dVTTT6GY4vca9fl8M4AvXFamWkr3EPg2lS/Mk
 WWwuseeU3H5evrCbiZKyWpY61Tmfbl8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320--dTSNfYwMWm_ZclFyL9rsw-1; Fri, 16 Jul 2021 10:46:58 -0400
X-MC-Unique: -dTSNfYwMWm_ZclFyL9rsw-1
Received: by mail-wr1-f70.google.com with SMTP id
 a4-20020adffb840000b02901304c660e75so4855763wrr.19
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 07:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oCo8/2YHmdp0jS4NKlj2pmghpJWNvykE51FtkCJnUJ8=;
 b=nk+Gqy98h54bOtDDxS4Yn7XmVDyM/j2yShKUzcBz6JMT9muKXOnEFSO26niR3ThiOo
 fPbBRlO/Vh03yZX8Gk1T9JxamwSJx7ua8U77qgYLhDSU6OTMCsI9/gW9fJAOCKqb0N4i
 GoXkIKjmQQmR5KUNBCllkQ1+IGQdzE4bTfIUxqkbicX1QYzSh4jsinayRQseEqd3DMRK
 IXnkDXwBZX3ahAvHDg9LL1P+nauTzb2SP4IR5mbKnq4vkeX/ZBr3qWG7ydkg7dYlp9Y3
 wkcED+UJU8ymvqiinHrAXlzO/GBnsh0D3hYmGiKh+1DRwJnCtG3eSYWv+KSNhdPkMH2o
 m9Sw==
X-Gm-Message-State: AOAM53233w8+Ctq1PVSvb4gVgVl8+0H9I2GLso/S0lpf3ZUI4Lmk+3A9
 NUKfE6t0fSFmuDKwyjYdkZtEDb+nnbBqk//RfARHc6JJXLeaZnk5a+lvmYOU/LnKfxfohmo3wHo
 I/v4f5Wq3Djh2YUU=
X-Received: by 2002:a5d:6da3:: with SMTP id u3mr12747432wrs.394.1626446817381; 
 Fri, 16 Jul 2021 07:46:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsYk2lLZF58uvRCwLfTjEPaB5qWocO3sDc4A1PhD+Z3FQmaB+KxoZjw1pBev221WZKSsCyEg==
X-Received: by 2002:a5d:6da3:: with SMTP id u3mr12747404wrs.394.1626446817066; 
 Fri, 16 Jul 2021 07:46:57 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 c12sm11580552wrr.90.2021.07.16.07.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 07:46:56 -0700 (PDT)
Subject: Re: [PATCH 08/14] iotests/common.rc: _make_test_img(): smarter
 compressiont_type handling
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-9-vsementsov@virtuozzo.com>
 <d983ae4a-dce5-35d3-1c63-7285651eae56@redhat.com>
 <a8c71445-a7cb-7d10-6b24-449861f9d39f@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <0a0b0ce5-3a9a-ca25-7f2f-9976b76cd1f6@redhat.com>
Date: Fri, 16 Jul 2021 16:46:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a8c71445-a7cb-7d10-6b24-449861f9d39f@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.07.21 16:24, Vladimir Sementsov-Ogievskiy wrote:
> 16.07.2021 15:38, Max Reitz wrote:
>> Subject: s/compressiont_type/compression_type/
>>
>> On 05.07.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
>>> Like it is done in iotests.py in qemu_img_create_prepare_args(), let's
>>> not follow compression_type=zstd of IMGOPTS if test creates image in
>>> old format.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   tests/qemu-iotests/common.rc | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/tests/qemu-iotests/common.rc 
>>> b/tests/qemu-iotests/common.rc
>>> index cbbf6d7c7f..4cae5b2d70 100644
>>> --- a/tests/qemu-iotests/common.rc
>>> +++ b/tests/qemu-iotests/common.rc
>>> @@ -438,6 +438,14 @@ _make_test_img()
>>>               backing_file=$param
>>>               continue
>>>           elif $opts_param; then
>>> +            if [[ "$param" == *"compat=0"* ]]; then
>>
>> Like in patch 2, probably should be 0.10, and account for “v2”.
>>
>>> +                # If user specified zstd compression type in 
>>> IMGOPTS, this will
>>> +                # just not work. So, let's imply forcing zlib 
>>> compression when
>>> +                # test creates image in old version of the format.
>>> +                # Similarly works qemu_img_create_prepare_args() in 
>>> iotests.py
>>> +                optstr=$(echo "$optstr" | $SED -e 
>>> 's/compression_type=\w\+//')
>>
>> What about the surrounding comma, if compression_type is just one 
>> option among others?  Do we need something like
>>
>> $SED -e 's/,compression_type=\w\+//' -e 's/compression_type=\w\+,\?//'
>>
>> ?
>
> Agree
>
>>
>>> +                optstr=$(_optstr_add "$optstr" 
>>> "compression_type=zlib")
>>
>> As the comment says, this is for compression_type in $IMGOPTS and 
>> then compat=0.10 in the parameters.  It won’t work if you have e.g. 
>> “_make_test_img -o compat=0.10,compression_type=zstd”, because then 
>> this generates the optstr 
>> “$IMGOPTS,compression_type=zlib,compat=0.10,compression_type=zstd”. 
>> Not sure if we want to care about this case, but, well...
>>
>> Then there’s the case where I have compat=0.10 in $IMGOPTS, and the 
>> test wants to use compression_type=zstd.  I think it’s correct not to 
>> replace compression_type=zstd then, because the test should be 
>> skipped for compat=0.10 in $IMGOPTS.  But that’s not what happens in 
>> the iotest.py version (qemu_img_create_prepare_args()), so I wonder 
>> whether the latter should be made to match this behavior here, if in 
>> any way possible.
>>
>> Now that I think about it more, I begin to wonder more...
>>
>> So this code doesn’t explicitly handle compression_type only in 
>> $IMGOPTS.  If you have
>>
>> _make_test_img -o compression_type=zstd,compat=0.10
>>
>> It’ll still keep the compression_type=zstd.  However, for
>>
>> _make_test_img -o compression_type=zstd -o compat=0.10
>>
>> It’ll replace it by zlib.
>>
>> So perhaps we should explicitly scan for compression_type only in 
>> $IMGOPTS and then drop it from the optstr if compat=0.10 is in the 
>> _make_test_img's -o options.
>>
>> But thinking further, this is not how $IMGOPTS work.  So far they 
>> aren’t advisory, they are mandatory.  If a test cannot work with 
>> something in $IMGOPTS, it has to be skipped.  Like, when you have 
>> compat=0.10 in $IMGOPTS, I don’t want to run tests that use v3 
>> features and have them just create v3 images for those tests.
>>
>> So my impression is that you’re giving compression_type special 
>> treatment here, and I don’t know why exactly.  Tests that create v2 
>> images should just have compression_type be an unsupported_imgopt.
>>
>> Max
>>
>
> Hmm.. I have better idea: deprecate v2 and drop all iotest support for 
> it now :)) What do you think?

I haven’t yet understood the appeal of deprecating v2, because basically 
all code is shared between v2 and v3. So I don’t really see the appeal 
in dropping iotest support for it either.

At least, this doesn’t appear like a better idea than to add 
_unsupported_imgopts where needed (in fact, _unsupported_imgopts should 
already be there for other v3-only options like lazy_refcounts).

> If not, than instead of this patch, we just should skip all tests that 
> don't support compression_type=zstd due to using old version.. This 
> means that we will skip some test-cases that can work with zstd just 
> because we can't skip separate test cases in bash tests.

The standard procedure for this is to have a quick look whether we 
actually lose (relevant) coverage for this imgopt if we skip the test 
(usually not), and if so, split that part out into a new file. But 
again, usually nothing of value is lost, so nothing is split off.

> (ohh, I'd deprecate bash tests too.. But that's kind of taste)

So far I don’t think there is a pressing reason why bash tests would be 
harder to support than Python tests, and so the effort to port all bash 
tests to Python seems much more difficult to me than having to duplicate 
meta-work like this.

(And in fact, as an example, I found it much easier to have bash tests 
support -o data_file than the Python tests, not least because the bash 
tests at least kind of all work the same, whereas we have like three 
variants of Python test styles.  Which brings me back to “bash tests 
don’t support separately skippable test cases” – well, same for most of 
our Python tests, I guess.)

Max


