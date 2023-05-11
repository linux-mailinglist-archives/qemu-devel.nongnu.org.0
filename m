Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E720C6FF2C1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 15:26:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px6He-0007ub-CY; Thu, 11 May 2023 09:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px6Hb-0007uA-NN
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:24:35 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px6Ha-00032I-27
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:24:35 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-306f2b42a86so5681513f8f.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 06:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683811472; x=1686403472;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tQNoxzGfkYt4h3RDyx6EMouW2T0Zlu9DWRgWcBQyp7Q=;
 b=rHW82tNge9MQ9R2wiUDFzRIuQt2fUaRRoDMwL5SFxtj6gWqourcm8mFV74SG0L9F4i
 kKh7itPW68kRq8iHx31sE3fu7B8sKyDFygkokAuqdhHaBlbiqiyc0sPNpH8gQVvsNAhG
 HlzMw0G8mhXKH4iJUX+r6ius6B2lOKGY1cHxHSBfiukSOdcL0pV3UdOsDwKEf/WnNEHp
 x3xd+01SE+P9GyPWfd4OJA2M3ob7B8MeLxopXY6t5Fypty3LKumOah3O5wXXQRgMmk4I
 7baJLYG2Uve/GzUwmsIYiIqfIYVdpfBGwclmaBEZNUwdNenhHrJNyAcrZRmpRfdGBO4i
 CjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683811472; x=1686403472;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tQNoxzGfkYt4h3RDyx6EMouW2T0Zlu9DWRgWcBQyp7Q=;
 b=b67lw9Gx/yQqncC5fLqYSFRYLisoCgRXXavhH+8VxAb/W0MUfnQT4wo628EoDJCw94
 A6fr57FOWN3qiAVyQGkYpxFAj9QT5pqOs1xWzt/fLul+2oBLeuug9PsACZW5fvLaF6ZN
 CxP3WZVuoLON405ZyMpGIhFsQulks+vrXkfPe5vJWbY49wlsYU5fJXmYc+kmKyCXm0sd
 By5oNLE9vjR+6Xu7A9HuUzTE65QthzGIaeOTrQzo4oy38X599zlWXP8CBC/o7gM49PJ1
 FrDRLxhBMSMoY14KKm4XqUdQb43eDIQCQ9MRS/yMx4YAftUGms7mUzB+eKphNvpy4TlM
 IpVA==
X-Gm-Message-State: AC+VfDw+GA2UG0zoA4MyG4BRTshm1v+LVuc5V6hK677EcH6YNEwukHV6
 t1j3cX1qo3rKXTHCZBH8hjsPDg==
X-Google-Smtp-Source: ACHHUZ6dYXjVVwczsp9C2GsmJOfwYK20QbLXjl4vGa22FwfRGMDc6wydwqgL4zR737AaF6FDmI0Ekg==
X-Received: by 2002:a5d:58e9:0:b0:306:340c:4737 with SMTP id
 f9-20020a5d58e9000000b00306340c4737mr14060508wrd.67.1683811472174; 
 Thu, 11 May 2023 06:24:32 -0700 (PDT)
Received: from [192.168.110.227] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q13-20020adff78d000000b002cea9d931e6sm20448254wrp.78.2023.05.11.06.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 06:24:31 -0700 (PDT)
Message-ID: <e795151f-8eee-42f6-542f-e589dfc8e509@linaro.org>
Date: Thu, 11 May 2023 14:24:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 11/15] include/exec: Change reserved_va semantics to last
 byte
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
 <20230328225806.2278728-12-richard.henderson@linaro.org>
 <49a92210-ee40-e284-7bf8-ca3c13d2c087@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <49a92210-ee40-e284-7bf8-ca3c13d2c087@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/11/23 12:48, Laurent Vivier wrote:
> This patch breaks something.
> 
> In LTP (20230127), fcntl36 fails now (all archs):
> 
> sudo unshare --time --ipc --uts --pid --fork --kill-child --mount --mount-proc --root 
> chroot/m68k/sid
> # /opt/ltp/testcases/bin/fcntl36
> 
> tst_test.c:1558: TINFO: Timeout per run is 0h 00m 30s
> fcntl36.c:288: TINFO: OFD read lock vs OFD write lock
> tst_kernel.c:87: TINFO: uname.machine=m68k kernel is 32bit
> fcntl36.c:366: TPASS: Access between threads synchronized
> fcntl36.c:288: TINFO: OFD write lock vs POSIX write lock
> fcntl36.c:318: TBROK: pthread_create(0x40800330,(nil),0x80004328,0x40800068) failed: 
> EAGAIN/EWOULDBLOCK

Any idea where the failure is coming from?
I don't see a matching syscall in -strace...


r~

