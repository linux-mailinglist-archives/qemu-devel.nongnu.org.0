Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBEF3A9BD2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:20:07 +0200 (CEST)
Received: from localhost ([::1]:39920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVSg-0003LE-6a
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltVRf-0001pO-0V
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:19:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltVRc-0000FJ-27
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623849537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=72OYqlPswc7nWWMH4CbGS3WBxPmRekRaoGjnier/A3I=;
 b=RrWudJ1oJxM9evJWUO8QwYAIgN+WZNwuTpyZUiYPiUW6S4V3hA0TbkZpHinv3DE8moZbQn
 TWttW6O9M1tcyWK6IiA2MUYT+1ljd0PHWaNyZDgZCwjbwmRJ50+2hWzx3ajxCDRm1JXhHH
 G6UUVaSVKywFu7DGaoBzbZLNZdBJj5s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-QXUJ6xs9O22sPf1vXWY6jQ-1; Wed, 16 Jun 2021 09:18:56 -0400
X-MC-Unique: QXUJ6xs9O22sPf1vXWY6jQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 b8-20020a170906d108b02903fa10388224so925284ejz.18
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 06:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=72OYqlPswc7nWWMH4CbGS3WBxPmRekRaoGjnier/A3I=;
 b=WrbYAfmNsSM+F4NKIXeg1s9s7hCqSXOiaFfe1DqBe8zDMf1ogrGM+qoVDPYXIe7VUR
 FtuNajm8es3JnPut0WbpI/7KeKkJt2z404La6da6KKSGjinaiESWR0m867gGjLI0pgFC
 /N1AyMK7bAxSLgvbQ4zZEfeb/tj+PdBgniUxLU8uWg2Tb9ZMz23iUowg3IN9XRIv5JYa
 XNHJi01hTfW9hEU2Nr79C/aD96dZhCANYilOr2pN4s7i7VrwcQcNQbHSB0Oo84vACL37
 or40DNVBrUtsXDLmzrMH0Ockep8JYVdKkTbZ5oi5FkLo3ncdhPX83sOy20zX3VoekdB8
 aSJg==
X-Gm-Message-State: AOAM5309NKvOaYCYnBCVJ5Lsznys+xO20GgEJEXU9zpNecEuuQJ7VBwP
 MM2Gi5ycNqNhpKBBP/+X/aoIzglObAQWTQKwumAl5Q6LYPjRLODuTTdGYoPmjhJ0k+HUjVqvAtR
 +SzmJJ3l916kXv9U=
X-Received: by 2002:aa7:ce86:: with SMTP id y6mr4132014edv.309.1623849535030; 
 Wed, 16 Jun 2021 06:18:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHEdKEDtc7ZJradWAi/t5OcEjFa9RzNgk1fBXiDTXfRvxYYw1waqmCxlVJWdjj85PcfVdWtg==
X-Received: by 2002:aa7:ce86:: with SMTP id y6mr4131983edv.309.1623849534791; 
 Wed, 16 Jun 2021 06:18:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n23sm1829832edr.87.2021.06.16.06.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 06:18:52 -0700 (PDT)
Subject: Re: [PATCH v3 3/7] block: add max_hw_transfer to BlockLimits
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-4-pbonzini@redhat.com>
 <cb030dc0-ee6f-4c0b-723d-4197c51f8a61@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a684c31d-9da3-9e75-89c0-c68997760108@redhat.com>
Date: Wed, 16 Jun 2021 15:18:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <cb030dc0-ee6f-4c0b-723d-4197c51f8a61@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.17, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/06/21 18:18, Max Reitz wrote:
>>   }
>> +/* Returns the maximum hardware transfer length, in bytes; guaranteed 
>> nonzero */
>> +uint64_t blk_get_max_hw_transfer(BlockBackend *blk)
>> +{
>> +    BlockDriverState *bs = blk_bs(blk);
>> +    uint64_t max = INT_MAX;
>> +
>> +    if (bs) {
>> +        max = MIN_NON_ZERO(bs->bl.max_hw_transfer, bs->bl.max_transfer);
>> +    }
>> +    return max;
> 
> Both `max_hw_transfer` and `max_transfer` can be 0, so this could return 
> 0, contrary to what the comment above promises.
> 
> Should `max` be initialized to 0 with a `MIN_NON_ZERO(max, INT_MAX)` 
> here (like `blk_get_max_transfer()` does it)?

Yes, something to that effect.

> (As for the rest, I think aligning to the request alignment makes sense, 
> but then again we don’t do that for max_transfer either, so... this at 
> least wouldn’t be a new bug.

Ok, will do.  I will also add a new patch to align max_transfer to the 
request alignment.

> Regarding the comment, checkpatch complains about it, so it should be 
> fixed so that /* is on its own line.

That makes it different from every other comment in block_int.h though. 
  Is it okay to fix all of them in a follow-up?

Paolo

> Speaking of checkpatch, now that I ran it, it also complains about the 
> new line in bdrv_merge_limits() exceeding 80 characters, so that should 
> be fixed, too.)


