Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183D7323442
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 00:44:30 +0100 (CET)
Received: from localhost ([::1]:35002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEhLw-0000f1-4Z
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 18:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEhKw-0000Cr-C2
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 18:43:26 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEhKu-0007cQ-QR
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 18:43:26 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v15so129506wrx.4
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 15:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s61vY0sq9X7elMAyx6v69ZJl3xMacukqvSErGzDm8As=;
 b=ki7dhcZvCBQJj5hDKV27Ye7MmTYq0yr5UUuabxZwR2EEUHsrK6FfW6fsmZlLV2PAVe
 sawDYLfkTornaR3lSfQfVG+UMrXsu4X+RhLAkVGFgFZVsIXgfowP0Pv98O1jkln2Lc4Z
 BBHjlajDI+axfyQ1A/nAQWn8hnKbChZDeYDr52yh6E6S6c06bkTOpvZ6l6bJOolOVOm/
 /ntXHZmlBOm3KNzC5Fui7FfRFSaLgaKiWtkVCbyn5Ao3oF3Hat/RmtVqFtKpUpj5rSxE
 1op62rq1fe6RRtGt/wmqWbH9vc1U3Yh10WW5+rBk6/IsrYDh7kCRYyfbe7Wofs6rxrSB
 a6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s61vY0sq9X7elMAyx6v69ZJl3xMacukqvSErGzDm8As=;
 b=rWftEJwzGJeAaZrs8papBYjLUk1PcyC2Wj1GHU5kXNk3l4O4ARYnHKr1izet8s1Bh+
 ZGpj9WAH8ALqs6C776zgICGHMs5ovzwe9VdOPaIiI1sjM0ydnNLm3g6tcLiRCxWMCPRl
 kU6q6YVbYKFoYaAD7WDa7t2lPHJgz6bJXHjUWH81jpXRltg6NEb2fCenoGL1YD3k14e+
 uSjF3AYrUCkVVIYFKb7XaHHE9plHlkeyKQw2A4RraGaonmDeD+xwLpaqfCYEKaDXPkkl
 JPfW+9QurTVeouaobD+vPNw7IunmhQGqqhmH4CCUFnjC9P+C7FxNkUkbLbaHkXHN2/0U
 fTaA==
X-Gm-Message-State: AOAM530qmSb1Vku/k0WZEk6udqUS/f6X7vUmUM/AGCSA+bml7uxBCgIi
 U2eRASdlhYl0x0+ATHE2waw=
X-Google-Smtp-Source: ABdhPJzfwJinDWsPdigvGlQlrfjMG9Mz06AgseT9z6vjwDiecmY/bMXGc4kbhGMjnyIeQWpFQcRizA==
X-Received: by 2002:adf:fac7:: with SMTP id a7mr27844613wrs.206.1614123802873; 
 Tue, 23 Feb 2021 15:43:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v18sm186805wml.45.2021.02.23.15.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 15:43:22 -0800 (PST)
Subject: Re: softmmu vs sysemu [Was: Re: [RFC v1 06/38] target/arm: split off
 cpu-softmmu.c]
To: Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-7-cfontana@suse.de> <87blcc57rj.fsf@linaro.org>
 <e7f21ff9-b2c6-668e-c973-d2949b81327e@suse.de>
 <2765ff1d-8b77-c2c8-c48a-dc2f582d80ff@redhat.com>
 <477a7799-cb25-afa7-c280-09d839a2b180@suse.de>
 <a6682a0f-5993-ed12-98d7-0c8f59385bbd@suse.de>
 <0a47d627-fda8-54c7-dbf8-2ebfc9000137@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9dee8138-2088-33ba-b941-494c64925004@amsat.org>
Date: Wed, 24 Feb 2021 00:43:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0a47d627-fda8-54c7-dbf8-2ebfc9000137@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@centriq4.arch.suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 7:51 PM, Richard Henderson wrote:
> On 2/23/21 10:18 AM, Claudio Fontana wrote:
>> I am all for "just getting it done", but here the i386 and the arm series become a mixture of things that I am not comfortable with,
>> I'd prefer a dedicated series..
> 
> You're thinking too deeply about the problem that I'm reporting to you about
> this patch set.
> 
> I just want the file naming done correctly, while you're renaming.  That is
> something you are actively changing in this patch set, so we should get it right.

So what is the new directory structure?

- user/
- sysemu/{tcg,kvm,}/

or

- tcg/a-user.c
- tcg/b-sysemu.c
- kvm/kvm.c

> You don't have to worry about ifdef CONFIG_SOFTMMU vs ifndef CONFIG_USER_ONLY
> within the code itself.

