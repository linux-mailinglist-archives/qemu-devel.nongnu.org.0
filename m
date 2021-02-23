Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918F5322A6C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 13:21:44 +0100 (CET)
Received: from localhost ([::1]:43694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEWhD-0002KB-B3
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 07:21:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lEWfN-0001dz-Lb
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 07:19:49 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:52464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lEWfK-0003Ml-EJ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 07:19:48 -0500
Received: by mail-pj1-x102f.google.com with SMTP id kr16so1700252pjb.2
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 04:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0XZ0zgp1iMwi6kcFSDBH6/1Ek8c40NKqA1G3gvtpiU4=;
 b=Aje3ryFEgvz9Q6PuDbIz2NCOFBVUhY4yJthIIOyXJ2cL2Avn0Y2v7eaHYhR+UvNYXT
 A1C8rnn8DPRCgqECmkgTfBrjJ8z5NzgSlmVPkFOpG6lD7BR0ICigvEgZYQKHEiW9lmTj
 1ap34EU5ZWMRyZ6XbSTU+SsjbYq9M5m5m+5WabQGiz4MHAJLdsiBw67/O+Ut1sKa01Zl
 9VzMYVkI91/TapKs10A5JhiKXVEQAhYDbq8eJtD9dhFBfh9SyCXA+tgvCb6/Fdqj8+/a
 PgD0FQVGT29ygzhVc8mZVCnTK+HjnsUsC5rHSUYBqcEy2BeTfXVGcCHkZwnwKUrck1Hv
 Tk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0XZ0zgp1iMwi6kcFSDBH6/1Ek8c40NKqA1G3gvtpiU4=;
 b=P+AFSTHf22zxNlXChG+w/jubphC61act+w03+GOtv9kUflSBVtQq7ED4qDbOLcCZi3
 aw7+0B1zQSh73sddncgdFIIQeNERPHpdZZwZjdLkzid14gyaW8rGu6BTk6RowbiJb5+S
 Hv1hIhiSSlMWen2+J3+ZMb0jL/i9h6NwNEWMML3prNL4WouPQKEc0T4hKQfCIFA99dyE
 Jos/L1gihxKswZtNfuWFUDHTtd4XTu/bMb33CkklPj3z7CgswKlgg2BBHTB/+81wNXwy
 ULvm7Tuut4E4JJ5QjktyKg3EwMQ1cOyGbZINBgs17rToKRGOJJ25Hd8HHyGKYNm5Enca
 lKNA==
X-Gm-Message-State: AOAM532H9bk4b2lywLxwvLaQk/dTy0ftDdPVqmK2Xc8YUV7V1f6hraVB
 d5ierwXIEi8sshPasT6d9Ecx5A==
X-Google-Smtp-Source: ABdhPJxOT9EHHZ4roEUaTMwhb8TeO8We7ZgVVEW4FxDHiab9WWzi+RWmvYEsVMggeINFfQurQEPfwA==
X-Received: by 2002:a17:902:a614:b029:e1:5b43:956a with SMTP id
 u20-20020a170902a614b02900e15b43956amr27720257plq.38.1614082783357; 
 Tue, 23 Feb 2021 04:19:43 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id g141sm834885pfb.67.2021.02.23.04.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 04:19:42 -0800 (PST)
Subject: Re: [PATCH qemu v13] spapr: Implement Open Firmware client interface
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210209110252.110107-1-aik@ozlabs.ru>
 <YDRxdIIiX9gCLEFM@yekko.fritz.box>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <e303c1ff-e5a9-2d65-5063-d49182bdb67f@ozlabs.ru>
Date: Tue, 23 Feb 2021 23:19:38 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <YDRxdIIiX9gCLEFM@yekko.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 23/02/2021 14:07, David Gibson wrote:
> On Tue, Feb 09, 2021 at 10:02:52PM +1100, Alexey Kardashevskiy wrote:
>> The PAPR platform which describes an OS environment that's presented by
>> a combination of a hypervisor and firmware. The features it specifies
>> require collaboration between the firmware and the hypervisor.
>>

[...]

>> +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
>> +                                target_ulong opcode, target_ulong *args)
>> +{
>> +    target_ulong of_client_args = ppc64_phys_to_real(args[0]);
>> +    struct prom_args pargs = { 0 };
>> +    char service[64];
>> +    unsigned nargs, nret, i;
>> +
>> +    cpu_physical_memory_read(of_client_args, &pargs, sizeof(pargs));
> 
> Need to check for read errors in case an out of bounds address is passed.


cpu_physical_memory_read() returns void and so does 
cpu_physical_memory_rw() but eventually called address_space_rw() 
returns an error code, should I switch to it?


> 
>> +    nargs = be32_to_cpu(pargs.nargs);
>> +    if (nargs >= ARRAY_SIZE(pargs.args)) {
>> +        return H_PARAMETER;
>> +    }
>> +
>> +    cpu_physical_memory_read(be32_to_cpu(pargs.service), service,
>> +                             sizeof(service));
>> +    if (strnlen(service, sizeof(service)) == sizeof(service)) {
>> +        /* Too long service name */
>> +        return H_PARAMETER;
>> +    }
>> +
>> +    for (i = 0; i < nargs; ++i) {
>> +        pargs.args[i] = be32_to_cpu(pargs.args[i]);
> 
> In general I dislike in-place endian conversion of structs, since I
> think it's less confusing to think of the endianness as a property of
> the type.

The type is uint32_t and there is no be32 in QEMU. I can have 2 copies 
of pargs if this makes reviewing easier, should I?




-- 
Alexey

