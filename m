Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4166B32D803
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 17:46:42 +0100 (CET)
Received: from localhost ([::1]:44222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHr7Z-0000o3-9Z
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 11:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHr3o-00081P-NB
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:42:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHr3l-0002Nw-V4
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614876165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rn1StLXZdW6IQ/ZFu/LT6OMRfbl/UTGxj84sgLnKJ1o=;
 b=ZihSgz4BhAVxy/GOZlimg6KTUTHd3ukFH/nNyLR2VzkI1GSFRyV8ateDpiBU3AMFxiUS3M
 3mzwYKO2zVSmHJB8yTHAOn+2/2GXkVqRniLcqPd+bLL66km+MnXuwbCbllfGa23i1aDAXd
 2301sSuQq0RXKDfEOf1OaxKKoOkhH5c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-0A7XUtccPtuSk6oCjjRxkw-1; Thu, 04 Mar 2021 11:42:43 -0500
X-MC-Unique: 0A7XUtccPtuSk6oCjjRxkw-1
Received: by mail-wr1-f72.google.com with SMTP id z6so5892079wrh.11
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 08:42:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rn1StLXZdW6IQ/ZFu/LT6OMRfbl/UTGxj84sgLnKJ1o=;
 b=ZZaKmHfSVZ6m1/YAiq+yRJScmghXmQxcOMI8sY3y2ABKQ/gLbXLGYHgp/3QjVHAsyc
 Dhf/OmSQt4DR1C79y1RmvPBjKookUV4Edqv7iptCioBe8RnL7X/mr+5rl8qvlxWJ/4h4
 9tX0A3uhSl4glyRT6tsxN1wbsEiCOcdbreMxU1QvmCKP4DHQC6/FdmlDlQgAGFUg6Ztw
 u4wy6QUPiw5YaKgxDtigaf1kzE/r8Zm6GyqmXPpwkvazTqPjxh1Y63QlgHgQWkJTfrNU
 4WOVbEQYUpoMdfKSTM7KNJb37hmogFj0l6v6brx9h4LFV/OpzztUL0xDIGDIgJArbjs4
 kXSA==
X-Gm-Message-State: AOAM532ubOop5VEexIRXPcNTPPms4hiMuTSVBb4eKClYp/63bvwYtsGC
 PfnwWDXWlKb+Vx1TdZDQOgBgokW4Mk6jFhygzAU5R5Tip31V7J9Hb4c/yTU3H+X7L8EygS3c0tj
 YOVTKl/EzSNz7HI0=
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr4806955wml.44.1614876161568; 
 Thu, 04 Mar 2021 08:42:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlz2KI52j/UDlEp7oVCtpCjF1XnFxEBvR4mD5eNHUGALzd8nuIyf5zrSrb0kgOsHXKBSMhVw==
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr4806917wml.44.1614876161342; 
 Thu, 04 Mar 2021 08:42:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g16sm19407990wrs.76.2021.03.04.08.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 08:42:40 -0800 (PST)
Subject: Re: [RFC PATCH 00/19] accel: Introduce AccelvCPUState opaque structure
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210303182219.1631042-1-philmd@redhat.com>
 <a84ce2e5-2c4c-9fce-d140-33e4c55c5055@redhat.com>
 <1eda0f3a-1b11-a90e-8502-cf86ef91f77e@redhat.com>
 <438743f3-6e97-1735-6c11-26d261fa91b4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a37683ea-a05f-e3a3-43b0-084f830ccd72@redhat.com>
Date: Thu, 4 Mar 2021 17:42:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <438743f3-6e97-1735-6c11-26d261fa91b4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 4:40 PM, Paolo Bonzini wrote:
> On 04/03/21 15:54, Philippe Mathieu-Daudé wrote:
>> On 3/4/21 2:56 PM, Paolo Bonzini wrote:
>>> On 03/03/21 19:22, Philippe Mathieu-Daudé wrote:
>>>> Series is organized as:
>>>> - preliminary trivial cleanups
>>>> - introduce AccelvCPUState
>>>> - move WHPX fields (build-tested)
>>>> - move HAX fields (not tested)
>>>> - move KVM fields (build-tested)
>>>> - move HVF fields (not tested)
>>>
>>> This approach prevents adding a TCG state.  Have you thought of using a
>>> union instead, or even a void pointer?
>>
>> Why does it prevent it? We can only have one accelerator per vCPU.
> 
> You're right, my misguided assumption was that there can only be one of
> WHPX/HAX/KVM/HVF.  This is true for WHPX/KVM/HVF but HAX can live with
> any of the others.

I suppose you aren't talking about build-time but runtime. There should
be no distinction related to accelerator at runtime. We should be able
to have multiple accelerators at runtime, and eventually be able to
migrate vCPU from one accelerator to another, if it is proven useful.

How accelerators are orchestrated is obviously out of the scope of this
series.

> However this means that AccelvCPUState would have multiple definitions.

Yes.

>  Did you check that gdb copes well with it?

No, I haven't, because we already use opaque pointers elsewhere.

> It's also forbidden by
> C++[1], so another thing to check would be LTO when using the C++
> compiler for linking.

OK, I have no clue about C++ (and tries to keep QEMU way from it)
or about LTO. So I'd need to investigate that.

> 
> Paolo
> 
> [1] https://en.wikipedia.org/wiki/One_Definition_Rule
> 
>> TCG state has to be declared as another AccelvCPUState implementation.
>>
>> Am I missing something?
>>
>> Preventing building different accelerator-specific code in the same
>> unit file is on purpose.
>>
>> Regards,
>>
>> Phil.
>>
> 


