Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B95214730
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jul 2020 18:03:45 +0200 (CEST)
Received: from localhost ([::1]:37502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrkdk-0005RG-9Q
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 12:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkOP-0007xa-M1
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 11:47:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26656
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkON-0000yu-1q
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 11:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xzmpYsBISGOvG5zZYT272uJF1IEN1usCaslKq9c+AuI=;
 b=cZZ9e/EOfTiskKmc4IhCeMcI3tFtfgDTUyaYRAi8KICQFfJVlm5Vh78kDQkvSmHTlzJ61i
 bSIAWsf5PK0BiQjiwCwqIXtdbnsBoedsxV+ioJtvKsi+ukac/cN0ep5ruWV+uCcNll3QG5
 hX6dTY29iwFcSBQWOnsTksEFZ2kgq50=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-3khtX-r3OwCfpgylYTjd2Q-1; Sat, 04 Jul 2020 11:47:48 -0400
X-MC-Unique: 3khtX-r3OwCfpgylYTjd2Q-1
Received: by mail-wm1-f70.google.com with SMTP id c124so7405548wme.0
 for <qemu-devel@nongnu.org>; Sat, 04 Jul 2020 08:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xzmpYsBISGOvG5zZYT272uJF1IEN1usCaslKq9c+AuI=;
 b=FF2Bsyp6FwDfWHNzrSkuBDyTaIcYt7b/lPMCYJZfT7gG7W99+Y+1ytJog6+/M2gvF6
 cG8SLhoYj68gwYNUhnSdBwt7U7+ZlUg306AXLVAZAnpBnp+BklNU4iv6iBPXS/19LyJu
 jm9n/s2QBCZKtcOB7krMKdGkdCZtZNTq6/YroCdiIM7mwseJhqTkSVXeopjC3KGSpYAx
 nO6Kgyyg7KwpTU+5CDz9AO8+YWc8SpWabJVbkKlMZ5AoDVhGcTRiHfWmgvjK7RrZTnKV
 Eyi1UE3YKDBNIiZMS36rgXS58eSBEIX4j04hQlItDupBLOme5h8cpjps45GY2f24Kluc
 EjCQ==
X-Gm-Message-State: AOAM532AkrNVRQCS6P7QS8OyhtaLpDJU6KaO2Ngy2i7jyqOgVq0vRayU
 xLgo9fJCO0gOtf/z+PIaBaNERxnjq+0kgHKSxS+wmR4ackO/Dlum9YGZsi7fIfnwkwOmunGQvAa
 u3plbCFzCH/OxqfM=
X-Received: by 2002:a1c:f203:: with SMTP id s3mr40227354wmc.126.1593877665681; 
 Sat, 04 Jul 2020 08:47:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz78ud83YSbMBrdOfGtqKWm90Fpba099F5FbVXmj543pUjapMrvaBTm1OpHgah3HnCpSY3BvQ==
X-Received: by 2002:a1c:f203:: with SMTP id s3mr40227327wmc.126.1593877665497; 
 Sat, 04 Jul 2020 08:47:45 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id d28sm18697107wrc.50.2020.07.04.08.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jul 2020 08:47:44 -0700 (PDT)
Subject: Re: [RFC PATCH v2 18/23] hw/openrisc/cputimer: Emit warning when old
 code is used
To: qemu-devel@nongnu.org
References: <20200704153908.12118-1-philmd@redhat.com>
 <20200704153908.12118-19-philmd@redhat.com>
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
Message-ID: <8cd142f9-9a31-cb42-8021-f47a47054f6d@redhat.com>
Date: Sat, 4 Jul 2020 17:47:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200704153908.12118-19-philmd@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/openrisc/cputimer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
> index 93268815d8..60f2c9667f 100644
> --- a/hw/openrisc/cputimer.c
> +++ b/hw/openrisc/cputimer.c
> @@ -22,6 +22,7 @@
>  #include "cpu.h"
>  #include "migration/vmstate.h"
>  #include "qemu/timer.h"
> +#include "hw/qdev-deprecated.h"
>  
>  #define TIMER_PERIOD 50 /* 50 ns period for 20 MHz timer */
>  
> @@ -135,6 +136,8 @@ static const VMStateDescription vmstate_or1k_timer = {
>  
>  void cpu_openrisc_clock_init(OpenRISCCPU *cpu)
>  {
> +    qdev_warn_deprecated_function_used();

Please disregard this patch, I forgot to address Paolo's comment:
https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg02202.html

> +
>      cpu->env.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &openrisc_timer_cb, cpu);
>      cpu->env.ttmr = 0x00000000;
>  
> 


