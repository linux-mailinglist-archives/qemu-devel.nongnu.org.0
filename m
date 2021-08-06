Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79613E2C5F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:18:41 +0200 (CEST)
Received: from localhost ([::1]:43398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC0gK-0001Rm-O9
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mC0f7-0008Qq-La
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:17:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mC0f4-0004fq-PQ
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628259442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rwvJYFIv8mf79U4BELkvPV9qYh7Wo/fiPu1/+DaWV+A=;
 b=RruoRdaaqYzUaIxpLnu8hLt0NbFTQ6YQVSjuqK5hg7+5BjLqURHD8Kuzx/vBDW+YmTVEyq
 Esfp4e0eVRkyoNCfPYWRxy8/o+j/GbIzepaBDU31xdyjaHMb1r1BIZzEHoiOUQxNEcDOsL
 X6kV4DSGoxm4Y/TwIuKptIm2yFSgDuw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-pcHnpPUuP8KzsAmUzyPgZA-1; Fri, 06 Aug 2021 10:17:20 -0400
X-MC-Unique: pcHnpPUuP8KzsAmUzyPgZA-1
Received: by mail-wr1-f72.google.com with SMTP id
 l12-20020a5d6d8c0000b029015488313d96so3196081wrs.15
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 07:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rwvJYFIv8mf79U4BELkvPV9qYh7Wo/fiPu1/+DaWV+A=;
 b=kczxb/CFYba1mYdzA0vztvJnRD3cV7ni+FU2dDghHc+jqmAAF5FxBau8l8BhEM8nWe
 Cb4eHz+c4knGNp0SU89i3Fo9R5sxQLWTji/V1ApKYzPOzAzp1ADRGzfcWJfR6++swGWg
 ss7Ea6++xiNC0M4BdhoTwhYKNpI13l0nJO6ou7y313nBPeIti/hMpt8pfgsyA5A0kFPg
 df4qAF1gyK6uQhDJ+pH53mVEHcCjKe4SMTskn0btqGmxDAg6dbics6UvQDMv2eAhBj4K
 VfoFeIMcQIEpA87ezQzt3kofsfonhrwlk+cqN2brgT9NZufDUxIWGHexigNt32GuplEF
 jKFA==
X-Gm-Message-State: AOAM531ZCQjWYBpC31FAgmttw0O0TVSuCxuQkjIFt4rWiNgkZy3xQKFp
 HJvMij60nEpWXO/aAi26oqhnWSA3n77YRXGasFjsYTPOtiH823YQP8PWJHp2p81FsOq62lXU05r
 ko0MHX86lxHbo350=
X-Received: by 2002:adf:f4c5:: with SMTP id h5mr11245852wrp.292.1628259439576; 
 Fri, 06 Aug 2021 07:17:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyev9X1RnON87QZSS3F719nbygWS4PsB/sImY6F29YCued1CECNFKjTnrGliDgLgpCIfyxKAg==
X-Received: by 2002:adf:f4c5:: with SMTP id h5mr11245829wrp.292.1628259439408; 
 Fri, 06 Aug 2021 07:17:19 -0700 (PDT)
Received: from [192.168.43.238] (206.red-95-127-155.staticip.rima-tde.net.
 [95.127.155.206])
 by smtp.gmail.com with ESMTPSA id b20sm9581176wmj.48.2021.08.06.07.17.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 07:17:19 -0700 (PDT)
Subject: Re: [PATCH v1] s390x/ioinst: Fix wrong MSCH alignment check on little
 endian
To: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
References: <20210805143753.86520-1-david@redhat.com>
 <875ywizupc.fsf@redhat.com> <f699dbe2-1cbb-478a-3330-bd207da12055@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <344ed7e5-f9a4-6754-32a5-72821e98f869@redhat.com>
Date: Fri, 6 Aug 2021 16:17:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f699dbe2-1cbb-478a-3330-bd207da12055@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/21 1:30 PM, David Hildenbrand wrote:
> On 06.08.21 13:19, Cornelia Huck wrote:
>> On Thu, Aug 05 2021, David Hildenbrand <david@redhat.com> wrote:
>>
>>> schib->pmcw.chars is 32bit, not 16bit. This fixes the kvm-unit-tests
>>> "css" test, which fails with:
>>>
>>>    FAIL: Channel Subsystem: measurement block format1: Unaligned MB
>>> origin:
>>>    Program interrupt: expected(21) == received(0)
>>>
>>> Because we end up not injecting an operand program exception.
>>>
>>> Fixes: a54b8ac340c2 ("css: SCHIB measurement block origin must be
>>> aligned")
>>> Cc: Halil Pasic <pasic@linux.ibm.com>
>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>> Cc: Thomas Huth <thuth@redhat.com>
>>> Cc: Pierre Morel <pmorel@linux.ibm.com>
>>> Cc: qemu-s390x@nongnu.org
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>   target/s390x/ioinst.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Same question here: still -rc worthy, or not?
>>
> 
> It's been broken forever, this can also wait I guess.

But the commit referenced is recent:

commit a54b8ac340c20531daa89929c5ce7fed89fa401d
Date:   Fri Feb 19 14:39:33 2021 +0100

    css: SCHIB measurement block origin must be aligned


