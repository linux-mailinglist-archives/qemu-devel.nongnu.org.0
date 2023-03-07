Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB17F6ADDF8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:51:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVqB-0000ca-5C; Tue, 07 Mar 2023 06:50:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZVq8-0000VF-CN
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:50:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZVq6-0001sh-Rs
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678189840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=egpwPR1abAHPuigSthHUn9A7XVCKflsAsDMcBDhaiCo=;
 b=OGp1DiJiYtZhp0HjJsekJ0wpAcqe6YaRyCEXZ0q6EsW+4pOU0eIJvTswgi8iJqPjK0/O8n
 69RT7Dn+0bJl8AFiVTX/3nJFxsZMWocCvh1f8RsDdDnbva+E45Anp/Ry9M5eSmhoXO8Ogg
 N0vqYjnWQ52vPWeR8D6GDebytfTBT/c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-Tvns0B0LP86QQWHuxQm2GA-1; Tue, 07 Mar 2023 06:50:37 -0500
X-MC-Unique: Tvns0B0LP86QQWHuxQm2GA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k36-20020a05600c1ca400b003eac86e4387so8143871wms.8
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:50:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678189836;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=egpwPR1abAHPuigSthHUn9A7XVCKflsAsDMcBDhaiCo=;
 b=tcOcuoRlNDL0hVKcu36Z7WdO5H+p8oGabEQ15lr+8LqOZ9fRSd56SSiHlwyZeqYDKD
 N/Sa0zwlyH/+FQ9yxDOwnaykMptDvOrdA0DWIUDc4ulWXocTY0eX2yb7gSCfIR4iFfNQ
 pSH2z9aCQnVbKVAZruu7AJVHlkpAX8v84G2PJReZkSdYKafNJ5RUU/fFNu9yWobrmcyt
 6OIk+pQ8j9pqkBou9yJc4gUK4oGoARq1ggX9p6nIW/nLZlTQx4G+3I9R4iqPjL66oFwQ
 D/pBrwLl3L2c1x9buwMPKeEVQF9VMLzqUOYB7I7Em123NtNfyT+ljmFuIGjOX3R5ofAc
 J36w==
X-Gm-Message-State: AO0yUKXULWkFItDTuJaUmG5EmbSXy77bV6uVc902MThsRa6ajR1Rq4xX
 ieafll/BWgWIRfc9YOa8ME2vSs7T8H3fGs8/eEkI/auJZDya7sF0t/EAHq39VPGg0YeppY1zJzy
 WPGVevkHXpzwB3aI=
X-Received: by 2002:a05:600c:4f92:b0:3ea:f6c4:5f28 with SMTP id
 n18-20020a05600c4f9200b003eaf6c45f28mr12538236wmq.36.1678189836496; 
 Tue, 07 Mar 2023 03:50:36 -0800 (PST)
X-Google-Smtp-Source: AK7set9HQ/2ZE9lelXXKGHK3KADEYvjVXf+ci2StyCVFrN3dB+U6B9FTkJvX7CjnkMzwACr01QH9Rg==
X-Received: by 2002:a05:600c:4f92:b0:3ea:f6c4:5f28 with SMTP id
 n18-20020a05600c4f9200b003eaf6c45f28mr12538222wmq.36.1678189836225; 
 Tue, 07 Mar 2023 03:50:36 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-96.web.vodafone.de.
 [109.43.177.96]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05600c00cc00b003e1202744f2sm16290200wmm.31.2023.03.07.03.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 03:50:35 -0800 (PST)
Message-ID: <b7b3a6a7-bb03-3da6-8a16-ac12c1e54980@redhat.com>
Date: Tue, 7 Mar 2023 12:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 00/16] Final tests, s390x and misc updates before the soft
 freeze
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230306133002.418421-1-thuth@redhat.com>
 <CAFEAcA_tM1gxRonaNNzUpBxGJ+dt=D3r9MsT-4SXhXDKDK422w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA_tM1gxRonaNNzUpBxGJ+dt=D3r9MsT-4SXhXDKDK422w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/03/2023 10.57, Peter Maydell wrote:
> On Mon, 6 Mar 2023 at 13:30, Thomas Huth <thuth@redhat.com> wrote:
>>
>>   Hi Peter!
>>
>> The following changes since commit 2946e1af2704bf6584f57d4e3aec49d1d5f3ecc0:
>>
>>    configure: Disable thread-safety warnings on macOS (2023-03-04 14:03:46 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/thuth/qemu.git tags/pull-request-2023-03-06
>>
>> for you to fetch changes up to cb161e95334dd9ba6835dbe8a8a60a2a87ddfe7e:
>>
>>    pc-bios/s390-ccw: Update s390-ccw.img with the list-directed IPL fix (2023-03-06 12:05:10 +0100)
>>
>> ----------------------------------------------------------------
>> * Refine the distro support policy
>> * Deprecate 32-bit x86 and arm hosts for system emulation
>> * Check bison version to be >= 3.0
>> * Compile vnc test only if vnc is really enabled
>> * Check some configs in docs/config/ via the readconfig-test
>> * s390x: Add support for list-directed IPL from ECKD DASD
>>
>> ----------------------------------------------------------------
> 
> On the centost-stream-8 job:
> https://gitlab.com/qemu-project/qemu/-/jobs/3883361977
> 
> the readconfig test falls over because it assumes the existence
> of the 'user' network backend

Ok, thanks, I'll fix it and send a v2...

  Thomas



