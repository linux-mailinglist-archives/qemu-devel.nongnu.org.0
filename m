Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E9E5522A6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:17:51 +0200 (CEST)
Received: from localhost ([::1]:36336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3L26-0005L7-R3
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3L0g-0004et-8A
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:16:22 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3L0e-0004Qd-Hm
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:16:21 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 x1-20020a17090abc8100b001ec7f8a51f5so7327490pjr.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=egDIUHEK75dkcJLcQnYKRRCRtHw5BxrlD02YUF8SBDE=;
 b=qrzQpYFhRlohJ5nDFBnfmXYRSSF/aMtRAFpxmGTM8+rNbMFZ838ZQPZO4uqIEw+1+K
 JIcSV9KzK2vO2IfksUYNhtt+lIe5X56QMfsyW5p/3u8O4so0/fVo8JQ9Gb8b4UROe7OB
 4IJQraZbqgAoK8CPOJYna9HQkbiAKmDNvDWMNlB1ftZs9n1p9+oSH6zNF/gGQdBemXY9
 IVY+C0OjLAvQy/D5C1cA4erzu8J4KC6oYM9rAFPu/2inp666aWhWVpNhD6rFlQ5OJnST
 73oujgGQ7429TSQvTYahOPiPisDF7siMZHB5/4Z8fNiz/HlO55rENsylGnvqUCAO7mRQ
 cplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=egDIUHEK75dkcJLcQnYKRRCRtHw5BxrlD02YUF8SBDE=;
 b=I0PKCYf1Z6EqSarAk4Y74I7GAo2MMjIVscLpuxkx/rKhu/ORiZl3DqpybDz+cgYc7Q
 Glk9suB0VmjttnBpbUYSD7cWTrZz+5QHcLDofkS9FUIYd1BECKC+Zx3/1BR25WUqTcLf
 YVOL2eicYRlsm46P05krKSKJarN4qYbg0D4WrPvrIJnb0sjFXshTQ82vJ9FGDK/+MVQL
 g1K+8rYlb8mw/E6pJFq3QYHhPMgEwJfi1H54//FEL7zyk6O8gRbdaRMd+5nwbaK1MsoL
 sJJwhuuIQlhxqYPW0h4RSdzbAabu6ovWurrJOPrYBgpH3bHtaxpR+llg0oaEzSU+P4xH
 7iTw==
X-Gm-Message-State: AJIora+JAlqJiKeXu4mc2VMemTgJpzo9QTEhYdR0HcQm19hVOmQpFoGY
 4WYFICai/1Eu5jHSVb1glesuGg==
X-Google-Smtp-Source: AGRyM1uC7YdjYiWjnp2HOhoLmRL3AIaVsKC4dGrde6Ipfik9ylJtMfvrpSCMBla6glQrQlkaUsN8rg==
X-Received: by 2002:a17:902:a9c3:b0:16a:c81:43ee with SMTP id
 b3-20020a170902a9c300b0016a0c8143eemr15646388plr.137.1655745378628; 
 Mon, 20 Jun 2022 10:16:18 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a633c03000000b0040c7e5cfdd9sm4953402pga.16.2022.06.20.10.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 10:16:18 -0700 (PDT)
Message-ID: <9aa40c22-d4e4-c665-fd66-f259ffd589b2@linaro.org>
Date: Mon, 20 Jun 2022 10:16:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/8] Add some functions for LoongArch
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org, chenhuacai@loongson.cn
References: <20220620080451.3711049-1-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220620080451.3711049-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/22 01:04, Xiaojuan Yang wrote:
> In order to start the latest community BIOS and kernel of LoongArch,
> we have added the following patches.
> 
> This series add some functions for LoongArch, and fix some errors.
> Add bios, kernel, fdt, smbios and acpi options support.
> 
> The kernel file:
>     * https://github.com/loongson/linux/tree/loongarch-next
> The bios file:
>     * https://github.com/loongson/edk2
>     * https://github.com/loongson/edk2-platforms
> 
> 
> Xiaojuan Yang (8):
>    hw/loongarch: Add default bios startup support
>    hw/loongarch: Add -kernel and -initrd options support
>    hw/loongarch: Add LoongArch smbios support
>    hw/loongarch: Add LoongArch acpi support
>    hw/loongarch: Add fdt support
>    hw/loongarch: Fix loongarch ipi device
>    target/loongarch: Fix vector size of exception entry address
>    target/loongarch: Fix csrwr timer clear

Please fill in the patch descriptions for each of these.


r~

