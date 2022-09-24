Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9805D5E8DAC
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 17:04:53 +0200 (CEST)
Received: from localhost ([::1]:42604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc6i4-0006ul-7U
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 11:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc6eG-0003F7-BC
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 11:00:58 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:44614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc6eD-0006zR-Iw
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 11:00:55 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id l1so1752024qvu.11
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=YDcdhPxO9VeFIp634C6kQTyfDCYn22eTAOsBNQOFDYA=;
 b=j/0ja04DteR9YlaMHZteb+Vf4XiJb2OLF6MOxYCtEqvg/hTJH76Y0xak+/uKSzCigO
 anfeHUETL5jq3OuR+1tZeiVJJsELyMgXIOhdGqXyBtIPs4ZfL11bPOZlq6JaDnQBp0Xh
 irsH7l/Mjh1fce/O0EJ4XylovKZeJYVLcD5I0aAiUSqFu2MUaf9W/Qabu3csHHbUmqGg
 regCg1ptHc2GT9fZ/9mZy4U6qf7Q1iW/pF13gOND8razgequPA6dXmdee2oOZEscGgT6
 bf3JJ/of/5Fsx95wz/K4gvXDVB2ZAZjRp49/GU40mNx3unjiN2DE0+wbINCNh7283WjC
 06pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=YDcdhPxO9VeFIp634C6kQTyfDCYn22eTAOsBNQOFDYA=;
 b=1h4qx5QAALkb/prnYB7ET9gv5l7pX02Vb1gKZ16BEysNNl28HgaC2my/VMrzRAyn4R
 T17rlyF9GzQ0ltp8pAeQxMVtQVk4FAaQdC5or/6awbACxu8EDHnEnmRQWdAfDZ21dy2+
 N2TFGMS9OpGXCruvUwYwybWoiWLhXkXRVQZ2LdEeZFpypUTRPyOzlU3u4czAHXgBkO9z
 1leLSveDXNtpCFbYZg4Hvo2LWPFisAkUNbvzVuyK1dz/68v7d1siCgWbkXWz4R0mlT51
 Q6dmTn8iucjYpBSnAhZdQfHXkRbJD7HbomM8Tgi2irjz83uvqanzDyMqXzKwq3MjfyBN
 TdPA==
X-Gm-Message-State: ACrzQf2x3X998Oo1F9x7/xOMu7vFRUmy8To7QZMYYQzF0x3mezX880UU
 W3q8gRDG5a3ljAw9aHqv2mhnflNNDabMpKO1
X-Google-Smtp-Source: AMsMyM625UAFF8FEoHKFZlqkvhKgidvZ3QK8Ku02WFvddUG3S6IOi5BDxfxDpZD++NG4QkPGZIlCww==
X-Received: by 2002:ad4:4ea7:0:b0:4ad:656a:260c with SMTP id
 ed7-20020ad44ea7000000b004ad656a260cmr11231683qvb.51.1664031652052; 
 Sat, 24 Sep 2022 08:00:52 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:1f12:b4b:2dff:20:54a0?
 ([2605:ef80:80b2:1f12:b4b:2dff:20:54a0])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a05620a0bc200b006ce7d9dea7asm7835307qki.13.2022.09.24.08.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 08:00:51 -0700 (PDT)
Message-ID: <4983f700-2e6f-cbfa-c80c-9a30308634c8@linaro.org>
Date: Sat, 24 Sep 2022 15:00:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 02/37] target/i386: make ldo/sto operations consistent
 with ldq
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/20/22 17:24, Paolo Bonzini wrote:
> ldq takes a pointer to the first byte to load the 64-bit word in;
> ldo takes a pointer to the first byte of the ZMMReg.  Make them
> consistent, which will be useful in the new SSE decoder's
> load/writeback routines.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/translate.c | 43 +++++++++++++++++++------------------
>   1 file changed, 22 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

