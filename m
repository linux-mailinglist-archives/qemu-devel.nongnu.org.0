Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C41455FF3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 16:54:09 +0100 (CET)
Received: from localhost ([::1]:33790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnjjk-00023y-G1
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 10:54:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnjin-0001FJ-JO
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 10:53:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnjik-0001nq-Lv
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 10:53:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637250785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XwHJkKimdigolm51ibJTiwPSzXGKhj9eLJNWwishndQ=;
 b=OYpKB0plCownzubS9Z5//BOqa2q8UdSiUTW0e7o8PlXoJOmvGbMWcuAS6WVOKgD2nsXGRk
 a2v8+dV62jAtu5igIti+p6jE+UoFEAMLsqFinTEHxJ21TBlTtFz1KuDZI5/RK0gwmGJvCE
 lSuWJQVpHVr5inWcnrPvroP2BO7ieIE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-adUyNSNVMqiL3ENt59fF2g-1; Thu, 18 Nov 2021 10:53:04 -0500
X-MC-Unique: adUyNSNVMqiL3ENt59fF2g-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso3330945wms.5
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 07:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XwHJkKimdigolm51ibJTiwPSzXGKhj9eLJNWwishndQ=;
 b=AWu3uoLhxL2KjZnopD0Yg9auceXxcC29VXQ4ChcjJH+avgvkKDTNqGXwN7QAlbXVXg
 rzhzIvMuaJbjTEnGLKrWUCn9B4xbTnqb0/y5NwIhXKokOFtFSZ14/I+3Bi7Wm5M9iBBG
 YytI+oF+wZWzLpKcLOCBVxtuYsYK2PtLyyT3rbLFlyKnZT8eBtSU19o+C//WmP7bqvW2
 azTUwvO8ypCFWZnAEpMuhQJpLfsHn90HRaEBZqWicYP3zgPU/Q8DD90ftHX4A3i8+rOT
 SxknaO2OqgM6xGNjn+MuBFFLwDjmlJ3ZOOUTRJDmIJ93nW6y9UJs9coxUKUGUW+fuV3q
 kilQ==
X-Gm-Message-State: AOAM530sLhrkIbmTD04zMiDOIo4j54COYF4GFQu4JiRRwXrAANgyc1mw
 OEeAULMJmT8g6Jr61NSFvHuGLAraAHT8Ewc1j/tjGrBGk4yguTmumYYycD9CESChfZbsOeKOrnK
 Vo7wOHX4GfTZQvrE=
X-Received: by 2002:a05:6000:1848:: with SMTP id
 c8mr31747232wri.265.1637250783377; 
 Thu, 18 Nov 2021 07:53:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxptgwAfFDRNKNKbc7AxrZKB2ol7VHftFgqjv3MnPvb4ugrbbtIx7fx0MqE5iDRT0IAtUhdHg==
X-Received: by 2002:a05:6000:1848:: with SMTP id
 c8mr31747195wri.265.1637250783104; 
 Thu, 18 Nov 2021 07:53:03 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id o4sm276178wry.80.2021.11.18.07.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 07:53:02 -0800 (PST)
Message-ID: <ec979fe1-caa7-ce1c-3d25-73130bcc7102@redhat.com>
Date: Thu, 18 Nov 2021 16:53:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/2] iotests/149: Skip on unsupported ciphers
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211117151707.52549-1-hreitz@redhat.com>
 <20211117151707.52549-3-hreitz@redhat.com> <YZUjwQ8BzU+fIPUC@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <YZUjwQ8BzU+fIPUC@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.11.21 16:46, Daniel P. Berrangé wrote:
> On Wed, Nov 17, 2021 at 04:17:07PM +0100, Hanna Reitz wrote:
>> Whenever qemu-img or qemu-io report that some cipher is unsupported,
>> skip the whole test, because that is probably because qemu has been
>> configured with the gnutls crypto backend.
>>
>> We could taylor the algorithm list to what gnutls supports, but this is
>> a test that is run rather rarely anyway (because it requires
>> password-less sudo), and so it seems better and easier to skip it.  When
>> this test is intentionally run to check LUKS compatibility, it seems
>> better not to limit the algorithms but keep the list extensive.
> I'd really like to figure out a way to be able to partially run
> this test. When I have hit problems in the past, I needed to
> run specific tests, but then the expected output always contains
> everything.  I've thought of a few options
>
>   - Split it into many stanadlone tests - eg
>       tests/qemu-iotests/tests/luks-host-$ALG

I wouldn’t hate it, though we should have some common file where common 
code can be sourced from.

>   - Split only the expected output eg
>   
>       149-$SUBTEST
>
>    and have a way to indicate which of expected output files
>    we need to concatenate for the set of subtests that we
>    run.

I’d prefer it if the test could verify its own output so that the 
reference output is basically just the usual unittest output of dots, 
“Ran XX tests” and “OK”.

(Two reasons: You can then easily disable some tests with the reference 
output changing only slightly; and it makes reviewing a test much easier 
because then I don’t need to verify the reference output...)

>   - Introduce some template syntax in expected output
>     tha can be used to munge the output.
>
>   - Stop comparing expected output entirely and just
>     then this into a normal python unit test.

That’s something that might indeed be useful for unittest-style iotests.

Then again, we already allow them to skip any test case and it will be 
counted as success, is that not sufficient?

>   - Insert your idea here ?

I personally most prefer unittest-style tests, because with them you can 
just %s/def test_/def xtest_/, then reverse this change for all the 
cases you want to run, and then adjust the reference output to match the 
number of tests run.

So I suppose the best idea I have is to convert this test into unittest 
style, and then it should be more modular when it comes to what subtests 
it wants to run.

I mean, it doesn’t have to truly be an iotests.QMPTestCase.  It would be 
sufficient if the test itself verified the output of every command it 
invokes (instead of leaving that to a separate reference output file) 
and then printed something like “OK” afterwards.  Then we could 
trivially skip some cases just by printing “OK” even if they weren’t run.

Hanna


