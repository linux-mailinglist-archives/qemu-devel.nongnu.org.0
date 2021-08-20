Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F175E3F30C0
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 18:03:56 +0200 (CEST)
Received: from localhost ([::1]:33254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH6zm-0001HQ-Qb
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 12:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH6wd-0005zc-FH
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:00:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH6wb-0005qo-Ot
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:00:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629475232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j5dSjhlNUq6u7o7NicB0F+lvfhsc3TR9zM+HrOXIAM8=;
 b=LXb/MP/c1koK5uQZrRFedm4SetcImIXOZy9Mr3zDGBgHAqLpmNs1QFSsqgN7YXIJagiNSu
 uF3OWPPR3OigcGn1Au1SRLJY/beQ7LA+lbEeYFiFvWcvr+Y+GsoqtqZZYgolLZxaC18GF4
 eRJcjTx7+TEWgoZ1N796akMv1KvPq6s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-difx53MOOnKR5DQXyCztOQ-1; Fri, 20 Aug 2021 12:00:28 -0400
X-MC-Unique: difx53MOOnKR5DQXyCztOQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so4979545wml.5
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 09:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j5dSjhlNUq6u7o7NicB0F+lvfhsc3TR9zM+HrOXIAM8=;
 b=NRsmlFYuUH+w/pOrmxbqUDfoqIOpqrHefRYYlyQaKCWZsYYjGneDdK/WIIVfmPmVOP
 YVpfB68G+V0ZwkZtV6Zl5txlKYjE7gfeEWN1DLez8mgB3nT0ypmlC3kTeNy0OXDF+4ul
 5VHEpw7FOCDTbTNjgpYocsg/2ESm1oZ3Zu97UwQZB8lkaJhna94RJTmDwoxiyPIyW3WA
 StStvXI8vbmtlhmPP/nvaO3ysXyEIVsAjoprSIPja5OvRM9imRWgDLVEzZ41Rqw4TEOb
 vHiABpC+6ZYW4dWnAXo16SUKuIzJwQueR1Svp/oQTP6++TZb4MGI2dQuYzTrQbPxBKpJ
 46uw==
X-Gm-Message-State: AOAM531ADfJDZraO4m9rbf7Ms5/wNMIY4nOVyC96qyDR3NspJU4hyPqd
 oQ6cGS+pk9mnTd4WX/lwCjTMCJtZ8Y85eXSaCV3efZ3JKZFmDwWOr7FIyjmKvvqqHTKIEHpFO1B
 14OOHscHc19O0Ja4=
X-Received: by 2002:adf:e10c:: with SMTP id t12mr11016482wrz.36.1629475227519; 
 Fri, 20 Aug 2021 09:00:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCOP0PqlKVauRQCwETx1mf27IS9+3Gha50vLreXaf5LPqfr3FyPO6/oo3q3pVWJIeDfuEgLw==
X-Received: by 2002:adf:e10c:: with SMTP id t12mr11016467wrz.36.1629475227401; 
 Fri, 20 Aug 2021 09:00:27 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id e4sm6365082wrw.74.2021.08.20.09.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 09:00:26 -0700 (PDT)
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210820155211.3153137-1-philmd@redhat.com>
 <20a53e29-ba23-fe0d-f961-63d0b5ca9a89@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d68297ca-7be3-48ab-e25c-4f55dc735670@redhat.com>
Date: Fri, 20 Aug 2021 18:00:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20a53e29-ba23-fe0d-f961-63d0b5ca9a89@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 5:53 PM, David Hildenbrand wrote:
> On 20.08.21 17:52, Philippe Mathieu-Daudé wrote:
>> When Linux refuses to overcommit a seriously wild allocation we get:
>>
>>    $ qemu-system-i386 -m 40000000
>>    qemu-system-i386: cannot set up guest memory 'pc.ram': Cannot
>> allocate memory
>>
>> Slighly improve the error message, displaying the memory size
>> requested (in case the user didn't expect unspecified memory size
>> unit is in MiB):
>>
>>    $ qemu-system-i386 -m 40000000
>>    qemu-system-i386: Cannot set up 38.1 TiB of guest memory 'pc.ram':
>> Cannot allocate memory
>>
>> Reported-by: Bin Meng <bmeng.cn@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   softmmu/physmem.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 2e18947598e..2f300a9e79b 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -1982,8 +1982,10 @@ static void ram_block_add(RAMBlock *new_block,
>> Error **errp)
>>                                                    
>> &new_block->mr->align,
>>                                                     shared, noreserve);
>>               if (!new_block->host) {
>> +                g_autofree char *size_s =
>> size_to_str(new_block->max_length);
>>                   error_setg_errno(errp, errno,
>> -                                 "cannot set up guest memory '%s'",
>> +                                 "Cannot set up %s of guest memory
>> '%s'",
>> +                                 size_s,
>>                                    memory_region_name(new_block->mr));
>>                   qemu_mutex_unlock_ramlist();
>>                   return;
>>
> 
> IIRC, ram blocks might not necessarily be used for guest memory ... or
> is my memory wrong?

No clue, this error message was already here.

No problem to change s/guest/block/ although.


