Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948062BC793
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 18:51:55 +0100 (CET)
Received: from localhost ([::1]:41334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgtWk-0000aH-6C
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 12:51:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgtUi-0007Iu-1r
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 12:49:48 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgtUg-0003hi-B4
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 12:49:47 -0500
Received: by mail-wm1-x342.google.com with SMTP id x13so6280218wmj.1
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 09:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fIzAET5lzbfF2sTP0W1Dgu8KnTmMjg5HiNjdBmthyNk=;
 b=A0yhDucLNE9KOvpq1jHSMHtuYxAotXQTWVDAcK1u9SceE6IO4KAvqV8KRfhHKxlnLW
 6vdBp1Y23yfToFQirmWoOyx51OkTExgkLqSaj9IvnMPfG9vodL6aVAMNWmjOf6lTgdhA
 ste8RTHjxes8V7ftc/abgide/3vL86gB3QHXI8no89Gfov76J/yGqxI60kdeRObF4lHZ
 7jEWOTbzLmboHtsJBaMtqJhHuQN/nKwEbZsIYErPFG64plJIM6javdLyrEr9WoSMg8nV
 LUUYDxvOWSu5cl65/oa6Km/pezCvU7/UQdoMUUA9QLyIvtwO/avNBWV48KCl78ndzzsx
 kM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fIzAET5lzbfF2sTP0W1Dgu8KnTmMjg5HiNjdBmthyNk=;
 b=T/I0B7ilwHpLCG7J7XkyiYWG2Gl+1jL1Z2MN0UhR4w7+70vuAR025zv6pRPX5JiWAs
 lAmAxp5MVCwwsZkzgu9LiHpc4XXD61U5yGAqqhYG0wbTPQsEWpf+74W7KFDgV+CR77sx
 JbMlKm8F76LKfm9f56SLuzVLYGUliNPB5ryN61tVQwpQIysCyKmIsCs5/OEuJxy2e6MK
 vegwDIej5m7QN/kPVWANvS8BKlvSKSHs80FWIzQ1gUrpxh2CCIQNSpCWsuTDY7H+RPQD
 ssZBW8UObCDXX77BegxLbPFldCt4N3QepcblHywuTtbLElzRgiX6MvVPgRtbZySackrH
 v8QQ==
X-Gm-Message-State: AOAM531KuVJf7i13YQJY9NuDb86avgkFUsztsTmjZ+ZSQ2wBCjLc8fDP
 I27vuzqjY3rpZt9iMow0A2M=
X-Google-Smtp-Source: ABdhPJz5g9ey+jooZrhHfgBaMzywTzoxXMjA/2DcMKCR+/fInmKBP1Q8CTloVbqXxA1LhB9/l4m73g==
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr20997380wma.154.1606067384842; 
 Sun, 22 Nov 2020 09:49:44 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id u203sm11534629wme.32.2020.11.22.09.49.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2020 09:49:43 -0800 (PST)
Subject: Re: [PATCH 19/26] target/mips: Extract Loongson EXTensions
 translation routines
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-20-f4bug@amsat.org>
 <b520ffe3-1d98-88f7-895e-23e374bc2b4e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b6c4e1af-d72b-c024-c194-857db458f955@amsat.org>
Date: Sun, 22 Nov 2020 18:49:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b520ffe3-1d98-88f7-895e-23e374bc2b4e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/20 9:10 PM, Richard Henderson wrote:
> On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
>> LoongEXTs are general-purpose extensions from the LoongISA.
>>
>> Extract 440 lines of translation routines to
>> 'vendor-loong-lext_translate.c.inc'.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  target/mips/translate.c                       | 440 +----------------
>>  target/mips/vendor-loong-lext_translate.c.inc | 450 ++++++++++++++++++
>>  2 files changed, 451 insertions(+), 439 deletions(-)
>>  create mode 100644 target/mips/vendor-loong-lext_translate.c.inc
> 
> s/lext/ext/?  Seems silly to have loong in there twice.

OK (this is listed as LoongEXT32/LoongEXT64 in the datasheets).

> And I presume this is where gen_loong_integer goes?

Yes.

> 
> 
> r~
> 

