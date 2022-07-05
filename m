Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EC75667C5
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:21:55 +0200 (CEST)
Received: from localhost ([::1]:33976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8fgl-0007SV-AU
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8ffS-0006ZW-V6
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:20:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8ffO-0003OV-Jj
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657016425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0cKbrJjuV35QruaAEbfEgr3Lh/ELhmychT6cssd8nv0=;
 b=UH/3zTq/EKG2G0ApoUH2eFTzM3HmYrIP36aL1uRhlycW+j8WasoW6BMMttnCdvhEFWmNS0
 qrpllSOwWBKadyVlyhl11TssGWGOKOS1qiAsxdGXAe96D+g902BIhBnA40Tz5Mni+Y2jvK
 +TMcDaNpeaq6YHIiOmdrVF7LlBvJ6+I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-3qona7yrMnqc7wmnFKQbHg-1; Tue, 05 Jul 2022 06:20:24 -0400
X-MC-Unique: 3qona7yrMnqc7wmnFKQbHg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r128-20020a1c4486000000b003a2b44d876aso1846886wma.2
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 03:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0cKbrJjuV35QruaAEbfEgr3Lh/ELhmychT6cssd8nv0=;
 b=ofOHXtyWqCmUf5JHpXrbOmDoEZBjvb+H67CgEV2tksnfMPi4CG6EdmTgd/YfwAFwEx
 LPPrt0udGa8fbT57wZIyzf/edBINxg9xKTcO20an+KCkQX/3YCHpv9GRMhLM870F1h0n
 A64H0a7Jfhk/zicsnm+i1aY+sfJZsEC/PJoQV/tBfjmurJEyOVu+UswHR5SjSy4Bahli
 rN4n9lnZdis0b24BP6wDCvVT81tyeGpk8D7l1889KlkmYxOj/pXWtGa913Yr/qOZ1/iB
 aPDM3YGAKTv/qI1NC+nUh4uHSs9WVFCaZjF4fB2NoHmAd1VsThzBHbzljQd4IZsTMMnU
 A9wA==
X-Gm-Message-State: AJIora9rGLXQIWFZJFeWzEQ25LN5qC8wCSBbBgpiXFM5x2xRPGsF/8BI
 f/LB48vyPOdM0R18I0Im368EQTrtNNbmnMahZl7u8DLfpOFkOd4hlKEFT+k1RH1RF5OA8sU7USm
 XlXWWp5PlF9mdQYo=
X-Received: by 2002:a05:6000:1d89:b0:21d:5655:eb72 with SMTP id
 bk9-20020a0560001d8900b0021d5655eb72mr16840756wrb.110.1657016423456; 
 Tue, 05 Jul 2022 03:20:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sSvrTwPmxkbH5WE59kqIW/dBu3FTzNpok6WZN6wPyWur0hHmOoVvNjsiL/NdauTzDd0CeoKw==
X-Received: by 2002:a05:6000:1d89:b0:21d:5655:eb72 with SMTP id
 bk9-20020a0560001d8900b0021d5655eb72mr16840716wrb.110.1657016423118; 
 Tue, 05 Jul 2022 03:20:23 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-21.web.vodafone.de.
 [109.43.176.21]) by smtp.gmail.com with ESMTPSA id
 u18-20020adfdd52000000b002185d79dc7fsm9084366wrm.75.2022.07.05.03.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 03:20:22 -0700 (PDT)
Message-ID: <3efdf6ae-1ace-6db6-e947-e6288c41acd7@redhat.com>
Date: Tue, 5 Jul 2022 12:20:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Failure in iotest 183
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
References: <f629134d-0ce2-46df-13b5-30b735f6bd3d@redhat.com>
 <308c543a-5f72-b0f4-15d4-b98d4db6f4f2@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <308c543a-5f72-b0f4-15d4-b98d4db6f4f2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 05/07/2022 11.58, Hanna Reitz wrote:
> On 05.07.22 11:35, Thomas Huth wrote:
>>
>>  Hi!
>>
>> I've just hit a failure in iotest 183:
>>
>> --- /home/thuth/devel/qemu/tests/qemu-iotests/183.out
>> +++ /home/thuth/tmp/qemu-build/tests/qemu-iotests/scratch/183/183.out.bad
>> @@ -30,7 +30,7 @@
>>         'arguments': { 'uri': 'unix:SOCK_DIR/migrate', 'blk': true } }
>>  {"return": {}}
>>  { 'execute': 'query-status' }
>> -{"return": {"status": "postmigrate", "singlestep": false, "running": false}}
>> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
>> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, 
>> "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
>> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 
>> 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 
>> 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, 
>> "normal-bytes": 200704, "normal": 49}}}
> 
> Weird because query-status cannot return something with '"status": 
> "completed"' in it.  We can see the '"status": "postmigrate"' object 
> somewhere below, so it seems to me like the silent=yes part for the 
> query-migrate execution didn’t work as intended.
> 
> (And it does seem to work below, when waiting for a “100 %” to appear on 
> $dest.)
> 
> It’s been a while since we’ve touched common.qemu, so nothing comes to my 
> mind immediately that might have broken this.
...
> I’ve never hit this so far.
> 
> The only things to try I can come up with would be to bisect, or to try 
> adding `silent=$silent` to the `_timed_wait_for` calls in `send_qemu_cmd`...

Seems also like it does not reproduce that easily, though - I've just seen 
it once so far while running "make -j6 check SPEED=slow", so lots of other 
stuff was happening at the same time. I'll keep an eye on it to see whether 
I can reproduce it more easily somehow.

  Thomas


