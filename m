Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08A2124E56
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 17:51:02 +0100 (CET)
Received: from localhost ([::1]:57214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihcXN-0000Gj-E9
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 11:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50369)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ihcQg-0001Pc-Bt
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:44:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ihcQe-0000Sf-AP
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:44:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28306
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ihcQe-0000Ne-0c
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:44:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576687443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ggb5uT5yzs110uw1avq/HkgfrkhG0agcAPxS7x2CoDs=;
 b=S2kuBDQtwpExTBfr+z2y+6bYFX4Sb5fFYrDU0Jp1qiVf4WHbaq/ZYQDCvGP/lGB4GTGWz6
 X/cg9g5Qssp93Pr49LpV+McEN0KF/zZ2uV7UQZu7hx6mpAtF19S10UXEPY8USuaBu4wrgZ
 u2UzbYAdlLP/CQeyNf51lfPW462ruYA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-1B0BEqOMNQaoT8s9rtSgcg-1; Wed, 18 Dec 2019 11:44:02 -0500
Received: by mail-wr1-f69.google.com with SMTP id z15so1113689wrw.0
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 08:44:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ggb5uT5yzs110uw1avq/HkgfrkhG0agcAPxS7x2CoDs=;
 b=aM1SfenF1L0h3DvjHANwg/X6faqbXcpSh2UQF6XLmSUfw0mcYbVYa5L48QOWWJcxqA
 Gw4GLkzuDQcF8TOKJjud4bZc/8wnAoOrRdwV/AMbkV2ssFIK6Cy0UciU9iyv92h07TvM
 iB2uFrfFxyc2z8nz9An2/hko4uJnrxGESAJp7KE6guHvjTKbJB1mjkPmBIySmMl0zIHH
 KR8BLiKfFsRR8X6x0Xwb4VPemImHtbkK2hRUVbGW4cRsl6jcu02B3o3YtUgXJYVY8vvN
 KVj4wntnDbNZHIaLyg9kYk9TR0afDYQqSbz+TLldhLS20GwfY1Qwgl8oBYqzH378m+w2
 eHEw==
X-Gm-Message-State: APjAAAW2xpPpSCxGbbIODBjEiGWDfqQXKSh2cA6lJA69/YGJz0AK9GTb
 iosfTQOzMUAUogOuUJ4nfMKKJGE/LPqi2r814dJ2cYb/91NfOQzcyvD+uimU6aBGI4GbvhtN7Us
 zJsuOrQjgrSR4CTA=
X-Received: by 2002:adf:9144:: with SMTP id j62mr3759059wrj.168.1576687440113; 
 Wed, 18 Dec 2019 08:44:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqxbqkQeb4t+qIFj7T3zDp0lW61iv2/8fz1R8iOL5dRz4dF3plwXQtz/Kdyn9I51oV8JBOl7hQ==
X-Received: by 2002:adf:9144:: with SMTP id j62mr3759033wrj.168.1576687439828; 
 Wed, 18 Dec 2019 08:43:59 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:ac09:bce1:1c26:264c?
 ([2001:b07:6468:f312:ac09:bce1:1c26:264c])
 by smtp.gmail.com with ESMTPSA id d16sm3422906wrg.27.2019.12.18.08.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 08:43:59 -0800 (PST)
Subject: Re: [PATCH 1/3] block: eliminate BDRV_REQ_NO_SERIALISING
To: Kevin Wolf <kwolf@redhat.com>
References: <1576675026-25046-1-git-send-email-pbonzini@redhat.com>
 <1576675026-25046-2-git-send-email-pbonzini@redhat.com>
 <20191218163636.GC4632@linux.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ebdddf75-60a7-48b2-c075-232149979776@redhat.com>
Date: Wed, 18 Dec 2019 17:43:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191218163636.GC4632@linux.fritz.box>
Content-Language: en-US
X-MC-Unique: 1B0BEqOMNQaoT8s9rtSgcg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/12/19 17:37, Kevin Wolf wrote:
>>       * passthrough flags.  */
>> -    assert(!(flags & ~(BDRV_REQ_NO_SERIALISING | BDRV_REQ_COPY_ON_READ |
>> -                       BDRV_REQ_PREFETCH)));
>> +    assert(!(flags & ~(BDRV_REQ_COPY_ON_READ | BDRV_REQ_PREFETCH)));
>>  
>>      /* Handle Copy on Read and associated serialisation */
>>      if (flags & BDRV_REQ_COPY_ON_READ) {
>> @@ -1458,12 +1457,7 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
>>          bdrv_mark_request_serialising(req, bdrv_get_cluster_size(bs));
>>      }
>>  
>> -    /* BDRV_REQ_SERIALISING is only for write operation */
>> -    assert(!(flags & BDRV_REQ_SERIALISING));
> I think we shoud still keep this assertion as long as read requests
> don't mark themselves as serialising when BDRV_REQ_SERIALISING is given.
> Otherwise, someone might add the flag to a read request and will later
> be surprised that it didn't work.

I'm removing it because it's anyway tested by the earlier

    assert(!(flags & ~(BDRV_REQ_COPY_ON_READ | BDRV_REQ_PREFETCH)));

>> @@ -3222,9 +3214,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
>>  
>>          /* BDRV_REQ_SERIALISING is only for write operation */
>>          assert(!(read_flags & BDRV_REQ_SERIALISING));
> Here you kept the assertion, so apart from making sense anyway, it would
> also be more consistent to keep it above, too. :-)

... which is not present here.

Paolo


