Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21894D0EEC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 06:02:09 +0100 (CET)
Received: from localhost ([::1]:42798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRRz6-0005H3-7h
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 00:02:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRRxK-0003Gq-Gg
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 00:00:20 -0500
Received: from [2607:f8b0:4864:20::102a] (port=52803
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRRxI-0002Bx-TM
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 00:00:18 -0500
Received: by mail-pj1-x102a.google.com with SMTP id v4so16095824pjh.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 21:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=7KF/4+Rj+CBkELge+P1jOqDl2Of8Ru9ou4Nz+uFMdSQ=;
 b=N2ybaHmvkSKz2GSrssW4aQTe2QuQyS0M7AlUBlPA5UodAfzHbpgMo/k046p/DUiJew
 QqOEVAedUJidttGmRmjCEZHd1VV0Y7GEWRT3KPeH5XgSK/3hAKJzQKd7NG0QXmp71/0o
 1gp73uO6uJ5QGrfXnjQGdc0gB18ApNe9KBXuo/sMV8i9JUNg880rVuhUlFeewJ3lf/5T
 s1UtKOLl8g0ys7l/SedTOiRykEjOJJOqpx0ZOmKolvXKMxidU1c+vpXnowKc2TzZd3HG
 /7oBRhwTYSXQf7LMc6SP57smrf0N5REmZe1h8qMhs40PyeYW2ehlb9nNn+BcyeQ2SM/C
 1aDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7KF/4+Rj+CBkELge+P1jOqDl2Of8Ru9ou4Nz+uFMdSQ=;
 b=cr0OOX0zder9Rby+ueDpRa4MWAyJmIlGYTdOSZoYiVWb1rRurJZNQmfOnyTMbLv0D9
 b41fHFosTmJof1gZ43FqmMGf/WhZIJoWXkCfgZdkyEHMBRvk0bl7cj59PMXgogMiBgzt
 UthmXf1cHxfWlSPXKuUBw6Tv7R1EVMCbDB4r8S+AWVtIOxQE4sFpa+T0eiWvNipeEgXI
 5XncZ6GN7tBOSh7Z/lBGFImgPuvxDjksi1MQ5PPabizGXrM0oVcYqEMhyDRfX7XOTDaT
 h4c2ebqnitINAWXHvdAl5YFHj+FZ3OC97JS4MACe9tYnWrxQluTDHwXjcUyF961SvDma
 MgYw==
X-Gm-Message-State: AOAM531iqcUQ4D/FL/OR3YYHR6JFuctlwyuLOq88qanTXL2O5F7/j+Dt
 cvLJY2vQYfUQujHwoZObm0pKMgT1Pw2NzA==
X-Google-Smtp-Source: ABdhPJycDbmKeVJPC0u8wuPrI6k63xIkEc2HM2//ANyGABOQOgA2Ygueo2SSrwW8Te3/cy4LCshYjg==
X-Received: by 2002:a17:902:cf02:b0:14d:54cf:9a6a with SMTP id
 i2-20020a170902cf0200b0014d54cf9a6amr15316398plg.137.1646715615034; 
 Mon, 07 Mar 2022 21:00:15 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 a133-20020a621a8b000000b004f6a79008ddsm15547240pfa.45.2022.03.07.21.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 21:00:14 -0800 (PST)
Message-ID: <5bb620d4-96f0-cf7f-5530-af529a32c78d@linaro.org>
Date: Mon, 7 Mar 2022 19:00:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Question about atomics
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 18:18, Warner Losh wrote:
> I have a question related to the user-mode emulation and atomics. I asked on IRC, but 
> thinking about it, I think it may be too complex to discuss in that medium...
> 
> In FreeBSD we have a system call that uses host atomic operations to interact memory that 
> userland also interacts with using atomic operations.
> 
> In bsd-user we call the kernel with a special flag for dealing with 32-bit processes 
> running on a 64-bit kernel. In this case, we use 32-bit-sized atomics to set variables in 
> the address space of the bsd-user guest. This is used when running armv7 binaries on amd64 
> hosts.
> 
> First question: Is this expected to work? I know I'm a bit vague, so as a followup 
> question: If there's restrictions on this, what might they be? Do some classes of atomic 
> operations work, while others may fail or need additional cooperation? Are there any 
> conformance tests I could compile for FreeBSD/armv7 to test the hypothesis that atomic 
> operations are misbehaving?

Yes, qatomic_foo is expected to work.  It's what we use across threads, and it is expected 
to work "in kernel mode", i.e. within cpu_loop().

There are compile-time restrictions on the set of atomic operations, mostly based on what 
the host supports.  But anything that actually compiles is expected to work (there are a 
set of ifdefs if you need something more than the default).

Beyond that, there is start_exclusive() / end_exclusive() which will stop-the-world and 
make sure that the current thread is the only one running.

> Thanks for any help you might be able to give.

Show the code in question?


r~

