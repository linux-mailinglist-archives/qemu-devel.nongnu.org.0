Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D2C5BEFFE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:20:56 +0200 (CEST)
Received: from localhost ([::1]:39312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalbr-0007SY-PR
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oahL2-0004Sx-EQ
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:47:19 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oahL0-0005U0-D2
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:47:15 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r7so5650433wrm.2
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=S4+F3OpfGHZXhWV5h4JTcpv0MwBP1DQ1h7Rjv+r8erk=;
 b=Vq+xDhVhpOsFhLoKSkqPp9yWFBcSsF8wz29zlsc4iov1+e3XMem0Wc4XTIt+QNU8Kv
 mIVJwBW2h+8iJrwYMBVJnWkq/Zwp1/CQTtoqwSJ8JOBLbkZFZn36UtunLBapNNXgA6F5
 1K7WoTarbuDtp3Q8fAh2M7UN8GYfoU6L+qKrpdMRyDgPS+IO3RsRVPsQZ+hhkhBl1zkP
 SW2gVMrql9JTvMjJwFAtIarTYiGD5XVQWHajdsDAnl68rcCOJ5Orsf+EQxOXuluw8JLQ
 bhj9Rz3lWsX7KyI5Aijgv0IbnFtQQOZsy+IZEHs1l5HfPVnsSmQ7C3+ZHtdG3raZhQ/1
 D3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=S4+F3OpfGHZXhWV5h4JTcpv0MwBP1DQ1h7Rjv+r8erk=;
 b=IHljqT6CnQ/e0dotl4AnMyEW+AkUkJrNtBvlckGj34GyR9GjQUhs+tVfVggvyfSdTS
 8RFQLTJFHt4zY1887eYKJKPc9hvBq1PHtyXF93wV4UDt45JcHLSS5lw254PKnHzMHrfZ
 O/kSJxhdPms6+h8wzbmDj58kyKIMMUywytn0as0WsZ5mz8f0NKPAaDOZEpLecTjMwWJB
 u0GUlnnCGDzDSgMRXlbvwdVpGoMEbRUWVP09piZTe0dEooygtR/V7DJa/EK1Oh+XbVlr
 d1VFOrpKs2AbZ9E+ruP9+qp3ZGsq6jF3DlzmGWkc86L2cVy2KXtc6anWwZwSqRZlsMxB
 TA0g==
X-Gm-Message-State: ACrzQf27jxlQ7z/MWKB9a+hpGEYwGlv89d9kDzjtVd9Q77yTJUc27QaA
 UPz4+Hq5KE3S/LOaRcXKxqk=
X-Google-Smtp-Source: AMsMyM7VJaz4HpgJY5h+6o+/55jZDcgrN//kXKIKLHTttx9FyUTccPZtGLCCpLWPd34YjEvXCK1vvw==
X-Received: by 2002:a05:6000:80a:b0:229:4632:d1d1 with SMTP id
 bt10-20020a056000080a00b002294632d1d1mr15456953wrb.73.1663696032582; 
 Tue, 20 Sep 2022 10:47:12 -0700 (PDT)
Received: from [192.168.232.175] (29.red-88-29-182.dynamicip.rima-tde.net.
 [88.29.182.29]) by smtp.gmail.com with ESMTPSA id
 bx29-20020a5d5b1d000000b0021f131de6aesm428786wrb.34.2022.09.20.10.47.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 10:47:12 -0700 (PDT)
Message-ID: <9223398d-b890-2d35-57de-900428f00c71@amsat.org>
Date: Tue, 20 Sep 2022 19:47:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 4/4] target/m68k: always call gen_exit_tb() after writes
 to SR
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 lucienmp.qemu@gmail.com, qemu-devel@nongnu.org
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
 <20220917112515.83905-5-mark.cave-ayland@ilande.co.uk>
 <a7eca9e4-e08d-a903-92ec-3ed49c233d5c@amsat.org>
 <d38085fa-d062-d6d7-3098-7933cd099c1d@linaro.org>
In-Reply-To: <d38085fa-d062-d6d7-3098-7933cd099c1d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.182,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 19/9/22 10:13, Richard Henderson wrote:
> On 9/18/22 00:29, Philippe Mathieu-Daudé wrote:
>> On 17/9/22 13:25, Mark Cave-Ayland wrote:
>>> Any write to SR can change the security state so always call 
>>> gen_exit_tb() when
>>> this occurs. In particular MacOS makes use of andiw/oriw in a few 
>>> places to
>>> handle the switch between user and supervisor mode.
>>
>> Shouldn't be safer to add the gen_exit_tb() call in gen_set_sr[_im]()?
> 
> No.  For halt we need to raise EXCP_HLT.

Right, I should have looked at translate.c; I also noticed the ccr_only
flag. So:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

