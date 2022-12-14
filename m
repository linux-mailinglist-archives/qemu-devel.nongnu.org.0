Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D1864CDB6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 17:10:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5UKJ-0000dy-2F; Wed, 14 Dec 2022 11:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p5UKH-0000dg-0y
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:09:45 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p5UKF-000787-De
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:09:44 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h11so175220wrw.13
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 08:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2da8+72MOqOGLqfqkcF1yBfebWJ5RM9kvIIzg97GfxE=;
 b=KXJn4PE8CfYrWt98lWeAZEHYEA/4ZMi91UcXHoV6qIoptkCrE7ysVTQfpPd86eR6nA
 XVjU2Z+S2o+ES22ctF5P1lypSAfhJL14Oov116AlzzAVinVdqRjwaIRjxlR+Dwur5XbP
 aarwvxkstwmhGn+apLC9JQsU5To/Y4GViw0FyaALJfi4y5eyBhjDZfealTTVMwkWgXDC
 hkP06uqDNOCAC7fc15IKwBhcIZEeDPhjc4KkpNai+fDCspSN6Rpl7vi6TQXIH1OKnrN6
 2ZVDIS1S4uQefLB19No0q3AQWpmacyy4CHPyCDiEjr+b5Ze97OjOZPngG3SKMphvCSBV
 1VdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2da8+72MOqOGLqfqkcF1yBfebWJ5RM9kvIIzg97GfxE=;
 b=DS6Ih2nJ8jlBDR3RGlzq1Vu/kbjic4aDr5MnB+dYxBS9IZOQ6GsJxlvY0nD6zQ0IhS
 mxW4SkQTgK9URSwv29LTg4FiwXw7YCFiOdpEWb40YtQLb35fb7PzGSrgdnxDYPzt+/Ve
 LdfChhhbBNQwVDVYGKjvenYbh4vgIgJhTegJBRe/UYm6RVs6M3bPguZGc0iYKtMXMl2e
 nf//Hk+xpahMHritf661h7t3ZmSEWIz0j9lj/fVIYg+RsKshrcEo7ZNyAOMBAWIEidhQ
 RbRBDOf0q34fx3e6/W1Hqu2uSYQi5tKtV61e1zcMum4FmmOXNRjroaVoklx+GhzTgdNR
 XZ2w==
X-Gm-Message-State: ANoB5pnbwwI/pnd2zY490g4WXjaDTxxF893V5Xl3o43pZCf5dqIFJoSr
 GfKcC7Xj5LmEL7Gc7IBjl1/YUw==
X-Google-Smtp-Source: AA0mqf5rsK6yeMx56PYMrVxShQDN8xEH4gj3HCftPmQZLMU+eMJtEwZVkdPdViNn1qt6XEypMRZ4+g==
X-Received: by 2002:adf:fcc6:0:b0:242:1ba0:208b with SMTP id
 f6-20020adffcc6000000b002421ba0208bmr16916175wrs.64.1671034181316; 
 Wed, 14 Dec 2022 08:09:41 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k24-20020adfd238000000b002420fe50322sm3262909wrh.91.2022.12.14.08.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 08:09:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 620641FFB7;
 Wed, 14 Dec 2022 16:09:40 +0000 (GMT)
References: <20221214143659.62133-1-philmd@linaro.org>
 <0506350d-c999-9f99-6a55-da45f6949abf@linaro.org>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] gdbstub: Have syscall_complete/[gs]et_reg to target
 agnostic typedefs
Date: Wed, 14 Dec 2022 16:09:28 +0000
In-reply-to: <0506350d-c999-9f99-6a55-da45f6949abf@linaro.org>
Message-ID: <878rjaj7az.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 14/12/22 15:36, Philippe Mathieu-Daud=C3=A9 wrote:
>> Prototypes using gdb_syscall_complete_cb() or gdb_?et_reg_cb()
>> don't depend on "cpu.h", thus are not target-specific.
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> ---
>>   include/exec/gdbstub.h | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> Subject should be:
> "gdbstub: Make syscall_complete/[gs]et_reg target-agnostic typedefs"

Queued to gdbstub/next, thanks.

>
>> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
>> index f667014888..1636fb3841 100644
>> --- a/include/exec/gdbstub.h
>> +++ b/include/exec/gdbstub.h
>> @@ -71,9 +71,6 @@ struct gdb_timeval {
>>     uint64_t tv_usec;   /* microsecond */
>>   } QEMU_PACKED;
>>   -#ifdef NEED_CPU_H
>> -#include "cpu.h"
>> -
>>   typedef void (*gdb_syscall_complete_cb)(CPUState *cpu, uint64_t ret, i=
nt err);
>>     /**
>> @@ -126,6 +123,7 @@ int gdb_handlesig(CPUState *, int);
>>   void gdb_signalled(CPUArchState *, int);
>>   void gdbserver_fork(CPUState *);
>>   #endif
>> +
>>   /* Get or set a register.  Returns the size of the register.  */
>>   typedef int (*gdb_get_reg_cb)(CPUArchState *env, GByteArray *buf, int =
reg);
>>   typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_t *buf, int reg=
);
>> @@ -133,6 +131,9 @@ void gdb_register_coprocessor(CPUState *cpu,
>>                                 gdb_get_reg_cb get_reg, gdb_set_reg_cb s=
et_reg,
>>                                 int num_regs, const char *xml, int g_pos=
);
>>   +#ifdef NEED_CPU_H
>> +#include "cpu.h"
>> +
>>   /*
>>    * The GDB remote protocol transfers values in target byte order. As
>>    * the gdbstub may be batching up several register values we always


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

