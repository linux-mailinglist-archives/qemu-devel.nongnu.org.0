Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B250284FB8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 18:20:35 +0200 (CEST)
Received: from localhost ([::1]:37074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPpha-0006Qx-86
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 12:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kPpWC-0007Xq-KY
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 12:08:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kPpWA-0004AI-0b
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 12:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602000524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uQPOXx61gGd7CQpz+C9b8oiPpf7D4x7HUE8FjDRCoV0=;
 b=c4B8kJ9Vo9L1U8OGv7M83r/YtklnHGLs6IMPMdUktwwuHsabXnvR7oTkjRq0+Kx+dbjTsK
 55jLaaUe0NN+5f0zpiB5t7266RwosI2jQQYlvHlSnMR686TBnh29ZfPecWvtZAuhRj1ear
 9byhJ7efPjhglgZDVtZCWA7Ff4zgix4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-AylCzjCyPeyadu2_ec9KhQ-1; Tue, 06 Oct 2020 12:08:41 -0400
X-MC-Unique: AylCzjCyPeyadu2_ec9KhQ-1
Received: by mail-wm1-f72.google.com with SMTP id c204so1292382wmd.5
 for <qemu-devel@nongnu.org>; Tue, 06 Oct 2020 09:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=uQPOXx61gGd7CQpz+C9b8oiPpf7D4x7HUE8FjDRCoV0=;
 b=ibE2aMGgilRcYIOnZ0/DUu+xSk+HepBQUZtwXNxzpRAgBf9o8KbzviU78xnosnNTKs
 zbUMtlyYbgk2r319skTYHcSMnEKhn4nKakfeaekzDwkLMhcmUZk7QgksgFUoqJPkqlg0
 W01qG4Scih2/UMtFN7Fe4/24udNVfAf99DzNqyCPtAyDcAuV/v1j6RyiqFhBnQxex6Lr
 OI4GePXumMvq4H7wUGCP4PsfA1sDd/WpRdftDBDyz7HrMyYRWHJyXBlaXTt0D0YyZmNV
 96J9LK/HBcNae5UcyTdiN4lUCCUkB/PNIAFUTAUWPy5qnadIulKo2jxPu8L87JbUCdyo
 Y8UQ==
X-Gm-Message-State: AOAM532aoEHJL65ThSq9bnUrM/VGvbgtNDWE2MCBkinScPyfpcG8IrCY
 3PLiLa5S8iUdNsFbEm0Qg2r/7BN90BbDuUZgkmL9ZTyiINx5VvP+wcSDP9ffkeagMgOkINQ1nUH
 72Ye3V8VsSM6ztyw=
X-Received: by 2002:a5d:6149:: with SMTP id y9mr5920296wrt.352.1602000520189; 
 Tue, 06 Oct 2020 09:08:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyT8u/iwLT8D0q/xsygDeMdGxrfI4xs6GU+Wn8gRrbS+ML+/DyyqSNE55BPwlFW1FyuIGsnJA==
X-Received: by 2002:a5d:6149:: with SMTP id y9mr5920275wrt.352.1602000520004; 
 Tue, 06 Oct 2020 09:08:40 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id j206sm5208258wmj.5.2020.10.06.09.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 09:08:39 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] hw/nvram: Always register
 FW_CFG_DATA_GENERATOR_INTERFACE
To: Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201006153636.2383248-1-philmd@redhat.com>
 <20201006153636.2383248-2-philmd@redhat.com>
 <134bbd15-c53c-7686-a36d-f02a81b56e0d@linaro.org>
 <e7348766-7210-23f8-ab4e-b5985c279909@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <1df30292-4bff-eb71-f8a6-afa05c08ba11@redhat.com>
Date: Tue, 6 Oct 2020 18:08:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e7348766-7210-23f8-ab4e-b5985c279909@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/20 6:04 PM, Laszlo Ersek wrote:
> On 10/06/20 17:51, Richard Henderson wrote:
>> On 10/6/20 10:36 AM, Philippe Mathieu-Daudé wrote:
>>> +++ b/hw/nvram/fw_cfg-interface.c
>>> @@ -0,0 +1,15 @@
>>> +#include "qemu/osdep.h"
>>> +#include "hw/nvram/fw_cfg.h"
>>
>> License boilerplate missing.
>>
>> r~
>>
> 
> Hrmpf, so easy to forget about that, especially in review :/

Although easily scriptable if we consider SPDX identifiers...

> Thanks for
> catching it.
> 
> Laszlo
> 


