Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADAF4384C3
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 20:44:22 +0200 (CEST)
Received: from localhost ([::1]:38618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meM0D-0005K3-75
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 14:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meLsg-00042Q-VA
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 14:36:35 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:42645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meLse-0000Uj-DL
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 14:36:34 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso5358200pjb.1
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 11:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X3janyCeOIsPzgec325HfWco/XxW8Kou6uAMbNliFDA=;
 b=a7yz7f9v5U+EbijKkyMxzw5LYtV6pIY/O7MaPOZH+gEp/E+CczQUZLyczAGMhdCQgE
 K1Rx6/BILQEHKkGqZymlLhEeRXRS4OXSY3wyahBC123+avu5ktcGrdXFMnt6pzfdINmp
 7hVDG2KVzE4dPMdPepzp/+TFQcvKovPT/vqQrHww+OZG2A+H1o8PVGaJuVRyIDSUQKX7
 gbBuAPw6HbTvvuduPGD/eMna3pN6lRipzLeZENIb9EMdcTpaFswtABkntZE5GXcn7jkk
 RdNIDZKoZxmGdJseUKQ+zytRyv1eqfNs6JwzmOrn/p2ZSXZBQbGihpkgyp9ULu8Sshi0
 2rZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X3janyCeOIsPzgec325HfWco/XxW8Kou6uAMbNliFDA=;
 b=rLWQmIk5Fy4R852vA8Fio48Q2lO5Dx8ZfFLctgblITCOq2NQmxy5WJ53YLS27NuuBP
 CC1qBpD3TAYD0gW4mz84xy/7xU4W7lhKShvD/eqsFt7XymPQ8Zn0sDTIpqIT1N3ZetrZ
 DpUDP95U0YR84+jd8yAfjLGngKZt5JqY9YZFUUTc2Tc/OwA3dFtr/VnUdPi2P5Hq+xC4
 jspwi5pYfYFR3ftD8xomOavQV/FiMwYrPz7jsrlmlVDajRJ3HQcE+c5CM7F4kgvyuSG2
 psTzkNVN/nIfbw5Zq/kz72m8R1wugaw0sqjyJaZGA9GUoNSLCpsDZ8Rs1h3nOAM+FzIs
 OeQQ==
X-Gm-Message-State: AOAM533BDfvARTNBWz2MCy7MI6UMplKGJYYrCi5ZurVfRcQZLG2euB5g
 f59uLtDs+MvQXCrPKYTC8oA7cg==
X-Google-Smtp-Source: ABdhPJzD7gma5GkxblwvycyP9cUiQCBdQ9Cx/boj2htwLFpE5G0NSV0FrcymJXK6tjglWqwSYF2cGw==
X-Received: by 2002:a17:90b:1c0e:: with SMTP id
 oc14mr8462868pjb.159.1635014190600; 
 Sat, 23 Oct 2021 11:36:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm10793207pfe.119.2021.10.23.11.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 11:36:29 -0700 (PDT)
Subject: Re: [PATCH 15/33] target/ppc: Implement Vector Insert from GPR using
 GPR index insns
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-16-matheus.ferst@eldorado.org.br>
 <0581a10f-1411-a174-5869-4fe0999132f3@linaro.org>
 <e7c53321-91e8-54af-9c6a-8f894fdc49@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f316ea9c-0876-9f80-5c56-210f65234fd1@linaro.org>
Date: Sat, 23 Oct 2021 11:36:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e7c53321-91e8-54af-9c6a-8f894fdc49@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: lucas.castro@eldorado.org.br, qemu-devel@nongnu.org, groug@kaod.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 3:12 AM, BALATON Zoltan wrote:
> You mentioning target_ulong reminded me a question I had. Currently we have 
> qemu-system-ppc and qemu-system-ppc64 but the latter includes all machines of the former 
> too so you could run for example sam460ex with qemu-system-ppc64 (except mac99 which 
> behaves differently based on which executable it's part of but you could use mac99 -cpu G4 
> with qemu-system-ppc64 as well). But isn't target_ulong different in these executables and 
> could that cause a problem with this? I've always used qemu-system-ppc for 32 bit machines 
> but we could have one just executable for all machines if there's no need for both.

Yes, we can, and probably should, have one executable for all PPC system emulation.  RISCV 
is actively working toward that, and I think it would be fairly easy for ARM and x86 to 
follow.

It's something relatively easy to do that reduces the size of the test matrix.


r~

