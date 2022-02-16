Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6975C4B845A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:35:31 +0100 (CET)
Received: from localhost ([::1]:43978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGig-0005ok-Ed
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:35:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKGKC-0008Py-8X; Wed, 16 Feb 2022 04:10:12 -0500
Received: from [2607:f8b0:4864:20::630] (port=38408
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKGK8-0005h7-MY; Wed, 16 Feb 2022 04:10:11 -0500
Received: by mail-pl1-x630.google.com with SMTP id c3so1532022pls.5;
 Wed, 16 Feb 2022 01:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=yJgC9g6rxTuUdq7oR+z/hG4OAsp6kck9GKFxW18u+w0=;
 b=P+aFHIaR6qj4lP6rtL2J0gG3D9k1DNjxxLBdLLeNq+9l/ocSL/v5b7MEYoZkHOiWkx
 CVlAE7RQcwkQGQwrubvDy1pgY7tSiO3NOrWjJVOyC1REVsgoi6EkyvCxso3pB0lNkYF3
 yJ3InlaLl6uvz1d7S8UQR/jD1svyQa0ProJ/JHWXr3mOqPqdKPgp5DYKP2BEzB2OD18C
 SED8KIbJIyHkIiIZSSue4wFnhvjW7vXbUBAOtfleam/PLx8fNmU208EwTHfvnklGOC57
 dtAFziphcTXKM7sTsvJObeipt0I9BJJTBnbO80eVuRdDqbkRJPDTyN6cLChcCLvOqdXd
 3Jtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=yJgC9g6rxTuUdq7oR+z/hG4OAsp6kck9GKFxW18u+w0=;
 b=ZeKRZSqMHo4ranm0dpeNI2LSaFT0RYXYwMptU2kt/tzoGtdehA3cXaxRZvuEaNaIGH
 HFM/trZMSt/u5aanI1tc0x0N0WFTbTrQ5ZrcPxHvWFcxqx3Iu6hAHd6mawnQkoQF84PU
 ynK6BR/C051ou+HzKtXZr59cfNfyoQ0y8gfXwt1LdoOWj7TDPGaFDFYQxdvDbdy5dd3h
 KQe3AzoInyZY23mEXQdRCAaEskdo0C3PIEKn6grJw8ql00YXxXcqmKj7y8/pqZ9VWD+P
 Jd0r7p99/DUe2V8MwwWiWAuG1kowSXcmZfoXRv6V6pjOENPmXrzms6DsMx8b4ItRPSox
 iXgw==
X-Gm-Message-State: AOAM5335Yux/fy6nbvcfXWNQWglbciKpOi5nwwwHkCqW7pZgrSHbA+CO
 VxHreE0/FGD176XAlDMvwdc=
X-Google-Smtp-Source: ABdhPJy1XzFtRe3kLsLht2OnisaRiYxJ6jJjZ9LtMhjTul3kjuWkb8bTXpac/KZ+U9a9ifcO7QbFGw==
X-Received: by 2002:a17:903:41c6:b0:14e:fbca:6bdc with SMTP id
 u6-20020a17090341c600b0014efbca6bdcmr1375446ple.117.1645002604674; 
 Wed, 16 Feb 2022 01:10:04 -0800 (PST)
Received: from localhost (193-116-225-41.tpgi.com.au. [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id h5sm8469105pfc.118.2022.02.16.01.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 01:10:04 -0800 (PST)
Date: Wed, 16 Feb 2022 19:09:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/9] ppc: nested KVM HV for spapr virtual hypervisor
To: =?iso-8859-1?q?C=E9dric=0A?= Le Goater <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Fabiano Rosas
 <farosas@linux.ibm.com>, qemu-ppc@nongnu.org
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <459593cb-6ab7-1998-687d-7b4b96f8cb97@kaod.org>
 <a7025097-79c9-cb23-71bb-b38b21c9d809@gmail.com>
 <87iltgx7h7.fsf@linux.ibm.com>
In-Reply-To: <87iltgx7h7.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1644997149.ttbvcloy3m.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x630.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Fabiano Rosas's message of February 16, 2022 5:20 am:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>=20
>> On 2/15/22 15:33, C=C3=A9dric Le Goater wrote:
>>> On 2/15/22 04:16, Nicholas Piggin wrote:
>>>> Here is the rollup of patches in much better shape since the RFC.
>>>> I include the 2 first ones unchanged from independent submission
>>>> just to be clear that this series requires them.
>>>>
>>>> Thanks Cedric and Fabiano for wading through my poor quality RFC
>>>> code, very good changes suggested and I hope I got most of them
>>>> and this one is easier to follow.
>>>=20
>>> This is in good shape and functional. I will try to propose a small
>>> buildroot environment for it, so that we don't have to start a full
>>> distro to test.
>>>=20
>>> I would like to talk about the naming. KVM-HV is I think "reserved"
>>> to the PowerNV platform (baremetal). We also have KVM-PR which runs
>>> KVM guests on various platforms, including pseries.
>>>=20
>>> How can we call this yet another KVM PPC implementation ?
>>
>> Do we need a new name? I believe Nick uses the stock kvm_hv kernel modul=
e in this
>> implementation.
>>
>> If we want a name to differ between the different KVM-HV usages, well, I=
'd suggest
>> KVM-EHV (Emulated HV) or KVM-NHV (Nested HV) or KVM-VHV (Virtual HV) or =
anything
>> that suggests that this is a different flavor of using KVM-HV.
>=20
> I'd say it's imperative to have a clear indication that this is
> TCG. Otherwise we'll have people trying to weird stuff with it and
> complaining that Nested KVM is bugged.

Difficult to convey that in the L2 I think, but that is the case
no matter what we call it in the L0 AFAIKS.

> Some ideas:
>=20
> Emulated Nested KVM
> Emulated Nested HV
> Nested TCG
>=20
> The first one is perhaps more accurate, but we'd end up having "kvm"
> mentioned in TCG code and that is super confusing.

It provides the "nested HV" hypervisor API so it can support guests=20
that use the nested HV KVM backend. The matter between TCG and real
metal is on top of that -- the user knows TCG is emulated.

So, not sure how to go. We could remove the KVM name. The cap itself
is just called nested-hv and that's what KVM uses. I think KVM here
was added in the description just so you would konw that KVM can be
run on it.

Thanks,
Nick

