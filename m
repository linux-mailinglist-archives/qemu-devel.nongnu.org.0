Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4306995C2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:28:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSeID-0001S6-QG; Thu, 16 Feb 2023 08:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSeI6-0001IS-0V
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:27:14 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSeI4-0006Tm-BP
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:27:13 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f18-20020a7bcd12000000b003e206711347so1680067wmj.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Xa29WhiHgsKNKOOaEkGY+UmjKxSvIsu7Et0upEMMDuU=;
 b=duqMpugt+xYqKE73yw2kOVRIrs69J7u48dp1kcb1WC0scLapyVo+iuYA7S6migJekJ
 CwlSKTnntFsneapKFAfZW5x7JEmSnyB6HdsOB3BMJij9/JQJ7eTMkF1VT9tG7Ek8kEwL
 jYxMUrW+q6RGymwi/yRi3uNo2DHq9IOlFucG2ZgviTK4u53Lf5p74Dfq6Q87cE1BPUY8
 XId/TEmga4nDEVK2zIiAJhqLKpz3ZaApMxnsRg3w8JjnPGjlqQQgu5WBMKD3uqEUplCr
 kYQvPWSwEJk+RPi+1Iec4hnSu++lUSXyQmJotgdvvQFz8ohnqB75Y1nK44Zaa4MVStiw
 0f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xa29WhiHgsKNKOOaEkGY+UmjKxSvIsu7Et0upEMMDuU=;
 b=0g+R0cvKIwLEOetEi5/48+5d1W/1W33Z7PgSyNrbc0738ucWs2iw3CJHd6G0XjvsC9
 hwaJFOIEqcXP1fDZhDhNeHRvLudaBk/3mDn0uyBT/J2qu12hBipPwX8qyRyOnV5/GvJi
 abpra1DFHX+nrNvrkUo8kFzHk82XVOTkfk5AwfdmONcthbqKa6fvnMopRtjtcTzUG091
 T3rxJJkmwHYmHOSAbib80YmXqIZG9i+lDtjwmYltlUyYuz6sObd+at5YvfeNPx5p5f8G
 OMxIarKhGihoyFXXQa2d+/9m3knHO8axB90LsEukQ0dcncbHTjwDv1FNMyFB38W4/e6Q
 HkqA==
X-Gm-Message-State: AO0yUKVdaEYeSo1q0XcslqwQiD8A1RbXm4slMJOGVomqvtA33ZZMHpR9
 00hKs+6VQjGfy1G/UcKzZbRIpw==
X-Google-Smtp-Source: AK7set9IbGqjgULtcT/AMnbnSRj2BuKofFFCFGL3FGyjER/ks+V6IYHfJJdToUxZenZ9RhG9If3SzQ==
X-Received: by 2002:a05:600c:1d81:b0:3df:f3ce:be45 with SMTP id
 p1-20020a05600c1d8100b003dff3cebe45mr219810wms.4.1676554030886; 
 Thu, 16 Feb 2023 05:27:10 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 c1-20020adfe701000000b002c5526234d2sm1547500wrm.8.2023.02.16.05.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:27:10 -0800 (PST)
Date: Thu, 16 Feb 2023 13:27:05 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 08/16] hw/arm/smmuv3: Support S2AFFD
Message-ID: <Y+4vKVWenRF5ALcb@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-9-smostafa@google.com>
 <7fa87a34-48ad-5b7d-a034-44b925f0d1c1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fa87a34-48ad-5b7d-a034-44b925f0d1c1@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=smostafa@google.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

Hi Eric,

On Wed, Feb 15, 2023 at 07:37:52PM +0100, Eric Auger wrote:
> > Parse S2AFFD from STE and use it in stage-2 translation.
> >
> > This is described in the SMMUv3 manual "5.2. Stream Table Entry" in
> > "[181] S2AFFD".
> 
> from a patch structure pov, to me it would make more sense to add the
> STE field decoding in
> [RFC PATCH 06/16] hw/arm/smmuv3: Parse STE config for stage-2 and use it
> in hw/arm/smmuv3: Add page table walk for stage-2
Yes, as all STE parsing will be in the same patch, it make sense to
remove this one and AFFD in stage-2 PTW.

> > +         * An Access fault takes priority over a Permission fault.
> > +         */
> > +        if (!PTE_AF(pte) && !cfg->s2cfg.affd) {
> > +            info->type = SMMU_PTW_ERR_ACCESS;
> Wondering how you are going to differentiate page faults at S1 versus
> page faults at S2.
> Event number #10 differentiates both and recorded fields are different.
> 
> Do you handle that somewhere?
Yes, this is missing, similar to F_TRANSLATION, we can set
info->u.f_walk_eabt.s2 which would set S2[103] bit in the fault event.


Thanks,
Mostafa

