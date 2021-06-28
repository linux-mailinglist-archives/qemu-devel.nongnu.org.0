Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813303B67F5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 19:51:07 +0200 (CEST)
Received: from localhost ([::1]:40236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxvPW-0006Tm-BB
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 13:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxvOR-0005YJ-80
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:49:59 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxvOP-0000KD-2d
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:49:58 -0400
Received: by mail-pg1-x530.google.com with SMTP id e20so16111594pgg.0
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 10:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pHpYtuekTkQ+2Ve3OyDL2VdSt5fZOv4MnjKMMWrVEmE=;
 b=e7CtmacO6CUvxhYbp7mwMNz7PtvcoidEKkNCQP3fFT8nB+9jtNk1/ln3HE/aZbIu/r
 14+9BcYhM4JAHTDEsSjicLPOlyHAwjIP2Jc4HFxgw42vofPuWyuO7Bgz1Gu7b1ccqfWX
 A2tj6GCs3vLIl4RDJz/X7fQjuTG3fgzflxjveI90psZEQQJrcpyxnTJ+XvI5B/YjB2OH
 0J72jRpf4dqvVf2+90vRDKJfjxadPX4bmTgmFAWb/XJ8qb79r0JjKglrhsDVAv1+LLjj
 Ad5cbrpKQAq/5+k35TDvmXTQlXNdEUSotjhtmN9idwOklkYsoLJYzOkrUljMSRjdXVSN
 bUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pHpYtuekTkQ+2Ve3OyDL2VdSt5fZOv4MnjKMMWrVEmE=;
 b=f0od1EI4o13NaZF5cmjc/VFtPS7476Uk4yydtmF4fOspVxsdr1XIvjRKoABzf2dEt+
 8B7ai3DZcBmrxcQTcmG6n+Vwr56wbMiVqH5m8jQZ4lvgqRm5fbIIz0lqL8FbgOM+9Cg6
 TfeBmC28W4C6K8Jplv9AnFiPnwumF/zwMF64C2EO+ivUDK/x74OBTm9h9Db1Uxdyc9D8
 yXgb+axdZ2Po0KscfIeh3QI94dpdQ2dt36aHxXw0NwAc+T2XMU6AB/IuPEEeRKhRGTVk
 /s7PXLrIvV4xwoCTdIAabbpHqDPz0Dv/B8C90dIGEiMUZQWJjfqmvfcmUEJEZwQwHyIK
 7UTw==
X-Gm-Message-State: AOAM533sjFZt68Z7Ec+qp6++QTYKOP7Y7fCyhwUeoRs8OzxI28yV3LQR
 anqafLrzvRN6DmpmAijoQlRGMc2RoPCpmQ==
X-Google-Smtp-Source: ABdhPJzAo+WYlNo4avURKVPWya8+pHRVrdOJ16f9ACK3y5tWLaWbTkc87JbGXwxTakvBm509YagmQw==
X-Received: by 2002:a62:7546:0:b029:300:9df3:6ff9 with SMTP id
 q67-20020a6275460000b02903009df36ff9mr25551258pfc.57.1624902594842; 
 Mon, 28 Jun 2021 10:49:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id p8sm15798527pfw.135.2021.06.28.10.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 10:49:54 -0700 (PDT)
Subject: Re: [PATCH] target/s390x: Fix CC set by CONVERT TO FIXED/LOGICAL
To: Ulrich Weigand <uweigand@de.ibm.com>
References: <20210623145020.GA30585@oc3748833570.ibm.com>
 <b24537e5-07f9-8a43-5820-ecc82ee84bdb@linaro.org>
 <20210628125803.GA29264@oc3748833570.ibm.com>
 <5c9a00df-aa43-d721-912c-eeb9eda839a4@linaro.org>
 <20210628163236.GA14822@oc3748833570.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cdda50ba-cf3d-5021-c7b0-01f66d4f45d1@linaro.org>
Date: Mon, 28 Jun 2021 10:49:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628163236.GA14822@oc3748833570.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, Ulrich Weigand <ulrich.weigand@de.ibm.com>,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 9:32 AM, Ulrich Weigand wrote:
>> Don't clear out env->fpu_status.float_exception_flags in
>> handle_exceptions.  Wait until we're actually done with the data.
> 
> I don't really know much about qemu internals, but this is really
> confusing me, sorry.  Aren't env->fpu_status and env->cc_op two
> elements of the same global state?  Why it is OK to use one of
> these fields to pass information to the next helper, but not the
> other?  I guess I must be missing something here ...

One of them has

     cc_op = tcg_global_mem_new_i32(cpu_env, offsetof(CPUS390XState, cc_op),
                                    "cc_op");

which makes it a TCG Global, which may not be modified at will, and one of them does not.


r~

