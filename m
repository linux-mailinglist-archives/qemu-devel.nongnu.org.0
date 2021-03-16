Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A42E33D510
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 14:43:17 +0100 (CET)
Received: from localhost ([::1]:43588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM9ye-0000Nq-BY
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 09:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lM9xS-0007w1-FR
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:42:02 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:40842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lM9xQ-00023D-Tw
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:42:02 -0400
Received: by mail-ed1-x535.google.com with SMTP id b16so8802475eds.7
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 06:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JcT4eqprT5+OHjf92cA4zR6YzGQm+E2Vx5l9wB73C3E=;
 b=tdtqYEy29yfMyf7I1aHobYEBu3qCJqQ2vYNfTvOIRMa/+XNcrxFFuRtQPGqx5CSYkP
 lbvi2QMUbt3o1/fVyAvHhgd13U3AYJVrkt7AT2YkebkySrfekQeOBEK72dvJg6YCKTw3
 bzsIydeEPDI+JeUA5jWdI6eONr9vsdummuZexD0cksVx6Holcwv5S7i2y0qKBmjzv1qE
 ri05M6pa+PxwjDYoFhPoXlLtZIdsg3sE8L5RmIgIWLpKoVeCTzBon/059oz83FgtiTvj
 tW+19gWWBynId85Xnm1zdeZozOwyksi9T7UXDKzTqp4+utG7dEXtCpJmS/Nl5+6C7/H6
 DB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JcT4eqprT5+OHjf92cA4zR6YzGQm+E2Vx5l9wB73C3E=;
 b=Q4ZmSTNQr2nOhlXhNsOtrE5rLTR83/kX2bZHtMyPSf8R7jDJ2fTCLxb/bp2bhg1f6D
 FwCxLN/niJoQllY2nvCmZPbHNcu8F+QXsta7XP9r7sX2PTlNbs3YJPk8ceXg0wAl/J7U
 3ad8evbBoJVFE+YIqnReknwaVEmp4kBzPbC/11ux9aRk5e5QmXtg2ZfkBni6LU8DZRAn
 OILQatuXQNxSEeMyrk5tmbQ7h0JngOcM8w7xv2Y/5WK5c9du0X7qRxKP/CKRuD9wp9gq
 IOg7nmJ/V9AKJ3h/YQRObEg1l7PyZb8VGSJu5Tsta1O8N+2KYH3GyA32NAGeCtG22hlu
 Y6Zw==
X-Gm-Message-State: AOAM532xjqgx0jpOye4um7hT2gucbQNfvL7SkN590+QcvD4wgamL9srr
 EHzTyRRs6yxCTBSHxLUiaEuYlQ==
X-Google-Smtp-Source: ABdhPJxEpz8aYgIlGL/rB5Oy/CVAWuwoKjmrmoSuhOPhheYlbOPHdxEIs7xL4b5xXHEXYEX/9Z6oSw==
X-Received: by 2002:a50:cc4a:: with SMTP id n10mr36814349edi.371.1615902119180; 
 Tue, 16 Mar 2021 06:41:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e18sm9377429eji.111.2021.03.16.06.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 06:41:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A7C081FF7E;
 Tue, 16 Mar 2021 13:41:57 +0000 (GMT)
References: <20210312172821.31647-1-alex.bennee@linaro.org>
 <20210312172821.31647-9-alex.bennee@linaro.org>
 <YEuzC5GYBwpef05D@strawberry.localdomain>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH v1 08/14] plugins: add qemu_plugin_cb_flags to kernel-doc
Date: Tue, 16 Mar 2021 13:40:07 +0000
In-reply-to: <YEuzC5GYBwpef05D@strawberry.localdomain>
Message-ID: <87blbj8bbu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: kuhn.chenqun@huawei.com, cota@braap.org, qemu-devel@nongnu.org,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Mar 12 17:28, Alex Benn=C3=A9e wrote:
>> Also add a note to explain currently they are unused.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> I'm personally interested in one clarification below, but don't think
> that affects my:
>
> Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>
>
>> ---
>>  include/qemu/qemu-plugin.h | 16 +++++++++++++---
>>  1 file changed, 13 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>> index 9ae3940d89..c98866a637 100644
>> --- a/include/qemu/qemu-plugin.h
>> +++ b/include/qemu/qemu-plugin.h
>> @@ -207,10 +207,20 @@ struct qemu_plugin_tb;
>>  /** struct qemu_plugin_insn - Opaque handle for a translated instructio=
n */
>>  struct qemu_plugin_insn;
>>=20=20
>> +/**
>> + * enum qemu_plugin_cb_flags - type of callback
>> + *
>> + * @QEMU_PLUGIN_CB_NO_REGS: callback does not access the CPU's regs
>> + * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
>> + * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
>> + *
>> + * Note: currently unused, plugins cannot read or change system
>> + * register state.
>
> They are unused in the sense that the current plugin interface does not
> provide a way to make use of them. But are they completely free from
> side effects?

They are free of side effects visible to the plugin. Under the covers it
uses the existing TCG_CALL_NO_* mechanics to ensure that register state
is synced to/from TCG temporaries before the callback.

>
> -Aaron


--=20
Alex Benn=C3=A9e

