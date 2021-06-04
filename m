Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D7239B3C0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 09:22:33 +0200 (CEST)
Received: from localhost ([::1]:41014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp4A4-0005Md-Ds
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 03:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lp48u-0004Fk-TU
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:21:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lp48p-0000DX-P1
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622791274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9HqIOwbtiOSHOQgYB8AsPBltcERJ0L6E1je0jKpcnmk=;
 b=c7My9whFj+j7LleVCb2PnWCoYX3pmhDIBzZvnFVxFLBz301TLCjO6QA0/IY6v3DxkTepV7
 yfXXETNyJtv4CXhmlpsgGs3NIff6/U2xpcW7Tdl+Q/WKOb+9SAJAwtctpBm/5vXEzTvH8y
 rG/l7xxnvXP5+t6hbpYn4c+BMBVD20w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-06utC2ylMguTGintBAI5JQ-1; Fri, 04 Jun 2021 03:21:13 -0400
X-MC-Unique: 06utC2ylMguTGintBAI5JQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 q7-20020aa7cc070000b029038f59dab1c5so4544856edt.23
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 00:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9HqIOwbtiOSHOQgYB8AsPBltcERJ0L6E1je0jKpcnmk=;
 b=Ks7b6VQ5HhKIEWqctkOPwGtpWlGuJ0qGLJCA5vwaMUOb/CSSNJZ3gRYf/kL5CVqNVu
 NNtblVQVEVTpYsMJ2V9Q8wpA8QttjKW1qiqS51GGNlL6yVRKw6la6yYPheCzc0IwLii/
 8noJRWPY6kxERoUgAsIBrpvVa3o0LqZhUBs39FkGd8fiT4PLe+oIWrrKAifpFYx20yE4
 TeXjcUFW0pqFJsj+ZcsGeZiCnT06WoIHh0PjVzEK3/Jf5FBEWZ53/pUkYg4i5om/R5n7
 O+1lcKRRgGsd34Y5tKy1cpr+A7SKni8ScVuRZAVqi3Zepb+tv+3zEqLklyyFvLR0igFX
 FtyQ==
X-Gm-Message-State: AOAM5325eZ32L2dBrfXyo06SFSF6f5+XFj47Vjt+T79TuCYbM3aFjpEV
 eiU8dyPdOcN2tUHqKTqgmWS8iJL/ZGkwVQ+Nb1+FAslESH6BG4qkssjoVWTGsCPsfwMRPfNh0YM
 giJnja0/0tbOl3D8=
X-Received: by 2002:a05:6402:10c9:: with SMTP id
 p9mr3275720edu.370.1622791272522; 
 Fri, 04 Jun 2021 00:21:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzykwvdQeVGPadwVVQ/2ACRDjzx0O2FnoTZB+YipgKeRr/Mx0AhTnphUCFM1BK9lqEqXYfkTg==
X-Received: by 2002:a05:6402:10c9:: with SMTP id
 p9mr3275695edu.370.1622791272264; 
 Fri, 04 Jun 2021 00:21:12 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rl12sm2372992ejb.94.2021.06.04.00.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 00:21:11 -0700 (PDT)
Subject: Re: [PATCH v3 3/7] block: add max_hw_transfer to BlockLimits
To: Eric Blake <eblake@redhat.com>
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-4-pbonzini@redhat.com>
 <20210603173311.abker673xq6qscww@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9affbb63-5af3-2b68-a0c5-f9c42280a611@redhat.com>
Date: Fri, 4 Jun 2021 09:21:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603173311.abker673xq6qscww@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/06/21 19:33, Eric Blake wrote:
>> +/* Returns the maximum hardware transfer length, in bytes; guaranteed nonzero */
>> +uint64_t blk_get_max_hw_transfer(BlockBackend *blk)
>> +{
>> +    BlockDriverState *bs = blk_bs(blk);
>> +    uint64_t max = INT_MAX;
> 
> This is an unaligned value; should we instead round it down to the
> request_alignment granularity?

See below...

>> +++ b/include/block/block_int.h
>> @@ -695,6 +695,13 @@ typedef struct BlockLimits {
>>        * clamped down. */
>>       uint32_t max_transfer;
>>   
>> +    /* Maximal hardware transfer length in bytes.  Applies whenever
> 
> Leading /* on its own line, per our style.

The whole file still uses this style, I can change it if desired or do 
it later for the whole file or even the whole block subsystem.

>> +     * transfers to the device bypass the kernel I/O scheduler, for
>> +     * example with SG_IO.  If larger than max_transfer or if zero,
>> +     * blk_get_max_hw_transfer will fall back to max_transfer.
>> +     */
> 
> Should we mandate any additional requirements on this value such as
> multiple of request_alignment or even power-of-2?

Certainly not power of 2.  Multiple of request_alignment probably makes 
sense, but max_transfer doesn't have that limit.

Paolo

>> +    uint64_t max_hw_transfer;
>> +
>>       /* memory alignment, in bytes so that no bounce buffer is needed */
>>       size_t min_mem_alignment;
>>   
> 


