Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB4A539885
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 23:16:32 +0200 (CEST)
Received: from localhost ([::1]:40738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw9E7-0005h3-3b
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 17:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw9Cc-0004vt-Nc
 for qemu-devel@nongnu.org; Tue, 31 May 2022 17:14:58 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:54249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw9Cb-0006xj-5m
 for qemu-devel@nongnu.org; Tue, 31 May 2022 17:14:58 -0400
Received: by mail-pj1-x102d.google.com with SMTP id a10so63086pju.3
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 14:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PzBT5Or+dF30bmkFYcPq8483GzO8qgXHPIR6+G2IzdM=;
 b=d2ulXakIqxynUpilviQrNRUjenre5G8daB/mGuzG2ulGSUJRVaN0/kqQOm+CMEtxJd
 TDg++0DbIN2oo9CmO5HLj7B2xG49awtMuOk9Qp8IS64P8vLTCNgDOBXfJEldW++SiwVq
 u5lB5dwOvJjun0x29WxvNYlYOoSQCaKngn0+RKM96Fq+RK9j0Es5RvunyUhuDJ4+r/yW
 sbnTIO90fVBLZn8SVLfkDLK4YntlKVFcZcN1R+B5HOD9b9EfJR+MWuzeHdYR3hwOZ5uK
 dnaQDIF1Hld2pNQB0A1NYTRvUmJ7kBmL2q+TqcSoIrnc18z6S4iLdZxDkGwXq7FW6w/3
 V5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PzBT5Or+dF30bmkFYcPq8483GzO8qgXHPIR6+G2IzdM=;
 b=ejtk219qf0Id35ow4f+N/waSR8hxHOgJD8rdZXJKvChVWeWcyasn9MvpscijAs8fKE
 LPlqiDsW+auVcmq2BfsR9ydGKGRd1sUPV/+Gwiqgzd1fYcx072JlwGBpjOWHUSPh3mEB
 yUQ37Q9ZxvKQNd0Kb1sVur1JeumYcLkGSxI7gBsJCAlmeSbqKSEsrysLEtpOJqRIQwGC
 L1LwzLQ0kxiQ0bfYqsUed480/aOS37AUuh58QiTndTtQYjtTCBiH2CQJuEiQr5r1xxe7
 Q9FGRx9IwBmCZl7tQ6sfIm5R856Q2L5pacxXJqcoKlaBCsw9iUiE5pI2D0PamcDDgRfb
 /vKw==
X-Gm-Message-State: AOAM531LTCuMN9kNY3ZnZOfubiitRQOxCPCF0bkPZXgBSScdkLYULad2
 ENphCn5girX3dDKc2+/ktFjf8A==
X-Google-Smtp-Source: ABdhPJxzGRQK9+XH0VdyS2shw8J8y9blgR/V71Q4E9A+coYeLz5xQcjdGn3GpVCW2uFqW4xx7K9+zA==
X-Received: by 2002:a17:90a:4cc2:b0:1dd:1010:d10d with SMTP id
 k60-20020a17090a4cc200b001dd1010d10dmr30535274pjh.205.1654031695504; 
 Tue, 31 May 2022 14:14:55 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:4ae9:ceee:85cc:a70c?
 ([2602:ae:1547:e101:4ae9:ceee:85cc:a70c])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902e21300b00162529828aesm2902plb.109.2022.05.31.14.14.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 14:14:54 -0700 (PDT)
Message-ID: <058461d7-904d-d027-2d2c-8ee09a3ab1c4@linaro.org>
Date: Tue, 31 May 2022 14:14:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 10/17] target/m68k: Implement TRAPcc
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
 <20220527164807.135038-11-richard.henderson@linaro.org>
 <34af03f0-6c53-17a3-b91f-d368fd2ef7c3@vivier.eu>
 <f8f38e0b-e99f-40d7-d4c7-7e2dc047d4c8@linaro.org>
 <1ff07914-426c-63d9-c18e-393213c30a72@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <1ff07914-426c-63d9-c18e-393213c30a72@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/31/22 11:05, Laurent Vivier wrote:
>> Hmm.  That will completely hide trapcc -- you should have seen the new test case fail 
>> (and if not, the test case needs fixing).
> 
> I ran "make check", thinking the test is run, and saw no failure...
> and if I run "make check-tcg", I have:
>    make: Nothing to be done for 'check-tcg'.
> so what is the command to run the test?

make check-tcg.

If you get "nothing to be done", configure has not detected any cross-compilers (via 
docker or installed locally).  We usually list detected cross compilers at configure time. 
That's currently broken, but I saw Alex has a fix queued.


r~

