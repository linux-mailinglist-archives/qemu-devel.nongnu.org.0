Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5B8688591
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 18:37:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNdV6-0006BM-MF; Thu, 02 Feb 2023 12:35:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNdV3-00069z-36
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:35:53 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNdV1-0000fV-DV
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:35:52 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 f16-20020a17090a9b1000b0023058bbd7b2so1911703pjp.0
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 09:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z93XaQC9nhfkablGxm5prOumg5C52MtsNJtAVgf+/Xk=;
 b=siM7OcVxjUrp9VA9s6E/+waa5mTsORBQobtwYc3RoLp8uL5Uf3lkjX79K5voCbtz+y
 PbIPrt9b/ljjRw1AVx5NZMFbtlne2N0Jc0uDb/rC9etuO8MckxfloDKlPhBO/iQS83dR
 lVpR3X3TXXzwEk6qdFgcZA8SzcA7S4IGjeIQrYkFYvydDdzaWJ5TMsqrjgwmQePMol9r
 6O0ERV4zoZVNJ7nnVtPTAINndnt1PklTIdm+/+AYTvUX68LO5sYfEX47JGf52qsLiSLV
 /9v0tIfPj+O+AuOv9vLmJMHrPtVsRTCWnWHIgIp149tvJqNZ4C0JtHNlEaL/jCnt6WrB
 Ql6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z93XaQC9nhfkablGxm5prOumg5C52MtsNJtAVgf+/Xk=;
 b=AJ2FssrGYmcfsol/Lc/gAj5tQBBXtDhHhRVaRXc09ptUeJQma9GqQmCk9ZuuwDG1Bm
 nPh57seWcLUul90jEXPcpGFOhwqtCbyMelZqoATqk5nU7HIkivHkB2k3p9KJ2yi2nsDz
 RNHBy6tXuk+oJz3pCBnJa7Vd+sL9q4bxjsWXHTj2PHfQ8S8EEfYY6RPyR/O2EQVSjmnP
 LuZzgH/Qqi+7ooDjBILrR74P5q9MNCh3eXo7ZxBOLvkla0V5tyagnk4/USNuySVl/A8N
 n+sa3fQimk5Ixudc+J/W3ZVdpd0V+1s421w9CRUX0zSzfoHJbyIcXUOCRmSxqW5WGDYz
 ebMA==
X-Gm-Message-State: AO0yUKWT4zn8XyWwNTodAUT0+XVb4hnHPBvs2nat16yXW4dWwUw4Iftj
 6ZApV3ouClMp6d3L3oARyNsGpA==
X-Google-Smtp-Source: AK7set8hqU5dyRazxJ180X7fxijCMJdWEZ2QWU0K21vL//Jsk+HdgCdiDJf7MzK9005de1HmiBT/5g==
X-Received: by 2002:a17:90b:390a:b0:22e:5ffa:2a34 with SMTP id
 ob10-20020a17090b390a00b0022e5ffa2a34mr7581580pjb.36.1675359349787; 
 Thu, 02 Feb 2023 09:35:49 -0800 (PST)
Received: from [192.168.50.194] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 j5-20020a17090a694500b0022c2e29cadbsm3419163pjm.45.2023.02.02.09.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 09:35:49 -0800 (PST)
Message-ID: <16a6fadf-ca13-d3aa-7e4b-f950db982a21@linaro.org>
Date: Thu, 2 Feb 2023 07:35:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 06/39] target/riscv: Add vrol.[vv, vx] and vror.[vv, vx,
 vi] decoding, translation and execution support
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Cc: qemu-devel@nongnu.org, dickon.hood@codethink.co.uk,
 nazar.kazakov@codethink.co.uk, kiran.ostrolenk@codethink.co.uk,
 frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, pbonzini@redhat.com, kvm@vger.kernel.org
References: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
 <20230202124230.295997-7-lawrence.hunter@codethink.co.uk>
 <CAAeLtUA188Tdq4rROAWNqNkMSOXVT0BWQX669L6fyt5oM5knZg@mail.gmail.com>
 <CAAeLtUDcpyWkKgAo2Lk0ZoHcdyEeVARYkh05Ps27wbOzDF0sHA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAAeLtUDcpyWkKgAo2Lk0ZoHcdyEeVARYkh05Ps27wbOzDF0sHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/2/23 04:30, Philipp Tomsich wrote:
> On the second pass over these patches, here's how we can use gvec
> support for both vror and vrol:
> 
> /* Synthesize a rotate-right from a negate(shift-amount) + rotate-left */
> static void tcg_gen_gvec_rotrs(unsigned vece, uint32_t dofs, uint32_t aofs,
>                         TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz)
> {
>      TCGv_i32 tmp = tcg_temp_new_i32();
>      tcg_gen_neg_i32(tmp, shift);
>      tcg_gen_gvec_rotls(vece, dofs, aofs, tmp, oprsz, maxsz);

We can add rotls generically.
I hadn't done this so far because there were no users.


r~

