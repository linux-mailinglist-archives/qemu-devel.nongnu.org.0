Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCA0453593
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 16:18:18 +0100 (CET)
Received: from localhost ([::1]:59222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0Dx-0006ay-7e
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 10:18:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn0Bf-0004a7-EW
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:15:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn0Be-0002A9-2J
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637075753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HzByXK567zxPHXug0OWPXyifVYAyN398e+g9/g3dmt0=;
 b=d0uLzx89rZ7+uNZP/ZcKx4oNmrVwFeyVlhYpP7LVQiTHYoIV61myND5dqtBL7rJDIzPMTG
 O8476Jaiwm6WvZV1RCr08MrqhgcNk3H8WPqgX+8gw9ZCwW/akXNZzB78oPAZwDEiOiFi+t
 cKvguk/upDvTp8CFinxyCTEUMqwEf/s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-qXfpfhvcMme3x7TEHubjhg-1; Tue, 16 Nov 2021 10:15:52 -0500
X-MC-Unique: qXfpfhvcMme3x7TEHubjhg-1
Received: by mail-wr1-f70.google.com with SMTP id
 p3-20020a056000018300b00186b195d4ddso4556642wrx.15
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 07:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HzByXK567zxPHXug0OWPXyifVYAyN398e+g9/g3dmt0=;
 b=1oYlouuHStu6Eb2hD9iKKzYnzJMyt14CTspqKy2oOqcVKiw85xlHEwuPJ+nqjkO1CD
 c6UiyEODTU+6s57MkjzQZDoGC3VvLwaoWVy9Qvo1DlF7OoIfDTwj9B/FQ42Yg7iRMn2k
 jiB0RjRU+BAMGl/UDVQL0pmE14639LACkiuaknoCcr3c4gS1QYunTyVsMvHj3fOoiCkd
 ifG1WQHFvJQwFgx8gNSOVjEYo+SBt3n2YWfCN1vM2LCzPHiW9ABvQqY35bpb9z3DfysJ
 eN1P9BZ6/mhzBOgmQ8CmBZVkgC7NNSH4LCfhyhjfi/2NRS4CkxQcNjglw8dtfeDMmCnX
 qCMA==
X-Gm-Message-State: AOAM530Xn652/yxtOqI5+kYYi19Aym/OA4FZ+nRIOCSGvDHnMyWlj3Ff
 2TP0n07oRGPLyIx68CVdjYMn8gJ9hvuIpyk4BzNSAK/riYXHrxPP0hsXHFPeaxktQcSeJBi6cfu
 fENApgNfHop0uG5s=
X-Received: by 2002:a5d:674c:: with SMTP id l12mr9985088wrw.439.1637075751008; 
 Tue, 16 Nov 2021 07:15:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7TV9ti1uFGA1UIYHdmjaS47OcvFXGRk0DElzuEPwrtytIVMdXixJjbhtBPfld2jVUbKNBrg==
X-Received: by 2002:a5d:674c:: with SMTP id l12mr9985050wrw.439.1637075750872; 
 Tue, 16 Nov 2021 07:15:50 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z7sm2640386wmi.33.2021.11.16.07.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 07:15:49 -0800 (PST)
Message-ID: <75e68ceb-17ca-5efb-9373-cf5f256e81df@redhat.com>
Date: Tue, 16 Nov 2021 16:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-7.0 v4 05/11] tests/unit/test-smp-parse: Split the
 'generic' test in valid / invalid
To: Richard Henderson <richard.henderson@linaro.org>,
 "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-devel@nongnu.org
References: <20211115145900.2531865-1-philmd@redhat.com>
 <20211115145900.2531865-6-philmd@redhat.com>
 <0d3fa53c-ae1f-abfe-1418-46f96ca75015@huawei.com>
 <a1cfcb19-d493-719f-3e34-01b7e41dc2dd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <a1cfcb19-d493-719f-3e34-01b7e41dc2dd@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 15:22, Richard Henderson wrote:
> On 11/16/21 3:07 PM, wangyanan (Y) wrote:
>>> +    int i;
>>> +
>>> +
>> Ah, there is an extra empty line which should be deleted.
> 
> I noticed that too, but it gets deleted in patch 7, so I let it be.  ;-)

Oops sorry, I'll clean that once v7.0 is released.


