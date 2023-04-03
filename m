Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0B36D47E6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:24:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjL5a-0002kI-9n; Mon, 03 Apr 2023 10:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pjL5X-0002iU-R4
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:23:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pjL5V-00053u-G6
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680531792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lWK1x4xT/r5xvzN0M13d+2Qm6pSMNPGokwaELB/s2bo=;
 b=MGFL29vBLYIfh1BYo7NWgJ1cCZxqZum7ULwaABETwz3fgaHj4dT5PJ9mrkpGcwEGklk4SC
 UrwMF2EPGlhBT6wqBLulHHDGd6LMf6FVcQ5nPYwOoSNTbmiGwss5VRte/Tq0+uY91Ye3kh
 OZybTAgPQ1QwZiueh8rawIe3BBDCtPk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-w_u7J7sTOkWj1aafftq3yQ-1; Mon, 03 Apr 2023 10:23:10 -0400
X-MC-Unique: w_u7J7sTOkWj1aafftq3yQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 u14-20020a05600c19ce00b003f0331154b1so6683146wmq.3
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 07:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680531790;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lWK1x4xT/r5xvzN0M13d+2Qm6pSMNPGokwaELB/s2bo=;
 b=WeviGLPfw7xbiK3+nUvYIpWVQ3aCV8xZuwb1ZZDeoqGT1Aam57nxtsvFL570QWX8Y/
 f9uCvg5J4ZzLda+H3Ahmc6Hn6R8WtoWOSKctKpGAoIe4/oESgpV87A93Q5KkzX2ylw0N
 jhJGLJC4PGjvvXJnSWreDWp/3pUwyLvf0iWQKPcXWHdHNAK6INZmaR/9bKsYnsY0MzxO
 AI34XYUJV7X82mrvvuZkxAzFRJsH+XMvs8LglUXMjNs11RkHDS+ghF3t3KxDfN/GnbMQ
 jbanI9ymuPU/McY5VsRVJ0ezSM6l/DyWje+U9b0lg5oAIQALLr0fHNT8RFQIi0UPccfd
 B01g==
X-Gm-Message-State: AO0yUKXIz2Rj64R5gFwwwaxXz0cYLnnys6NVqHqRK/kcwsA+X2bZDt5B
 h2gMWMnbTpFVnrzW7PYWO9ND9vwNvAJMI4n5S3cqcexaPrGEMkZge3puyF4enuGEa/g+P2yIbf+
 o9j+tk1k7aMILYUc=
X-Received: by 2002:a7b:c00f:0:b0:3eb:3945:d3fd with SMTP id
 c15-20020a7bc00f000000b003eb3945d3fdmr26957394wmb.14.1680531789814; 
 Mon, 03 Apr 2023 07:23:09 -0700 (PDT)
X-Google-Smtp-Source: AK7set8o0oq2hf4IhxhET+a2VbZ6M5kDwIQXinM3eIlQC1H4LFUOT2Mjn5DQBkY7XGJohjGM/x5mVA==
X-Received: by 2002:a7b:c00f:0:b0:3eb:3945:d3fd with SMTP id
 c15-20020a7bc00f000000b003eb3945d3fdmr26957384wmb.14.1680531789563; 
 Mon, 03 Apr 2023 07:23:09 -0700 (PDT)
Received: from ?IPV6:2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93?
 (p200300cfd72bb3c384eccc633ddf7d93.dip0.t-ipconnect.de.
 [2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a05600c46c300b003eddc6aa5fasm19747380wmo.39.2023.04.03.07.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 07:23:08 -0700 (PDT)
Message-ID: <2ca93485-4597-8545-8258-a37d2573c45b@redhat.com>
Date: Mon, 3 Apr 2023 16:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] iotests/iov-padding: New test
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20230317175019.10857-1-hreitz@redhat.com>
 <20230317175019.10857-5-hreitz@redhat.com>
 <20230318123907.jvakflmadbqfaszk@redhat.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230318123907.jvakflmadbqfaszk@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.349, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18.03.23 13:39, Eric Blake wrote:
> On Fri, Mar 17, 2023 at 06:50:19PM +0100, Hanna Czenczek wrote:
>> Test that even vectored IO requests with 1024 vector elements that are
>> not aligned to the device's request alignment will succeed.
>>
>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
>> ---
>> +
>> +# Four combinations:
>> +# - Offset 4096, length 1023 * 512 + 512: Fully aligned to 4k
>> +# - Offset 4096, length 1023 * 512 + 4096: Head is aligned, tail is not
> Making sure I understand - we don't care if intermediate iovs are
> smaller than the alignment requirement, because the scatter-gather
> effects will pool it together and our overall request is still
> aligned.  Correct?

Not trivial to answer, but the short answer is that we don’t care.

The long answer: Padding is only done for head and tail, so intermediate 
alignment doesn’t matter – for the interface. Internally, it does 
actually matter, because every single buffer in the vector must be 
aligned to the memory alignment, and its length must be aligned to the 
request alignment (bdrv_qiov_is_aligned()). If those requirements aren’t 
met, the file-posix driver will mark the request as QEMU_AIO_MISALIGNED, 
and emulate it (with many separate writes) instead of handing it over to 
a kernel interface that would take the full vector.

That doesn’t really matter for the test, but explains why this was no 
issue before we decided to actually internally limited I/O vectors to 
1024 elements: If the guest sees a smaller request alignment than the 
host has, and then submits a 1024-element vectored request, there is for 
sure going to be some buffer in those 1024 elements that isn’t fully 
aligned.  Therefore, qemu will emulate the request, and so it doesn’t 
matter whether we increased its length past 1024 elements.

So what it does mean for the test is that these requests’ I/O vectors 
are never going to be passed to the kernel as-is, so that code path 
isn’t exercised.  But, as laid out in the previous paragraph, that code 
path isn’t exercised with guest OSs either.

> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


