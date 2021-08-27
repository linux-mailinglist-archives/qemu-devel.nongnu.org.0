Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730EF3F98EE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 14:17:18 +0200 (CEST)
Received: from localhost ([::1]:35340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJanN-0000QW-DB
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 08:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJakF-0006eZ-GC
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 08:14:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJakD-0007Qp-Nx
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 08:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630066440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SYN5I8s10y3zlyoujyVOqNBJgrMX81UI6RQ57pFMGLo=;
 b=WgCnTAtOM7sDAum74TG3XgZxvcDKkE7rTzol1cBVazNbM+MCNv5N5Q2FT6iPrRbeLrbmIg
 HCEUusoKye2rClZOKawAXMWBBEqbQlrUx7X7G/LfHGWgfCa3QbYmBi0LYZLdPbur38R/vk
 YON2ImVjSGUXFCwWEzmOq0JQuOpVSWY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-oD5lhJ0BMKqQvrGEwvPpVQ-1; Fri, 27 Aug 2021 08:13:59 -0400
X-MC-Unique: oD5lhJ0BMKqQvrGEwvPpVQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 p1-20020adfcc81000000b001576cccf12cso1795062wrj.6
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 05:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SYN5I8s10y3zlyoujyVOqNBJgrMX81UI6RQ57pFMGLo=;
 b=HlQUQDuYIjQdaRC9qn1CDBj4MWdZrgzAW2/dUrmCHFfzvIe23xowAEhUO5mN42W3HU
 IzuwKaBTj1fqXFEmjXnOLIRzit/iVb339IvMruahPHeHjvcQRudRDT2Y4oHccpuDTKTJ
 RK+KUzpUXtHnCTA20cubuxyLlAsXWXnWac971uWLNB6dW+ATaK8DE0rL54xdNBTntZlT
 Xrmbx+nYRc9UtZM/KBNaIzZnimeZid5Htv1pgvd6yCd8qSYvHbXG/DSjtPJt6XEEF3e1
 P3xxBlIkUsm9V/KRep9TXi9H5XLaFk5apMU9flpqVi1LtmZ5GmFSCnQDFj8glbYCkIXO
 c1Bw==
X-Gm-Message-State: AOAM531o7BKw2uCTfW+fTNt58qKYE7ZsLlqQrBC/22D8Wroy3ldpLpkF
 PiEd90VWJJnEbDvnFTIhEX8phv6slkqSMtIWFQwEAoNl4fRgkjGijgPCH7jerzbgC98RpFAHsdM
 hbXPqNqbVx52YzlU=
X-Received: by 2002:a05:6000:1010:: with SMTP id
 a16mr10144439wrx.70.1630066438257; 
 Fri, 27 Aug 2021 05:13:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5Nlm+Ri6YQO5p6b2V5KOyDGoO+T0fYbeIcVgo6Jrh5lJN9HsOT81aYGJw9Trl7xjFlhxBSw==
X-Received: by 2002:a05:6000:1010:: with SMTP id
 a16mr10144404wrx.70.1630066437996; 
 Fri, 27 Aug 2021 05:13:57 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o7sm5303745wmc.46.2021.08.27.05.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 05:13:57 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] hw/usb/xhci: Always expect 'dma' link property to
 be set
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210826200720.2196827-1-philmd@redhat.com>
 <20210826200720.2196827-4-philmd@redhat.com>
 <b8842325-cf0c-31f6-a4ba-68890eea4e49@ilande.co.uk>
 <CAFEAcA-fn4L9mSqvq+fQ9FhNnvAYv5gJmRMGYbQJNdJ15h81Lg@mail.gmail.com>
 <44d7475b-0d4a-58e0-59e1-bba24cb1ca7e@ilande.co.uk>
 <CAFEAcA82o8v6zJoYsv0hg9O-rUcUQL8EL2G-o76dwMg9k=bONA@mail.gmail.com>
 <2d1bb979-9bea-73b0-e6a2-f80ba4b85e1d@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f2c18528-09fc-0859-5661-587a5c56c820@redhat.com>
Date: Fri, 27 Aug 2021 14:13:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2d1bb979-9bea-73b0-e6a2-f80ba4b85e1d@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.437, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/27/21 1:03 PM, Mark Cave-Ayland wrote:
> On 27/08/2021 11:14, Peter Maydell wrote:
> 
>> On Fri, 27 Aug 2021 at 10:14, Mark Cave-Ayland
>> <mark.cave-ayland@ilande.co.uk> wrote:
>>> Ah so the plan moving forward is to always have an explicit MR passed
>>> in for DMA use.
>>> Sorry if I missed that in earlier versions of the patchset, I'm still
>>> getting back up
>>> to speed on QEMU hacking.
>>>
>>> Was there a decision as to what the property name should be? I see
>>> "dma_mr" used
>>> quite a bit, and if there will be more patches to remove the
>>> system_memory default
>>> from other devices then it would be nice to try and use the same name
>>> everywhere.
>>
>> No, I don't think we have a convention; it might be nice to add one.
>> Currently a quick git grep for DEFINE_PROP_LINK and eyeballing of
>> the results shows that we have:
>>
>>   "memory" x 7
>>   "dram" x 4
>>   "downstream" x 3
>>   "dma-memory" x 3
>>   "dma" x 2
>>   "source-memory"
>>   "dram-mr"
>>   "ddr"
>>   "ddr-ram"
>>   "gic"
>>   "cpc"
>>   "port[N]"
>>   "dma_mr"
>>   "ahb-bus"
>>   "system-memory"
>>   "main-bus"
>>
>> This list includes all our TYPE_MEMORY_REGION link properties; a few
>> of these
>> are special-purpose, and reasonably have specialized names. 2 out of 3
>> users
>> of "downstream" are devices which pass on (or filter out) memory
>> transactions
>> from the CPU (tz-msc, tz-mpc), and I think that name makes sense there.
>> (The 3rd is pl080.c, which is a plain old DMA controller, and the naming
>> there is not so well-suited.)
>>
>> "memory" is mostly SoC and CPU objects taking a link to whatever they
>> should
>> have as the CPU's view of memory.
>>
>> I don't have a strong view on what we ought to try to standardize on,
>> except that I don't like the "_mr" or "-mr" suffix -- I don't think we
>> need to try to encode the type of the link property in the property name.
>>
>> It is probably reasonable to have different naming conventions for:
>>   * SoC and CPU objects, which take a link to the MR which represents
>>     the CPU/SoC's view of the outside world
>>   * Endpoint devices which can be DMA masters and take a link giving
>>     them their view of what they can DMA to
>>   * filtering/control devices which take incoming transactions from
>>     an upstream port, filter some and pass the rest through to a
>>     downstream port

Which category fits IOMMUs?

>>
>> In pretty much all cases, these link properties are used only internally
>> to QEMU, so if we decide on a naming convention we can fairly easily
>> rename existing properties to match.
> 
> I quite like "cpu-memory" for SoC/CPU objects and "dma-memory" for
> endpoint devices that can be DMA masters. Perhaps the last case is
> specialised enough that a convention there doesn't make sense?
So "iommu-memory"?


