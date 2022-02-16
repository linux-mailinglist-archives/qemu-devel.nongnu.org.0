Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032114B7C07
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 01:41:57 +0100 (CET)
Received: from localhost ([::1]:55232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK8OJ-0006bz-It
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 19:41:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nK8Jj-0005j3-AG; Tue, 15 Feb 2022 19:37:11 -0500
Received: from [2607:f8b0:4864:20::535] (port=43874
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nK8Jf-0003Eb-GV; Tue, 15 Feb 2022 19:37:10 -0500
Received: by mail-pg1-x535.google.com with SMTP id r76so653883pgr.10;
 Tue, 15 Feb 2022 16:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=gnQudgnka2eoJXEKXYHB4cT+RYFn2WnvN/VXMMAJZJM=;
 b=fPSESYRn5ebLTZ89gmq4UtZL/Qp1Hf/oWCsV2JwyeSQDmzP2QdaLAuEUrTSjCVu80a
 tXOXPBvrk8DHsdjIZMGjiu4GvEOgRtWsJB0D+TeML76X54uHWjsbJeYc72ZDv8dVYzMS
 gNG+BsZRsRWVMZGcl7V+okYWr9gpXgmrMAuA7/F0KS8Hy5Lm6m3r1eB/9xa/39c3EX0t
 61igt5a+XOlQGzsoKqHO34DzqmqiXlh9itTnU1CGUqIlNpA/2XapP/ygveA4sUac+/Tq
 /Nm5gb/UvTtN+PG7jVoAiRPQlv3gNh2eYHfvNf0VW3Dx7nww4Hx030yBFuvDZ8Z3roGe
 x5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=gnQudgnka2eoJXEKXYHB4cT+RYFn2WnvN/VXMMAJZJM=;
 b=5uwqiDbsaIcDFEj+PCGYdOgQ4u3A+ZxG6NOi3Md62EOUB8iRBNfQnCN6fT5dAkozxt
 Baved8f4CgJWkhA07q/z/IF8dc9qqyS9pTm7wmvob2V2D6iq8GP3I8bt6K+cPcDMWJgb
 sc1QkBrI839xW7q/qYR3w7JZokYE/hL2oObKPW2pv5zVH8fyfPpS3hukNwGRoyr+Vjnq
 M3YbibU/GjO3MgQ21bO5voEYoRZtRjtILHwHVuKGEa+rzgkTuRDXsyJQwA+UIpMjzk01
 7Bty4B1X6B5b5NBvTVfiXdHH0wt6FjdrYG8nrKBxUebrRYA8kkTGl+4dbQ63tnFwieP/
 iFNw==
X-Gm-Message-State: AOAM532QV/DlupQAvvXEq8vk0DbE7pNc7b1EEo6YxVCOAhHfOBn45wSj
 Gg12XFltcKkDhHfI9xZdDps=
X-Google-Smtp-Source: ABdhPJyd10Ubpn1VWSAwbiEzQRtWmaDPzAwJNrrw9eoxWx0RQEnKgUVJ+hcBg2dG4B2sPkvrvjrRew==
X-Received: by 2002:a63:fb44:0:b0:372:9ec8:745a with SMTP id
 w4-20020a63fb44000000b003729ec8745amr124723pgj.551.1644971824860; 
 Tue, 15 Feb 2022 16:37:04 -0800 (PST)
Received: from localhost (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id m126sm2394156pga.94.2022.02.15.16.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 16:37:04 -0800 (PST)
Date: Wed, 16 Feb 2022 10:36:59 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/9] ppc: allow the hdecr timer to be created/destroyed
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <20220215031642.1691873-4-npiggin@gmail.com>
 <e1817a2f-5520-3709-8cd8-a4e0ee41244c@kaod.org>
In-Reply-To: <e1817a2f-5520-3709-8cd8-a4e0ee41244c@kaod.org>
MIME-Version: 1.0
Message-Id: <1644971502.nnlxqofnxq.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from C=C3=A9dric Le Goater's message of February 16, 2022 4:36 am:
> On 2/15/22 04:16, Nicholas Piggin wrote:
>> Machines which don't emulate the HDEC facility are able to use the
>> timer for something else. Provide functions to start and stop the
>> hdecr timer.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   hw/ppc/ppc.c         | 20 ++++++++++++++++++++
>>   include/hw/ppc/ppc.h |  3 +++
>>   2 files changed, 23 insertions(+)
>>=20
>> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
>> index c6dfc5975f..4bfd413c7f 100644
>> --- a/hw/ppc/ppc.c
>> +++ b/hw/ppc/ppc.c
>> @@ -1083,6 +1083,26 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, u=
int32_t freq)
>>       return &cpu_ppc_set_tb_clk;
>>   }
>>  =20
>> +void cpu_ppc_hdecr_init (CPUPPCState *env)
>=20
> checkpatch will complain ^

It did but I thouht I would keep to existing style. I'll change it.

>=20
>> +{
>> +    PowerPCCPU *cpu =3D env_archcpu(env);
>> +
>> +    assert(env->tb_env->hdecr_timer =3D=3D NULL);
>> +
>> +    env->tb_env->hdecr_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_=
ppc_hdecr_cb,
>> +                                                 cpu);
>> +}
>> +
>=20
> I am not convinced. Can't we start and stop the hdecr on demand ?

timer_mod() for existing hdecr_timer when we do ppc_store_hdecr, but
that shouldn't be used elsewhere in pseries except for nested HV.

Thanks,
Nick

