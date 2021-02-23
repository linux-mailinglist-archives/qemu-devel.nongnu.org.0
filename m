Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DB1322CBA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:48:20 +0100 (CET)
Received: from localhost ([::1]:49914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEYz5-0004s0-Q0
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEYy8-0004Nq-FI
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:47:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEYy6-00027q-Qm
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614091637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0k2Yk5RqG3ubYy8dpTZYIyeXvjQ6u0lXtPPyAYlKIEc=;
 b=VB/iy4NK7OBryxPkC98gFDxq7LwHVPEp9g954AqlYlq6XGN0Ryy/uXYbdxHAND7IHqMKOB
 0dwZkWYTRrvsGSeeqGh7VecmQq6/Ae6ccA68wT0oNFbNybiX6p08tU83Ey9XCCbTGUSOEG
 0vFejkCbggO52YBwhSQ2jVofP/ZOFxA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-_Q2V90i5Oz2sQCbMF_C15g-1; Tue, 23 Feb 2021 09:47:16 -0500
X-MC-Unique: _Q2V90i5Oz2sQCbMF_C15g-1
Received: by mail-ed1-f72.google.com with SMTP id s26so3676509edq.18
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 06:47:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0k2Yk5RqG3ubYy8dpTZYIyeXvjQ6u0lXtPPyAYlKIEc=;
 b=EUUAI93NuIT/tAH3mxbLc2v+r8f7n0nsXJC4M1dlv6k0XzncnCLgUTbyBvH79oU3vI
 29RX1FfCRZCyg+zyD4W89GjvR6JQJGSQHSLyl93hQeuyBpO17rxpQAs9SEqyIipiuik7
 prd60HxYe43VKXkbUvADAd+EelWp9dBmW9iDUWMN3EopUyNaQ/zthu0HpJWn99SfG6A/
 SNpE6BZgCnFQEjWceePAY+1H8kv/u9SHPICScS2nB2k2gh65FTYhUXlyEt+h3VBZLoYd
 aGIXXL1aZkIW/0Tb2lJTn18FmlVmwp9/GO3PeDrh1Ff2x/LEhFnQ4b8I63POG3kk7Arj
 2rrg==
X-Gm-Message-State: AOAM531sMwhR5cVml26zYWQGb4Gol405/c2oxhUghj4wNEcxh4QU0UxW
 bxivklqOCuV1o/O7G9/sIR5eLTfwkwTs4LOG8tOo2X3azg4Szu6bzgE9Vda0vzk6G2QfcnjeYbP
 gf9sQ6cln6FmMZLY=
X-Received: by 2002:a05:6402:c15:: with SMTP id
 co21mr28473492edb.115.1614091635181; 
 Tue, 23 Feb 2021 06:47:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzgM8L7p0rYECjDlSrhaSX3UPzDVYbz4eg9+mUA1nOLPrT1TQK02ZX256f7oRVsdi0GuoOAw==
X-Received: by 2002:a05:6402:c15:: with SMTP id
 co21mr28473462edb.115.1614091634949; 
 Tue, 23 Feb 2021 06:47:14 -0800 (PST)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id s18sm12648304ejc.79.2021.02.23.06.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 06:47:14 -0800 (PST)
Subject: Re: [RFC v1 34/38] target/arm: cpu: only initialize TCG gt timers
 under CONFIG_TCG
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-35-cfontana@suse.de> <87v9ak5cz0.fsf@linaro.org>
 <03502e51-99f5-239d-42a6-e57892faa297@suse.de> <87wnuz3v0u.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <44c078d1-ef9f-ff85-b2bd-424c9dfbda15@redhat.com>
Date: Tue, 23 Feb 2021 15:47:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87wnuz3v0u.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@centriq4.arch.suse.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/02/21 12:01, Alex Bennée wrote:
>> diff --git a/target/arm/machine.c b/target/arm/machine.c
>> index 666ef329ef..13d7c6d930 100644
>> --- a/target/arm/machine.c
>> +++ b/target/arm/machine.c
>> @@ -822,8 +822,13 @@ const VMStateDescription vmstate_arm_cpu = {
>>           VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
>>           VMSTATE_UINT32(env.exception.fsr, ARMCPU),
>>           VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
>> +#ifdef CONFIG_TCG
>>           VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
>>           VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
>> +#else
>> +        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
>> +        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
>> +#endif /* CONFIG_TCG */
> I'm not sure this is correct - VMSTATE_TIMER_PTR chases the links to
> just expose expired time but QEMUTimer has more in it than that. Paolo

If the timer is never set, it is completely free to create it with 
timer_new.  So it seems simpler to do nothing here.

The observation about the null pointer makes sense, but I think it would 
break existing migration streams.  Also we would like to convert all 
QEMUTimer* to embedded QEMUTimers, so my advice is to not bother adding 
it, instead of figuring out how to solve those problems.

Paolo


