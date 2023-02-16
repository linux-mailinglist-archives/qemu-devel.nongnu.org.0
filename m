Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9505A699A9D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:55:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShX2-0003Dy-I0; Thu, 16 Feb 2023 11:54:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShWy-0003DN-NS
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:54:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShWu-0006E6-IV
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:54:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676566483;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3EZUe8V3OvtV4dlnAAOu4AQEHMcgV8VbWADzJqqvqQ=;
 b=XwdGz6mUdeIoT4kD1hEzbbt/SOhRTLiWR3N5cTAfZ69MoXKWKE0cP2HhC00suNe1uTsiFN
 /ZFTse56dOeqBRTNVw5TowlrSeOR390nGAt11VpMgLIRbyF7M6jbrYVAXRrctX2zBcVffN
 oiUsrXzuH4c0fSj7uoJp+DJcZcnSczU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-147-6xJFmuT8No-e9i2CPF-uGA-1; Thu, 16 Feb 2023 11:54:42 -0500
X-MC-Unique: 6xJFmuT8No-e9i2CPF-uGA-1
Received: by mail-qt1-f197.google.com with SMTP id
 n1-20020ac85a01000000b003ba2a2c50f9so1525253qta.23
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:54:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q3EZUe8V3OvtV4dlnAAOu4AQEHMcgV8VbWADzJqqvqQ=;
 b=YYOhluzcjpNgCltEdvK96Oruow4s3cNfBV9D8iPp+gWtcEfAvRHUXl/z/V9FqlVrET
 vBlotz3uvZQ7BEu1M0FBMjbwcADRGwW3XLGi1G1keMs/lrH4wmouu6wLRKpHwtZml+Wq
 TpMey/gKtPBs7TPozS7T5Z1jndlRVYgV3HLdwsFmr+/5rXl36kC6kd5dRKZEfeIZwRw5
 PgOnETpqYYCEE3n5+LfmRzdlwbYW5/TPUTYcfoVhxLkrGctLZCIRm5BitUtll9NFPry/
 vyOGTWaU2ctraevQVO5vt9SQWyWTiXvsFJaVGvMTwOLhVgmOYh1wa91JjkITHcxUi/lZ
 PPzg==
X-Gm-Message-State: AO0yUKUFk+kB12IaMf/BNwT9sE5O8uKvUdBmLehN+/CxF536KZx3+ZjG
 fEHvwDabSTo4H280omCxn21NFdv2Mgz6Htna4WTe8tAJd8rgJoVD8Ozm1xeaudtUvGR0M6drxvC
 UUhUhG3FG6ETogOU=
X-Received: by 2002:ac8:5784:0:b0:3b9:bc8c:c204 with SMTP id
 v4-20020ac85784000000b003b9bc8cc204mr5051873qta.15.1676566481954; 
 Thu, 16 Feb 2023 08:54:41 -0800 (PST)
X-Google-Smtp-Source: AK7set9sXy6QYOTe7rRzGB0hgLadUTYuCgIrDshYA/VuRUS09FYqzffROdwdPqiT52tF1+BClXAiWA==
X-Received: by 2002:ac8:5784:0:b0:3b9:bc8c:c204 with SMTP id
 v4-20020ac85784000000b003b9bc8cc204mr5051850qta.15.1676566481711; 
 Thu, 16 Feb 2023 08:54:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 x78-20020a376351000000b006bb82221013sm1130705qkb.0.2023.02.16.08.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 08:54:41 -0800 (PST)
Message-ID: <83f5fbff-b30b-901a-f7fc-5f487de8cc69@redhat.com>
Date: Thu, 16 Feb 2023 17:54:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 13/16] hw/arm/smmuv3: Add CMDs related to stage 2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-14-smostafa@google.com>
 <7ebe5091-54ae-d5a2-09c4-0ae1e8276cb8@redhat.com>
 <Y+42e9PE9g7JpBuq@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y+42e9PE9g7JpBuq@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
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



On 2/16/23 14:58, Mostafa Saleh wrote:
> Hi Eric,
>
> On Thu, Feb 16, 2023 at 12:56:52PM +0100, Eric Auger wrote:
>>> @@ -1174,14 +1174,35 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>>>          case SMMU_CMD_TLBI_NH_VA:
>>>              smmuv3_s1_range_inval(bs, &cmd);
>>>              break;
>>> +        case SMMU_CMD_TLBI_S12_VMALL:
>>> +            uint16_t vmid = CMD_VMID(&cmd);
>>> +
>>> +            if (!STAGE2_SUPPORTED(s->features)) {
>> if you add such checks for S2, may you should consider adding similar
>> ones for existing S1?
> Yes, I will go through the other commands and do the same for stage-1
> only commands.
>
>>> +            smmu_inv_notifiers_all(&s->smmu_state);
>>> +            smmu_iotlb_inv_vmid(bs, vmid);
>>> +            break;
>>> +        case SMMU_CMD_TLBI_S2_IPA:
>>> +            if (!STAGE2_SUPPORTED(s->features)) {
>>> +                cmd_error = SMMU_CERROR_ILL;
>>> +                break;
>>> +            }
>>> +            /*
>>> +             * As currently only either s1 or s2 are supported
>>> +             * we can reuse same function for s2.
>>> +             */
>>> +            smmuv3_s1_range_inval(bs, &cmd);
>> Shouldn't we rename the function then?
> I guess we can rename it smmuv3_s1_s2_range_inval, we will have to
> revisit this when nesting is supported.
or simply smmuv3_range_inval, adding a comment specifying its is usable
for both stages

Eric
>
> Thanks,
> Mostafa
>


