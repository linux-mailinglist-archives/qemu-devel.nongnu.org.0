Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEDC20A29E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 18:07:39 +0200 (CEST)
Received: from localhost ([::1]:35714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joUPZ-0005Ww-S9
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 12:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1joTs3-0001P5-8i
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:32:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37818
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1joTrx-00044j-3D
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593099171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RxwWzBJA4LUrhcy2SpJbVhfjwP7aVecZxDgl/ITJpRk=;
 b=dD7pVIDMiJxAWE5eKJh9LXp/dWx1HhEGuOVMeU8gbn356lYqd5Je2tQEJEWz+mP8KWgOv+
 VsmKKD+IzHjp76kBwNc8dXyH2bsjwovg3ywooHQfap/qjy6ikxj7ji0bmZuB02qL6V+PYG
 hzYQLxB8QmW/xVDmprbdiHQM3E1fVj0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-41yhNcwzMBSAVVZFAlFNOQ-1; Thu, 25 Jun 2020 11:32:40 -0400
X-MC-Unique: 41yhNcwzMBSAVVZFAlFNOQ-1
Received: by mail-wr1-f72.google.com with SMTP id j16so1636484wrw.3
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 08:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RxwWzBJA4LUrhcy2SpJbVhfjwP7aVecZxDgl/ITJpRk=;
 b=FayaBp0PkKP+69FsPXlgBuzp14h1FFrtAvudEM2zMsaNqNZBCQLxYfRjKjqsJMN+QO
 rd9TvZD6Y4ZwKnHVCN8m+ocyEgktBx9PcYOuzIPTXZgM2TWY5c7/JibZ2tTuksTFtaQ8
 Qq2MX8SbExFgAQIHhHPQQBtVtSzXYj/p3bkLWbDouW0F2KeBKF+oHsMribG2oU4W3bh/
 ionmZO1S1APpw0w8CwwMf+CgDo3eE9dU9rPyWp19v2bI1LHKFUobVLUcDNDX0CBbp3wv
 fkONIjKeP3IJEnKE2Z6knqhwahyW3O6thVaMrBeT4OlgKUBsUGw1vRkjZa1BshVuq1x2
 5ipQ==
X-Gm-Message-State: AOAM531L3OwhBFo9MW3cqfTC5/3O4LD3ms1O9/eydHQ8IwCKpjDb9Jje
 TJOKDcv2tfeOMrX3CP8Dt4bkzt5OBMsjwEqjhWrmvjXOiUONwUUBMQUCwWYKRXv/Ahi5Udiuyun
 V2MPXPEOke9Mm4KQ=
X-Received: by 2002:a1c:1984:: with SMTP id 126mr3696788wmz.147.1593099159745; 
 Thu, 25 Jun 2020 08:32:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/80sTbh9SCDX8o3qpCZPLbzl+bZ3ahKpa5yqMQ9RAkOodf21T4qTpX9qRW1kUr6k3s0+mkA==
X-Received: by 2002:a1c:1984:: with SMTP id 126mr3696769wmz.147.1593099159570; 
 Thu, 25 Jun 2020 08:32:39 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id x13sm33701963wre.83.2020.06.25.08.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2020 08:32:38 -0700 (PDT)
Subject: Re: [PATCH v2 1/7] configure: Create symbolic links for pc-bios/*.elf
 files
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <1592807604-20805-1-git-send-email-bmeng.cn@gmail.com>
 <1592807604-20805-2-git-send-email-bmeng.cn@gmail.com>
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
Message-ID: <fcc39a02-ab7d-37eb-6774-cd14117d301b@redhat.com>
Date: Thu, 25 Jun 2020 17:32:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1592807604-20805-2-git-send-email-bmeng.cn@gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 01:47:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/20 8:33 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Now we need to ship the OpenSBI fw_jump.elf image for the
> RISC-V Spike machine,

Oh, does that mean we can now use the tests Chih-Min Chao sent
almost 1 year ago? See:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg631078.html

> it requires us to create symbolic
> links for pc-bios/*.elf files.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - new patch: configure: Create symbolic links for pc-bios/*.elf files
> 
>  configure | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configure b/configure
> index ba88fd1..4a1514a 100755
> --- a/configure
> +++ b/configure
> @@ -8399,6 +8399,7 @@ LINKS="$LINKS tests/qemu-iotests/check"
>  LINKS="$LINKS python"
>  for bios_file in \
>      $source_path/pc-bios/*.bin \
> +    $source_path/pc-bios/*.elf \
>      $source_path/pc-bios/*.lid \
>      $source_path/pc-bios/*.rom \
>      $source_path/pc-bios/*.dtb \
> 


