Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8779C68DA0F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:03:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOZA-0002xU-IB; Tue, 07 Feb 2023 09:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPOZ4-0002mw-3C
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:03:18 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPOZ2-0001nU-FQ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:03:17 -0500
Received: by mail-pg1-x536.google.com with SMTP id 5so6554228pgd.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z5aR+pFIII+/laXjfu4tk1cpTn732TBoBK1sRjibcbA=;
 b=dMSYQ3/Amc4H+hU4c71AySUVBkFDdxotIJcWR2yg+7XrfycRks6sEBgrM82zTNygdR
 BAspKcbBwq5YmoI1bl1FiDBebjqtfVbOuy2o+O2qnRqHn2KTrIu33Qz+HUAX4U9jeOzH
 v51hTblnGIYZMVTctpnG1enmEKIw7d5B/8/y/1UBhVbKf1yLH5weJQ+6kwUMJ+tFuZrO
 mbrQ8f4HdgJaZvCxf/osZVN7myI/W6WyqregnVpgIUpQ++r6698tYnylaUyUiA+YNmz2
 fiCzHTtfx9N9qliU1pN5d4psctuLomjRA1TQmYxjRoVCiVji6Q8hDZ8o4xDtxfHipgLd
 KOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z5aR+pFIII+/laXjfu4tk1cpTn732TBoBK1sRjibcbA=;
 b=C2cBQG0FdNH/ItLT9HUd/ha99BKVEd2PS9zpFk2EbuMWt+b/MBAEgG3cKKuefcVTJl
 HR43Dta6yX82LZ42PqKMYxO39NauG1S36GWTtbsidz5OMUOYu1L7Sk9JV6+L8yQOH+XI
 iAVlMD7/O1Z9qYO/PbUt4orG02Ja8+LS4pFblQBJlaiU0B93MI6IjdRmGvpIU1rJ47A4
 2LiE9DVttczxnTtefoutAmoSmD2fBcSU39ISCVUB8DwJFL9pXs1hv2nZs9TRvoIREclL
 bEM5vq+ta02HtBPFgQXuZiL0AnaI7l+M+YGddjClmE1S/L23uZylQgzk76lyoBAI70P7
 /r3g==
X-Gm-Message-State: AO0yUKWt1kctGJduVFCGg4SOr4pbNcZjYoJYMInBX3+hpDMDhj+q0M3A
 HBFdpMM5MxOksN1n/+VWAFG4ZhDXnijONjEm4lF7/g==
X-Google-Smtp-Source: AK7set8K+ceoDfC2m68p44o0oGavUQfSe0YvvgpZzOBa1vtQCm86WpOaKDRWFtgECcR7aTMOuAu2DvgWVNtItNyXM6I=
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr792867pfb.48.1675778593942; Tue, 07
 Feb 2023 06:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20230126141120.448641-1-smostafa@google.com>
In-Reply-To: <20230126141120.448641-1-smostafa@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 14:03:02 +0000
Message-ID: <CAFEAcA_gdg_bUwasDs0O54qL5_2=DEMzAFu22x4d7mrx6W5vLA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/smmuv3: Add GBPA register
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 26 Jan 2023 at 14:12, Mostafa Saleh <smostafa@google.com> wrote:
>
> GBPA register can be used to globally abort all
> transactions.
>
> It is described in the SMMU manual in "6.3.14 SMMU_GBPA".
> ABORT reset value is IMPLEMENTATION DEFINED, it is chosen to
> be zero(Do not abort incoming transactions).
>
> Other fields have default values of Use Incoming.
>
> If UPDATE is not set, the write is ignored. This is the only permitted
> behavior in SMMUv3.2 and later.(6.3.14.1 Update procedure)
>
> As this patch adds a new state to the SMMU (GBPA), it is added
> in a new subsection for forward migration compatibility.
>
> Property "migrate-gbpa" was added to support backward compatibility.
> However, if the GBPA.ABORT is set from SW at time of migration, the
> GBPA migration will be forced to avoid inconsistencies where a qemu
> instance is aborting transactions and it is migrated to another
> instance bypassing them.

Nothing ever sets the migrate-gpba property to anything
except its default 'true' value, so this (a) means that
it breaks migration compat and (b) seems a bit unneccessary.

Can we say "migrate the field only if it is something other
than its reset value", not have the property, and get
migration compatibility that way ?

Otherwise the patch looks OK.

thanks
-- PMM

