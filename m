Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A00D51627A
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 09:23:41 +0200 (CEST)
Received: from localhost ([::1]:45352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl3vf-0003vF-Sr
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 03:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl3bk-0004nQ-RR
 for qemu-devel@nongnu.org; Sun, 01 May 2022 03:03:05 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:42688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl3bj-00021i-BM
 for qemu-devel@nongnu.org; Sun, 01 May 2022 03:03:04 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so10530395pjm.1
 for <qemu-devel@nongnu.org>; Sun, 01 May 2022 00:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=iG7hSSSJ3KuSYxO5ZpH6XZO9NTIvx6sz55BEtYBgSzo=;
 b=qq/eHsi7XDUAwm4cGsD0CUO6mILpP1b+vbwQkytpACm+kYyEV3Mx46wver70Pun67B
 iKCq0+KtHCaHu9FyMDa1KBEbGIytSSza1hy2mfE5Yo/LkjFucWkbzDYVlNY9RXkwFwG1
 /BuBnLBqsFSQI0UTxAlUAKQmD2SjhVYO3fafPptBv7JHh1BVUBiJ0sCDv7RNBE6Hp8X8
 XrX5iNvVDk4bx/pfp0IdKZy10Cim6mzigXBox+YXZPiQM3DNysPN6no7VJzxfSOuQHkT
 mByMkUozlh1WfO11IBBdk0IsN/2b3Jd7ZfEdBR/cx7IUme6B/qm6bJChyF/yxOK7UyCO
 +J9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=iG7hSSSJ3KuSYxO5ZpH6XZO9NTIvx6sz55BEtYBgSzo=;
 b=dO10csbTbYjll9PAPimwARyT7zHMYvFJ4sKDDPA2gFdtbxTZZehqMBr1TDS/a1SQE7
 R4Ytek5Ke18hO51py41nWg1m3CnkVLY6CAkQ2XvU9WEeOJLvT6c3ukUyp9uoKPXjZQbz
 wT5pAcD6htCUXj599jkfi+yXL3BSjsLfyyWwooYg5jxP85CvLKdQg/rlRJ87HeYNqXxD
 Usw/LzPxQ+GfAYGD+JieS7ClUgofEMuOUCp9Q2W0LirqHhMnWVaUYEDWRY84Gu9frooQ
 a0IbWE4fbfqlL2PR5U3gtIYkqRemxp7T9GXdC2+wgl/Ly4RbKy+Wpojfy29XQgJIfe3p
 UK5g==
X-Gm-Message-State: AOAM531jgWE7Ws218BpELe+BmY1AfodXHbGThLQYvVa+gn5cEjKxxSf2
 quyJwCr2oVt2WXg95T7AZCTxUmlTD1cXtQ==
X-Google-Smtp-Source: ABdhPJzMgg93gufMmfzl0rFcZF5VGwMngpZEq7jJYfrVsusmhqwG1pGKDpFR7WTGi0qnn4OjCyJ9uw==
X-Received: by 2002:a17:90a:ab81:b0:1ca:8a76:cdda with SMTP id
 n1-20020a17090aab8100b001ca8a76cddamr12183729pjq.26.1651388581794; 
 Sun, 01 May 2022 00:03:01 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 a4-20020aa780c4000000b0050dc76281d9sm2529998pfn.179.2022.05.01.00.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 00:03:01 -0700 (PDT)
Message-ID: <16e6bd42-011b-6164-e35e-448cb7009b6f@linaro.org>
Date: Sun, 1 May 2022 00:02:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 00/43] semihosting cleanup
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220430132932.324018-1-richard.henderson@linaro.org>
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/22 06:28, Richard Henderson wrote:
>    target/m68k: Do semihosting call as a normal helper
>    target/nios2: Do semihosting call as a normal helper

There's a reason not to do this: locking of the iothread mutex, and being back in the main 
loop, where the vm will be stopped while we may wait for a reply from gdb.


r~

