Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E594257A641
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:13:13 +0200 (CEST)
Received: from localhost ([::1]:59118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDria-0006TA-9P
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDrgK-0000kC-KA
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:10:52 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDrgH-0001WK-Lt
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:10:52 -0400
Received: by mail-ej1-x62c.google.com with SMTP id oy13so28642532ejb.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/seujfPUhZ8egZzwztvHTrDzdfn7U2upuVR0e3Z/v4Y=;
 b=kPpKzRsAufvMX+cCvPEYWraV8ajL3z8nqRrKziUxXWfv47oJfIKAk3RE5b6nrwkJ2m
 iQSFSMNHnKa8gI2w6nGI5mHufgMO018j+aiRH9kFRVTI2l13c3jXZrwaEiuaN5r00awq
 04QDZQh7zHmketxbA0apIxINP0MdEvqKCmTWfquhmB4shnK532fbK4tD6NSxdCLv8Rqu
 WL8gIEhlzG8jLQxYPy6sozXYpP9jdTYoDZKQqMsuEfmqjQ4wRM7oHLf4meA8160a9JeT
 4OBO0mhWSVL3WYhEFEBsKeSCWwhAStzikwiwQiA/BOKNZr8ooUkWFNMf1+wZGPKfxiFU
 a6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/seujfPUhZ8egZzwztvHTrDzdfn7U2upuVR0e3Z/v4Y=;
 b=Wq2G1bCl7LTQ2SmHf3IwKxs+B8asaTW1gBhRYeZMxbpoSt7lrJuFeBDpRaCpBLSLIT
 vhKDCGU1bnMOFvRiLrmropgsqzIuXqytcD8E56yglbj2iUl3GN7+6xjt9UxL1jxlXG2v
 S/GQEkcU3XffprTrZ/mBkl1GG56Gm0u5PBqIwMzoG1PjC/WfnrdWJsW1Q3wI3u/GF8vw
 4FBJuxlsoylmHSLFL01BW4tmevvVVxr+3SMsTrzoAKbfBWLXsrznJMScFCXrCVGMOne1
 EFHgtbUF1ggD+Go3CXvNpfvdRwlVWgsaM+NpwDbHyVJyN0xQ3AQ0N7Tr5Jz/awx/9+SE
 v7Nw==
X-Gm-Message-State: AJIora+llOyfdDs5xXN6XNuGVUo+Ei/k+Hgt0mB/91vrpwSYFyTafrUr
 ZsT7b9aLDX+qh8fSLqBP9jc=
X-Google-Smtp-Source: AGRyM1shd2fo1M23vzYgyKNsQQWF83nKt8+rXK96Fn5kU5eegF/Dyj6iUs5fm7rhK2tQQ1lCpZ4pIg==
X-Received: by 2002:a17:907:d92:b0:72e:e94d:b675 with SMTP id
 go18-20020a1709070d9200b0072ee94db675mr22520937ejc.742.1658254246887; 
 Tue, 19 Jul 2022 11:10:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 j12-20020a056402238c00b00437938c731fsm10794890eda.97.2022.07.19.11.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 11:10:46 -0700 (PDT)
Message-ID: <7a2ed522-c6d2-48b8-5692-4a27b24ef312@redhat.com>
Date: Tue, 19 Jul 2022 20:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PULL 07/16] configure, meson: move ARCH to meson.build
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20211219141711.248066-1-pbonzini@redhat.com>
 <20211219141711.248066-8-pbonzini@redhat.com>
 <CAFEAcA-uAYrZPzGZfSVOQ16cxfYiR8k_J5D0XWNYn49V_hdmCA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA-uAYrZPzGZfSVOQ16cxfYiR8k_J5D0XWNYn49V_hdmCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/22 15:00, Peter Maydell wrote:
> shellcheck points out that this (old) commit removed the code
> setting ARCH from configure, but left behind a use of it:
> 
> case "$ARCH" in
> alpha)
>    # Ensure there's only a single GP
>    QEMU_CFLAGS="-msmall-data $QEMU_CFLAGS"
> ;;
> esac
> 
> Presumably meson.build needs to do some equivalent of this ?

Yeah, I'll send a patch before 7.1 gets out (Richard, as the resident 
Alpha guy do you why it is needed?).

Paolo

