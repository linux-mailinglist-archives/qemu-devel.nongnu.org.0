Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7AC40865F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 10:23:05 +0200 (CEST)
Received: from localhost ([::1]:53764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPhF1-0008Vl-VY
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 04:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mPhBy-0006oZ-TM
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:19:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mPhBs-0005OC-TN
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631521187;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJkMellTFxgjPkoDlkxxM0Jq5YOH4Ah/iD+GGHt++Wk=;
 b=H1ZaiPg9+I5DRsnqdI9rlpqR4y1j24brlxs97wtB5llcFnq6nglduyWfnTY0vE35vrr1Fc
 90QO89fhyq2aNJA466T/E98pAuU/VJjDjA6HI9V9B//N5+8csxPbMav3n5oREc3DQZ+gNW
 npeXo0cNYeh64YTyy6C7IAojx80UIw8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-gpujRoktPk-kz2x429Ywqg-1; Mon, 13 Sep 2021 04:19:46 -0400
X-MC-Unique: gpujRoktPk-kz2x429Ywqg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m22-20020a7bca56000000b002e7508f3faeso4584168wml.2
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 01:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=IJkMellTFxgjPkoDlkxxM0Jq5YOH4Ah/iD+GGHt++Wk=;
 b=AizCtqoMbzzvI3ij9NRUKh9tkkVlnPrBQaM+oLBp8+c5Vcek8uR9uFbl9j751bO1qP
 6xI/HAUIYUHM3l2s47dv/xG509EpJ7XEOZtchxergUMIsEltPPoG3waIvM+GA8xBk2vK
 ouLf+lFVDXiCE9diz4+uGS2gfIgVN+e65opi3T8pDCYnG7vc/aE3hytD79e+dtvxdPKz
 ZLuJZfTl4kN+hitqtvybGXl2a230OZGaWf4dgK16B5o+VKITw5lYDx1Bao7/0hCK3hzF
 hsFn4r/vUyAjMJq6ybUSFp/YohB81T6pxU7FrfDKombNBOzVhynEK0dhxHNCXqsPoY4/
 /cAg==
X-Gm-Message-State: AOAM533QPowx8KcVCZe1E4MhxALJjikW5cR5zpc1Lvl6dLziH9ZshKgn
 IQHtr7a789XfiRuq+JQ963Owm5plAh/50m2idicni3ZjVjjGV93WFE4PE5cGOR5G9ScPQxFQIS1
 e8liEHP0eyUva9oWjbNmI0WIwoqup9b8PIrxhIVFDjAziz8lf98hgRR9GmcOCKgOykrg3tQ==
X-Received: by 2002:a5d:64a7:: with SMTP id m7mr11077187wrp.171.1631521184992; 
 Mon, 13 Sep 2021 01:19:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJVviDqhTsSELOul+z/FBhifBQm86V8ykW4/Fde8ocnRkurpHJIbDb2n13CIdJJAWxDOqWxw==
X-Received: by 2002:a5d:64a7:: with SMTP id m7mr11077162wrp.171.1631521184751; 
 Mon, 13 Sep 2021 01:19:44 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id y4sm6152082wmi.22.2021.09.13.01.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 01:19:44 -0700 (PDT)
Subject: Re: SMMU Stage 2 translation in QEMU
To: shashi.mallela@linaro.org, Peter Maydell <peter.maydell@linaro.org>
References: <bac0b38fc7c5f7a5a1c91784eb7236de39b6f18a.camel@linaro.org>
 <CAFEAcA-k8=M5KQWoJ=yurAZuHt9=F9mb002Z=7T_EC6x5EP95w@mail.gmail.com>
 <909bcf70ba8d88d485ec0b36371633e54edef81c.camel@linaro.org>
 <CAFEAcA8=7-hHEHyABS-FFPtacYvhFpwa7_PLVsC7-x_5rxjicg@mail.gmail.com>
 <e8ccd74e89ba9d30d8588f0aa6966dc71d0ae923.camel@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <f788c9de-17be-025a-a723-c7ba86548970@redhat.com>
Date: Mon, 13 Sep 2021 10:19:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e8ccd74e89ba9d30d8588f0aa6966dc71d0ae923.camel@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-3.584, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Shashi,

On 9/10/21 3:32 PM, shashi.mallela@linaro.org wrote:
> So that would be the driver code running in guest OS because i see
> tables being setup by arm-smmu driver code in linux,which is similar to
> what happens with ITS(table base addresses programmed in registers by
> linux driver).
Stage2 SMMU tables are generally not used today. Only stage 1 is used,
even with VFIO (with KVM).
SMMUv3 upstream driver does not support S1+S2 (nested). It only supports
either S1 or S2. Enabling S2 can be done through VFIO driver, if you
select the VFIO_TYPE1_NESTING_IOMMU IOMMU type. This then calls IOMMU
.enable_nesting  = arm_smmu_enable_nesting which sets smmu_domain->stage
= ARM_SMMU_DOMAIN_NESTED. But the name is misleading as it actually
forces the use of S2 instead of S1.

However if you look at QEMU VFIO code, no one uses VFIO_TYPE1_NESTING_IOMMU.

Note I have worked on 2 stage integration for years, without much
success yet:
[RFC v9 00/29] vSMMUv3/pSMMUv3 2 stage VFIO integration

[PATCH v15 00/12] SMMUv3 Nested Stage Setup (IOMMU part)
[PATCH v13 00/13] SMMUv3 Nested Stage Setup (VFIO part)


Thanks

Eric
>
> On Fri, 2021-09-10 at 13:54 +0100, Peter Maydell wrote:
>> On Fri, 10 Sept 2021 at 13:39, <shashi.mallela@linaro.org> wrote:
>>> I am referring to the latter,"purely emulated QEMU with an emulated
>>> SMMU that handles accesses to emulated devices"
>> In that case, the stage 2 tables are set up by the guest
>> code (running at emulated EL2), just as they would be if
>> it were running on real hardware.
>>
>> -- PMM


