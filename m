Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06098456C4E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:27:49 +0100 (CET)
Received: from localhost ([::1]:50534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0BQ-00023D-5V
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:27:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo028-0007Wp-RB
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:18:13 -0500
Received: from [2a00:1450:4864:20::32b] (port=52177
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo026-00045C-U9
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:18:12 -0500
Received: by mail-wm1-x32b.google.com with SMTP id 137so4307608wma.1
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 01:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/9Xr+lNW04aBuSVnBKJi6KBxBTf60eHiW3hO+X5TGfw=;
 b=oBMrE5/4cSari04F5IMTJkaNTGiJBXfAV24M4EThE39m0NMJJDoMi+XWfbA0qVmh1S
 0COg9efA7UW8+u76FhChraED5Y/fhrH4f8yDhLIdmiCzJGq4HU7iAqDoO9BNNsoqA2tE
 qvxWSSZ7Sd/eaPQlW9P13VnaGCj/wi/I7mdXB7wZP7RcyTp7cs84vjSbzpnVmPdCFXvh
 FWHiTUB/sxVN1QLz3sbR9ORgRRs6uI61sshMau/CGuCw1hh7LsdWHIteQUtfY6mA+Xpw
 Aohd7nlZ0mYlNKT4FWkxyw581PD6W3OCfQio19DwwOoBBUS0E8WzfQVOvbDs26KVuVP1
 W/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/9Xr+lNW04aBuSVnBKJi6KBxBTf60eHiW3hO+X5TGfw=;
 b=cXJtTeDoBNtotJ7Zxf3eMXXPVqOG+5xdSHr1tFBfBiFKGQ7Q1pa6/bLUtPiOuINenj
 jGhRTAQJtw8lE7epN89GiMWOv4TXBDpWHmB+XS0KZgXifRbGbRI6dlcRMA2Klt2gSgPp
 aBVGqy/7gcRP1VZFjUZZIq7SPKmC7W7/T5b64pI8Xk0XtTZLeTLVtMktBODC5F4CMJKg
 nWJ5XWj8ghvCQV1fOQWpzUSB2z12xkDU2b7P67fbGTph/xi6IWFvD6i691AWNFjDINtf
 W6tzMhiOithBQ/1IixQqoEGReMXcxW/H64PzJxHvjA/W0MJbvrLlTMpe3eescfMxyTzN
 BQqg==
X-Gm-Message-State: AOAM530EV5OeR9K2+ELU8WhC36MX7WXnI9in/SZr2U8zEw0jbTodTS8e
 qemu6pj2uJyhtoBMMJ9gkOXmgg==
X-Google-Smtp-Source: ABdhPJxiL02MILHlt7Q9hfa5f15C4tvcRX25JOF3Ls+NzI5rlbypiWzAARaT+FerYymhctc0ta1MsA==
X-Received: by 2002:a05:600c:3494:: with SMTP id
 a20mr4902992wmq.195.1637313487636; 
 Fri, 19 Nov 2021 01:18:07 -0800 (PST)
Received: from [192.168.8.105] (165.red-37-158-79.dynamicip.rima-tde.net.
 [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id s63sm2456262wme.22.2021.11.19.01.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 01:18:07 -0800 (PST)
Subject: Re: [PATCH v2 1/3] target/ppc: Fixed call to deferred exception
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211118132502.984059-1-lucas.araujo@eldorado.org.br>
 <20211118132502.984059-2-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5e723955-68fc-a77c-b131-ca9e29f23423@linaro.org>
Date: Fri, 19 Nov 2021 10:18:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211118132502.984059-2-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.727,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: danielhb413@gmail.com, mark.cave-ayland@ilande.co.uk, pc@us.ibm.com,
 david@gibson.dropbear.id.au, matheus.ferst@eldorado.org.br, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 2:25 PM, Lucas Mateus Castro (alqotel) wrote:
> +    if ((fpscr & FP_VXSOFT) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXSOFT;
> +    } else if ((fpscr & FP_OX) && (fpscr & FP_OE)) {
> +        error = POWERPC_EXCP_FP_OX;
> +    } else if ((fpscr & FP_UX) && (fpscr & FP_UE)) {
> +        error = POWERPC_EXCP_FP_UX;
> +    } else if ((fpscr & FP_XX) && (fpscr & FP_XE)) {
> +        error = POWERPC_EXCP_FP_XX;
> +    } else if ((fpscr & FP_ZX) && (fpscr & FP_ZE)) {
> +        error = POWERPC_EXCP_FP_ZX;
> +    } else if ((fpscr & FP_VXSNAN) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXSNAN;
> +    } else if ((fpscr & FP_VXISI) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXISI;
> +    } else if ((fpscr & FP_VXIDI) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXIDI;
> +    } else if ((fpscr & FP_VXZDZ) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXZDZ;
> +    } else if ((fpscr & FP_VXIMZ) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXIMZ;
> +    } else if ((fpscr & FP_VXVC) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXVC;
> +    }

Is there a defined order for these in the manual?  I couldn't find it quickly if so.  If 
there is no defined order, I think you should test VE only once.

Drop the use of fpscr_ve and use fpscr & FP_VE instead. (I think these hidden uses of *env 
are evil and should be banished, but that's a bit of a job.)

You could say

     } else {
         return;
     }

> +
> +    if (error) {

and then remove this test.

The rest of it looks good.


r~

