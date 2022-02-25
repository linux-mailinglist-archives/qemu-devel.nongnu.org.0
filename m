Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 099744C42F9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:59:28 +0100 (CET)
Received: from localhost ([::1]:50914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNYJq-0002cO-2Z
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:59:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nNYHo-000107-8D; Fri, 25 Feb 2022 05:57:23 -0500
Received: from [2607:f8b0:4864:20::52c] (port=42872
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nNYHd-0000Wu-GH; Fri, 25 Feb 2022 05:57:11 -0500
Received: by mail-pg1-x52c.google.com with SMTP id o8so4328016pgf.9;
 Fri, 25 Feb 2022 02:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Mw1swWLDp6e1vdrsDpYAZJ9mvntGdEZ9KdgXSbauEFw=;
 b=SBLu75CyhiSGXGXYayBNMSObkNXJZkFow34V6N1GJlTJ6hPiU79Ck/r8Gmefw4forn
 rsldSGWTCt9h6Di41uejzCSBxW4ZQVziN+6hovxE0cuFIA6CvEUxteG96T5QdQQVRpPc
 IqD8331ygdMGSkHrtv+e6EaW/qOHTUbltCOMKnTH3vh14fRuQf8IKVceT0iIvFJf/4tx
 HoTn6uqoBNWGqXCcRipQ8vXtYsj84CKd46SsZThXmG6oOhts/ab0v9CjTvierG/z+J7l
 6PPzBn+DJVxJBaoeOPsoFeYeun973xy2KxG7c3ABsUEmlDDyiglzH44xEc814eUCgpvS
 PV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Mw1swWLDp6e1vdrsDpYAZJ9mvntGdEZ9KdgXSbauEFw=;
 b=uhWXjASxMgonLRzXkyP+BjUUUBrY39E+22g42sPw9KjiM1OkW5vBVxQCsHFZvkdmSS
 AKTX9piOWzkipM0OODfe3/EtmY9aC2q0I7qWj4jeXVzKk1e2Xfljovfrh+MmnUxV9tOS
 fDlr44AV7KvLqmVSOBcizdQSzNjFsiEFjYiY3Afjd2YQ/AKcaVpic2jJ3LGxsr5i20YA
 8Fju+f4D+/HCHhquyMGljTZuJSDcI3URyaAfe6ARGMo1jG4M/NkoPAMMRuhS2e+3uYl3
 QssZsQ/+LKPgveSLzBPisAwpgWBI1FxdFTR38NvrAFwe3hzbH1gd1gSrT3jpu4tqvC6C
 XHcw==
X-Gm-Message-State: AOAM531znscWX2zJjiohaOKPBEumfq/n7RyE64cQQ8voaNNovDQtSI4+
 OChMVzr18eQSVNpeoTP+xCk=
X-Google-Smtp-Source: ABdhPJytcpiUQbjzlnImKkA+xjJATYr0xFYpwm+NKe6XglcCwZ3OZWhNEcmKRBKIWqctjMLAv0spbQ==
X-Received: by 2002:a65:4144:0:b0:374:315a:7dff with SMTP id
 x4-20020a654144000000b00374315a7dffmr5760884pgp.506.1645786627911; 
 Fri, 25 Feb 2022 02:57:07 -0800 (PST)
Received: from localhost (118-208-203-92.tpgi.com.au. [118.208.203.92])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a056a0024ce00b004f3c87df62bsm2750774pfv.81.2022.02.25.02.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 02:57:07 -0800 (PST)
Date: Fri, 25 Feb 2022 20:57:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 4/4] spapr: Add KVM-on-TCG migration support
To: David Gibson <david@gibson.dropbear.id.au>, Fabiano Rosas
 <farosas@linux.ibm.com>
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
 <20220224185817.2207228-5-farosas@linux.ibm.com> <YhhQGKL2mZDN2mtx@yekko>
In-Reply-To: <YhhQGKL2mZDN2mtx@yekko>
MIME-Version: 1.0
Message-Id: <1645786423.ggnsc61px0.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x52c.google.com
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
Cc: aik@ozlabs.ru, danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from David Gibson's message of February 25, 2022 1:42 pm:
> On Thu, Feb 24, 2022 at 03:58:17PM -0300, Fabiano Rosas wrote:
>> This adds migration support for TCG pseries machines running a KVM-HV
>> guest.
>> @@ -734,6 +777,7 @@ const VMStateDescription vmstate_ppc_cpu =3D {
>>          &vmstate_tlbemb,
>>          &vmstate_tlbmas,
>>          &vmstate_compat,
>> +        &vmstate_nested,
>=20
> The hdecr stuff doesn't seem quite right.  Notionally the L1 cpu,
> since it is in PAPR mode, doesn't *have* an HDECR.  It's only the L0
> nested-KVM extensions that allow it to kind of fake access to an
> HDECR.  We're kind of abusing the HDECR fields in the cpu structure
> for this.  At the very least I think the fake-HDECR migration stuff
> needs to go in the spapr_cpu_state not the general cpu state, since it
> would make no sense if the L1 were a powernv system.

We could possibly just make a new timer for this, btw. It's not really
buying a lot and may be slightly confusing to share hdecr. It could
still cause a HDEC exception though.

(If we really wanted to divorce that confusion about the HV architecture
from the vhyp nested L0 implementation we could come up with an entirely
new set of "exit nested" kind of exceptions that don't look like HV
interrupts, but reusing the HV interrupts was simple and kind of neat
in a way).

Thanks,
Nick

