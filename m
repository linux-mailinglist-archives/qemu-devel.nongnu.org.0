Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761EA3B968F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 21:28:43 +0200 (CEST)
Received: from localhost ([::1]:39196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz2Mc-00064V-1b
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 15:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lz2LS-0005CW-2E
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 15:27:30 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lz2LO-0006EE-7X
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 15:27:29 -0400
Received: by mail-pg1-x534.google.com with SMTP id v7so7095138pgl.2
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 12:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1o1PTLpg3F44NwwaXVoTaZGkpdjcyW7RO02fMHok40g=;
 b=wOgPmqul5wZHctdzmq8e5i1KdZS+uXuZunHddtXv9ituH5LfOQvB1Wpm3XctTPjtPy
 WEs6nowdvSwqehqGBdIKxKHwpplWIXm6FUDU5ERuETu6rZQZ8eUSaGPrNnmWYblzbQ1v
 7QSbIkszWi0q3ZtpdPCsarHOYLG6cUeCY3mJcV60XjebOSGAA+jK7U7dV836Ax6rornh
 ook79U7okR/SMqf3z3qwZRedwzpy6ElDBtLKl52A9ATq9V7hMNZlcpLIGUj2DSCqRAH1
 OoHiI+u/TLTlqClzeiuS1Mdt7Tgp8XHjnAPxeCl/a2p4kbmaOk5yb69LjMAfkRo0DHHX
 XWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1o1PTLpg3F44NwwaXVoTaZGkpdjcyW7RO02fMHok40g=;
 b=WAfGk/kPejymnkO94Ca7yYTRJOuX/Xus50FZ0MQoNVnQ2LMF1DfWVF1O9wc01B6AuS
 EKScBfKcE4j+XU21EhxgBOMXbiLj4wAy/lCKYCoXIm3vsdvXxEhZGnIAsloa8oPX+P5Q
 D4+24/bRsfdAsILhjLuU2TscygFKPf64B9Q28Fh5C37mwXmghpK08rPdxIvULaSjzo3W
 e6YztVf6NCLwvpfIHcgDhkNPhO/iEVctjjoCDYlQZxl4MNTFGx8mi205PTQCh014TcSH
 Y/B/ubs32tPjyy8iuSd0w7j0fKDe/tXJBSLwWtbVACyUPoSfEnp7lgX0Q47609iRnKXF
 pcWA==
X-Gm-Message-State: AOAM533616/6iFdS302OL2myrYlgWEZ8vBog6yZrmSDbfjDt0Uo+v0zs
 vjmfNouOLQyQTvy/liZgtEPvDw==
X-Google-Smtp-Source: ABdhPJyAgpVI+T068w566uyYzG+UB7u3k3wPqdGprzBB61i69F0cBCoVmgnketee3RUxKJcAMQH50g==
X-Received: by 2002:a63:d74c:: with SMTP id w12mr1108776pgi.91.1625167643830; 
 Thu, 01 Jul 2021 12:27:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x17sm819286pfa.26.2021.07.01.12.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 12:27:23 -0700 (PDT)
Subject: Re: [PATCH v2 02/23] linux-user/aarch64: Implement setup_sigtramp
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-3-richard.henderson@linaro.org>
 <CAFEAcA8pbG0kp_un++SzGfyVZw0FOMVU7zdyBCa7YKsCMeAZuQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <27acb275-4819-1160-ac2e-9fb3b9a9abe1@linaro.org>
Date: Thu, 1 Jul 2021 12:27:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8pbG0kp_un++SzGfyVZw0FOMVU7zdyBCa7YKsCMeAZuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/21 6:36 AM, Peter Maydell wrote:
> A little way up from here there's a comment:
> 
>      /* Reserve space for the return code.  On a real system this would
>       * be within the VDSO.  So, despite the name this is not a "real"
>       * record within the frame.
>       */
>      fr_ofs = layout.total_size;
>      layout.total_size += sizeof(struct target_rt_frame_record);
> 
> That now needs updating, because we're no longer putting the return
> code in that target_rt_frame_record.

Updated to

    /*
     * Reserve space for the standard frame unwind pair: fp, lr.
     * Despite the name this is not a "real" record within the frame.
     */


> I think the 'struct target_rt_frame_record' now does correspond
> to the kernel's 'struct frame_record', right?

Yes.


r~

