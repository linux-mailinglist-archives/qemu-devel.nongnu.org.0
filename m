Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC4130F40A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 14:42:27 +0100 (CET)
Received: from localhost ([::1]:44304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ett-0004lz-G6
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 08:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7esv-0004HI-NQ
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:41:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7est-0007wR-AZ
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:41:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612446082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UY3HeSFQU1gYw0AOW9igLbtTne46XsofYnEUcAhBLHk=;
 b=ZxYOfnSj9ZS+eJPg/JTVP7n6prQcarL6DtmR9QsQvKV9qbJivzRvrAQewSBkaXKxSuLL4j
 /FRNBtdptrd4rX3d0h9wvPKRsIWY0oCyKqudeUOCxtcsDNuz+72Mb/Y2wfYc0v1zYVyDD7
 EBYuZSer72lCUd65F5jZNf4XtxgXYr8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-AS1r6aVBPpOzK1q2no6OPA-1; Thu, 04 Feb 2021 08:41:19 -0500
X-MC-Unique: AS1r6aVBPpOzK1q2no6OPA-1
Received: by mail-ed1-f70.google.com with SMTP id u19so2838120edr.1
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 05:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UY3HeSFQU1gYw0AOW9igLbtTne46XsofYnEUcAhBLHk=;
 b=QPy9lTYKqndj53KGAJBYUSHlPW1lkkAl+mx7BCs34vf2ox3aLApavNdx3ZdMe2pPyd
 jFciIvHdftaJfq8LKxoB067S5aXMY651x5Ztdy8gNcj2F7DoZJ43YAOEebvN4995SWUB
 CGN5nLHki/WjXUiI4jpnFLKdczO5QSRi5Eo+HDpls13H3IZ8BRHWzT0NEbaohdLkTFxU
 jpDaYIgts/xw9J8psd8Dt0XgP+x8D2hmjPfyh1vW+qU1y+o4ivJPDjHzjcUnfZ8/idkF
 JLBMZABWJ9eaIt3dcoS5amD3XriJD5emJ6KNIQT03eIXRK0ov7RpJoMKZikj9FW+kfmx
 /1QQ==
X-Gm-Message-State: AOAM532uyPJtWPBgZ+W0f0ntmQPcFNA6BXXWcz/Be/b2+xPgS2t5cLK8
 5y2EN8mwgA/hjhYIacvQR9YtqApikUFD1ZrKbdqJTt+4xL3o1HAECqoJIjFpv99+HVZflNab2BD
 YFj4j2Ozf68L90tk=
X-Received: by 2002:a17:906:b756:: with SMTP id
 fx22mr7650084ejb.406.1612446078380; 
 Thu, 04 Feb 2021 05:41:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzoqXXeN40DKwFwhNHWwRlwEBZxAcN1w7/zRhTifNYLtAvY03l9d7z0ji+nhDoj6dIKUl5Knw==
X-Received: by 2002:a17:906:b756:: with SMTP id
 fx22mr7650069ejb.406.1612446078180; 
 Thu, 04 Feb 2021 05:41:18 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id a7sm2484771eje.96.2021.02.04.05.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 05:41:15 -0800 (PST)
Subject: Re: [PATCH v15 21/23] hw/core/cpu: call qemu_init_vcpu in
 cpu_common_realizefn
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-22-cfontana@suse.de> <871rdxrt08.fsf@linaro.org>
 <7500a412-c94a-6990-eb48-9ee78bfb94e3@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <05980f44-88a6-6ef7-b263-07c2d898b8f0@redhat.com>
Date: Thu, 4 Feb 2021 14:41:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7500a412-c94a-6990-eb48-9ee78bfb94e3@suse.de>
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
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 11:23 AM, Claudio Fontana wrote:
> On 2/3/21 5:51 PM, Alex Bennée wrote:
>>
>> Claudio Fontana <cfontana@suse.de> writes:
>>
>>> move the call to qemu_init_vcpu inside cpu_common_realizefn,
>>> so it does not need to be done explicitly in each target cpu.
>>>
>>> Despite this, the way cpu realize is done continues to be not ideal;
>>>
>>> ideally the cpu_list_add would be done in common_cpu,
>>> and in this case we could avoid even more redundant open coded
>>> additional calls in target/xxx/cpu.c,
>>>
>>> but this cannot happen because target cpu code, plugins, etc
>>> now all came to rely on cpu->index
>>> (which is updated in cpu_list_add), since no particular order
>>> was defined previously, so we are stuck with the freak call
>>> order for the target cpu realizefn.
>>>
>>> After this patch the target/xxx/cpu.c realizefn body becomes:
>>>
>>> void mycpu_realizefn(DeviceState *dev, Error **errp)
>>> {
>>>     /* ... */
>>>     cpu_exec_realizefn(CPU_STATE(dev), errp);
>>>
>>>     /* ... anything that needs done pre-qemu_vcpu_init */
>>>
>>>     xcc->parent_realize(dev, errp); /* does qemu_vcpu_init */
>>>
>>>     /* ... anything that needs to be done after qemu_vcpu_init */
>>> }
>>
>> Uggh, introducing a magic order seems like inviting trouble for later
>> on. Is there anyway we can improve things? Paolo?
>>
> 
> 
> The magic order is there already. I call it "freak order" instead of "magic", because this is more the result of uncontrolled code growth rather than the work of magic :-)

Eventually related to this unsolved problem:

  cpu_reset() might modify architecture-specific fields allocated
  by qemu_init_vcpu(). To avoid bugs similar to the one fixed in
  commit 00d0f7cb66 when introducing new architectures, move the
  cpu_reset() calls after qemu_init_vcpu().

See discussion:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg686480.html

> 
> This patch attempts to remove one degree of freedom, but the current situation of cpu realizing is basically fubar. This patch attempts to improve things slightly,
> but as mentioned elsewhere it basically fails to achieve the goal,
> 
> so I am tempted to just retire it. Maybe someone interested could look at the situation with new eyes (possibly even me later on).


