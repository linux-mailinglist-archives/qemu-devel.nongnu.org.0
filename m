Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987164B7C9C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 02:55:55 +0100 (CET)
Received: from localhost ([::1]:41352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK9Xu-0000fr-Nu
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 20:55:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nK9Sy-0007EU-GP; Tue, 15 Feb 2022 20:50:48 -0500
Received: from [2607:f8b0:4864:20::62b] (port=39739
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nK9Su-0008HZ-6N; Tue, 15 Feb 2022 20:50:47 -0500
Received: by mail-pl1-x62b.google.com with SMTP id w1so820394plb.6;
 Tue, 15 Feb 2022 17:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=tBuB2kKXjlUwdb4hd9viCGXFFViVPS8a9WNjDiQjvRQ=;
 b=LqOxXzRBYrv/k95QD4ZgoHWP9z5Kvxaii+U+t1x//TcZa8SIhWEL2zgThaOVWgoMrc
 CS/qlZX1M3nlgHn+94QLJZot3OWT5Tom3x6+fZWav7+ImKw+zDxgLw/XxXktoQyqBBSm
 mq9Zk91xy5gMGqZ5+7AhAI5pZvW6GO1si7x4AKwFQCzb6zya2RgXXl3LKuYqi6/SznAw
 lBX/ZcnOB81OCa7Bs5FjswAHUHpflmZoMmMwi4OVKZw7voMLelF5mB+9c0gjBnmpehIs
 S7S12uRHZuLDwquSCKFqfiVQ35U+eV6Eg0XD33Gamd8WhWNjEFvMRz5ZwPxQmag5okLv
 y6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=tBuB2kKXjlUwdb4hd9viCGXFFViVPS8a9WNjDiQjvRQ=;
 b=h5hz75lSfagU1xK13YYfIuFf1XKkDHO7GIfYQ9of8UqwUyTAagmOj0Sslop9TFpHWL
 78A81xO+2JK8P+tuLmUVpVI6IZBjZaEVBAtwmlaZThobiBchOBA13BjIoqXsmCnqmOrU
 RsY3lHYN0sZb+TWmpaYaGkFKmHwndvv/eS5Lod0MV1ceekW/LUpLhFhz4mtrtM9WXjNr
 VH8FiAHDsmp+ZUx+IuW1bvHlfO/0l5iHh49y/f9qXyVv19Zv+bKF2O1s47EXQGbiKXCQ
 d3qbgZhYmlsnuWcoV7URbjsfb7w+e8+8nXcv97+GULMcdjaHwFTQQvtckFJiVWIeA24b
 Cpnw==
X-Gm-Message-State: AOAM532KshjHb20TetMNhmdhQrY1cw5CfpMUd59Ij2O8pdPL1fJn6H+J
 7iS2gwupYQDppPlhcoPtK28=
X-Google-Smtp-Source: ABdhPJx6f09b6ZydZ6N91rhiZ99nDx7Qr/3Rqt3EZX31UUn+pt/Pot/w4H0slxqNtOTkpluSQOALtQ==
X-Received: by 2002:a17:90b:2516:b0:1b8:ee0d:7686 with SMTP id
 ns22-20020a17090b251600b001b8ee0d7686mr7514843pjb.135.1644976240132; 
 Tue, 15 Feb 2022 17:50:40 -0800 (PST)
Received: from localhost (60-241-140-189.static.tpgi.com.au. [60.241.140.189])
 by smtp.gmail.com with ESMTPSA id
 t2sm40689428pfg.207.2022.02.15.17.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 17:50:39 -0800 (PST)
Date: Wed, 16 Feb 2022 11:50:34 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] spapr: Add SPAPR_CAP_AIL_MODE_3 for AIL mode 3
 support for H_SET_MODE hcall
To: David Gibson <david@gibson.dropbear.id.au>
References: <20220214111749.1542196-1-npiggin@gmail.com>
 <Ygr9eYymaFJb0nEI@yekko>
In-Reply-To: <Ygr9eYymaFJb0nEI@yekko>
MIME-Version: 1.0
Message-Id: <1644976024.xj3xgh76qi.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62b.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from David Gibson's message of February 15, 2022 11:10 am:
> On Mon, Feb 14, 2022 at 09:17:48PM +1000, Nicholas Piggin wrote:
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index 222c1b6bbd..5dec056796 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -811,32 +811,35 @@ static target_ulong h_set_mode_resource_le(PowerPC=
CPU *cpu,
>>  }
>> =20
>>  static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *cpu=
,
>> +                                                        SpaprMachineSta=
te *spapr,
>>                                                          target_ulong mf=
lags,
>>                                                          target_ulong va=
lue1,
>>                                                          target_ulong va=
lue2)
>>  {
>> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
>> -
>> -    if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
>> -        return H_P2;
>> -    }
>>      if (value1) {
>>          return H_P3;
>>      }
>> +
>>      if (value2) {
>>          return H_P4;
>>      }
>> =20
>> -    if (mflags =3D=3D 1) {
>> -        /* AIL=3D1 is reserved in POWER8/POWER9/POWER10 */
>> +    /* AIL-1 is not architected, and AIL-2 is not supported by QEMU. */
>> +    if (mflags =3D=3D 1 || mflags =3D=3D 2) {
>=20
> This test is redundant with the one below, isn't it?

Ah, yes.

>=20
>>          return H_UNSUPPORTED_FLAG;
>>      }
>> =20
>> -    if (mflags =3D=3D 2 && (pcc->insns_flags2 & PPC2_ISA310)) {
>> -        /* AIL=3D2 is reserved in POWER10 (ISA v3.1) */
>> +    /* Only 0 and 3 are possible */
>> +    if (mflags !=3D 0 && mflags !=3D 3) {
>>          return H_UNSUPPORTED_FLAG;
>>      }
>> =20
>> +    if (mflags =3D=3D 3) {
>> +        if (!spapr_get_cap(spapr, SPAPR_CAP_AIL_MODE_3)) {
>> +            return H_UNSUPPORTED_FLAG;
>> +        }
>> +    }
>> +
>>      spapr_set_all_lpcrs(mflags << LPCR_AIL_SHIFT, LPCR_AIL);
>> =20
>>      return H_SUCCESS;
>> @@ -853,7 +856,7 @@ static target_ulong h_set_mode(PowerPCCPU *cpu, Spap=
rMachineState *spapr,
>>          ret =3D h_set_mode_resource_le(cpu, spapr, args[0], args[2], ar=
gs[3]);
>>          break;
>>      case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
>> -        ret =3D h_set_mode_resource_addr_trans_mode(cpu, args[0],
>> +        ret =3D h_set_mode_resource_addr_trans_mode(cpu, spapr, args[0]=
,
>>                                                    args[2], args[3]);
>>          break;
>>      }
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index ee7504b976..edbf3eeed0 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -77,8 +77,10 @@ typedef enum {
>>  #define SPAPR_CAP_FWNMI                 0x0A
>>  /* Support H_RPT_INVALIDATE */
>>  #define SPAPR_CAP_RPT_INVALIDATE        0x0B
>> +/* Support for AIL modes */
>> +#define SPAPR_CAP_AIL_MODE_3            0x0C
>>  /* Num Caps */
>> -#define SPAPR_CAP_NUM                   (SPAPR_CAP_RPT_INVALIDATE + 1)
>> +#define SPAPR_CAP_NUM                   (SPAPR_CAP_AIL_MODE_3 + 1)
>> =20
>>  /*
>>   * Capability Values
>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>> index dc93b99189..128bc530d4 100644
>> --- a/target/ppc/kvm.c
>> +++ b/target/ppc/kvm.c
>> @@ -2563,6 +2563,29 @@ int kvmppc_has_cap_rpt_invalidate(void)
>>      return cap_rpt_invalidate;
>>  }
>> =20
>> +int kvmppc_supports_ail_3(void)
>=20
> Returning bool would make more sense, no?

It would.

>=20
>> +{
>> +    PowerPCCPUClass *pcc =3D kvm_ppc_get_host_cpu_class();
>> +
>> +    /*
>> +     * KVM PR only supports AIL-0
>> +     */
>> +    if (kvmppc_is_pr(kvm_state)) {
>> +        return 0;
>> +    }
>> +
>> +    /*
>> +     * KVM HV hosts support AIL-3 on POWER8 and above, except for radix
>> +     * mode on some early POWER9s, but it's not clear how to cover thos=
e
>> +     * without disabling the feature for many.
>> +     */
>> +    if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
>=20
> This effectively means that the pseries machine type simply won't
> start with a !PPC2_ISA207S cpu model.  I'm not sure if we support any
> such CPUs in any case.

Oh, would that at least give an error to disable cap-ail-mode-3?

> If we do, we should probably change the
> default value for this cap based on cpu model in
> default_caps_with_cpu().

We allegedly still support POWER7 KVM in Linux. I've never tested it
and I don't know how much it's used at all. Probably should keep it
working here if possible. I'll look into default_caps_with_cpu().

Thanks,
Nick

