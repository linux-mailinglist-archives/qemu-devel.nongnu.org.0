Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAA44613EA
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 12:34:13 +0100 (CET)
Received: from localhost ([::1]:36528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrevE-0003ST-47
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 06:34:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mreuT-0002mf-E6
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 06:33:25 -0500
Received: from [2a00:1450:4864:20::435] (port=40679
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mreuR-0004Vx-QX
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 06:33:25 -0500
Received: by mail-wr1-x435.google.com with SMTP id t9so19072048wrx.7
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 03:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=LSJT9fWHIrYPCSKVv1+CbxWLaZzp4ErT9bjHuWZcsVY=;
 b=fr2r2oSNmxu+poy0ir2iNiHb1d9nf0M1zZY9Me9Gz1MApPlvz5gU0XC2CEdzgsUKrf
 UKVFwvUMmIDiQ0MACxtPCzjdrv+C1hrGvNoyrgLH0IgyJ3zshE+zoe4ldtEhBej1SWOB
 dpjNSikqE7gju3GOslB1AxFrXQG4PUrjC5dnYouqGDLsQERY83Qk01Tg4sSRuxbOX8kK
 fSjyBhXBWM882uMRNIha/BA06bq5lytg6goV8H34hcjRBxKKkmz76Ei/qP/YZYJFFDcs
 Fa/EW+0NT7+SDju74tBMQ/dEKieoB9FXEduqHjdhSWrkl9Rh8GOHhzSwXqXusSwrgBxc
 yzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=LSJT9fWHIrYPCSKVv1+CbxWLaZzp4ErT9bjHuWZcsVY=;
 b=vMezNDSU6CbE34sNl358YQQ7w3faFJ767MSHZuBRIO2LR44TYyatwPR/rOsmMwW+3z
 FvUgzX1JWZTaOJLL83QR3FU7T9lhrvYOPXcdjwgHsKqEqCSnTxnYw+5tAPASCyZQcEd/
 zFuMWJtlADxMfI8ZS17zALdaZp38k69GRAEcFOOSPUpJBLxUeD6NRaA8Yth6mmyWJ40C
 qp4c1iTmMSauEacN6NbjpYEpdPVZlNQPAf8Vx4UyPRLFVjlmYDTnP6IDc2+4LYb/ZhhV
 7VtV2QxrzlFPKJdMsiODUGqhWCckBvixItdtNXm60PmhDcTypnDmoBeT2GZqJJGLZjKt
 aE8Q==
X-Gm-Message-State: AOAM530qoCdQTSp6nP8SbXOzZyR03zNCaksuKMQN2evkyBJscSI6D35D
 Tf/c+1iFnNsGNtbm5QaVtG3eTw==
X-Google-Smtp-Source: ABdhPJwpGgLwXr3TBB0HvGxRafyGAqSzAxJHesTGs4UfZpAk9U8JMlZ6WhPwlfXMKsS3ubksakvXlA==
X-Received: by 2002:a5d:5385:: with SMTP id d5mr32201902wrv.132.1638185602152; 
 Mon, 29 Nov 2021 03:33:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s63sm15461808wme.22.2021.11.29.03.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 03:33:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C06171FF96;
 Mon, 29 Nov 2021 11:33:20 +0000 (GMT)
References: <20211125154144.2904741-1-alex.bennee@linaro.org>
 <20211125154144.2904741-3-alex.bennee@linaro.org>
 <5c283ce4-1583-5f40-3468-f818b909f210@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 2/7] accel/tcg: suppress IRQ check for special TBs
Date: Mon, 29 Nov 2021 11:33:01 +0000
In-reply-to: <5c283ce4-1583-5f40-3468-f818b909f210@linaro.org>
Message-ID: <87v90byz5r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 11/25/21 4:41 PM, Alex Benn=C3=A9e wrote:
>> @@ -1738,7 +1738,7 @@ tb_invalidate_phys_page_range__locked(struct page_=
collection *pages,
>>       if (current_tb_modified) {
>>           page_collection_unlock(pages);
>>           /* Force execution of one insn next time.  */
>> -        cpu->cflags_next_tb =3D 1 | curr_cflags(cpu);
>> +        cpu->cflags_next_tb =3D 1 | CF_NOIRQ | curr_cflags(cpu);
>>           mmap_unlock();
>>           cpu_loop_exit_noexc(cpu);
>>       }
>
> There's another instance in tb_invalidate_phys_page.
>
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 314f8b439c..b43f92e900 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -946,7 +946,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr,=
 vaddr len,
>>                   cpu_loop_exit(cpu);
>>               } else {
>>                   /* Force execution of one insn next time.  */
>> -                cpu->cflags_next_tb =3D 1 | CF_LAST_IO | curr_cflags(cp=
u);
>> +                cpu->cflags_next_tb =3D 1 | CF_LAST_IO | CF_NOIRQ | cur=
r_cflags(cpu);
>>                   mmap_unlock();
>>                   cpu_loop_exit_noexc(cpu);
>>               }
>
> And a second instance in this function.

I had skipped this one as icount was in effect but I guess it can't hurt.

--=20
Alex Benn=C3=A9e

