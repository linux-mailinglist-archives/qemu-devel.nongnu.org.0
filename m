Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6816454616
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 13:03:23 +0100 (CET)
Received: from localhost ([::1]:40896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnJes-0004At-LQ
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 07:03:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnJd2-0003K7-8j
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 07:01:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnJcy-0007JC-Mg
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 07:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637150482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cMjUHsAWG4QtlXLxLsTHVmDVihXjymgtaFSZlOTlBPU=;
 b=DLMZRsEohFBPUcyG8gUR0v4vtIBNEgFAoWBVI2F2D27xFNvY2XYeFSVjQm7wZoTsYQF1QE
 +d6ZlsydHpTlT0jmfJkh2LBQuHl45xp1mRQ7b9rZzdo4fl0R3TIL1t2VDEPhMx7j9Me+xN
 oRjJJ5f/OT3euLpbHNnC45fzYceLpHc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-E4dARmDpPP-V5irMcd_D3g-1; Wed, 17 Nov 2021 07:01:19 -0500
X-MC-Unique: E4dARmDpPP-V5irMcd_D3g-1
Received: by mail-wr1-f71.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so323429wrd.1
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 04:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cMjUHsAWG4QtlXLxLsTHVmDVihXjymgtaFSZlOTlBPU=;
 b=58Jq0q6mHMa+1TJFMSnABaIPQiKr0ebzMh8pv4tOtoYOzhoBU9ktbMIbBcUot4inPB
 qVI5970DXwCOIKlpxRQNe4tSK01scPzyAa/auLibqjb8Y8Jmw5o73M7HX946zb4n+CU+
 k+CGbc8iVnwjyRLe/iATe/cJa1wLoZruDduCyOjzOTV/OrICxnwAtNNuiPg5cPlG6PAv
 Q1OWka/yK3H3pSs1QKYOVjYv0Racojc7oIWiefAE4DAEThAinzNDQNogHaY04H+4hgk+
 TVifLVNEbr8IXhcX1QJmO0iJMETXh8RzOhgP2DNRmbAZz0iFi/VMzGy8sHJRGHXa2tbO
 NpUw==
X-Gm-Message-State: AOAM531oL0kJGOlNvgCjAHI7HFvTQS5SHxhQ6+gWDfbxN/tXIoBdEyh+
 nh+0j6/3WTpGrbHTqEto8/jGfZnUcP2qeKqu9a4O1WkrAv9tRJZ3wD04/uc8FnfVZwP7hc60kok
 gSSJJRPMuFvjCu/Y=
X-Received: by 2002:a1c:8093:: with SMTP id
 b141mr79137549wmd.129.1637150478127; 
 Wed, 17 Nov 2021 04:01:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7hEBEy3Xg+BGlUvq4bL0Qol4XTp0NbecTMNjlpeWRPYySp0LOVxU0+jcEJJMarTsmRuYpXA==
X-Received: by 2002:a1c:8093:: with SMTP id
 b141mr79137512wmd.129.1637150477878; 
 Wed, 17 Nov 2021 04:01:17 -0800 (PST)
Received: from [10.201.33.14] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id v8sm20434624wrd.84.2021.11.17.04.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 04:01:17 -0800 (PST)
Message-ID: <063e12f5-c119-f4ae-33d4-c010ba6615c8@redhat.com>
Date: Wed, 17 Nov 2021 13:01:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
References: <20211114005111.515543-1-aik@ozlabs.ru>
 <735870db-c919-5f85-859a-eddbf507005b@kaod.org>
 <e0d2a9bd-1c63-7033-7daf-271fea702d66@redhat.com>
 <5ac387fa-8b6e-7d77-d425-a26f453bcc94@linaro.org>
 <cf010ee6-0a8c-c18b-4c3b-3b4761d2ed69@ozlabs.ru>
 <fe6d8599-49d6-779d-cfe9-7f5a7a48cd60@linaro.org>
 <5d500a70-7240-d70b-eb3e-d06c8266e014@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <5d500a70-7240-d70b-eb3e-d06c8266e014@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 09:49, Cédric Le Goater wrote:
> On 11/17/21 09:39, Richard Henderson wrote:
>> On 11/16/21 11:48 PM, Alexey Kardashevskiy wrote:
>>> Yup. I am doing SLOF updates this way for ages after diifs became
>>> quite huge to make mailman barfing on the size, and the "subsystem"
>>> in the subj was the way to reduce the noise Peter had to respond to :)
>>>
>>> btw should I be signing those? I am not now.
>>
>> You could if you and Cedric want to do so (is it really Alexey sending
>> the sub pr and not an impostor with access to the same github
>> account?), but it will not leave a permanent record in the mainline
>> history, because the merge object with the signature will be removed
>> by any rebase.
> 
> 
> Yes. I just noticed that the merge commit is lost :
> 
> 2021-11-09 15:50 +0100 Christophe Lombard                     o
> [ppc-7.0] {origin/ppc-7.0} pci-host: Allow extended config space access
> for PowerNV PHB4 model
> 2021-11-16 17:39 +0100 Cédric Le Goater                       M─┐ Merge
> tag 'qemu-slof-20211112' of github.com:aik/qemu into ppc-7.0
> 2021-11-13 14:47 +1100 Alexey Kardashevskiy                   │ o
> pseries: Update SLOF firmware image
> 2021-11-12 12:28 +0100 Richard Henderson                      M─│─┐
> Merge tag 'pull-ppc-20211112' of https://github.com/legoater/qemu into
> staging
> 2021-11-10 17:25 -0300 Daniel Henrique Barboza                │ o─┘
> {origin/ppc-for-upstream} {origin/ppc-next} <pull-ppc-20211112>
> ppc/mmu_helper.c: do not truncate 'ea
> ...
> 
> After rebase :
> 
> 2021-11-09 15:50 +0100 Christophe Lombard                     o
> [ppc-7.0] pci-host: Allow extended config space access for PowerNV PHB4
> model
> 2021-11-13 14:47 +1100 Alexey Kardashevskiy                   o pseries:
> Update SLOF firmware image
> 2021-11-16 21:07 +0100 Richard Henderson                      o Update
> version for v6.2.0-rc1 release
> 2021-11-16 18:55 +0100 Richard Henderson                      M─┐ Merge
> tag 'pull-nbd-2021-11-16' of https://repo.or.cz/qemu/ericb into staging
> ...

No need to rebase if Alexey sends his pullreq once v6.2 is out.

> Alexey's commit appears in the list with only his SoB and we loose :
> 
>     Merge tag 'qemu-slof-20211112' of github.com:aik/qemu into ppc-7.0
> 
>     * tag 'qemu-slof-20211112' of github.com:aik/qemu:
>       pseries: Update SLOF firmware image
> 
>     Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> which I find interesting to identify where the SLOF blob is coming from.
> 
> 
> Thanks,
> 
> C.
> 


