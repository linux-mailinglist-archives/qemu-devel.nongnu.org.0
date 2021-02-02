Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B3130CCDA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 21:12:10 +0100 (CET)
Received: from localhost ([::1]:58792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l721w-0003Cn-Tz
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 15:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l720q-0002fc-Kn
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:11:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l720i-0001eY-Fp
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:11:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612296650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+oey9asTbH97fsJjIlpPofHKLxbhhSqOztHHFBI3eIg=;
 b=Oof1t7ebjg0flSPpmqN16cN9J+Cp6uMd0vNBoGPTO5AMWsRaQsXOQrm5pTv5XT2mzeupXH
 UiZA51gv1+jpLa9m0/isSh4PLs4Qf0gI2VnF2Bf+6NSyT7L1OkLU8nl2hTTSM6jvGBT6+M
 xmqcycp8B9wPonjVNNmZ92Rdtwwt2KI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-Pyg7MX-kOhWugqFzmDW2Jw-1; Tue, 02 Feb 2021 15:10:49 -0500
X-MC-Unique: Pyg7MX-kOhWugqFzmDW2Jw-1
Received: by mail-wm1-f70.google.com with SMTP id z67so1929089wme.3
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 12:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+oey9asTbH97fsJjIlpPofHKLxbhhSqOztHHFBI3eIg=;
 b=BzhEw9O6AIF5C0kGnwUGxo+G/m88yG0Fkr6yk3NvOI7awcuTkH+ZPrbSBUKpA5vFR+
 LuOiFj60GisvvKt9dmmx53tdJ2p59x6Az+f1fq1U5kIJoXHLcHb0B/OCIB1RBHcE97MX
 pNA/snxv7IFYOzJp9CdsonhZaZDcOQYPqVNfOK3bzuIcrlDDoWmNiO0tHYk0qs3WNtb7
 PHime7NICDxzs+kqPqG9YoxcwKSSLUaYno/uOYLxwMbw0xKym7rfTgixIuzVWC4lgC8T
 LuCel8s9SnqKU/Yi86TQEMxOw+Z9hV8HZYFny7mIosMIgZndhAYLmp4O68bpSVcL2Hco
 sPCg==
X-Gm-Message-State: AOAM533M1oSCPrhtAjTE5Kf6tTUPMPWqTLXxappqH+c5/FaQeBu8/WHE
 UZ2n/y1R2vciYDHVZt5ieSCY8eoD166rY2TOaKcezBl9HqY9QTKmnrvT+4Z25FAnyATACRMkp4I
 qSf9GdI9ZbSXAYnQ=
X-Received: by 2002:a5d:5051:: with SMTP id h17mr26315086wrt.164.1612296647629; 
 Tue, 02 Feb 2021 12:10:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvR8WexPosmfYcEVW7HnhGJrlMm3VXh+s7Ku5XEQYa/kbQLaOdb0JEaAg+6SJfSsTzlIxK0w==
X-Received: by 2002:a5d:5051:: with SMTP id h17mr26315072wrt.164.1612296647448; 
 Tue, 02 Feb 2021 12:10:47 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id s4sm33234410wrt.85.2021.02.02.12.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 12:10:46 -0800 (PST)
Subject: Re: [PATCH] iotests: Fix expected whitespace for 185
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210202185914.614705-1-eblake@redhat.com>
 <4c0fc5aa-d7a9-728c-24a8-e0aafc5a791c@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <db263d1d-a222-de58-fb1f-13d861c2a2bb@redhat.com>
Date: Tue, 2 Feb 2021 21:10:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4c0fc5aa-d7a9-728c-24a8-e0aafc5a791c@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 9:03 PM, Vladimir Sementsov-Ogievskiy wrote:
> 02.02.2021 21:59, Eric Blake wrote:
>> Commit f93e19fb03b adjusted various iotest whitespace discrepancies,
>> but missed a test that is not part of default 'make check'.
> 
> 
> Actually, at point of f93e19fb03b there is no x-perf at all, so it's not
> a miss in f93e19fb03b...
> 
> Let me bisect it...
> 
> Hmm, seems, it's wrong since introducing this line in 61623f82153788e

Assuming you'll reword the commit description:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Why was it wrongly added - it's a question.. Looks like something was
> merged in a meantime, that changed how qmp log looks like.. And original
> patch was made before that. But I don't want to dig more :)
> 
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>   tests/qemu-iotests/185.out | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/qemu-iotests/185.out b/tests/qemu-iotests/185.out
>> index 9dedc8eacbed..754a64125865 100644
>> --- a/tests/qemu-iotests/185.out
>> +++ b/tests/qemu-iotests/185.out
>> @@ -89,7 +89,7 @@ Formatting 'TEST_DIR/t.qcow2.copy', fmt=qcow2
>> cluster_size=65536 extended_l2=off
>>                         'format': 'IMGFMT',
>>                         'sync': 'full',
>>                         'speed': 65536,
>> -                      'x-perf': { 'max-chunk': 65536 } } }
>> +                      'x-perf': {'max-chunk': 65536} } }
>>   Formatting 'TEST_DIR/t.qcow2.copy', fmt=qcow2 cluster_size=65536
>> extended_l2=off compression_type=zlib size=67108864 lazy_refcounts=off
>> refcount_bits=16
>>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
>> "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id":
>> "disk"}}
>>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
>> "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id":
>> "disk"}}
>>
> 
> 
> for the patch itself:
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 


