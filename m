Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915563AA21C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 19:06:44 +0200 (CEST)
Received: from localhost ([::1]:33460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYzz-0003bp-9U
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 13:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltYxs-0001DE-8i
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 13:04:32 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:38721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltYxo-0004ge-RM
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 13:04:31 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so4376465pjz.3
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 10:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=74p0cJtLc8Zu2Wfuc8ZiUpesgUXZd1+7MlfMmPmeoQk=;
 b=vghZP0RAoBqqdEMOvNnFjtMl/qIj67yjx6Fvrlt7reh2VnXI5jrjCx/j8YvqfXO0L9
 yh3XT9gTAoVNf7RbPHQgdTlMt1+E5Z0nEk35Vb3BVqt1ggarmbKS72V6gyXjE3GBCyA8
 uwmhS0mQAbTGWZzGQ4TwZspUN7a0ItsiadGfvdk5Oyi0jKdD+yJL1a6t488H4mLqM+fZ
 6+LQQAHD6X/jcLL/ncdExWZ9bYH5w+U+uTC8uMs0VYESxntHI1k5W68gTlC1IP4HmY0+
 xA1hrJtqChPtsY4nI3vh1YZZtXTsi3W7CglHyvTH1c4HQQX3o/ooCf3A2zOtgzhyIvva
 RTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=74p0cJtLc8Zu2Wfuc8ZiUpesgUXZd1+7MlfMmPmeoQk=;
 b=JziTH2FjVGa+bGaqcghoZRMAP/uQRJG98rabu738uPMiOmsBu69JsMfz00rHDA05K/
 X0QLebhL/YJyF7UOL1RE21IKT4mfgJ9KXmkJm/6wHWwsAESnkpGgclzKpak2wUYdEsXE
 lhuR1OKXcNRVXE6Ao45xa6oYK33nyw7bjf0BQrUwD6P30r0MBIaCStDrwALEjcu0cgSk
 Ka8574w43ILVv61vn/jODgYujRgM+Ds88krl2ZHckNhOCUZXfSD7yyMuC7QWphG12MTK
 RrBIJaj8C0JsX1lEY5AfEZcBoAm3TewvtojKVno6zf7vmF3no6e+6MmrRg69SI2WtKFM
 T8+w==
X-Gm-Message-State: AOAM530qjbW9fqQO9ybKa2na5JDdTSMmc9dFx2bfL6e+AgHHLXDuqqh4
 CHV0JLGcwyl9OHWN44yKa4t0vQ==
X-Google-Smtp-Source: ABdhPJwaNgQaLwVda1jIoDN7qY3ABuYrL9IICt6s9YMp5UcnmoKzputNdfJquc8LEbi+2cPtXJfJEw==
X-Received: by 2002:a17:90a:5401:: with SMTP id z1mr756985pjh.7.1623863067114; 
 Wed, 16 Jun 2021 10:04:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 s4sm2677414pju.17.2021.06.16.10.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 10:04:26 -0700 (PDT)
Subject: Re: [PATCH v3] target/ppc: fix address translation bug for radix mmus
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210616130130.87058-1-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1e52a84b-f912-0077-7ddc-61e63179c2b2@linaro.org>
Date: Wed, 16 Jun 2021 10:04:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616130130.87058-1-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 6:01 AM, Bruno Larsen (billionai) wrote:
> @@ -310,7 +311,9 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
>       if (ppc_radix64_walk_tree(CPU(cpu)->as, g_raddr, pate.dw0 & PRTBE_R_RPDB,
>                                 pate.dw0 & PRTBE_R_RPDS, h_raddr, h_page_size,
>                                 &pte, &fault_cause, &pte_addr) ||
> -        ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause, h_prot, true)) {
> +        ppc_radix64_check_prot(cpu, access_type, pte,
> +                               &fault_cause, h_prot, mmu_idx, true)
> +        ) {

Parenthesis and brace on previous line.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

