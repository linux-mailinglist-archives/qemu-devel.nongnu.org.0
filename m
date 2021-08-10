Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EF53E595F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 13:48:01 +0200 (CEST)
Received: from localhost ([::1]:38254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDQEi-00005Q-7v
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 07:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDQDi-0007ic-85
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:46:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDQDg-0002ck-24
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628596015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+f7OR3Ghbp5INT4ZvB1CJBjzimnv03GvaEVV2yFQeY=;
 b=DHeSlGu5/rJAj4EK6cAGet5o+exLTiTZs8siZ5Mj/t95EG7mV4rooVnJXl0SBc+UWyZ1kR
 4AqTsWMBC93Ebvu+AE228uwRAnMH2xXYgwK5YHFbd0XoWrbjy5nffgqa+SuKhFnREerfBt
 wvJH8oq1RQuBxOrcb5kr0ilRRfhImeI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-dNKDpiFIMY-Efb3JiGwoeA-1; Tue, 10 Aug 2021 07:46:54 -0400
X-MC-Unique: dNKDpiFIMY-Efb3JiGwoeA-1
Received: by mail-wr1-f72.google.com with SMTP id
 m5-20020a5d6a050000b0290154e83dce73so2049845wru.19
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 04:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=j+f7OR3Ghbp5INT4ZvB1CJBjzimnv03GvaEVV2yFQeY=;
 b=WYCmTTWzg6B7lIrGfsFbXhcKFFon++p8CiAqiAGRH+CGJ0gS8cXy6VnlP2cHC+bAxA
 9WSGAysUKqMyfH0pYJsyfbrvgBGYrMC02TaQ7veIGk+zTIcWPmOVV5WemhZiRWJdGRsf
 kTS38nMh6fJflWqIpqtV8klPojb1OpcUlx+mxhW5anRtUvO0zV75Gixht71i3Urd8qBL
 1Hka9mrGPPbBjf/6s4JB/dTfWD1/Qvajae8DB5JjtFG25foxPw7+igBeIbkeuq9+stCS
 AWrjWRPfl94yrqd6AyBrytFeeJad1K9CMU2u6YQH7+YMvSe60pWx8g/r5Dv0HRTJoecH
 RsdQ==
X-Gm-Message-State: AOAM532dfRqtPAZ1n0y3G/uvoyfKUXBKFw5HihW/CHerVGOR7jOVlilK
 98L3IpjneHj7trbupXQUUpNmjY14Ls6+rF0EssRzBAOMsZ4oyhj8YquOhlDfKfMmnvTQuftyKHA
 2zC5ZV+p3SU3fmdg=
X-Received: by 2002:adf:9e0b:: with SMTP id u11mr30287589wre.403.1628596013002; 
 Tue, 10 Aug 2021 04:46:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfXr4llfo+LrzrnkvjW8Wuw3H5+9rzW5MDulgEQziv2Ww4pemdL5bBslCl4xdoMW7DSMa+aA==
X-Received: by 2002:adf:9e0b:: with SMTP id u11mr30287573wre.403.1628596012832; 
 Tue, 10 Aug 2021 04:46:52 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 a11sm8865657wrw.67.2021.08.10.04.46.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 04:46:52 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Name and email address change
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
References: <20210810095049.35602-1-hreitz@redhat.com>
 <0598232c-ee2a-cb82-264b-052fde8082ae@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <98a4f877-2cbc-e285-3055-0a7b5a7ef901@redhat.com>
Date: Tue, 10 Aug 2021 13:46:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0598232c-ee2a-cb82-264b-052fde8082ae@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.704, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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

On 10.08.21 13:29, Philippe Mathieu-Daudé wrote:
> On 8/10/21 11:50 AM, Hanna Reitz wrote:
>> I have changed my name and email address.  Update the MAINTAINERS file
>> to match.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   MAINTAINERS | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
> I'd recommend you to also add an entry in .mailmap:
>
> -- >8 --
> diff --git a/.mailmap b/.mailmap
> index 082ff893ab3..504839c84d3 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -53,6 +53,7 @@ Anthony Liguori <anthony@codemonkey.ws> Anthony
> Liguori <aliguori@us.ibm.com>
>   Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
>   Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
>   Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
> +Hanna Reitz <hreitz@redhat.com> <mreitz@redhat.com>
>   Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
>   Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
>   James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
> ---

Hu, I didn’t know there is such a thing.  Looks like I could even do

Hanna Reitz <hreitz@redhat.com> Max Reitz <mreitz@redhat.com>

Feels a bit like cheating, though...?

> As it or with .mailmap modified:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


