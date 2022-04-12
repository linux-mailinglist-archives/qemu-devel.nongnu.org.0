Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE2C4FDD9B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 13:23:35 +0200 (CEST)
Received: from localhost ([::1]:39682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neEcP-0003X4-Sb
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 07:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1neEZq-0002RS-Jx
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 07:20:55 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1neEZo-0008Uv-0z
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 07:20:53 -0400
Received: by mail-ej1-x62d.google.com with SMTP id g18so11703543ejc.10
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=oOcnboi4+AkLg8hER+MJU2C/13i6+MpSAw+5Hyu1xwA=;
 b=e1xSV7QQi7v1TpYfagbHkQINTdpnn1ytI1CIFd3j0wkzgKJIZ0aThMd/xiycLHXMR3
 L7w/FYaeOzCTajCxKCXKicQsTKgDw7GcykKl16nYi1B3O4u9RLgbtdBYv83xykHxXhal
 WjvMz4Qmz+dPUGiIECbT/q7r/aAfvgHqyjuY3MGH9zuzj4fN0K3omBDYPkaVZb6eaOK3
 WeV2/44ZhTImKhsAyBvfH3sIUgc1N8ffm5f/38I9Tf4HtrzqhciTQyPuazQ5qY9txn6C
 lBeyY6olxpPKt//QR3UCgAQ77uKkSlJYiT0roDY5vl3NQfokof7Dq2FDtmnbAL5CUyx1
 /AZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=oOcnboi4+AkLg8hER+MJU2C/13i6+MpSAw+5Hyu1xwA=;
 b=Fj9RSCe3MONmXTr0Le5NCmVUgjlLcC97AAjcnSmlYgdScodzdsKS/fv6a+vUs2v2c1
 L+2Nj8yweerMg6jNR0wQIg0A2FrWDQcLLt0P9btVrOpGYfBPMzKTZ25T+uozAB4mwD1N
 tNbh4v/7RSTcJF1XzjTi7TnHgDJj3HmVL5Zq4Z+T9XPYGnHm/kWdQemL/2LjEEwoloxv
 w/bbWWLMJX2E90Wq6Tusgh9syuSnxE111EVImI4/JjKynjGJLBuDDezQ8xnkuiFbRL5q
 /VLGRoy6ejZG4Pw1KK6f3sgjJMtFti49LC/f2Sg/d0j5G32tgsDpMJNgybq/5QSHH+Ei
 9AHA==
X-Gm-Message-State: AOAM531YDBmAiXEIVVBjsIXgzrs6GnVZGZqXeddmwVa1k/pks/UA3nq7
 MYIlhcnoQ8q0L1zj8tcyp4Hfcg==
X-Google-Smtp-Source: ABdhPJzhTL0v27ZsbnAT+nfzTNC5cXtadmc+TMeJDXPi7YqNcQfFQc1KGpFJtgXvAnMUXl3mJZ/MiQ==
X-Received: by 2002:a17:906:704f:b0:6e0:2ce5:131e with SMTP id
 r15-20020a170906704f00b006e02ce5131emr32763605ejj.246.1649762449481; 
 Tue, 12 Apr 2022 04:20:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a170906938a00b006e88c811016sm2891249ejx.145.2022.04.12.04.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 04:20:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6B28D1FFB7;
 Tue, 12 Apr 2022 12:20:47 +0100 (BST)
References: <20220412104519.201655-1-alex.bennee@linaro.org>
 <CAFEAcA_j78LD=K=BY+szHK+X0kyh3RXm7ZT4gM2GDmcKTLYeCA@mail.gmail.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] gdb/gic: expose cpu_index via MxTxAttrs
Date: Tue, 12 Apr 2022 12:19:56 +0100
In-reply-to: <CAFEAcA_j78LD=K=BY+szHK+X0kyh3RXm7ZT4gM2GDmcKTLYeCA@mail.gmail.com>
Message-ID: <87o816zgxc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 12 Apr 2022 at 11:45, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> When accessing HW via the gdbstub we can't easily figure out what the
>> cpu_index is. The canonical case is current_cpu but for some cases
>> that will be NULL. For debug accesses we can overload requester_id and
>> make the GIC a bit smarter about fishing that out.
>>
>> [AJB: very much a PoC hack for now but interested if this makes sense.
>> We could encode cpu_index in another field but that would grow
>> MxTxAttrs even more.]
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
>> ---
>>  include/exec/memattrs.h |  2 +-
>>  hw/core/cpu-sysemu.c    | 15 +++++++++++----
>>  hw/intc/arm_gic.c       | 33 +++++++++++++++++++--------------
>>  3 files changed, 31 insertions(+), 19 deletions(-)
>>
>> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
>> index 9fb98bc1ef..1333a34cb3 100644
>> --- a/include/exec/memattrs.h
>> +++ b/include/exec/memattrs.h
>> @@ -43,7 +43,7 @@ typedef struct MemTxAttrs {
>>       * (see MEMTX_ACCESS_ERROR).
>>       */
>>      unsigned int memory:1;
>> -    /* Requester ID (for MSI for example) */
>> +    /* Requester ID (for MSI for example) or cpu_index for debug */
>>      unsigned int requester_id:16;
>
> If we want to provide a requester ID for memory transactions we
> should provide it always, not just for debug. That way gic_get_current_cp=
u()
> and similar code can unconditionally use requester_id and never needs
> to look at current_cpu. (We would also need to figure out how we want
> to parcel out requester_ids in the system, so that PCI requester IDs
> don't clash with CPU requester IDs.)

We could have a requester_type field (0 for CPU, 1 for PCI for now)?

>
> -- PMM


--=20
Alex Benn=C3=A9e

