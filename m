Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF69452D2F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 09:52:02 +0100 (CET)
Received: from localhost ([::1]:45092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmuCA-0007sD-0p
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 03:52:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmuAO-0006Iz-Iu
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 03:50:12 -0500
Received: from [2a00:1450:4864:20::333] (port=46651
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmuAL-0003s8-5A
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 03:50:12 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so1752075wmb.5
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 00:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kr+5Cm9/LsaRp8oOYU7uasL8VoF1iTYuJU+NHgwq+p0=;
 b=ude5RYUCXHTHSCn+K54+IwNASsIDJb0YEITt4NWAtiq+R0QEl6x/Y+r5M2YNDAMLZx
 0zSe4VW+mXjumeR8QhQF4LFXjIo2qmhcM5eqQUX/eIFERXGmWxpgO1GtUqSaEd2gWc0p
 4O+E6eqtzukFItZ14835sg3YEgyhCf+UltwnOAqonS3a/kfw08VDojGW5HZ+wBOfY6Ou
 Iz3LkpKwcR8ExgtqhJfqx6C5LZQCHdfLrwd9fVRWI7B+Cs9LzOEfn+zUm3NnUBh1CUuG
 +eSDm4NqOUvLBRijrQtm7VwpBlwGJ+wI4YuAY+sz1VQGCBY2pz2Oog4okPhp39fuBTtZ
 5Irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kr+5Cm9/LsaRp8oOYU7uasL8VoF1iTYuJU+NHgwq+p0=;
 b=0Nz435vJb2BsrfN8c6d/JDCCT9yiNcA1BAWjgUIJx3K7lhm0LuYW1M6jpr9xG2MpN+
 MXqVZhdiHe6vCSTYxnwqlnJm1hvNdyux62GvfxwC5XH/Ef2g8zSd19f8ptzsIK4CvpxW
 aWE3a0hldK9nk6vFarhoxxm7J0ZxbEKmUcEgz/6nTOVwI4ToW38dvRiCPogwUMydPWMP
 PY62IB9hglV1gObfi4G9D/HFS6O4KVKJvnV9jb5pfJX+k1LCv03W5xzfsKb2BEt4d/Nj
 OCn0jblaoGwoHVfRSSjRjgBO72rLBDUoIMBjJvnrV9BQTGgjEx2nCQioU73pviSufR8M
 p6zw==
X-Gm-Message-State: AOAM5328LoJ+vFPwJsPg1/aMZzoE9fT2HteIHMvCCY7ZVAMP4A7jp9SV
 gTUeckZGDJbbmYa68QYFKnz4Xw==
X-Google-Smtp-Source: ABdhPJzF1MlBSpa5fGljRN/VuJTVBIkf0w9dn7RDdGZNn96pI3+e5EjenedPeOayWEXj9jRjdbdCvQ==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr66194919wmf.185.1637052607561; 
 Tue, 16 Nov 2021 00:50:07 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id l16sm1902785wmq.46.2021.11.16.00.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 00:50:07 -0800 (PST)
Subject: Re: [PULL 00/20] pci,pc,virtio: bugfixes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211115163607.177432-1-mst@redhat.com>
 <999d5ac2-2c4f-6296-d507-5fc456342385@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c196ded5-400e-db17-2b32-ca75d3b9cdc7@linaro.org>
Date: Tue, 16 Nov 2021 09:50:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <999d5ac2-2c4f-6296-d507-5fc456342385@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 11:43 PM, Philippe Mathieu-Daudé wrote:
> Cc'ing Alex for this apparently unrelated test failure:
> 
> make[2]: Entering directory 'build/tests/tcg/arm-linux-user'
> timeout --foreground 60  tests/guest-debug/run-test.py --gdb
> /usr/bin/gdb-multiarch --qemu build/qemu-arm --qargs "" --bin testthread
> --test tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py >
> run-gdbstub-thread-breakpoint.out
> make[2]: *** [tests/tcg/multiarch/Makefile.target:71:
> run-gdbstub-thread-breakpoint] Error 1
> make[1]: *** [tests/tcg/Makefile.qemu:102: run-guest-tests] Error 2
> make: *** [tests/Makefile.include:63: run-tcg-tests-arm-linux-user] Error 2
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/1785024040#L5986

For the record, this one is transient.


r~

