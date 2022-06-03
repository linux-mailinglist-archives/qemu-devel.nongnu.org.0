Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA2353CC01
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 17:08:43 +0200 (CEST)
Received: from localhost ([::1]:42244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx8uo-0004GY-MS
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 11:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx8s6-0002Sp-RH
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 11:05:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx8s3-0005uH-Kv
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 11:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654268750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8JHfiYNcfscpTsqS/f5uG8jf4FjnNFlmS3Qkwe7NpA=;
 b=Niv2JDkcqj6qMKCF56r7WfFqLYdYvQo++LO7exxekRgrugGr9xQQ1SOsVFIWik43Jo9oLK
 jFWv0Zk8QcLvVHpFhDKD0QQmb5dihipQdtS9N8sMlrxrwHddA/kYRCJG+FpBMJKnx0ryPe
 qGxE/Brk1XQS1YEl5t94Z4ShB5TH6QI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-uFpynrmsN8uEwkaTk9lFbQ-1; Fri, 03 Jun 2022 11:05:49 -0400
X-MC-Unique: uFpynrmsN8uEwkaTk9lFbQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m19-20020a05600c4f5300b003974eba88c0so4488361wmq.9
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 08:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=n8JHfiYNcfscpTsqS/f5uG8jf4FjnNFlmS3Qkwe7NpA=;
 b=QnYzjiXE4hGK/BtMDBAGMDdcRRvBx9Li2cRsp2ZyJPvNZ0V6wdBxAAkd6MdZAfFnxu
 cp4kZ0xDQYCekqHsVrCuzvnOKR1iNvy92BbWzDM7uFeMQFEeYscSXuKknt5hu4gmtTI5
 WhmTXPZ3bByWIPS4sXsupG4IK2QXzI1RTdsgnCGRPF1Q17lkgASZFIKmk7ybgS1Kye1I
 8i//LPSxCtPqxNIg14/C90mx7dydPYEcl/X4vAoeN5jUWgQOHYABiIqNsAXg2n7l/Pio
 fldKv1Ws2dswT38EJHGXqNHOJyuXUuSB/AhENdDJXoW6X0aJSagfYpS8RqPa0O9OsSk3
 TRDQ==
X-Gm-Message-State: AOAM530dkfxGE1/ygPmOuboG632Dcz0MljUbLHHfVPepx/04EY01EtZY
 bxoe8UtEsEABOxZU5avU4Z8dLQ1jse9Ml5LK20Vs4VGasq4AkblkNylZlYdoS+VS8s8DTOcrcoj
 Qoe+HeKKA71HPf7M=
X-Received: by 2002:a5d:59af:0:b0:20f:d6e8:a5e with SMTP id
 p15-20020a5d59af000000b0020fd6e80a5emr8501901wrr.507.1654268748605; 
 Fri, 03 Jun 2022 08:05:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTDGRC/oOObswaQEsc/x+Q2CgXn0HWuSyaKB6k8Ogbp8mdeiOe6nbrX2uyyw+LyCD3LcYEOA==
X-Received: by 2002:a5d:59af:0:b0:20f:d6e8:a5e with SMTP id
 p15-20020a5d59af000000b0020fd6e80a5emr8501814wrr.507.1654268747682; 
 Fri, 03 Jun 2022 08:05:47 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-213.customers.d1-online.com.
 [80.187.98.213]) by smtp.gmail.com with ESMTPSA id
 h42-20020a05600c49aa00b003973d425a7fsm9417657wmp.41.2022.06.03.08.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 08:05:46 -0700 (PDT)
Message-ID: <c7274cba-130c-b2fb-f6fa-453787ad8bad@redhat.com>
Date: Fri, 3 Jun 2022 17:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20220516145823.148450-1-thuth@redhat.com>
 <20220516145823.148450-4-thuth@redhat.com>
 <CAFEAcA8t37wT2D-tT0n0O2HP1sTtYfeS8p2Wd+4QE6jsJ0k9Hw@mail.gmail.com>
 <f614c7f6-2523-d587-ea44-fe4c70e8c630@redhat.com>
 <c263a4ca-ceb3-a2f0-0839-b915cf98728e@linaro.org>
 <5098180d-334f-7631-011f-6beb3a1434ac@linaro.org>
 <757ff3c0-b77a-b230-6a09-fb3d8c95b1c7@redhat.com>
 <81c001a9-7709-66e5-fe71-370ebf3cb39b@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/3] capstone: Remove the capstone submodule
In-Reply-To: <81c001a9-7709-66e5-fe71-370ebf3cb39b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/06/2022 15.48, Richard Henderson wrote:
> On 6/2/22 22:21, Thomas Huth wrote:
>> So is capstone disassembly better now with Ubuntu 20.04 or should we still 
>> revert the submodule removal?
> 
> It's better, yes.  At least it's giving me disassembly of the system registers.
> 
>> Also, if libvixl is so bad, why do we still have that in the repo?
> 
> Well, we just removed 3 other old disassemblers -- I think libvixl can be next.

I thought there was a reason for keeping vixl around ... but seems my memory 
is wrong here. After searching a little bit, I only found this here:

  https://lists.nongnu.org/archive/html/qemu-devel/2018-05/msg03416.html

So seems like there was already the idea of removing vixl four years ago... 
I'll send a patch to remove it.

  Thomas


