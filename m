Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BD14C0D87
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 08:45:42 +0100 (CET)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMmLE-00021b-Qy
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 02:45:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nMmHw-0000CK-3N; Wed, 23 Feb 2022 02:42:17 -0500
Received: from [2607:f8b0:4864:20::42e] (port=36575
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nMmHu-0005Hc-Gw; Wed, 23 Feb 2022 02:42:15 -0500
Received: by mail-pf1-x42e.google.com with SMTP id z16so14575984pfh.3;
 Tue, 22 Feb 2022 23:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ekOIikJrpXz0oT3PGHpejgz6LDx55TdL8Xs7Zilmq9A=;
 b=P4w2sUBNbaTPkww/UykWoTxZpZjp5rbu9ZkyFgs9lKiLARmR0clesHaFau+JjIiAbx
 D0ZQR3etrPAPzno/6Ota/VUoR7LritL+pEDNWB9r2+2e4u9xlD87iGedXZe6JBG9yHmt
 F8tgL45I9+KCvn/DbbPtRJ1Jp8rtaiI9kAXBAd7sJX9mL8BNt0bk/QssTAd8uVzfQ8rR
 8Kn5to/2QxSywH0HRmiK+KjE5cvkhCSXzXZRksLajpIJ6bqt4XuwcRzWmYAXgNnXbch5
 9MU7txLuyNbFHChW532SlyFA7SFyWPY0IhaGErJkRapx7Ers9fnkmEpSzP9JcMYyAEF0
 S3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ekOIikJrpXz0oT3PGHpejgz6LDx55TdL8Xs7Zilmq9A=;
 b=hFD8eanKlXT0ORPbz7Gm8zlGxYgBhomIUkj4XifZgw1Xg1sZjxbXfXOQwKJGHfqHuE
 Ay+nkp8Z8Qeg9krf6SqMNGbB/m1RweuwGeIVIhI+zRhOCzs25djhNLmR8I+i33RmdUvF
 cAaNOlPzaKPjzXny2K59IOmOCtWM/dBJZI6lW5q75RZswANYpFVMKKcC1IgKXCIfXYtz
 K2lt9Ecrjaz1WFhBBcC5LqPXPfF4BfnDZg45mQmhKSpnkim0WL9Sp7Au7TTxqlRqoIVv
 VudtNBlW2LL1qzhyhY3ZJ4kiCWZiRQUcE0eIIEHQdCXzZ+u8ql1PtUo56xSVCbBkGdet
 MLow==
X-Gm-Message-State: AOAM531oYEgiVadYyhv6XOYpGtUtQcid51EmazZ/S3lHwfhns0hMGPcA
 geWiQPKgOHds7tWU18vO7KM=
X-Google-Smtp-Source: ABdhPJw/+48Lcdc+S1HiLOmtwWN+I9HMSQRqJ6/lD3OsMdX8UGt6CfaqLWux1IZB0l2XxjUvMGeuuQ==
X-Received: by 2002:a63:221f:0:b0:374:7286:446a with SMTP id
 i31-20020a63221f000000b003747286446amr6216094pgi.538.1645602131911; 
 Tue, 22 Feb 2022 23:42:11 -0800 (PST)
Received: from localhost (60-240-120-95.tpgi.com.au. [60.240.120.95])
 by smtp.gmail.com with ESMTPSA id q2sm20835063pfu.160.2022.02.22.23.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 23:42:11 -0800 (PST)
Date: Wed, 23 Feb 2022 17:42:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 2/3] spapr: Add SPAPR_CAP_AIL_MODE_3 for AIL mode 3
 support for H_SET_MODE hcall
To: David Gibson <david@gibson.dropbear.id.au>
References: <20220216063903.1782281-1-npiggin@gmail.com>
 <20220216063903.1782281-2-npiggin@gmail.com> <Yg2UBtTXneXhDdHz@yekko>
In-Reply-To: <Yg2UBtTXneXhDdHz@yekko>
MIME-Version: 1.0
Message-Id: <1645601745.av9rgobn2v.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from David Gibson's message of February 17, 2022 10:17 am:
> On Wed, Feb 16, 2022 at 04:39:02PM +1000, Nicholas Piggin wrote:
>> The behaviour of the Address Translation Mode on Interrupt resource is
>> not consistently supported by all CPU versions or all KVM versions:
>> KVM-HV does not support mode 2, and does not support mode 3 on POWER7 or
>> early POWER9 processesors. KVM PR only supports mode 0. TCG supports all
>> modes (0, 2, 3). This leads to inconsistencies in guest behaviour and
>> could cause problems migrating guests.
>>=20
>> This was not noticable for Linux guests for a long time because the
>> kernel only uses modes 0 and 3, and it used to consider AIL-3 to be
>> advisory in that it would always keep the AIL-0 vectors around. Recent
>> Linux guests depend on the AIL mode working as specified in order to
>> support the SCV facility interrupt. If AIL-3 can not be provided, then
>> Linux must be given an error so it can disable the SCV facility, rather
>> than silently failing.
>>=20
>> Add the ail-mode-3 capability to specify that AIL-3 is supported. AIL-0
>> is implied as the baseline, and AIL-2 is no longer supported by spapr.
>> AIL-2 is not known to be used by any software, but support in TCG could
>> be restored with an ail-mode-2 capability quite easily if a regression
>> is reported.
>>=20
>> Modify the H_SET_MODE Address Translation Mode on Interrupt resource
>> handler to check capabilities and correctly return error if not
>> supported.
>>=20
>> A heuristic is added for KVM to determine AIL-3 support before the
>> introduction of a new KVM CAP, because blanket disabling AIL-3 has too
>> much performance cost.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>=20
> [snip]
>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>> index dc93b99189..1338c41f8f 100644
>> --- a/target/ppc/kvm.c
>> +++ b/target/ppc/kvm.c
>> @@ -2563,6 +2563,35 @@ int kvmppc_has_cap_rpt_invalidate(void)
>>      return cap_rpt_invalidate;
>>  }
>> =20
>> +bool kvmppc_supports_ail_3(void)
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
>> +     * mode on some early POWER9s.
>> +     */
>> +    if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
>> +        return 0;
>> +    }
>> +
>> +    /* These tests match the CPU_FTR_P9_RADIX_PREFETCH_BUG flag in Linu=
x */
>> +    if (((pcc->pvr & 0xffffff00) =3D=3D CPU_POWERPC_POWER9_DD1) ||
>> +        ((pcc->pvr & 0xffffff00) =3D=3D CPU_POWERPC_POWER9_DD20) ||
>> +        ((pcc->pvr & 0xffffff00) =3D=3D CPU_POWERPC_POWER9_DD21)) {
>> +        return 0;
>> +    }
>=20
> Deducing what KVM supports rather than getting it to tell us
> explicitly with a cap is usually frowned upon.  However, given the
> earlier discussion, I'm satisfied that this is the least bad available
> option, at least for now.

BTW this particular test doesn't work as I hoped because we only have
a power9 dd2.0 model.

Adding a 2.2 or 2.3 would be possible. Maybe overkill.  I'll change
the test just to catch all POWER9 for now.

KVM cap has been allocated in the upstream kvm tree now though, so I'll
re-send soon.

Thanks,
Nick

