Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB776FC455
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 12:55:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwKzU-0006hj-Um; Tue, 09 May 2023 06:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pwKzS-0006hb-WC
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:54:43 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pwKzR-0000MG-Du
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:54:42 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-b9d9dad9edfso7572323276.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 03:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683629677; x=1686221677;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c5OX+OjKHjHsMDmiTE/RRgl/xh0/hWwq26iGNNb3WyU=;
 b=lrltUUfgl5iOfMepOEFKjiEFyJexm9mAphQ9/ZblAJbbrAOLsyd1MR5KZVHiT2Tp/K
 vARajIWPNFPM8pk1/too9m5+QZHx99C5RLgXvQV+HNkCIB/T5KkgV2TBeIO/1rBJN1hx
 Pl+DyGO9g7FhwsHFRrAKboAHgye29+dDJqyXIfo6bmPX/V1fznI1wtrrnozoRUmSdzqL
 lQoAK2I/cfTvDNkAo3MVrrkph6fO3J3bk4bcmPaAeltksuZOYa1Fp6opsq/p0b04kvIz
 BSStCn09vGYmh+RW2NXG6PFFVIOslUVLw5qiNd1UgEZG/MFBuZyJt9p4cmYjTGBblwEA
 knhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683629677; x=1686221677;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c5OX+OjKHjHsMDmiTE/RRgl/xh0/hWwq26iGNNb3WyU=;
 b=O1XPeU/81DGCQ0HE3SP9EwlcoG517KSRWDjP41kxq0KphKycf/IXI3t9twJCILFSF4
 vR8vE9FN9Ka1pieZjG6TnzkIlogIswJtTmlnV0lUZoXgyeyrCB/FewtDj1RBC6lqH6Vm
 l791F/eAVWjW6Btx1M6Q8ANcyAufvMa5wB/41q9lh21VWPF5lLsYgZZ5Rqm9pyweU30y
 w3s9peNrWqfuS2Q8Rs+SUhFiTid/oir2mZbuO69JEPhkJR/5/b9kxw7piTyJAlMCdgcU
 W0oq8GC3n/SR8/3M2sCVt2sE+RhW/bTx31uYM3wwU7bzm75cQBNeWUCnJd7OdZrTGaxH
 Rufg==
X-Gm-Message-State: AC+VfDz5W6dSmAFOrBQUxyoR+oh7qzRDNV75c3dNN6p7M1oRXwh1C88t
 8GiEPG9QQDJa+83z7BE1HD79A1lZHyU3DJBSAu0=
X-Google-Smtp-Source: ACHHUZ5UOeMk5kCpe1Gmv/lRwsAIYhehN1rwhIBPu5ccjzf0KxCU6i4cq84UmeKhQJ1rgNuofamzpeohv9XA02CsDzk=
X-Received: by 2002:a25:b097:0:b0:b99:4804:6ec7 with SMTP id
 f23-20020a25b097000000b00b9948046ec7mr14749861ybj.34.1683629676923; Tue, 09
 May 2023 03:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAJSP0QUccstoX1EBBB=snA+g7xTc4Wr4Hf+-x-k9dbbd2iahnA@mail.gmail.com>
 <CAJ+F1CJXaE+1O_93QuAiZ8Zddhc9hRp2X3Umc1whSqrPDXxEyg@mail.gmail.com>
In-Reply-To: <CAJ+F1CJXaE+1O_93QuAiZ8Zddhc9hRp2X3Umc1whSqrPDXxEyg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 9 May 2023 06:54:24 -0400
Message-ID: <CAJSP0QVXUhq2umitm5vOEr-XMkP5L1TJ2oO9YqKT+FwehJ-inQ@mail.gmail.com>
Subject: Re: Your clang TSA patches
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 9 May 2023 at 03:01, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi Stefan
>
> On Mon, May 8, 2023 at 6:54=E2=80=AFPM Stefan Hajnoczi <stefanha@gmail.co=
m> wrote:
>>
>> Hi Marc-Andr=C3=A9,
>> clang's Thread Safety Analysis is being used more in the QEMU block
>> layer and a few limitations have been hit:
>> 1. Mutexes that are struct fields are not supported (only global mutexes=
 work).
>> 2. Analysis does not extend across function pointers. See
>> GRAPH_RDLOCK_PTR for a workaround that is currently used.
>>
>> (There was a third limitation that I don't remember. Maybe Kevin remembe=
rs.)
>>
>> I heard you had clang or LLVM patches in that past that improve TSA.
>> Did your patches address these things? Any idea how hard it is to fix
>> these limitations?
>
>
>
> I don't remember much about that work, I didn't spend that much time on i=
t, and it was 5y ago already!
>
> My WIP branch is still available: https://github.com/elmarco/clang/commit=
s/qemu-ta
>
> it seems I was trying to modify clang to support TSA annotations on typed=
ef and function pointers, and warn on unmatching. I have no idea if this is=
 still relevant. I remember dropping the effort at that time because of lac=
k of interest or help in both projects.

Thanks! The changes seem small enough that it may be possible to get
them merged without a major time commitment.

It seems the function pointer analysis limitation still exists after
these 5 years :).

Stefan

