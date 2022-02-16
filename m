Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1774B86E5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 12:41:10 +0100 (CET)
Received: from localhost ([::1]:50002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKIgH-0005aT-A2
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 06:41:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKIeF-00041d-Es; Wed, 16 Feb 2022 06:39:03 -0500
Received: from [2607:f8b0:4864:20::1034] (port=42952
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKIeD-0002tU-10; Wed, 16 Feb 2022 06:39:03 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 h7-20020a17090a648700b001b927560c2bso2130301pjj.1; 
 Wed, 16 Feb 2022 03:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=9Q05sWssYXubKe3gukgBWinSjY9JHu45EQgffbErzmc=;
 b=Wn7o2COyQe9wEBb9Gbnz4x7A+tE2nVwTEnTcEfm+47glBUxQsPlpHjgChS+Xy6d8Qi
 FulERTwOz3qP+CHiI8ijgGuSHBDolvTwhJOoFKUydLuiGscr83sUwwXlMgC6iIBcoDXC
 vD6L6anQEbkLDoTi/VWqwhmODN5sX/VYe35rKJSGfw9VSsq9D0Rsc+T4TzS5Gszh4w81
 XyKRl/jurxZ46QX+mbQiSc3GwS70z+3nzfDpx8xv5Nkj13f4uZ6fLS/WfWxWJ5XlXL4s
 TxnvmI4moDidT3sfPRclocHNmwCNruPQ90Q6whHzFwPO4RfOCM1Tqii/j4QsKkaxncAP
 5OZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=9Q05sWssYXubKe3gukgBWinSjY9JHu45EQgffbErzmc=;
 b=QcbHevi9qh4pe59ggXKMS5ab2SbnmO/3zJJpCjsJ31Q5q8ehtqfGG8VHeACC+2l6Bw
 uCsS9Nrwu80/ez5xVitufji0cgtTF+2WVKP4zvBN6cXr8kohVHd10rjY0VncQAXKl8vY
 o1l7vnj1LQQsMe1OV3MEGpqwERuV+0fbaBcH0XqUevnjOjbTh8KND7sZcpxBPg8V75IH
 KP2PJLNbru0qcyqlm0pyWBU/uhzIBYIPsrppuZI1bzjY1CgtgZ4IdJwHW4VYncanBngg
 zC0NrRw31Y0SpSlQje9rogQBb3z/D30MDl8POEYanO/Bro+pGNDCW9+YloUX1/Fokutj
 qKTg==
X-Gm-Message-State: AOAM531u0v0Yom1Wt+CY77M+8JOy8Zydj4cmyx5yJExaKIAZHwJg5Mid
 UzPzo0Bau7fNS4ust0AXTKI=
X-Google-Smtp-Source: ABdhPJzQlYO134fkthqI8EBgcpleNeZWGP9muhDQGH/4VUOv+/o4DDbbycQmooo5VzOvTb1vLvSmaA==
X-Received: by 2002:a17:902:d510:b0:14a:f815:a00a with SMTP id
 b16-20020a170902d51000b0014af815a00amr1951885plg.168.1645011539109; 
 Wed, 16 Feb 2022 03:38:59 -0800 (PST)
Received: from localhost (193-116-225-41.tpgi.com.au. [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id g12sm41523603pfm.119.2022.02.16.03.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 03:38:58 -0800 (PST)
Date: Wed, 16 Feb 2022 21:38:53 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 9/9] spapr: implement nested-hv capability for the
 virtual hypervisor
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20220216102545.1808018-1-npiggin@gmail.com>
 <20220216102545.1808018-10-npiggin@gmail.com>
 <e8c5834c-22bc-a33d-832e-566284d1daeb@kaod.org>
In-Reply-To: <e8c5834c-22bc-a33d-832e-566284d1daeb@kaod.org>
MIME-Version: 1.0
Message-Id: <1645011231.6p1nag6ali.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1034.google.com
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
Cc: =?iso-8859-1?q?Daniel=0A?= Henrique Barboza <danielhb413@gmail.com>,
 qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from C=C3=A9dric Le Goater's message of February 16, 2022 8:52 pm:
> On 2/16/22 11:25, Nicholas Piggin wrote:
>> This implements the Nested KVM HV hcall API for spapr under TCG.
>>=20
>> The L2 is switched in when the H_ENTER_NESTED hcall is made, and the
>> L1 is switched back in returned from the hcall when a HV exception
>> is sent to the vhyp. Register state is copied in and out according to
>> the nested KVM HV hcall API specification.
>>=20
>> The hdecr timer is started when the L2 is switched in, and it provides
>> the HDEC / 0x980 return to L1.
>>=20
>> The MMU re-uses the bare metal radix 2-level page table walker by
>> using the get_pate method to point the MMU to the nested partition
>> table entry. MMU faults due to partition scope errors raise HV
>> exceptions and accordingly are routed back to the L1.
>>=20
>> The MMU does not tag translations for the L1 (direct) vs L2 (nested)
>> guests, so the TLB is flushed on any L1<->L2 transition (hcall entry
>> and exit).>
>> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Some last comments below,

[...]

>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index edbf3eeed0..852fe61b36 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -199,6 +199,9 @@ struct SpaprMachineState {
>>       bool has_graphics;
>>       uint32_t vsmt;       /* Virtual SMT mode (KVM's "core stride") */
>>  =20
>> +    /* Nested HV support (TCG only) */
>> +    uint64_t nested_ptcr;
>> +
>=20
> this is new state to migrate.
>=20

[...]

>> +/* Linux 64-bit powerpc pt_regs struct, used by nested HV */
>> +struct kvmppc_pt_regs {
>> +    uint64_t gpr[32];
>> +    uint64_t nip;
>> +    uint64_t msr;
>> +    uint64_t orig_gpr3;    /* Used for restarting system calls */
>> +    uint64_t ctr;
>> +    uint64_t link;
>> +    uint64_t xer;
>> +    uint64_t ccr;
>> +    uint64_t softe;        /* Soft enabled/disabled */
>> +    uint64_t trap;         /* Reason for being here */
>> +    uint64_t dar;          /* Fault registers */
>> +    uint64_t dsisr;        /* on 4xx/Book-E used for ESR */
>> +    uint64_t result;       /* Result of a system call */
>> +};
>=20
> I think we need to start moving all the spapr hcall definitions under
> spapr_hcall.h. It can come later.

Sure.

[...]

>> diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_=
core.h
>> index dab3dfc76c..b560514560 100644
>> --- a/include/hw/ppc/spapr_cpu_core.h
>> +++ b/include/hw/ppc/spapr_cpu_core.h
>> @@ -48,6 +48,11 @@ typedef struct SpaprCpuState {
>>       bool prod; /* not migrated, only used to improve dispatch latencie=
s */
>>       struct ICPState *icp;
>>       struct XiveTCTX *tctx;
>> +
>> +    /* Fields for nested-HV support */
>> +    bool in_nested; /* true while the L2 is executing */
>> +    CPUPPCState *nested_host_state; /* holds the L1 state while L2 exec=
utes */
>> +    int64_t nested_tb_offset; /* L1->L2 TB offset */
>=20
> This needs a new vmstate.

How about instead of the vmstate (we would need all the L1 state in
nested_host_state as well), we just add a migration blocker in the
L2 entry path. We could limit the max hdecr to say 1 second to
ensure it unblocks before long.

I know migration blockers are not preferred but in this case it gives
us some iterations to debug and optimise first, which might change
the data to migrate.

Thanks,
Nick

