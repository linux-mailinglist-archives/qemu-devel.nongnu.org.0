Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89B21FD0A6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 17:15:50 +0200 (CEST)
Received: from localhost ([::1]:57942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlZn3-0006nB-N0
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 11:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jlZgF-0004gT-UA
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 11:08:47 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56076
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jlZgD-0006Ej-C0
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 11:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592406523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4t5aEEhixJKv1dKhyIIzBH6l0t7LFuM7Z9ocXN6g74=;
 b=SooWYd68WNBdFCI5lwep1pB5wdbeuuheUqyust+4+3z764X3lQ3du7U3twuFy/8Hmt8WPR
 jQZBZUDVPHKbfdxG2MiI82BTUtppli/+/bJwdZp6qc+X0MA9hQg+I0EOPkaRtWz76ErkC8
 joSoqgyKJngj8Cu82d/lZIp1eImzoyk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-Z2-QGy_2MGyzrQyTQOZgqQ-1; Wed, 17 Jun 2020 11:08:39 -0400
X-MC-Unique: Z2-QGy_2MGyzrQyTQOZgqQ-1
Received: by mail-wm1-f72.google.com with SMTP id a7so963658wmf.1
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 08:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W4t5aEEhixJKv1dKhyIIzBH6l0t7LFuM7Z9ocXN6g74=;
 b=TxRiNEgwAodMKI7k31WZwtV7xST5IwUd0SQszFyfP50m/RoniNztvBmBxFwNC5J2m4
 VHtW0qe2Xz31Mx4aGpF6YtODGPvDqWjr9AVLtbTh7HT/49QndbqG01RMZHmusAuT3hZf
 akcPsl2dhs9uuDITveg+SpE8L5aAxE5q9jztZ0SDTmgPy/Q4b4VuiTqkxfDGnjrDp5Ju
 XPdlHq6hSnsmt9RulbdPY+cBGe8hVbGhw72Fpy3wQa9iDjQSvcePRBwDZqrWFJY2IGIk
 vVCOixE9TwT24atnn7A1DPlKADBityxykU+1kW8uSsXZP+/8EnW5i6Xt2+Bx+6HGgIcT
 fGEQ==
X-Gm-Message-State: AOAM5320NLTeDTv20Km3s3sTREdyjCCQK9zJ0gkfhYH7DjY/+LCrn4XZ
 Chjaf7EGSGCqaweHhfyRmzQ4JdLgzIAZ8IK015AjbZPuuMVNyFUIMGuoq9sr6NF6013GcMmJv0M
 A4SN4rUZ1Ko+/Cqc=
X-Received: by 2002:a5d:522f:: with SMTP id i15mr9177150wra.339.1592406517946; 
 Wed, 17 Jun 2020 08:08:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUa+7NCTEgyWjCMbtrVga1JzhEL4eb08rsyFl3DWAqIG9rLewzEMFPNecq7/j8mRBbPSJ6lw==
X-Received: by 2002:a5d:522f:: with SMTP id i15mr9177128wra.339.1592406517713; 
 Wed, 17 Jun 2020 08:08:37 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:48a4:82f8:2ffd:ec67?
 ([2001:b07:6468:f312:48a4:82f8:2ffd:ec67])
 by smtp.gmail.com with ESMTPSA id u13sm33886809wrp.53.2020.06.17.08.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2020 08:08:33 -0700 (PDT)
Subject: Re: [PATCH 0/6] Add various undefined MMIO r/w functions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20200617053934.122642-1-ppandit@redhat.com>
 <20200617063956.GA12597@umbus.fritz.box> <20200617070621.29051d4b@x1.home>
 <8357f8a5-83e3-47a7-57c9-b88edfa3812c@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <053a1d95-56ec-80da-cebf-51f920e86daa@redhat.com>
Date: Wed, 17 Jun 2020 17:08:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <8357f8a5-83e3-47a7-57c9-b88edfa3812c@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 01:42:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Prasad J Pandit <pjp@fedoraproject.org>, Li Qiang <liq3ea@163.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 P J P <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Li Qiang <pangpei.lq@antfin.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/06/20 15:20, Philippe Mathieu-Daudé wrote:
> On 6/17/20 3:06 PM, Alex Williamson wrote:
>> On Wed, 17 Jun 2020 16:39:56 +1000
>> David Gibson <david@gibson.dropbear.id.au> wrote:
>>
>>> On Wed, Jun 17, 2020 at 11:09:27AM +0530, P J P wrote:
>>>> From: Prasad J Pandit <pjp@fedoraproject.org>
>>>>
>>>> Hello,
>>>>
>>>> This series adds various undefined MMIO read/write functions
>>>> to avoid potential guest crash via a NULL pointer dereference.  
>>>
>>> Hrm.  If this is such a common problem, maybe we should just add a
>>> NULL check in the common paths.
>>
>> +1, clearly the behavior is already expected.  Thanks,
> 
> 20 months ago Peter suggested:
> 
> "assert that every MemoryRegionOps has pointers to callbacks
>  in it, when it is registered in memory_region_init_io() and
>  memory_region_init_rom_device_nomigrate()."
> 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg573310.html
> 
> Li Qiang refers to this post from Paolo:
> 
>>  static const MemoryRegionOps notdirty_mem_ops = {
>> +    .read = notdirty_mem_read,
>>      .write = notdirty_mem_write,
>>      .valid.accepts = notdirty_mem_accepts,
>>      .endianness = DEVICE_NATIVE_ENDIAN,
> 
> "This cannot happen, since TLB_NOTDIRTY is only added
>  to the addr_write member (see accel/tcg/cputlb.c)."

I'm now okay with asserting it, as long as notdirty_mem_read abort()s.

Paolo


