Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 354813E59CB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 14:20:36 +0200 (CEST)
Received: from localhost ([::1]:43284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDQkF-00087W-9F
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 08:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDQih-0005zq-87
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:18:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDQif-00007Z-N7
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628597937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pBCNfb6F41X7eucTQdEqv9VeNxVc5vFOKFPGvznhDhg=;
 b=SCRjU1qi+xK3euF+znunfdKAi3SOwPQzkfPR6LdL73RwqnD65vnaorHUnd2C4GzzvnYkG6
 MwfdpXRW+T2NG2o7++Vozi1INsFTaJfVzweHEG0GVTsdfRyRg7dXuVlDJAmZGhL0ZcGzwr
 w9fdUh6LWyX+p6oIP3XK4k+TkCEZ4Ng=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-3iI8XKbvN_GwlDToMshAlA-1; Tue, 10 Aug 2021 08:18:56 -0400
X-MC-Unique: 3iI8XKbvN_GwlDToMshAlA-1
Received: by mail-wr1-f69.google.com with SMTP id
 o11-20020a5d474b0000b02901533f8ed22cso6335360wrs.22
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 05:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pBCNfb6F41X7eucTQdEqv9VeNxVc5vFOKFPGvznhDhg=;
 b=qIZAUvX+w0+NnxhBn6Yd6pDebbFSbReXYpthd1zS3R8FUKm6x8f+ZivCKxYSipsckV
 RCQor4KaSyHPTYBYvCwdqgb5O4exvdVSt4PKqjNVIZTt4juoxfox3YTWfJcIU+VgQ/Iw
 BFzzwbQbQicp+/6D4AptwIkgLgosg6tK6wxtvjhmTKvY9n2SdcCJWpZlfDOzlXb5/afp
 wOUaU4Zc7A1K1szpjQ5R2a7ycq4e9P4J1yrAXArvL2yGYdKM9ojfScYhHFe3Ry1X8Si9
 NmJP7KtAECjrk+INuL41CCKCxO7voOPD/AuUCVexz0Mx6EJJAME5FmzqK2Akf13c7Zz7
 bxPQ==
X-Gm-Message-State: AOAM533l8fSISbiXfOUEJUxOfDcLlneF+Ag1qYiAiZluwCNEXtS8WXJ8
 DQZFX4XCaOik3xl2Ee2yVrZC800Wvjw8+jpCnTppYFlSeMNcBELyfdA2IaH89PqMpnu6q/xgyXB
 VOpdpT21AAdDmPDM=
X-Received: by 2002:a5d:5343:: with SMTP id t3mr18257090wrv.273.1628597934862; 
 Tue, 10 Aug 2021 05:18:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG7lsJ3f7IXsOFdub6yXWKsh6nv2r8DBJuZTCD9meVFsqfAw/Z5wlCeEEXmLemL+wc+o2vJA==
X-Received: by 2002:a5d:5343:: with SMTP id t3mr18257073wrv.273.1628597934687; 
 Tue, 10 Aug 2021 05:18:54 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id i3sm2602811wmb.17.2021.08.10.05.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 05:18:54 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Name and email address change
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20210810095049.35602-1-hreitz@redhat.com>
 <0598232c-ee2a-cb82-264b-052fde8082ae@redhat.com>
 <98a4f877-2cbc-e285-3055-0a7b5a7ef901@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <21a0061a-f31a-eafb-7701-02e2d2976b5f@redhat.com>
Date: Tue, 10 Aug 2021 14:18:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <98a4f877-2cbc-e285-3055-0a7b5a7ef901@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

On 8/10/21 1:46 PM, Hanna Reitz wrote:
> On 10.08.21 13:29, Philippe Mathieu-Daudé wrote:
>> On 8/10/21 11:50 AM, Hanna Reitz wrote:
>>> I have changed my name and email address.  Update the MAINTAINERS file
>>> to match.
>>>
>>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>>> ---
>>>   MAINTAINERS | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>> I'd recommend you to also add an entry in .mailmap:
>>
>> -- >8 --
>> diff --git a/.mailmap b/.mailmap
>> index 082ff893ab3..504839c84d3 100644
>> --- a/.mailmap
>> +++ b/.mailmap
>> @@ -53,6 +53,7 @@ Anthony Liguori <anthony@codemonkey.ws> Anthony
>> Liguori <aliguori@us.ibm.com>
>>   Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
>>   Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
>>   Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
>> +Hanna Reitz <hreitz@redhat.com> <mreitz@redhat.com>
>>   Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
>>   Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
>>   James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
>> ---
> 
> Hu, I didn’t know there is such a thing.  Looks like I could even do
> 
> Hanna Reitz <hreitz@redhat.com> Max Reitz <mreitz@redhat.com>

If you want to restrict to 'Max Reitz', but without it it will simply
take all mails from <mreitz@>. IMO KISS, no need to filter by name in
your case :)

> Feels a bit like cheating, though...?

No, why? The "preferred name forms" section seems adequate.

>> As it or with .mailmap modified:
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

What is nice with .mailmap is the combination with ./get_maintainers.pl,
in particular when it defaults looking at commit history. If you
Sob/Acked a commit as Max, the script (call by git-send-email) will
replace it by Hanna.

For the contribution statistics, all your previous contributions as Max
will be directly shown as Hanna (along with your future ones).


