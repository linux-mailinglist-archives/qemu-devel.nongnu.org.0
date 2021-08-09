Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549523E42C3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:32:56 +0200 (CEST)
Received: from localhost ([::1]:46442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1eR-0007FF-EK
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD1dT-0006Kf-Qt
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD1dQ-0006hG-GY
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628501510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K6BF3LXD3SuIw1YI02Dj1lw/a9hpC+xf2JrGcnvQFX0=;
 b=A6ylz3IUFUIHHY+t1cZVT1OxE6O+HSmuyFnVotFpLNCQS0opEIcfruRQ28rcVdSfMcMKAO
 LLltIHFbSgIwr7XYHadUUQYM+i99NvbglGTPjktfKXypYB7T51vg4aCDLjxtGV19prfAyW
 6qeOmOb3EzGD4y9YJ8yxBqfOpkxEf28=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-DXSl2FleNW2fdvEaoqZTpA-1; Mon, 09 Aug 2021 05:31:49 -0400
X-MC-Unique: DXSl2FleNW2fdvEaoqZTpA-1
Received: by mail-wm1-f69.google.com with SMTP id
 k13-20020a05600c1c8db029025018ac4f7dso4420410wms.2
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K6BF3LXD3SuIw1YI02Dj1lw/a9hpC+xf2JrGcnvQFX0=;
 b=KYFfSd4HldNRRKqT2v1KDFCIXM5jwi7yHrYEOoy5ippXnzN+fmGm5dJjM1v+AxCmIv
 FQHUoSBiYyhw+dex2ABeMwDpD0XSTwKyV3oezbAj0E23FLCXOXdrhBFulIvANX+ZFlHR
 tfiR0II5qWW+PyRJb6LYdDJPh/5oJSk6vhA57eE5EIEpPK7U7tU2iJX7YbwMy68McotW
 RgYjzYIhBboQhzLycwm0Y9VMAvnjEgJQlSHA9bgZljot9ZauRkmSMcHYIEMeyQnf8uQs
 q/qPXcAl/dipuNiXezQXBseh/2FdbmxpryIWFWU8hZmTjH03SQ1wju0K/ZkoyJBRjxQo
 h3aw==
X-Gm-Message-State: AOAM530Flg0+Qr1WOhF+0jZdU3ac/K+63cqrR6neF5EbkR5JoppuSEmC
 XVazy0u57GcYhVZtgdEwR12SRkUPvy+ExXvl7+J8Cw/LlZaU4M+bTXhsvHi8ZJT9204RC2Vb38j
 f8D/yV4xc8g8Wo7s=
X-Received: by 2002:a1c:e919:: with SMTP id q25mr11109873wmc.28.1628501508214; 
 Mon, 09 Aug 2021 02:31:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1kKQfQZXajVYTeUEsPsQKUA53Z6UogYirI0AKY6j6cZUGdW29ycepyRsOGtfatPxihgkV7g==
X-Received: by 2002:a1c:e919:: with SMTP id q25mr11109852wmc.28.1628501508000; 
 Mon, 09 Aug 2021 02:31:48 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t16sm19097436wmi.13.2021.08.09.02.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 02:31:47 -0700 (PDT)
Subject: Re: [PATCH v2] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
To: Alexander Bulekov <alxndr@bu.edu>, Qiang Liu <cyruscyliu@gmail.com>
References: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
 <20210806144209.nbx4vlm6ofkza5pl@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <31b39c41-17e9-3901-66c3-622afc653121@redhat.com>
Date: Mon, 9 Aug 2021 11:31:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806144209.nbx4vlm6ofkza5pl@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Bandan Das <bsd@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/21 4:42 PM, Alexander Bulekov wrote:
> On 210804 1451, Qiang Liu wrote:
>> xlnx_dp_read allows an out-of-bounds read at its default branch because
>> of an improper index.
>>
>> According to
>> https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
>> (DP Module), registers 0x3A4/0x3A4/0x3AC are allowed.
>>
>> DP_INT_MASK     0x000003A4      32      mixed   0xFFFFF03F      Interrupt Mask Register for intrN.
>> DP_INT_EN       0x000003A8      32      mixed   0x00000000      Interrupt Enable Register.
>> DP_INT_DS       0x000003AC      32      mixed   0x00000000      Interrupt Disable Register.
>>
>> In xlnx_dp_write, when the offset is 0x3A8 and 0x3AC, the virtual device
>> will write s->core_registers[0x3A4
>>>> 2]. That is to say, the maxize of s->core_registers could be ((0x3A4
>>>> 2) + 1). However, the current size of s->core_registers is (0x3AF >>
>>>> 2), that is ((0x3A4 >> 2) + 2), which is out of the range.
>> In xlxn_dp_read, the access to offset 0x3A8 or 0x3AC will be directed to
>> the offset 0x3A8 (incorrect functionality) or 0x3AC (out-of-bounds read)
>> rather than 0x3A4.
>>
>> This patch enforces the read access to offset 0x3A8 and 0x3AC to 0x3A4,
>> but does not adjust the size of s->core_registers to avoid breaking
>> migration.
>>
>> Fixes: 58ac482a66de ("introduce xlnx-dp")
>> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> 
> Acked-by: Alexander Bulekov <alxndr@bu.edu>
> 
> If there is somehow a regression, the test won't fail in a fatal way, so
> maybe it makes sense to throw in a setenv(UBSAN_OPTIONS=halt_on_error=1)

Where? Main meson? qtests meson? setenv() in the test (but would
override preset variable)?


