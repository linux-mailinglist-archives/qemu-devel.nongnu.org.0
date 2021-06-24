Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497993B3919
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 00:11:09 +0200 (CEST)
Received: from localhost ([::1]:53634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwXYx-0006eS-Hp
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 18:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lwXXO-0005uP-0q
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 18:09:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lwXXK-0006bP-L3
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 18:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624572565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4B28hTOuAAuZaYAvuuG6IWNoNOJwRBtM2oXVHz9v8WA=;
 b=NHufFhs/4D14CJR6KUeuhtNsI3YC2Bvw7y8uDlNiiIbnqIN7Qj5B9wE8tWFx6fTk7Y6SOF
 6IlmvrC/GSgybSpiiKSqt0s3G/JQ5kENgIO+c5R2UbPhXsAvavEmPYhbKFVtOBpCloS+Jy
 kac4C6qcjIWoJK1VCjhs1J0v8ZBEIHo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-7vZbdVsFPWW6U3uBfQO5mg-1; Thu, 24 Jun 2021 18:09:24 -0400
X-MC-Unique: 7vZbdVsFPWW6U3uBfQO5mg-1
Received: by mail-ed1-f72.google.com with SMTP id
 z5-20020a05640235c5b0290393974bcf7eso4117519edc.2
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 15:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4B28hTOuAAuZaYAvuuG6IWNoNOJwRBtM2oXVHz9v8WA=;
 b=YNZDYvj4JShwFOrdw35RdA2mzZGphKl3eQn8AXmCQM31HYfN8m+zYJ1lqLdrbsv6e7
 Cz44WkL4fw0EZ/7SvKhzjefMIBc0UsdEooNVdgeayM/Joq5uij6udCkBL5jQLlMvTtX/
 TtO44Jn+wRXKKojJ8Ho6Xbrjnv4KUFi0UY+bLdr6YSLD8mUtTU3aEOdVOVtDsLF4/sYI
 DensiK+FaTXd+8jFQuLO7lVjtMIUQlM+5UsiLB2H5iA5co2zQZXeC+658KvetFW4NT89
 u7YufJFURSKa3MUzUXmtHYB6VwrMSpT0PRvBGtS9rYChPZ7iRtq7w4ezKcgbqhhrqayF
 yNuw==
X-Gm-Message-State: AOAM530M8/MMYa7yysiN4uT8tCl5sARmQf5QQ4dj365GXitg9c3u6ApE
 tBn/gXX3yt9XFCw9mU6e9VMdx5NI59bCqX+H35HFz8ZStUj/BrL8Mgisc0arHd+kwscgEa8vL0w
 xFobNnOm4I8IiBts=
X-Received: by 2002:aa7:c790:: with SMTP id n16mr10253909eds.370.1624572562885; 
 Thu, 24 Jun 2021 15:09:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZ8cv3/ZUEDCRxG4NOJ5MztKZUgEz/sMHF1J59RzdTVcYjO5EmfGWPeopzbXXzqUAg+VteIw==
X-Received: by 2002:aa7:c790:: with SMTP id n16mr10253727eds.370.1624572561086; 
 Thu, 24 Jun 2021 15:09:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id em20sm1788907ejc.70.2021.06.24.15.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 15:09:20 -0700 (PDT)
Subject: Re: [PATCH v2] mc146818rtc: Make PF independent of PIE
To: Jason Thorpe <thorpej@me.com>
References: <20210619193849.27889-1-thorpej@me.com>
 <b9e20dbc-fa5f-1e37-ad8a-5d433d77c4b0@redhat.com>
 <00FB4F43-698C-4888-91E7-45FE80CCFC67@me.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bf3645bf-6a47-75f8-862a-7ea8c467f007@redhat.com>
Date: Fri, 25 Jun 2021 00:09:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <00FB4F43-698C-4888-91E7-45FE80CCFC67@me.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/06/21 16:24, Jason Thorpe wrote:
>> Second, the firmware could set a nonzero period, and this would cause
>> continuous interruptions of the guest after the firmware stops, due to
>> s->periodic_timer firing.  This is "optimized" by the bug that you are
>> fixing.  To keep the optimization you could:
>>
>> - do the timer_mod in periodic_timer_update only if !PF || (PIE && lost_tick_policy==SLEW)
>>
>> - in cmos_ioport_read, if !timer_pending(s->periodic_timer) call
>>
>>     periodic_timer_update(s, qemu_clock_get_ns(rtc_clock),
>>                           s->period, true);
>>
>> to update s->next_periodic_time for the next tick and ensure PF will be set.
> 
> I might be missing some subtlety here, but by my reading of
> periodic_timer_update(), either one of those changes would result in a
> delay of the next latching of PF by however many ns the CPU was late in
> reading PF since the last time it was latched  Please correct me if I’m
> wrong about this!

No, it shouldn't.  I may be wrong, but the process is the following:

- the current rtc_clock value is stored in cur_clock

- because period_change is true, the delay between writing PF and 
reading C is stored in lost_clock

- then the delay is compensated by next_irq_clock = cur_clock + period - 
lost_clock

The best way to confirm this would be by writing a testcase (there's 
already an mc146818 suite in tests/qtest).

Paolo

> There exists software out there in the wild that depends on PF latching at regular intervals regardless if when the CPU reads, it, i.e.:
> 
> PF          PF          PF          PF          PF          PF
>      C            C                  C      C                  C
> 
> -- thorpej
> 
> 


