Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948226E5E6A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 12:16:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poiNG-0006rM-Bf; Tue, 18 Apr 2023 06:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poiNE-0006qf-RE
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 06:15:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poiNC-0001WO-4b
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 06:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681812940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yzOfbIO5bOqjfu9Ib99/kh3hbnxQwZKu2ebFntng39Q=;
 b=R7PysgfvuBsQhkqKeJLZGpdkyiRZaXT9Srxbuu4QxHBUGRPS9rVZVXLTGdhA8+akennPQW
 lNbW6C5lEhoom4Io+Sz4nTfY2lbbRTmYXITf55BaA3aFqrjDHgHxcWPc5gkRTQ/NNkPWED
 +ZESt65O7lGNi6ld02ZQMle7aNFez3s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-180aaZtkNey4hJLgMwZvwA-1; Tue, 18 Apr 2023 06:15:39 -0400
X-MC-Unique: 180aaZtkNey4hJLgMwZvwA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f080f53c49so12157925e9.0
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 03:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681812938; x=1684404938;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yzOfbIO5bOqjfu9Ib99/kh3hbnxQwZKu2ebFntng39Q=;
 b=A9t0wROJ812TuB9zG+8an293VrxH3lqxaBp/Yv9vZs56s3XZc3R2YkBdUhbShyxq1w
 OwFraxvT9tvXsNXs1+99wlYTbzT6eYT5c5sc1JA96rOiXuQjNVuOgW5ivr8UpYDCUwk4
 6zvUt+wH1hHF3UBUhQqJ1bEEYO2dtoGzGuzZ1Khc1RigsYVP7C8kpb3BoZB/LgoumGQB
 ovK1AI51KQkaT2Vh2Bwe0dz93vE/YP7La7OD/4GBo2O5o8/ghOP57qR+/Jw3cIpcAlmh
 l1AwhZ4Hjn3knpemtbkVM9GeK1GonwFw9xNJdWgdyoVbnvuJovXjL2TsdO8R8OcGTfl+
 gatA==
X-Gm-Message-State: AAQBX9fM10/qo1srYWDA/7gsVtXxq6+69SSl7b+9EYYuJobBsuzrXdSJ
 I2V1dLfINCWFwUd45MWVj/GmyxjbX7E9Ul06mLLEdOOpEnlliFmDbe02szT6RB4qxVXuP7Dgzw9
 WRa10PCXTNBu/76o=
X-Received: by 2002:adf:eb91:0:b0:2fc:b3be:7436 with SMTP id
 t17-20020adfeb91000000b002fcb3be7436mr1443474wrn.25.1681812938551; 
 Tue, 18 Apr 2023 03:15:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZJEyY6xoKQeFhLWcqB9Jp1d7Fo8Yyu1vap0e108ePZWOzD5VVWtvbm8h8dxiw3fa78qvUVlw==
X-Received: by 2002:adf:eb91:0:b0:2fc:b3be:7436 with SMTP id
 t17-20020adfeb91000000b002fcb3be7436mr1443445wrn.25.1681812938278; 
 Tue, 18 Apr 2023 03:15:38 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-59.web.vodafone.de.
 [109.43.176.59]) by smtp.gmail.com with ESMTPSA id
 d2-20020adffbc2000000b002fddcb73162sm909475wrs.71.2023.04.18.03.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 03:15:37 -0700 (PDT)
Message-ID: <80fce082-b468-2c9b-b370-a9de349d0860@redhat.com>
Date: Tue, 18 Apr 2023 12:15:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v19 01/21] s390x/cpu topology: add s390 specifics to CPU
 topology
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230403162905.17703-1-pmorel@linux.ibm.com>
 <20230403162905.17703-2-pmorel@linux.ibm.com>
 <e96e60dade206cb970b55bfc9d2a77643bd14d98.camel@linux.ibm.com>
 <d7a0263f-4b27-387d-bf6c-fde71df3feb4@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <d7a0263f-4b27-387d-bf6c-fde71df3feb4@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 18/04/2023 12.01, Pierre Morel wrote:
> 
> On 4/18/23 10:53, Nina Schoetterl-Glausch wrote:
>> On Mon, 2023-04-03 at 18:28 +0200, Pierre Morel wrote:
>>> S390 adds two new SMP levels, drawers and books to the CPU
>>> topology.
>>> The S390 CPU have specific topology features like dedication
>>> and entitlement to give to the guest indications on the host
>>> vCPUs scheduling and help the guest take the best decisions
>>> on the scheduling of threads on the vCPUs.
>>>
>>> Let us provide the SMP properties with books and drawers levels
>>> and S390 CPU with dedication and entitlement,
>>>
>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   MAINTAINERS                     |  5 ++++
>>>   qapi/machine-common.json        | 22 ++++++++++++++
>>>   qapi/machine-target.json        | 12 ++++++++
>>>   qapi/machine.json               | 17 +++++++++--
>>>   include/hw/boards.h             | 10 ++++++-
>>>   include/hw/s390x/cpu-topology.h | 15 ++++++++++
>> Is hw/s390x the right path for cpu-topology?
>> I haven't understood the difference between hw/s390x and target/s390x
>> but target/s390x feels more correct, I could be mistaken though.
> 
> AFAIK target/s390 is for CPU emulation code while hw/s390 is for other 
> emulation.
> 
> So it depends how we classify the CPU topology, it is related to CPU but it 
> is no emulation.

Normally I'd say target/ is for everything what happens within a CPU chip, 
and hw/ is for everything that happens outside of a CPU chip, i.e. machine 
definitions and other devices.
Now CPU topology is borderline - drawers and books are rather a concept of 
the machine and not of the CPU, but things like dies and threads rather 
happen within a CPU chip.
So I don't mind too much either way, but I think it's certainly ok to keep 
it in hw/s390x/ if you prefer that.

  Thomas


