Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23E7375C15
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 22:04:07 +0200 (CEST)
Received: from localhost ([::1]:47780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lekEA-000704-49
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 16:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lekBB-0006LV-Ki
 for qemu-devel@nongnu.org; Thu, 06 May 2021 16:01:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lekB1-0006gr-Pf
 for qemu-devel@nongnu.org; Thu, 06 May 2021 16:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620331248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yudgmIQn3hghxVW4zyY5B4fizVer8MR7FSo3oxcCGgM=;
 b=Fb6QnEklM7DKUTKBWsxd9Uk9v9+QYYkOTPwGuFzQmXP5xxa/5FdCmIdirBbe7atp8A16jW
 TgFzTMHRtN9SLUGCb+XLNx67QBfGGnsh4xIZ4heD/TpHFHo1NyTcI1vbYFN7FHDUndLsa9
 Nb/4NIJeQIYPJcLDPAmdNOdgJJD1fBY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-UBP1TwIdMAS4Z5EfaskJsg-1; Thu, 06 May 2021 16:00:46 -0400
X-MC-Unique: UBP1TwIdMAS4Z5EfaskJsg-1
Received: by mail-wr1-f71.google.com with SMTP id
 q18-20020adfc5120000b029010c2bdd72adso2623953wrf.16
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 13:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yudgmIQn3hghxVW4zyY5B4fizVer8MR7FSo3oxcCGgM=;
 b=umzsfth2a0YZ4XKkAgHvrAEkYfIfikMF2vG43o0bViVDdxyCJGu746GW8etL1x2lfC
 5YIJDjlcJNfT0j7WfC+GukG6ZHVL4hr8covKd24Hkqk/8bFm5NWcd0BPlIQXLEd0oZ+u
 /leD8V7ocETBaUMZ7Q4tyt7Juc2P7at1bRybLpqMx2fMtE76zeaUguboR80Fvcvn0pb4
 GZg2j3+HKMEbqqbIoMf1NZLmQ91kN387h+9svlHiPuxWvKPWw1ssJ366MHUQbvG0fGwA
 AkIBA2EAFETGHh7ZgymvyQMbD/+vui4rmsQjgo7FzWv2be/Q095ZsHHrKZUmm71VtnMA
 RDfQ==
X-Gm-Message-State: AOAM530Q8OWGwvmkDHrdX0WLAWu0ok5HBL2iTjRBUEvk6ZBg8Qvn5ngn
 Bp9W+vJA8LOWshcqxvk868MzDKoUvt9cMigNkpNJiAteSMnxUYDQsG6vkr1SkEJRZ1/YhNUDIsy
 9B3/6hxxntVxktuQ=
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr6024461wmj.115.1620331245866; 
 Thu, 06 May 2021 13:00:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT17Q7lTDxN646PmD1cPyas9bOJppOKoF7DrDA/o1IfIl3SFlVCP5Zc6rBC1b4LeL2YZ1ctQ==
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr6024428wmj.115.1620331245553; 
 Thu, 06 May 2021 13:00:45 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id a15sm6603747wrx.9.2021.05.06.13.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 13:00:45 -0700 (PDT)
Subject: Re: [PATCH] virtio-blk: Convert QEMUBH callback to "bitops.h" API
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210506155419.1796056-1-philmd@redhat.com>
 <fdf97a71-1359-e186-a895-3383c31ca20c@linaro.org>
 <20266f2d-00e2-339a-0fdf-122c32ae4da1@redhat.com>
Message-ID: <0f3dbab6-8b73-7988-213d-a248d48f2bbc@redhat.com>
Date: Thu, 6 May 2021 22:00:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20266f2d-00e2-339a-0fdf-122c32ae4da1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Li Hangjing <lihangjing@baidu.com>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Chai Wen <chaiwen@baidu.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xie Yongji <xieyongji@baidu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 9:42 PM, Philippe Mathieu-Daudé wrote:
> On 5/6/21 8:22 PM, Richard Henderson wrote:
>> On 5/6/21 8:54 AM, Philippe Mathieu-Daudé wrote:
>>>   static void notify_guest_bh(void *opaque)
>>>   {
>>>       VirtIOBlockDataPlane *s = opaque;
>>> -    unsigned nvqs = s->conf->num_queues;
>>> -    unsigned long bitmap[BITS_TO_LONGS(nvqs)];
>>> -    unsigned j;
>>>   -    memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
>>> -    memset(s->batch_notify_vqs, 0, sizeof(bitmap));
>>> -
>>> -    for (j = 0; j < nvqs; j += BITS_PER_LONG) {
>>> -        unsigned long bits = bitmap[j / BITS_PER_LONG];
>>> -
>>> -        while (bits != 0) {
>>> -            unsigned i = j + ctzl(bits);
>>> +    for (unsigned i = 0; i < s->conf->num_queues; i++) {
>>
>> Is this bitmap dense enough that you want to iterate by index,

The max is 1Kb:

#define VIRTIO_QUEUE_MAX 1024

> 
> By 'iterate by index' do you mean the actual iteration with 'j'?
> 
>> or is it
>> sparse enough to iterate via find_first_bit/find_next_bit?
> 
> I looked at find_first_bit/find_next_bit() but they seemed to do
> a lot more than test_and_clear_bit(). As Stefan said this is hot
> path, I thought this would be cheaper, but haven't profiled the
> performance.
> 
>> In either case, leave the copy of  s->conf->num_queues to a local variable.
> 
> That is sensible to do :)
> 


