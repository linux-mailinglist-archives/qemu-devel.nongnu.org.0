Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE76479A94
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 12:29:24 +0100 (CET)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myXtz-0001yM-6d
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 06:29:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myXrI-0000lE-LK
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 06:26:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myXrF-0002dc-76
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 06:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639826791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqYzEv8sjm1chLmdzkY6W+PLu2mXRaztXkZrhm+3WS4=;
 b=S5R7G1X3NFY8P4VlgbycXIkqEZDoE5PKUEq1Re3xJ+2hyQEKKZcBpZBTm64eK+6m1mQX65
 IvuGJnyMeTvoIBrdUJlxImz06+Qk1ZZpHrdNVHKp+TaNAl4othUenax4aEQ2YjG4vGUnOw
 tFSsGkMU1+YIqlUHlGl6GLmX8G9gijY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-RC-7LDYwMjCV7mL4bdoxCg-1; Sat, 18 Dec 2021 06:26:30 -0500
X-MC-Unique: RC-7LDYwMjCV7mL4bdoxCg-1
Received: by mail-wr1-f71.google.com with SMTP id
 c16-20020adfa310000000b001a2349890e1so1403479wrb.0
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 03:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NqYzEv8sjm1chLmdzkY6W+PLu2mXRaztXkZrhm+3WS4=;
 b=yZdsZL2qIqi0u1EXoaTxLnJdRhcdGJFhPrI0MgIy/RrHaNqrm1boxlPSldthGxpa6c
 t2kGk/6x8X98o9SMHCw3eVgh0sHxwwxuJ+9i/yxKWEeMVvN9iGuqH6dGH3hXIvfPfcVL
 UdNO8dnBEOnstBZ3UU7DEWY36j6VPX2O0iSDLKXDqBOUtFZDhMnQa9nthcuWj1ycOy2c
 XFNryWzQmxEh2gjGQJbgmJIQK3UNk5vWdPvak0hoNIm3NxCd8WybpUHv6QrtJ1m7HtSO
 X6V2kEPeDk/yI24o35aDE/G9h7LKFXJ7xRcaPvynzW9wqQbcSXkGipWA/pxwqwe6b6xh
 eVIg==
X-Gm-Message-State: AOAM531f0wale/iv9WTKVPlsCykmMPm+x2Q+h1fUf2F94l61NG3WZmEH
 G9p29wgRSmgBRcgfMpDV9znIe0QHcK7lOOYiUnWGY7NHieOyfjFRHz2atGpVKnYp+GjgJUEemkI
 82nTOaA3q5sM0lBI=
X-Received: by 2002:a1c:f217:: with SMTP id s23mr13204826wmc.70.1639826789534; 
 Sat, 18 Dec 2021 03:26:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFLerOtqUQV63HufOby/PkDlzSj6b0zysU+uc4iikWYSY4i0qc4iY73y5f3QGrs/MdqdjSvQ==
X-Received: by 2002:a1c:f217:: with SMTP id s23mr13204807wmc.70.1639826789361; 
 Sat, 18 Dec 2021 03:26:29 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m3sm3577798wms.25.2021.12.18.03.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Dec 2021 03:26:28 -0800 (PST)
Message-ID: <266f9231-3925-dba2-61f1-d5172e2e9fe8@redhat.com>
Date: Sat, 18 Dec 2021 12:26:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH v3 3/3] softmmu/physmem: Introduce MemTxAttrs::memory
 field and MEMTX_BUS_ERROR
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211215182421.418374-1-philmd@redhat.com>
 <20211215182421.418374-4-philmd@redhat.com>
 <CAFEAcA_UKFHT=PbwNtyqV4G2Vdw7LVUjUj_X_DZ5Kk6=yF+EBg@mail.gmail.com>
 <f07f6b9c-ac81-62a1-be71-6c82267bdaf7@redhat.com>
 <65d60871-31dc-1e59-3cb4-34a27e7af339@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <65d60871-31dc-1e59-3cb4-34a27e7af339@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/21 03:07, Richard Henderson wrote:
> On 12/17/21 3:18 PM, Philippe Mathieu-Daudé wrote:
>>>>   #define MEMTX_OK 0
>>>>   #define MEMTX_ERROR             (1U << 0) /* device returned an
>>>> error */
>>>>   #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that
>>>> address */
>>>> +#define MEMTX_BUS_ERROR         (1U << 2) /* bus returned an error */
>>>
>>> This is kind of odd naming, because MEMTX_DECODE_ERROR already means
>>> "bus/interconnect returned an error" and it generally translates
>>> into what at the OS level gets called a "bus error"...
>>
>> MEMTX_DECODE_ERROR is "nothing at that address". We want a name
>> for "there is something, but you don't have access to it".
>> Maybe MEMTX_ILLEGAL_ERROR?
> 
> ILLEGAL doesn't convey much.  MEMTX_ACCESS_ERROR?

OK, such:

  #define MEMTX_ACCESS_ERROR      (1U << 2) /* access denied */

alternatively MEMTX_PERM_ERROR.


