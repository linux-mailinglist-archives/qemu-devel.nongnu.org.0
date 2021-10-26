Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CCF43AA25
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 04:16:20 +0200 (CEST)
Received: from localhost ([::1]:40368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfC0h-0002fi-DJ
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 22:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfByd-000203-Pl
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 22:14:11 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:34791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfByc-0006vY-0v
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 22:14:11 -0400
Received: by mail-pg1-x52a.google.com with SMTP id h193so12569587pgc.1
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 19:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9juIETVb395kyLfxoiQ+aILUwEdPrcJrV7UAe9Q4JMk=;
 b=z45Y4bHyw8gFbXf1ttAEL4QA4JwK0P+wtFgzHW3oJO1zO0SFUDD0MZkEXo7FX7USGz
 Q5fP7gS4G9wu4Qvp1k11Fy9IcD/4lTziRPPYh+q2Rlk38YWocjMHw2GMFXZcQ0eJ3F6m
 a9txsLzEbrexmpK/IuSh9dveLGFE9IbcgKB2VF6mozDl8zseLlY1AQl+ICO4rAWfJZrH
 i8Vn0DN0dIpCBQdNeQ8geRhLEYttP3/HGPyDnpqHhLtZM8Vq99urwdWHTyMqOcvaQNrw
 n1h5tA/UT3UqGw+P62h7dstNPzCWzYCj9inHSmvCDdr+ou48JPwXhqihCJw3mDxzPzo1
 d8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9juIETVb395kyLfxoiQ+aILUwEdPrcJrV7UAe9Q4JMk=;
 b=v5BAscPERSKlpJ8SqbcsPAL7l0RAOU5QcoKuRil8yd3tBTTiQ0JAUtTp4bsxueDPFE
 FXfOet1n+TutMilLOtOFEZwwD3i6/Got29r21imMvVBcurQbJKiOJwWIfh6trKH/IeTJ
 39T+wuuZXYI8FmFX8sBpvaqhWdugc1QYJvwFdroHpXbAM8awdqau+EkOFgcBkC5FAbj5
 bNil2pfmEt5LQ7fjHlCpjSVt3N3zjIozafBTBwB5KFHaqj7zT1qk7TXq3HyxHOvfjM/Z
 YL2BdFrI2SHRnlr8Ec6gYV5i6hE5dp05XoVI7NOY/c+nhwhDIJX1oKuhCSAjWbDBqDzP
 3Qqw==
X-Gm-Message-State: AOAM533AsPK/c5TOIEs5hC5a5m7V+uOphM0BXRX04jPZkpEbxWydWT4d
 BwVrCu8SHxrwtH5Kx65lMSds5Hqoj0jxxA==
X-Google-Smtp-Source: ABdhPJynE9zjGb5f5Ugm/5np5V9SfNybfiWXTr8YzpHXwWkw88g9iewDn3v/uYjolgAjkRTG/d0Shg==
X-Received: by 2002:a05:6a00:150b:b0:47b:d1a4:73e with SMTP id
 q11-20020a056a00150b00b0047bd1a4073emr20046273pfu.8.1635214447722; 
 Mon, 25 Oct 2021 19:14:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c4sm10628472pfl.53.2021.10.25.19.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 19:14:07 -0700 (PDT)
Subject: Re: Commit abb0cd93494 breaks -singlestep -d in_asm,cpu with
 qemu-system-sh4
To: BALATON Zoltan <balaton@eik.bme.hu>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <ec65bc8f-2f99-9f49-d6ee-7b96e67a3a1b@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7c17ee47-1622-0bd0-d294-752eaff849b6@linaro.org>
Date: Mon, 25 Oct 2021 19:14:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ec65bc8f-2f99-9f49-d6ee-7b96e67a3a1b@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 2:16 PM, BALATON Zoltan wrote:
> Hello,
> 
> Commit abb0cd93494 (accel/tcg: Split out log_cpu_exec) seems to have broken -singlestep -d 
> in_asm,cpu output with qemu-system-sh4 after a delay slot. Since that commit I get:
> 
> pc=0xac80003e sr=0x500000f1 pr=0x00000000 fpscr=0x00040001
> spc=0x00000000 ssr=0x00000000 gbr=0x00000000 vbr=0x00000000
> sgr=0x00000000 dbr=0x00000000 delayed_pc=0x00000000 fpul=0x00000000
> r0=0x8cc9d000 r1=0xacc9d000 r2=0xe0000000 r3=0x8c800000
> r4=0x00000000 r5=0x00000000 r6=0x00000000 r7=0x00000000
> r8=0x00000000 r9=0x00000000 r10=0x00000000 r11=0x00000000
> r12=0x00000000 r13=0x00000000 r14=0x00000000 r15=0x00000000
> r16=0x00000000 r17=0x500000f0 r18=0x00000000 r19=0x00000000
> r20=0x00000000 r21=0x00000000 r22=0x00000000 r23=0x00000000
> ----------------
> IN:
> 0xac800040:  bt.s       0xac80001a
> 
> pc=0xac800040 sr=0x500000f1 pr=0x00000000 fpscr=0x00040001
> spc=0x00000000 ssr=0x00000000 gbr=0x00000000 vbr=0x00000000
> sgr=0x00000000 dbr=0x00000000 delayed_pc=0x00000000 fpul=0x00000000
> r0=0x8cc9cfe0 r1=0xacc9d000 r2=0xe0000000 r3=0x8c800000
> r4=0x00000000 r5=0x00000000 r6=0x00000000 r7=0x00000000
> r8=0x00000000 r9=0x00000000 r10=0x00000000 r11=0x00000000
> r12=0x00000000 r13=0x00000000 r14=0x00000000 r15=0x00000000
> r16=0x00000000 r17=0x500000f0 r18=0x00000000 r19=0x00000000
> r20=0x00000000 r21=0x00000000 r22=0x00000000 r23=0x00000000
> ----------------
> IN:
> 0xac800042:  add        #-32,r1
> 
> pc=0xac800042 sr=0x500000f1 pr=0x00000000 fpscr=0x00040001
> spc=0x00000000 ssr=0x00000000 gbr=0x00000000 vbr=0x00000000
> sgr=0x00000000 dbr=0x00000000 delayed_pc=0xac80001a fpul=0x00000000
> r0=0x8cc9cfe0 r1=0xacc9d000 r2=0xe0000000 r3=0x8c800000
> r4=0x00000000 r5=0x00000000 r6=0x00000000 r7=0x00000000
> r8=0x00000000 r9=0x00000000 r10=0x00000000 r11=0x00000000
> r12=0x00000000 r13=0x00000000 r14=0x00000000 r15=0x00000000
> r16=0x00000000 r17=0x500000f0 r18=0x00000000 r19=0x00000000
> r20=0x00000000 r21=0x00000000 r22=0x00000000 r23=0x00000000
> in conditional delay slot (delayed_pc=0xac80001a)
> pc=0xac80001a sr=0x500000f1 pr=0x00000000 fpscr=0x00040001
> spc=0x00000000 ssr=0x00000000 gbr=0x00000000 vbr=0x00000000
> sgr=0x00000000 dbr=0x00000000 delayed_pc=0xac80001a fpul=0x00000000
> r0=0x8cc9cfe0 r1=0xacc9cfe0 r2=0xe0000000 r3=0x8c800000
> r4=0x00000000 r5=0x00000000 r6=0x00000000 r7=0x00000000
> r8=0x00000000 r9=0x00000000 r10=0x00000000 r11=0x00000000
> r12=0x00000000 r13=0x00000000 r14=0x00000000 r15=0x00000000
> r16=0x00000000 r17=0x500000f0 r18=0x00000000 r19=0x00000000
> r20=0x00000000 r21=0x00000000 r22=0x00000000 r23=0x00000000
> pc=0xac80001c sr=0x500000f1 pr=0x00000000 fpscr=0x00040001
> spc=0x00000000 ssr=0x00000000 gbr=0x00000000 vbr=0x00000000
> sgr=0x00000000 dbr=0x00000000 delayed_pc=0xac80001a fpul=0x00000000
> r0=0x8cc9cfe0 r1=0xacc9cfe0 r2=0xe0000000 r3=0x8c800000
> r4=0x00000000 r5=0x00000000 r6=0x00000000 r7=0x00000000
> r8=0x00000000 r9=0x00000000 r10=0x00000000 r11=0x00000000
> r12=0x00000000 r13=0x00000000 r14=0x00000000 r15=0x00000000
> r16=0x00000000 r17=0x500000f0 r18=0x00000000 r19=0x00000000
> r20=0x00000000 r21=0x00000000 r22=0x00000000 r23=0x00000000
> 
> After the first delay slot no more in_asm output is printed.

I don't think it's broken, it's just logging more (lots more) than it used to do -- that 
was part of the changes in that patch set.  If I turn off logging, and let -singlestep run 
by itself, it takes some time but I do get to a login prompt.


r~

