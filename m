Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C54B93D8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 23:30:08 +0100 (CET)
Received: from localhost ([::1]:48060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKSoJ-0000Fg-A9
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 17:30:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKSmy-00080T-BP
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:28:44 -0500
Received: from [2a00:1450:4864:20::634] (port=40534
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKSmw-0000PF-Ly
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:28:43 -0500
Received: by mail-ej1-x634.google.com with SMTP id p15so2478664ejc.7
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 14:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WjxU1xcOHjHzxIuB20VTJTnhavioopYgErvzULhJl3E=;
 b=F81G+lKAM895ZLpNScRJx3nZgn5+AI60xH+AfCZln202tkg76u1bwtIK9qlBnQI52X
 Gc8PLRcmSsaFaCc+Oi565l5KvvKlqQs+ksQlBE4eRc3b9NF+22Thukr2NwzrEN2jWLcP
 YdsDEQsD8iFS1dajbDXjqrzPVXRzTj5LV6H/ofR3pclaU765fiP5gPhF13EvnVASY/yE
 0UYAKe6Xph6JRNgD3sBN8TeEcytsZDWyXljcFk7JV/u1qLR/54/Tc/kfaqgtA1F7e040
 DvveKNID5LDq356YquGiAsQejOixLXLX0D7pCI+nOhOsRD+s/MiKr9u66I09dxv+aIwA
 dLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WjxU1xcOHjHzxIuB20VTJTnhavioopYgErvzULhJl3E=;
 b=G86F/JfUBd5b0h489HDaxr9reTIpdzbg9t8tZ3e42XpYRw4imD4zvTPgYfbyahJI0R
 Qghlm9ZSRzSrDOae53HyRekTER3jR0wPvKYEq1NbrZxaHNnGy11Vxn2snMbyZlFnL9cO
 q4aYTa2c5urZwv4PfhxDI3s8ajb/ce14SZC/LE02R7snTyUG8oxaZFjhbRofFmvgOtTz
 Xo91T4MtX+Nu9EqiUtGj/RzG7z2tiSs8eMoMkTXfmzG5TLhcf+1lo4qdT3RYgkDzQFmq
 Gj7rRriruLuB3N0xsIS83kUjaZUZKAN9w3gyQAUpkKiF4fdKnbE1aqAVVZoxrfFpn3sq
 xP6Q==
X-Gm-Message-State: AOAM530bxccZoqVkhwD48ijS0+DndrxZdsijXmS6KD1mOyb5XBRJpTBK
 CicZ2hWxPuUQe89Csf5wigs=
X-Google-Smtp-Source: ABdhPJxtNIU+x94jEFEy7h+Nea8P8FPm9+Vp0anrI78O4MqNP5Ih9cly2BwFVMTLNKmtMLuP4ORLKw==
X-Received: by 2002:a17:906:b57:b0:6ce:29b3:404c with SMTP id
 v23-20020a1709060b5700b006ce29b3404cmr138641ejg.140.1645050520905; 
 Wed, 16 Feb 2022 14:28:40 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id g2sm2328337edt.44.2022.02.16.14.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 14:28:40 -0800 (PST)
Message-ID: <a35b3b64-2e6b-2a43-9f2b-ab3ba322bbea@redhat.com>
Date: Wed, 16 Feb 2022 23:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Portable inline asm to get address of TLS variable
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Florian Weimer <fweimer@redhat.com>, qemu-devel@nongnu.org,
 Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/22 18:46, Stefan Hajnoczi wrote:
> However, I wonder if the compiler might reuse a register that already
> contains the address. Then we'd have the coroutine problem again when
> qemu_coroutine_yield() is called between the earlier address calculation
> and the asm volatile statement.

Yes, the compiler should be able to reuse the register.  volatile only 
says that the contents of the "asm" cannot be subject to e.g. loop 
optimizations:

	for (i = 0; i < 10; i++) {
		asm("# assembly": "=r"(k) : "0"(10));
		j += k;
	}

will likely execute the asm once, while "asm volatile" (or an asm 
without inputs, which is always volatile) will execute it ten times.

However, the input of the assembly can be evaluated only once either 
way.  For example, in the case above you might have "movl $10, %edx" 
outside the loop even with asm volatile.

One way to fix it for modules could be to define a (global, non-TLS) 
variable in QEMU with the %fs-based offset of the relevant thread-local 
variable, and initialize it before modules are loaded.

Paolo

