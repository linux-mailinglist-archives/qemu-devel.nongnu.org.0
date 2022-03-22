Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31504E3C8C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 11:37:38 +0100 (CET)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbtR-0007A0-Ko
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 06:37:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWbrk-0005mV-BS
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:35:52 -0400
Received: from [2a00:1450:4864:20::32a] (port=41654
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWbrh-0001PA-Tz
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:35:51 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so1192552wme.0
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 03:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=I7u6OHzn6ArybvdyEP24aLrfPdmncWRCQufD64eCdRs=;
 b=NybJZX5DpDJp4vRaQ/xEO3V/Zxcout8c6LbCCcOyKPNwD+XUdqPoz3ixfordHBXBap
 n+p0kPu0yKBtfWm5A8AzzkrOgvsq7l9+JMwngJ2iMfMKpnsoPy4lxtpnAGwM+XyrXBDm
 YLPzxqvE1zXfbm1aQUC9X/LRntGGHs6NTSbet+IkoUBITy93s6Epgtq5TisYiFVy3pb5
 2NaEuyl1bedXTXRAAGZDFWIZ3Hd55OxYTEYZY1CNcyGwsOx8Otvl+pS/1BxHp16MRxzG
 GAz4tDFnsMcckb3mBVRUVyT+DsKffpRhVaBVOvhdVTMJtnUVqffYHGA3f1CYvybl6w19
 gpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I7u6OHzn6ArybvdyEP24aLrfPdmncWRCQufD64eCdRs=;
 b=xzfcwcoAE1h3ZtfvsE4cx7XBe52geHZV3IiMHn28cgx4Wld3xe3AG8K5gSebr/iPkl
 sy3Nm4p2a7S8YkLfeND2BK0JVWfhNpiDr5YsP85TYtud0VmnO2i4sLScUxjLXX/cT5O5
 jUgASROpwV8hfW1UA9na3jkAFn9AdVtbeuf2Yqnwqswa70du7A4G7ti1vmpNqXKcp3Nf
 bZfpr+bg0/UV/KyppxiYCun6Hj8/ILTSKa5gdA2sZhlFIRTdydLYgvyBKaM/6oE0J5Yp
 v2IxJSbUhaKYhQoXl+gBEBccGmPr2DLkRddssi5vhPrbCOQ6kYvMIpKsjiVg3wOVqsy0
 iupQ==
X-Gm-Message-State: AOAM531HSaKSrliLD7SOVmFqra29CBWdaj6fC0Kld35j99T3lUywL1WW
 5IOgBHIPTsAdVGrqfFrK2Ps=
X-Google-Smtp-Source: ABdhPJwm3WiaujVnpBn+27exlhrfrMc6vMZx2A3MPHDpAySeEE24jR7AdeKkUbjaZshqx4sVRSKhcA==
X-Received: by 2002:a5d:4887:0:b0:203:dde4:c770 with SMTP id
 g7-20020a5d4887000000b00203dde4c770mr21186788wrq.20.1647945346993; 
 Tue, 22 Mar 2022 03:35:46 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c3b8700b0038cb890e34bsm1180789wms.4.2022.03.22.03.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 03:35:46 -0700 (PDT)
Message-ID: <4a3f6515-6c79-aeb4-1f31-ec568091ac91@gmail.com>
Date: Tue, 22 Mar 2022 11:35:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/2] qemu-binfmt-conf.sh: Extend magic to distinguish
 mips o32 and n32 ABI
Content-Language: en-US
To: =?UTF-8?Q?Andreas_K=2e_H=c3=bcttel?= <dilfridge@gentoo.org>,
 qemu-devel@nongnu.org
References: <20220305000624.1498181-1-dilfridge@gentoo.org>
 <20220314213355.2477-1-dilfridge@gentoo.org>
 <20220314213355.2477-3-dilfridge@gentoo.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220314213355.2477-3-dilfridge@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/3/22 22:33, Andreas K. Hüttel wrote:
> This information is given by the EF_MIPS_ABI2 (0x20) bit in the
> e_flags field of the ELF header (a 4-byte value at offset 0x24 for
> the here applicable ELFCLASS32).
> 
> See-also: https://www.mail-archive.com/qemu-devel@nongnu.org/msg732572.html

This is commit ace3d65459 ("linux-user: detect mismatched ELF ABI
in qemu-mips[n32][el]").

> Signed-off-by: Andreas K. Hüttel <dilfridge@gentoo.org>
> ---
>   scripts/qemu-binfmt-conf.sh | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> index fc2f856800..5f44346166 100755
> --- a/scripts/qemu-binfmt-conf.sh
> +++ b/scripts/qemu-binfmt-conf.sh
> @@ -60,20 +60,20 @@ m68k_family=m68k
>   
>   # FIXME: We could use the other endianness on a MIPS host.
>   
> -mips_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08'
> -mips_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xfe\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
> +mips_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
> +mips_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xfe\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20'
>   mips_family=mips
>   
> -mipsel_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00'
> -mipsel_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xfe\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
> +mipsel_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
> +mipsel_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xfe\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00'
>   mipsel_family=mips
>   
> -mipsn32_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08'
> -mipsn32_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
> +mipsn32_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20'
> +mipsn32_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xfe\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20'
>   mipsn32_family=mips
>   
> -mipsn32el_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00'
> -mipsn32el_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
> +mipsn32el_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00'
> +mipsn32el_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xfe\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00'
>   mipsn32el_family=mips
>   
>   mips64_magic='\x7fELF\x02\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08'


