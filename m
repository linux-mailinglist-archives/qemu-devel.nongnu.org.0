Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DD96F7E59
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 10:05:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puqPo-0004Z3-Nf; Fri, 05 May 2023 04:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puqPg-0004V2-DH
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:03:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puqPe-0002XR-EV
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683273812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFAZGtt20jjfxFOWddyez5tj/P7elvG1aIyda0Udr64=;
 b=RF5J/sRaWbPoi6iy5uGy7coKYkf3ClcaNvDbDTu115hfx2v42HMT6GHpiIE4CeMvDGnmgk
 HJpkxQeRiddiTvaRdJ//5OT/wYgHw/FucmCvSQJmM3eiK+WzOZHAoSnf3qzRzubj8I8CUB
 PIsQZbkwarBmS9wjUNJc++S1DFgG3I8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-RHRGTjP3P1qlCi3TwNKfzw-1; Fri, 05 May 2023 04:03:30 -0400
X-MC-Unique: RHRGTjP3P1qlCi3TwNKfzw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f3fe24912cso9638125e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 01:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683273809; x=1685865809;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xFAZGtt20jjfxFOWddyez5tj/P7elvG1aIyda0Udr64=;
 b=DyY9rwpGLTXtVSLS2U4EwyJ6chaotseDqXLEkrrYkXiuDl+j2NJoRyjH1oypYp0qo2
 5Pgk0NuN9pbqSM6PVesRUgVHDlZJ6wHn8Lv5WLp037rzs3wbB8lyGxW17HGL40J6bJDs
 jAlA6afk5800UI6CA0Goh3a22nKe/5x2rwBwOb7vgnA5jkJ4MqC9tUWm0GF3uplL0baq
 /2yQVyHG2wJi+vcmsvqKFl8qNB4tH69n1uxufCi6LBpF0+GOYaYOCLnAFJzdlyd2gPpa
 NLFxkXJX2KCtcCRnMQqWXxtlG/dvYR2XCJLTFJYp2i9adiwXkqULsuMECGVRVrmtajO3
 /Hkg==
X-Gm-Message-State: AC+VfDxKIL99zUhs3hzhm0f33trhAsXKS581fz/OBmm2J4dNnVC98MjE
 ekvknq3KG/m5GXeTnJE3dOr7Jykh+UZzHkYR/qt+CfkHGYlkAHgslKxHq0aOSLORuvzePt81BkK
 WI6V5fd26PNgNfV0=
X-Received: by 2002:a7b:c357:0:b0:3ee:19b4:a2e6 with SMTP id
 l23-20020a7bc357000000b003ee19b4a2e6mr414916wmj.19.1683273809413; 
 Fri, 05 May 2023 01:03:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7IgW4LpLerY7nDGpska6phJavNFcAvC/Va1g1I7WQwFaQE/fYo7poYMvsFKxEdXlmM7UqHkg==
X-Received: by 2002:a7b:c357:0:b0:3ee:19b4:a2e6 with SMTP id
 l23-20020a7bc357000000b003ee19b4a2e6mr414894wmj.19.1683273808956; 
 Fri, 05 May 2023 01:03:28 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-91.web.vodafone.de.
 [109.43.179.91]) by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b003ed2c0a0f37sm7198369wmg.35.2023.05.05.01.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 01:03:28 -0700 (PDT)
Message-ID: <1cf86174-b3eb-0674-7669-1bc7b4bc3eac@redhat.com>
Date: Fri, 5 May 2023 10:03:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] hw/ppc/Kconfig: NVDIMM is a hard requirement for the
 pseries machine
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230504180521.220404-1-thuth@redhat.com>
 <9b5e3d31-3e1a-eba1-e935-fb6f0dd75283@gmail.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <9b5e3d31-3e1a-eba1-e935-fb6f0dd75283@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04/05/2023 23.19, Daniel Henrique Barboza wrote:
> 
> 
> On 5/4/23 15:05, Thomas Huth wrote:
>> When building QEMU with "--without-default-devices", the pseries
>> machine fails to start even when running with the --nodefaults option:
>>
>>   $ ./qemu-system-ppc64 --nodefaults -M pseries
>>   Type 'spapr-nvdimm' is missing its parent 'nvdimm'
>>   Aborted (core dumped)
>>
>> Looks like NVDIMM is a hard requirement for this machine nowadays.
> 
> Ouch.
> 
> I believe this has to do with this comment in hw/ppc/spapr.c, in
> spapr_instance_init():
> 
>      /*
>       * NVDIMM support went live in 5.1 without considering that, in
>       * other archs, the user needs to enable NVDIMM support with the
>       * 'nvdimm' machine option and the default behavior is NVDIMM
>       * support disabled. It is too late to roll back to the standard
>       * behavior without breaking 5.1 guests.
>       */
>      if (mc->nvdimm_supported) {
>          ms->nvdimms_state->is_enabled = true;
>      }
> 
> It seems like you found out another side effect of this nvdimm situation 
> that Igor
> documented 2 years ago in 55810e90 ("ppc/spapr: cleanup -machine 
> pseries,nvdimm=X
> handling").
> 
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> 
> I'll send a PPC PR in the next few days. Let me know if you want me to queue 
> it.

Yes, please add it to your queue!

  Thanks,
   Thomas


