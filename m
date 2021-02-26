Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A40B326640
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 18:22:04 +0100 (CET)
Received: from localhost ([::1]:51264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFgoU-0006L5-Pv
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 12:22:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFgfT-00083X-AC
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 12:12:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFgfQ-0002mX-LW
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 12:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614359559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bGteM8N3QawFj+iCel1m8QzrLLoW+MRQySciCov1C84=;
 b=WhbK+1P0trEyE9MPc+qINXOSmGcDd59hDIexYn34t4vSxYee20/ycv58dEEARCT6buaX7T
 W97Ll6NjQB5K1hT6vMvjeO8pvmOUyZyUGaBrxH1T4hcYtiftwDjotkSf5QBA8PQvJTyFyU
 Vad0ZJXALcMl1/8sPFNhCNIE6lcEBqY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-VNr0mFQ2PfSQzm3pTTMUqA-1; Fri, 26 Feb 2021 12:12:37 -0500
X-MC-Unique: VNr0mFQ2PfSQzm3pTTMUqA-1
Received: by mail-ej1-f71.google.com with SMTP id m4so4489533ejc.14
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 09:12:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bGteM8N3QawFj+iCel1m8QzrLLoW+MRQySciCov1C84=;
 b=oBPENpcwrxMOvpmYd8UODuD0mjCOj0FJbgUFb2MjQ8qoHTHGh0QfYbwlt1QzjNlhdf
 URhw0WOw1fkJOORiWdPMrytFLBX8hqkcEkd76M7SN1Rr88rDq2KPt53ElP3v0IiD7lPF
 v6VFCk1ubKGRA0Y7CSuYCGojsV1eJEI6Kh8bs1qfWAsHG7FQfU04sThjFnTjURYR+LAA
 JKqyjv0/JZXLMqzoIHXGOhYSruHdkG6pOEoWIGuY2it8iowpE/2+vKhDgn7+hI4U1WLM
 n/oCJrMPwqa8e0/62IcEuO1vJAmib8/2z1ex0zpo46XW9jX1gP+jgGq6gIlbfotbbbpo
 Riqw==
X-Gm-Message-State: AOAM532Q72j/uP0K4OJ+tWezPscxKIoa08K1R+vwNz6kdEskZJkz+zV8
 HDl4xd9GxLkc7uCUFpeN1IpuY0suet4mx7KfhR87EezlETWDksImuHKmmsSuIWh6MkxrFODXAaD
 Z6MzLADJU3AU0O5A=
X-Received: by 2002:a05:6402:d05:: with SMTP id
 eb5mr4492490edb.143.1614359556043; 
 Fri, 26 Feb 2021 09:12:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGLcmBeaxGsnB6GzslmXb4kzhdKSCGYxJXb36yqYD855vr/tYpRMqLSQ22h08xdSyuYKzOhg==
X-Received: by 2002:a05:6402:d05:: with SMTP id
 eb5mr4492470edb.143.1614359555883; 
 Fri, 26 Feb 2021 09:12:35 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w24sm5968442edv.67.2021.02.26.09.12.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 09:12:35 -0800 (PST)
Subject: Re: [PATCH 0/2] target/i386: Fix cpu_x86_{fsave,frstor,fxsave,fxrstor}
To: Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210226162022.375654-1-richard.henderson@linaro.org>
 <bba3bfb8-6f8c-9a14-d7c6-b19b904be020@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9aaaff9d-672d-a53d-57fa-5700f5f5092c@redhat.com>
Date: Fri, 26 Feb 2021 18:12:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <bba3bfb8-6f8c-9a14-d7c6-b19b904be020@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: philmd@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/02/21 17:59, Claudio Fontana wrote:
> On 2/26/21 5:20 PM, Richard Henderson wrote:
>> As discussed during review of Claudio's "i386 cleanup" patch set.
>>
>>
>> r~
>>
>>
>> Richard Henderson (2):
>>    target/i386: Rename helper_fldt, helper_fstt
>>    target/i386: Split out do_fsave, do_frstor, do_fxsave, do_fxrstor
>>
>>   target/i386/tcg/fpu_helper.c | 65 +++++++++++++++++++++++-------------
>>   1 file changed, 41 insertions(+), 24 deletions(-)
>>
> Reviewed-by: Claudio Fontana <cfontana@suse.de>
> Tested-by: Claudio Fontana <cfontana@suse.de>
> 

Claudio, can you merge them in your patch set?

Thanks,

Paolo


