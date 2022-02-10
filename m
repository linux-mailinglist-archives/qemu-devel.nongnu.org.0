Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C9C4B1548
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 19:33:47 +0100 (CET)
Received: from localhost ([::1]:50464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIEGH-0001AH-LC
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 13:33:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nID0x-0004ZD-Dy
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:13:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nID0u-0000Nj-I9
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644513219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jmfquqkZm6CRvDk4x7mdCVhV+lb44+Elbx6EJv5hD3w=;
 b=EiyRlp6eyJnc+BU1fW4B6MXyDS69WV+t7qf5ZOY8rCMIvEas9QCeTUuYJ3ukLwBzrz+N1k
 tqBuUk3oHVFV1BABrJn3DgCPE3Qu9iWfZaq9uZH9voiyy4ATREu8gJ17KuVPCk6YZjVTQo
 I3R9EcyxoYs0iSxMyW4Q+QP1GJjG44E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-2hiNRZRyMweUD3LcaiMmiQ-1; Thu, 10 Feb 2022 12:13:35 -0500
X-MC-Unique: 2hiNRZRyMweUD3LcaiMmiQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 k3-20020adfb343000000b001e463e6af20so2766858wrd.8
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 09:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jmfquqkZm6CRvDk4x7mdCVhV+lb44+Elbx6EJv5hD3w=;
 b=kK2AuDJDQlEux4UH7SX0dlxpB15wXzt/vtX7QP4OOLwCxSOEh3mB3yajgG0cqr69Rz
 ytxWpBg/ErZzaP1WROBsMV51xzy5ioaTbjO4/2vfQ9l1hlKT5G0B7zX+cmXLhlN4VFUy
 3GXV773Ybwwf8XzSHF27gCeewjfbrDvhZ2YYlKE1QnuQtYPTQMyRUTAZa5qz7+egE3v3
 FD/ZMfXFZNoa0hpfx8uG9iri6WSqdWrr25+rvRb/GrYX1CGA7kiuI/6b6VMUW8NmtDqu
 OdeV3X0r/V3Ofyw/WR5wdCvF5ytmiYYPlcROMuvduCw0uh4CkVzCo3xlFoYt4Z/sa7s7
 hd9Q==
X-Gm-Message-State: AOAM533pjC3Wd2PNi5ySDIOoeDRn9rd0Q1xTE8RcazqxWdKtPUZ6RGJL
 jBMQCJp3KxkVBAfqva/Y1gE9IAGpW0HoWVyGqePUGJrkWOY1CCF9Sti/WQX7r/U0L8aPhvyXC7X
 mxV54Naf+kNPbOyQ=
X-Received: by 2002:a05:600c:1ca8:: with SMTP id
 k40mr2991517wms.62.1644513214293; 
 Thu, 10 Feb 2022 09:13:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxESnytagCmoFwLrRpxOKAAKAAg/hlVzfeKOaEnayjAIcTGhVNL1pIn2p+5WjCBcmjGYn8BSg==
X-Received: by 2002:a05:600c:1ca8:: with SMTP id
 k40mr2991503wms.62.1644513214073; 
 Thu, 10 Feb 2022 09:13:34 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id j2sm1883592wms.2.2022.02.10.09.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 09:13:33 -0800 (PST)
Message-ID: <a4955275-6cdd-f54d-81b1-8380aad0461f@redhat.com>
Date: Thu, 10 Feb 2022 18:13:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: qemu iotest 161 and make check
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu block <qemu-block@nongnu.org>,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <36201311-39e2-0b94-1b06-74a2df988553@linux.ibm.com>
 <45589fd7-bf18-8950-34f5-86a90b99c8c1@virtuozzo.com>
 <586f035a-91b7-4743-9285-09996aa32b4f@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <586f035a-91b7-4743-9285-09996aa32b4f@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/02/2022 15.51, Christian Borntraeger wrote:
> 
> 
> Am 10.02.22 um 15:47 schrieb Vladimir Sementsov-Ogievskiy:
>> 10.02.2022 10:57, Christian Borntraeger wrote:
>>> Hello,
>>>
>>> I do see spurious failures of 161 in our CI, but only when I use
>>> make check with parallelism (-j).
>>> I have not yet figured out which other testcase could interfere
>>>
>>> @@ -34,6 +34,8 @@
>>>   *** Commit and then change an option on the backing file
>>>
>>>   Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=1048576
>>> +qemu-img: TEST_DIR/t.IMGFMT.base: Failed to get "write" lock
>>> +Is another process using the image [TEST_DIR/t.IMGFMT.base]?
>>>   Formatting 'TEST_DIR/t.IMGFMT.int', fmt=IMGFMT size=1048576 
>>> backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
>>>   Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 
>>> backing_file=TEST_DIR/t.IMGFMT.int backing_fmt=IMGFMT
>>>   { 'execute': 'qmp_capabilities' }
>>>
>>>
>>> any ideas?
>>>
>>
>> Hmm, interesting.. Is it always 161 and always exactly this diff?
> 
> Its always 161 and only 161. I would need to check if its always the same 
> error.
> 
>>
>> First, this place in 161 is usual: we just create and image, like in many 
>> other tests.
>>
>> Second, why _make_test_img trigger "Failed to get write lock"? It should 
>> just create an image. Hmm. And probably starts QSD if protocol is fuse. 
>> So, that start of QSD may probably fail.. Is that the case? What is image 
>> format and protocol used in test run?
>>
>> But anyway, tests running in parallel should not break each other as each 
>> test has own TEST_DIR and SOCK_DIR..

Unless you run into the issue that Hanna described here:

  https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01735.html

  Thomas



