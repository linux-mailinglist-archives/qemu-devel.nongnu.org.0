Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0852C3E5C70
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 16:01:14 +0200 (CEST)
Received: from localhost ([::1]:51642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSJc-0003IO-MG
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 10:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDSHn-0001lw-P5
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:59:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDSHk-0005f6-TQ
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628603955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mMknXUP/A/l675Bri79li+aze2n7at3rFtceCPaJS/M=;
 b=HSEc26RDiNh0eKlcC4bz/rRP5txP5m4bIE3GXzqD1lsT4bfn0htRYE1OSQGodUQuRbDXj1
 +NCF/PxFm/uLhaerlQt/XN8zHmjxJsGZWFv7YNiSUSeRe68vxjL6UJTLL73uijsHgcD8dv
 s+RtikN7C0wp7p5krv8iTpb2mYTer/w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-iPAPIY-FPwWK60BNHXSzJg-1; Tue, 10 Aug 2021 09:59:14 -0400
X-MC-Unique: iPAPIY-FPwWK60BNHXSzJg-1
Received: by mail-wr1-f72.google.com with SMTP id
 f6-20020adfe9060000b0290153abe88c2dso6457809wrm.20
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 06:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mMknXUP/A/l675Bri79li+aze2n7at3rFtceCPaJS/M=;
 b=DJ+TNSeEeL9frk1dmQYyjeunLM9IbUHpuhH7f2vSg3IRP7teCtOTfobk7DzW9Kkk2o
 JWZAAvqQj3ty+kYCuLY3W6ACnEeioIDFgCLeHmxOOnX7tuVmG2uWSMvteSMC0uxK5Ju4
 enlWnZMml14ReSpEpW+k/mcNPt3GdCVmAYK+gFG2OxOQxkI+z51+0HHmQ85igWCNSqsB
 muMUvHd65X7+xexfCAkX7tzHzGO+5bGmitWFGBHfoAZJ33eoprMm02lDz52jYH4psq/V
 km0un4D7ZGTlLYUVSEl6Syeu6bU7GN3DJYF57zp3zRgaV7kFQ3+86U0JBjwiHw1iEsXe
 CEgw==
X-Gm-Message-State: AOAM532Z1v8r6t9kB0V/47ORg+lLlqHm1DL98ezOAYp/4V3NJew3YolD
 AH1JPoAdAFEoknKG1h1aeu7JWHr7LO+VzCbkdZADo/LeY3WFSLEufIVoHW3hy5ZJLGiss5GMXJo
 vQdYkZ4TXSjTfJ0c=
X-Received: by 2002:a05:600c:4f0d:: with SMTP id
 l13mr22567603wmq.18.1628603953506; 
 Tue, 10 Aug 2021 06:59:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5UN7Px8b8CGKg8wh+WqdEbLvUbUe7HGowwcUi3glR3POVw//fIs/9EWe6xXmwwscYiXFKtw==
X-Received: by 2002:a05:600c:4f0d:: with SMTP id
 l13mr22567579wmq.18.1628603953230; 
 Tue, 10 Aug 2021 06:59:13 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 h9sm20641998wmb.35.2021.08.10.06.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 06:59:12 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Name and email address change
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
References: <20210810095049.35602-1-hreitz@redhat.com>
 <0598232c-ee2a-cb82-264b-052fde8082ae@redhat.com>
 <98a4f877-2cbc-e285-3055-0a7b5a7ef901@redhat.com>
 <21a0061a-f31a-eafb-7701-02e2d2976b5f@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <35bea603-b6d5-7d10-d705-5ac259a87588@redhat.com>
Date: Tue, 10 Aug 2021 15:59:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <21a0061a-f31a-eafb-7701-02e2d2976b5f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.08.21 14:18, Philippe Mathieu-Daudé wrote:
> On 8/10/21 1:46 PM, Hanna Reitz wrote:
>> On 10.08.21 13:29, Philippe Mathieu-Daudé wrote:
>>> On 8/10/21 11:50 AM, Hanna Reitz wrote:
>>>> I have changed my name and email address.  Update the MAINTAINERS file
>>>> to match.
>>>>
>>>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>>>> ---
>>>>    MAINTAINERS | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>> I'd recommend you to also add an entry in .mailmap:
>>>
>>> -- >8 --
>>> diff --git a/.mailmap b/.mailmap
>>> index 082ff893ab3..504839c84d3 100644
>>> --- a/.mailmap
>>> +++ b/.mailmap
>>> @@ -53,6 +53,7 @@ Anthony Liguori <anthony@codemonkey.ws> Anthony
>>> Liguori <aliguori@us.ibm.com>
>>>    Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
>>>    Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
>>>    Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
>>> +Hanna Reitz <hreitz@redhat.com> <mreitz@redhat.com>
>>>    Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
>>>    Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
>>>    James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
>>> ---
>> Hu, I didn’t know there is such a thing.  Looks like I could even do
>>
>> Hanna Reitz <hreitz@redhat.com> Max Reitz <mreitz@redhat.com>
> If you want to restrict to 'Max Reitz', but without it it will simply
> take all mails from <mreitz@>. IMO KISS, no need to filter by name in
> your case :)

Oh, right.  I thought not giving the name would only replace the email 
address, for some reason.

>> Feels a bit like cheating, though...?
> No, why? The "preferred name forms" section seems adequate.

Well.  It’s not exactly a preferred name form, is it.

But it is a case of “git author config” change, so I suppose it fits best.

>>> As it or with .mailmap modified:
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> What is nice with .mailmap is the combination with ./get_maintainers.pl,
> in particular when it defaults looking at commit history. If you
> Sob/Acked a commit as Max, the script (call by git-send-email) will
> replace it by Hanna.

That almost sounds like a reason not to do it.  You know, so I can deny 
any involvement on maintainer-less files. O:)

> For the contribution statistics, all your previous contributions as Max
> will be directly shown as Hanna (along with your future ones).

OK, well, if you insist. :)

Hanna


