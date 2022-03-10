Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DA94D489C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:09:18 +0100 (CET)
Received: from localhost ([::1]:50044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJTg-0003Pt-Kt
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:09:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIsr-0006to-3O
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:31:16 -0500
Received: from [2a00:1450:4864:20::330] (port=41766
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIsn-0005KP-I0
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:31:11 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so3420642wmf.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 05:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v4vNJYpsTW9lI6pkjPgTdOyqBH7CrwgvTymkEAK5+2Y=;
 b=UTeZLAzhXnkALQ48oksDfMqFgRRkgwv06YDWc+A+7PFtyztrgZCbJ4LT9y8by/KDAm
 puuyet+UDJ5rschVXAwc6p9Q+u1Et5vpB0ZpN2BzdFv29oDo23IDnFdnM9tZZ3cDAfUV
 OriVdP8Coo+5kUEYkkOjrJi+U7gqZ4MBTPSroQxs7fMI4Iv3BqtcOzP6hzUCBQ6TM8Hr
 6EU5WHm9aMFUzfkqwN8FVMtgU3s39iYPnbmthjl9bFAiYVGutxiWq/8o+9x6BMNw5rZB
 1UhR/ss1kxdYAPNN408FEH6ZVaz0i2CPGBNTWai6vRSL2TpvzRLbz5nmeVRlWdWRxCnw
 jT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v4vNJYpsTW9lI6pkjPgTdOyqBH7CrwgvTymkEAK5+2Y=;
 b=vQurVud6TiQ03RmZ5ZfUA3IB+UZAdxYX+sEZSSYD9K26Za+IfjVR3pMXqarFlaF8VP
 v6z8BkmPrPCSpVFbUIU0wMguuI/9FMfbh0KhMLaGfWwdaOIGIbK3rWe2NVMW9jmP5CxE
 aftiaDeMaSO+dTK3C6EW3s9K1lxSYKDq7bB173yRicgr+h0aYWesqWwsP0dlj5T1BHt1
 5JfzuLvL7UJx/9pX8NFICxjYx0/GXAnSg5UxVi+UU5pD8un2d7wn4cEm5oHsLIDx98qq
 tQfBKN7qLEz5i+Bj7cE5mx1v4Z2gZ2GQAOr0AM2ZV8+9YvKISP9++VC1vOk5VwFVAhHR
 nAQg==
X-Gm-Message-State: AOAM532urQy2hyufxVbgkf/Bn5+pxqniFWJW2HcAV++Bp6zWFejLJ4Zo
 T1ugBXsyiUNB7oRNV2/pIPU=
X-Google-Smtp-Source: ABdhPJwV7wv4uYyCbyOQnbGebhsF/0AQvEa0zWrwCywgO4S5wXgG3iKKS8zfgY/HPnbFggAo6NBF9A==
X-Received: by 2002:a05:600c:3b89:b0:389:cf43:eafc with SMTP id
 n9-20020a05600c3b8900b00389cf43eafcmr3597655wms.205.1646919068143; 
 Thu, 10 Mar 2022 05:31:08 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 s8-20020adfc548000000b001f07639a704sm4311921wrf.7.2022.03.10.05.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 05:31:07 -0800 (PST)
Message-ID: <776fdc69-5ffe-0dcc-43ac-44da68bb0f68@redhat.com>
Date: Thu, 10 Mar 2022 14:31:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: qemu-softmmu -cpu help broken
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
References: <CAMo8BfKsLmdjRzmX6+nD3u-+8-6dx5VuU-kNH9gwx04NhQ5fGA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAMo8BfKsLmdjRzmX6+nD3u-+8-6dx5VuU-kNH9gwx04NhQ5fGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 12:10, Max Filippov wrote:
> Hello,
> 
> I've noticed that the command
>   qemu-system-xtensa -cpu help
> no longer prints anything. Apparently because cpu_list is no longer defined
> in list_cpus inside softmmu/cpus.c

I think it'd be better to move list_cpus() to cpu.c in the root 
directory, and from include/sysemu/cpus.h to include/exec/cpu-common.h.

Paolo

