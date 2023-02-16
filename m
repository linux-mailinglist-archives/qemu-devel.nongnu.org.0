Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCB5699A6A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:44:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShMs-0003zx-Fr; Thu, 16 Feb 2023 11:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShMq-0003vv-2Z
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:44:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShMo-0000sT-Dj
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:44:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676565856;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkZXoSfMpXv6hHL7OdKJdWYbQdxHTmhtUamhXXJavso=;
 b=P8pDxHR2MSvFCZZMwLYN9HZhJolyLYYKJt78RWY9YLUGwytp/nq1vLyJuFVk3keKkqBmB1
 In+68zUcUKyxEcH7nzxDGHFisgiD+CQ0VNL6srHwglmPEGirdkTHvVTqMoQugbY8KCeYFl
 InnA+2fpgPBlMNfR07NxyTzEGnZGFUM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-640-Lgk8AxhGM8yvA12G_lKPaQ-1; Thu, 16 Feb 2023 11:44:14 -0500
X-MC-Unique: Lgk8AxhGM8yvA12G_lKPaQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 j10-20020a05620a288a00b0070630ecfd9bso1530856qkp.20
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:44:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YkZXoSfMpXv6hHL7OdKJdWYbQdxHTmhtUamhXXJavso=;
 b=7PWSrYvZ+zGYwGLB+rZEO4CdTUDWiyIXcNaTABw46cu2VdDWBYy/UcOsEXs+H92FaY
 Oed2YV4QLqknEBIjGDRDagwGduS+dWbZt75Fg1hsiE1m56auBiT5e/GZbD5tMnxGxI4N
 JqRMHfCHeWVqhcgR4l3/kzn0cMP+DQSM4payYq+IufgeReeDVTIz3gTlcRBMAGXLLX/W
 +46z+9JV1FY6cif0xIPrWSM9tWrdZa/pAJfX1+z/k5YwBrSHorJ16VBxT0AbfnxVCQ9s
 9ijWgGY+0kj+86/yIqSTXYt8QabHDs8fVlfIMuVgyo+7EpBg/4ZhdSVfEnjQQZ4mHgl7
 d3jw==
X-Gm-Message-State: AO0yUKVLS0aekC6y0ma3ZVTkNuTkBx/M7ItdBHseGmkf1Mpr+Wp4Gehb
 aInuZUl1/jDgXdgZgtfPnQzOdngxvJZC5JY74W9lpuQtOog78sF28k3vAbD0ol4MXpquS25BnWK
 S4osIKCLKoudn9tE=
X-Received: by 2002:a05:622a:1741:b0:3a8:dae:d985 with SMTP id
 l1-20020a05622a174100b003a80daed985mr4769268qtk.14.1676565854368; 
 Thu, 16 Feb 2023 08:44:14 -0800 (PST)
X-Google-Smtp-Source: AK7set8G1JTtlG/n1SBqYm6eJkBCedV87NqQfI5mDLAin7wJPT3cRd24yWkJXViaKqQZeqB2gb1rvw==
X-Received: by 2002:a05:622a:1741:b0:3a8:dae:d985 with SMTP id
 l1-20020a05622a174100b003a80daed985mr4769245qtk.14.1676565854056; 
 Thu, 16 Feb 2023 08:44:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 x1-20020ac81201000000b003b9b41a32b7sm1475816qti.81.2023.02.16.08.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 08:44:13 -0800 (PST)
Message-ID: <7a63bcd1-0b54-63ea-55c1-925fe4dcf6d5@redhat.com>
Date: Thu, 16 Feb 2023 17:44:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 03/16] hw/arm/smmuv3: Rename smmu_ptw_64
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-4-smostafa@google.com>
 <608e2401-83f1-e7c6-af17-25da22df76a6@redhat.com>
 <Y+4n8aJkQu/479Ir@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y+4n8aJkQu/479Ir@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/16/23 13:56, Mostafa Saleh wrote:
> On Wed, Feb 15, 2023 at 05:53:23PM +0100, Eric Auger wrote:
>>> +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>>>  {
>>>      dma_addr_t baseaddr, indexmask;
>>>      int stage = cfg->stage;
>>> @@ -384,7 +384,7 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>>>          g_assert_not_reached();
>>>      }
>>>  
>>> -    return smmu_ptw_64(cfg, iova, perm, tlbe, info);
>>> +    return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
>> May need to rename the trace points as well
>>
> All PTW trace points have a stage argument which is set correctly
> from stage-1/stage-2 ptw functions:
> trace_smmu_ptw_page_pte
> trace_smmu_ptw_block_pte
> trace_smmu_ptw_invalid_pte
Ah OK. Forgot that.
>
> trace_smmu_ptw_level is the only one that had no stage argument, I can
> change it to be consistent with the others.

OK

Thanks

Eric
>
> Thanks,
> Mostafa
>


