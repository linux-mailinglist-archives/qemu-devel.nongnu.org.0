Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EA54B6140
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 03:59:38 +0100 (CET)
Received: from localhost ([::1]:33422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJo41-0007R9-5L
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 21:59:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJo1m-0006OB-Pa; Mon, 14 Feb 2022 21:57:18 -0500
Received: from [2607:f8b0:4864:20::1032] (port=55170
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJo1k-00081E-E8; Mon, 14 Feb 2022 21:57:18 -0500
Received: by mail-pj1-x1032.google.com with SMTP id b8so4351628pjb.4;
 Mon, 14 Feb 2022 18:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=yHqubugiZxlFfE660JKgUBDyWYoXJH3MLOQkbfhYh1g=;
 b=aP6wgb9qeLU9Cl0E5jut8YkgYiAGGa318HPkdBXEPiWmxaDr0lSOI2pfX5dAWyC5EG
 9woySch0XZ92M21uDLFjAmrb3jBo4eFFZokOSlbv+oUbpgw6zeE8IL6aVnGKaKSog1Jw
 tjWTpgcCP4mTZfjIoEUaVqI3Yv1vBG/0OP4ha+EI4YXeg82wkugu5rmpd3fSS7NVagAm
 wxkHQrM61QuRkec5Pfp58SInWTHD8DcWq4XVICxJMjXYgquIs3KRJao4MQVzoniPxr1E
 l8EFDQzmy7xC2tvNQ8slzBM5BuKuy1Ci8JRMzZEMA12T02jEo0uHLvZysyct61kKIia1
 HW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=yHqubugiZxlFfE660JKgUBDyWYoXJH3MLOQkbfhYh1g=;
 b=UtXEM8UDMTSLdN9ePDtYC0YdjNLZGbEXSFB6GjKV1Kp19JTAS7FOq6hNN9QXNRB2xr
 0i+osZtZO8bRruPBPzBwxpxJdGfvkwHDwbI0C30jdy7W6TgSWbgET/CHRBdHRZxr++9r
 2ZhWGWDxy9rC/HJL/eesVkFgPGYksc06X0d6GlK17TcgQ/TrWyiKQERJKsgdjpbYr+QK
 /AQbshGbdxvOqY9aKaLzCqcHYK1rh7hg7Ap1JKdzm54tuDyIljH6WpOZnGPtzLoY+sRo
 X2H1mMnHx0fcj9vjF60ApHD03HYQCU7urm8Nxw3tU2Lmy0ozHUXqvnFqjujOv7ev+L8e
 Vf9A==
X-Gm-Message-State: AOAM530D1s4mbAnCbmIxzyhU6Cxlnwf/0LbwuJjY/voDdd8nCl6q32jU
 Nc1ssvitICl4zYwziZC8c01NzecMcLo=
X-Google-Smtp-Source: ABdhPJxo1NaZbfQNsbTfSbuK05Yp1dbdEFwPJb4Me3D7PxY6oWykwfGwT+fPPB6vYBQSM4mvoIjh1g==
X-Received: by 2002:a17:90a:af8d:b0:1b9:3807:ce8e with SMTP id
 w13-20020a17090aaf8d00b001b93807ce8emr2082577pjq.62.1644893834572; 
 Mon, 14 Feb 2022 18:57:14 -0800 (PST)
Received: from localhost (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id j185sm36000207pfd.85.2022.02.14.18.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 18:57:14 -0800 (PST)
Date: Tue, 15 Feb 2022 12:57:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 3/3] spapr: implement nested-hv support for the TCG
 virtual hypervisor
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20220210065340.1276367-1-npiggin@gmail.com>
 <20220210065340.1276367-4-npiggin@gmail.com>
 <aaaf8ca4-9685-f600-9082-bc3a80eb59c9@kaod.org>
 <1644881088.rvm7j0emi0.astroid@bobo.none>
In-Reply-To: <1644881088.rvm7j0emi0.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1644893720.zfgyd9jh5k.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Nicholas Piggin's message of February 15, 2022 9:28 am:
> Excerpts from C=C3=A9dric Le Goater's message of February 15, 2022 4:31 a=
m:
>> On 2/10/22 07:53, Nicholas Piggin wrote:
>>> +void spapr_enter_nested(PowerPCCPU *cpu)
>>> +{
>>> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
>>> +    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
>>> +    CPUState *cs =3D CPU(cpu);
>>> +    CPUPPCState *env =3D &cpu->env;
>>> +    target_ulong hv_ptr =3D env->gpr[4];
>>> +    target_ulong regs_ptr =3D env->gpr[5];
>>> +    target_ulong hdec, now =3D cpu_ppc_load_tbl(env);
>>> +    struct kvmppc_hv_guest_state *hvstate;
>>> +    struct kvmppc_hv_guest_state hv_state;
>>> +    struct kvmppc_pt_regs *regs;
>>> +    hwaddr len;
>>> +    uint32_t cr;
>>> +    int i;
>>> +
>>> +    if (cpu->in_spapr_nested) {
>>> +        env->gpr[3] =3D H_FUNCTION;
>>> +        return;
>>> +    }
>>> +    if (spapr->nested_ptcr =3D=3D 0) {
>>> +        env->gpr[3] =3D H_NOT_AVAILABLE;
>>> +        return;
>>> +    }
>>> +
>>> +    len =3D sizeof(*hvstate);
>>> +    hvstate =3D cpu_physical_memory_map(hv_ptr, &len,=20
>>=20
>> Are you writing to the state ? address_space_map() is a better pratice.
>=20
> Yes, in exit_nested it gets written. I'll take a look at=20
> address_space_map().

Hmm, address_space_map() says only use it for reads OR writes. Some o=20
these are doing both.

Why is it better practice to use address_space_map()? I could split the
operations out into read, then write if necessary. For now I will re
submit the series with cpu_physical_memory_map because there has been a
lot of changes and cleanups includng all your and Fabiano's suggestions
except this one so it should make it easier to review.

Thanks,
Nick

