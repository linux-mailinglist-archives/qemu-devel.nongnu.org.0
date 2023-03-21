Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB1D6C3377
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:55:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecSG-0001dX-VM; Tue, 21 Mar 2023 09:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pecSB-0001cu-Rv
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:55:10 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pecSA-0004tX-0N
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:55:07 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3ed3080d17bso20405e9.0
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679406904;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ChDSX/xieTqXHkr2n2LuVn1Gf13gDU4lZynnBv9cIZY=;
 b=kiuq4UXzai/NUjBE0vdCAStTCnT7fqhWEH93skgoiVNARVTiPoFsi3nP+g0z8nIqfc
 0qUhxtTf/bXm7M5yvpoGbyXtbKT0+HlJIA/ZGMOIQkBrkl0XVerWY/5D1xEbBxgkm3/u
 JiJKT0J8DpkDkDD8dKYMeEw2NnV5Ys6ZXGtXzkGFK9UuiXGMSCZVMrGj6Xb6IcNCh5h3
 HNNx8PYzi4HYtF39zMRDJREjknYAYAlnB2SkZaSQNMjTwskOH+e7VFG2+AerXhoROIE3
 a9EGb8o9FWFsLYUB6rYIykRaRuKhqay5/c9fryqHT2Y0Jtls2Aedl3oAkV58Qj8scJaJ
 UCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679406904;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ChDSX/xieTqXHkr2n2LuVn1Gf13gDU4lZynnBv9cIZY=;
 b=U1L5anBFuOAEznaxS4YMnultLV9bmevlqKZ0qxAgmKQFijzYDtPJ3rphyaDPIQl7mb
 fODn86rktuNRbArwa/2MDzwbH3GDNrnbh3NFr79GZ1gkUvZhHIBRD7PvfaLbjCo9fKDB
 n0UZ0ZcN8NohnVWHXKtooWJllZsQUL3BgeJtWWLwauMCMKFdczg9rvLJwQtjsSzysw1a
 PfzpdOmtdtQOee7niM/0VlwdYH1NWflHxpd6yN7sL+aWQAOH7BHIoSbr1QB6mDJIcE/W
 pM+qShXGscK0BnNtiHRUlxBjDOk0zUv5cUinBkaxYL9L4SW4Vsc/uXspDzvZrRJHszMr
 e6OQ==
X-Gm-Message-State: AO0yUKUNIDY7+rH090SiepZUUNBlDASeCYJ+O+Hg6ZN/Brx0DBKjS73g
 wIObCf8SQI8RL46XBcQ69VuGhQ==
X-Google-Smtp-Source: AK7set9Lv+m8V1OTnQBBYlxjfwMe8Ml8iEf9TKP7+rQ8+icYdIjIccgVWLyHhM0yMSII5/ceoeiMCg==
X-Received: by 2002:a05:600c:4745:b0:3df:f3cb:e8ce with SMTP id
 w5-20020a05600c474500b003dff3cbe8cemr144780wmo.7.1679406904011; 
 Tue, 21 Mar 2023 06:55:04 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 f26-20020a7bc8da000000b003ed2d7f9135sm13474417wml.45.2023.03.21.06.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:55:03 -0700 (PDT)
Date: Tue, 21 Mar 2023 13:54:59 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger@redhat.com, qemu-devel@nongnu.org, jean-philippe@linaro.org,
 qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v2 10/11] hw/arm/smmuv3: Populate OAS based on CPU
 PARANGE
Message-ID: <ZBm3M7A8nnBweDE3@google.com>
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-11-smostafa@google.com>
 <6e6810c3-c01a-5a2f-4fed-64c9391e22ba@redhat.com>
 <ZBmruj7OME3Pfbh1@google.com>
 <d2e9d8d5-1cf6-67fe-e780-41038fcaa376@redhat.com>
 <CAFEAcA_NZiby7=DWaDBu7b5Dbo5sXF9N7T-0_wskZ46FR9Esxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_NZiby7=DWaDBu7b5Dbo5sXF9N7T-0_wskZ46FR9Esxw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32c.google.com
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

Hi Peter,

On Tue, Mar 21, 2023 at 01:34:55PM +0000, Peter Maydell wrote:
> > >>> +     */
> > >>> +    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
> > >>> +    uint8_t oas = FIELD_EX64(armcpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
> > >> is this working in accelerated mode?
> > > I didn't try with accel, I will give it a try, but from what I see, that
> > > ARM_CPU() is used to get the CPU in traget/arm/kvm.c which is used from
> > > accel/kvm-all.c, so it seems this would work for accelerated mode.
> >
> > yeah I ma not familiar enough with that code but it is worth to be checked.
> 
> I'm a bit unsure about fishing around in the CPU ID registers for this.
> That's not what you would do in real hardware, you'd just say "the
> system is supposed to configure the CPU and the SMMU correctly".
> 
> Also, there is no guarantee that CPU 0 is related to this SMMU in
> particular.
Sorry, missed this point in last email.

So, we leave it this way, or there is a better way to discover PARANGE?

Thanks,
Mostafa


