Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0BC3283EB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:28:43 +0100 (CET)
Received: from localhost ([::1]:46860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlPW-0000qQ-5E
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <babush@rev.ng>) id 1lGlNr-0008Ki-Iq
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:26:59 -0500
Received: from rev.ng ([5.9.113.41]:57409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <babush@rev.ng>) id 1lGlNp-0008O1-KN
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:26:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
 References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=16gKclkrkkCnijO3zyRk899JnPYPqMyKvxbOyfLBaTE=; b=cifcHoB3/5CoHM098X2EzRekFQ
 aoH4kCSKVdRq0Umbl+l15CfMfjiiCjmlpTp227oICIqAvaRFzhL7EtG2CvCMDqJxUiUPlvvTKxpwG
 VI6og7oRicqzDjeJ/zBHwNjWQHO0+nSNwFAAZn+hsR7oyHkQ4GiM3BZal+ErmFqGx4b8=;
Received: by mail-vs1-f49.google.com with SMTP id k12so3037587vso.13
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 08:26:48 -0800 (PST)
X-Gm-Message-State: AOAM532yAM/k2akaYNLvphm7CwF3MpA0WRosAwqovPoqJwm1sGMLGb84
 /PXRiUHpvLsWkLK45yeyL/obUuxYwhe9XufWFA==
X-Google-Smtp-Source: ABdhPJwmaGMc1A9jNTx2DGKBjJmtafZ5ZzpBQ2jR+FxPP75v8PwxEQP51bBJaCwkHEx/OCrbFf362+bONte2IjZh10c=
X-Received: by 2002:a05:6102:c10:: with SMTP id
 x16mr3775150vss.54.1614616002815; 
 Mon, 01 Mar 2021 08:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-7-ale.qemu@rev.ng>
 <f6008951-1faf-8ff7-ecdd-4648ebc56f7b@linaro.org>
In-Reply-To: <f6008951-1faf-8ff7-ecdd-4648ebc56f7b@linaro.org>
Date: Mon, 1 Mar 2021 17:26:31 +0100
X-Gmail-Original-Message-ID: <CALU5z=PE2o7yDXJFnvWt+3w2smHs=cPga7QGchjudq010RSQ2Q@mail.gmail.com>
Message-ID: <CALU5z=PE2o7yDXJFnvWt+3w2smHs=cPga7QGchjudq010RSQ2Q@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] target/hexagon: prepare input for the idef-parser
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org, 
 Taylor Simpson <tsimpson@quicinc.com>, Brian Cain <bcain@quicinc.com>,
 nizzo@rev.ng, philmd@redhat.com, Alessandro Di Federico <ale@rev.ng>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=5.9.113.41; envelope-from=babush@rev.ng;
 helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Paolo Montesel <babush@rev.ng>
From:  Paolo Montesel via <qemu-devel@nongnu.org>

> > +/* Copy rules */
> > +#define fLSBOLD(VAL) (fGETBIT(0, VAL))
> > +#define fSATH(VAL) fSATN(16, VAL)
> > +#define fSATUH(VAL) fSATUN(16, VAL)
> > +#define fVSATH(VAL) fVSATN(16, VAL)
> > +#define fVSATUH(VAL) fVSATUN(16, VAL)
> > +#define fSATUB(VAL) fSATUN(8, VAL)
> > +#define fSATB(VAL) fSATN(8, VAL)
> > +#define fVSATUB(VAL) fVSATUN(8, VAL)
> > +#define fVSATB(VAL) fVSATN(8, VAL)
> > +#define fCALL(A) fWRITE_LR(fREAD_NPC()); fWRITE_NPC(A);
> > +#define fCALLR(A) fWRITE_LR(fREAD_NPC()); fWRITE_NPC(A);
> > +#define fCAST2_8s(A) fSXTN(16, 64, A)
> > +#define fCAST2_8u(A) fZXTN(16, 64, A)
> > +#define fCAST8S_16S(A) (fSXTN(64, 128, A))
> > +#define fCAST16S_8S(A) (fSXTN(128, 64, A))
> > +#define fVSATW(A) fVSATN(32, fCAST8_8s(A))
> > +#define fSATW(A) fSATN(32, fCAST8_8s(A))
> > +#define fVSAT(A) fVSATN(32, A)
> > +#define fSAT(A) fSATN(32, A)
> > +
> > +/* Ease parsing */
> > +#define f8BITSOF(VAL) ((VAL) ? 0xff : 0x00)
> > +#define fREAD_GP() (Constant_extended ? (0) : GP)
> > +#define fCLIP(DST, SRC, U) (DST = fMIN((1 << U) - 1, fMAX(SRC, -(1 << U))))
>
> I guess this is what's in the manual, but my reading of this expression is
> "saturate", not "clip".  How does it differ from
>
>   fSATN(U, SRC)
>
> ?

Their semantics are different.
E.g.:
- fCLIP(dst, 0x80, 8) => dst = 0x80
- fSATN(8, 0x80) => 0x7F

Take a look at `target/hexagon/macros.h` to see their slow
(macro/helper-based) implementation, which is basically our reference.

As for the naming, it's not up to us.

Paolo

