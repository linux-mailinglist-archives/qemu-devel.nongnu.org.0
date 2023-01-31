Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E7968351D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:23:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMvI1-0004pI-K5; Tue, 31 Jan 2023 13:23:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMvHz-0004oi-Ax
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:23:27 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMvHx-0004r5-MR
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:23:27 -0500
Received: by mail-pg1-x535.google.com with SMTP id g68so10672159pgc.11
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 10:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gp2Qzx24+h0LMZkYpy3auGyFcUp2nHgj/+SeV3UzUwM=;
 b=R3BabV2nkfkHS1VM5VL2zL5omdUqOKsHhbfbVzRiLDaWh2fLzZnSuBw8PCE0DaYwLP
 6U6Y6WElldQr33v99YubIZhxTWRQVoArOAg24woKSp/w0AtzyZnqdsylHl9JJteZqtbr
 sbQaNOTpgdijW2S3O+2jD7UcTSCxBado39nOvGBGRPsRYNx0RmhtR9TT87m3JEXnY1Jr
 GDLd+l4CnNUp5aHiPVpujd4edM4JNjlHp45WrBpblXNSBQZ3vnN8IxEbEEhVTiaWdHSf
 ACI+cqXYfPgCP33wTUy+N3OM3fDZ3lL2bqerrxcDxgvG3nPkQvTk54tXCjIpNg121JZH
 N7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gp2Qzx24+h0LMZkYpy3auGyFcUp2nHgj/+SeV3UzUwM=;
 b=ipg4DUKSNNt8pDsP2kdjBniW8AV4Rpu5bgoJ4bxXeDYotq8ojv/GgksVoesvm2ydoG
 9SE3LHq+/J21Kjq+KBE0QHdM3tjyIJdOYJu41DUwoynjX2rnU7AW9/5GGvO2Q6O1xFMX
 tVOH05yMDOSB0A120rJeeD0w037D1P1mgWMPyecP1aUhuJIuH8qmRWWYoe+UJpIAQHCh
 siIKw1+APgCAqf68ypQ8Ob7uVcm0dboHC7v4hfccGnD526twpxP+afwrSso1FTfEcXCA
 prEy6Wm5yxd8lz9RWNIXfSuHnYRPgJLfN7F4yL2v2woZHu2eSQDYRTSVpFcoPUU3lmat
 7PRg==
X-Gm-Message-State: AO0yUKW89whvydopq5Vj7yfdx3c3aS9uu/u5q924zI792EO2YXF6srRP
 rrt/eTcaQMTzz2v5D7XsjL8vKg==
X-Google-Smtp-Source: AK7set/Amok1yo8IwRj1zryMwgQN6sl2yiANOw0YLF9Y49lfl5/r7scUdZX5b+yFEGxyFTGs9K5H4w==
X-Received: by 2002:aa7:82c5:0:b0:593:6e2f:b859 with SMTP id
 f5-20020aa782c5000000b005936e2fb859mr13110345pfn.4.1675189403967; 
 Tue, 31 Jan 2023 10:23:23 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 w127-20020a628285000000b005939fe1719fsm6278982pfd.39.2023.01.31.10.23.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 10:23:23 -0800 (PST)
Message-ID: <1cf43062-1e18-b7aa-8c85-f1b0afe27708@linaro.org>
Date: Tue, 31 Jan 2023 08:23:19 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 08/14] RISC-V: Adding T-Head MemPair extension
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Kito Cheng <kito.cheng@sifive.com>, Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
References: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
 <20230131180158.2471047-9-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230131180158.2471047-9-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/31/23 08:01, Christoph Muellner wrote:
> +    if ((memop & MO_SIZE) == MO_64) {
> +        addr2 = get_address(ctx, a->rs, 8 + (a->sh2 << shamt));
> +    } else {
> +        addr2 = get_address(ctx, a->rs, 4 + (a->sh2 << shamt));
> +    }

Use memop_size(memop) instead.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

