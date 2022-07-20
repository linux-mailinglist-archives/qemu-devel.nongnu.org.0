Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63E857BAC9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 17:49:57 +0200 (CEST)
Received: from localhost ([::1]:37166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEBxU-0002Rr-OU
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 11:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oEBwH-0000tL-Fe
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:48:41 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:45883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oEBwF-0000qp-KS
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:48:41 -0400
Received: by mail-pg1-x52b.google.com with SMTP id f65so16717110pgc.12
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 08:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NL4vrzmz25r5/O1khrHmPy+CDoKS9o/yYAlQAZb2cRY=;
 b=cYT7VeYCwjb3ZGGsH3m2WxAZ006ufYRDtk9KpQanhdK9W1f4pz0SU296NsISSAeRaO
 ml1lUgfz6Fc6eDb7p99HGKcCIyER0okPf9GDCmd3hcR4xwZRYGodLEZ+oU9zeENLZ9XU
 PwGH3rntq6YqcUOCjI4cbXXzmoPpfVH3YmGAs7PZq6n6PWmlfykHhPdXhWyW7nnQmo4s
 NDc5eMXZpLuerNDBSsZIJOKpmlEAGTK2REKInN2qagEg3HGaDev0U7fIdwoVR8y1CSK8
 gtKrS9drpjy/t3Niws1f/o/dMcxZhpAblmTGjb5pCudVpn8lFXcXfh4Dp6aQUcVvxp3z
 hYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NL4vrzmz25r5/O1khrHmPy+CDoKS9o/yYAlQAZb2cRY=;
 b=A8PxNJ6s6OQMmSP1va2qOkKXKpMk5wkrI0JHv/nR+pqYcOHihUh3TAqzdXpyfxgCVA
 n5qDCJKlZvTKZvoqovNMbebbeBw51JwUnp/RFFs6DlE3zhMr3m3WYOmj1t6jdCFol+Bm
 y+f6ixFrDZxqUycxHfxzYXpwB0Ap+7PZ87Fg2pEVTAtrcngwQCbP/0coWK0KHHGRN+2d
 XPdcKyqujFhkKn1LXpoqUZKdsnCCqVy1a09VM7NEdbVLQq3/QWzLAZ6g98mTZ2MeRY6k
 qthXHEziakuEzQHPm6VEHukwO3ONAXiTBt2sCyRd4zLc0/kDHHVFzv2JYwCf67phc54b
 vZnQ==
X-Gm-Message-State: AJIora8sEfSQji/IhIj1N3CcBPSZ5pf3Z+GmN+uvU6ZjGeG292ZRKPnu
 A7jFBi61ai2nMcVcQkvmM7Ry1g==
X-Google-Smtp-Source: AGRyM1taBpBJ9D09MbEsrnhkB15f+hCk9TAmRzmnJ0C1yhcBvsSNHpW7EBYaMjUB9NPmCsIHeIAQOg==
X-Received: by 2002:a05:6a00:3392:b0:52b:4896:b317 with SMTP id
 cm18-20020a056a00339200b0052b4896b317mr26049692pfb.17.1658332117881; 
 Wed, 20 Jul 2022 08:48:37 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com.
 [35.230.65.123]) by smtp.gmail.com with ESMTPSA id
 o6-20020a17090a9f8600b001f21a8f7f14sm1829265pjp.9.2022.07.20.08.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:48:33 -0700 (PDT)
Date: Wed, 20 Jul 2022 15:48:29 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mtosatti@redhat.com" <mtosatti@redhat.com>,
 "likexu@tencent.com" <likexu@tencent.com>,
 "Ma, XiangfeiX" <xiangfeix.ma@intel.com>
Subject: Re: [PATCH] i386: Disable BTS and PEBS
Message-ID: <Ytgjzfl4kq4G/4B7@google.com>
References: <20220718032206.34488-1-zhenzhong.duan@intel.com>
 <a7bccbc5-fcb7-eaa8-ce95-fa7f380b8af9@redhat.com>
 <YtW+ymE654W662X4@google.com>
 <9dbe748c-57b4-eab5-3933-0e9891b031c1@redhat.com>
 <Ytb9kTFtnltT3fdf@google.com>
 <MWHPR1101MB21109B9363739A573F6391DD928E9@MWHPR1101MB2110.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MWHPR1101MB21109B9363739A573F6391DD928E9@MWHPR1101MB2110.namprd11.prod.outlook.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=seanjc@google.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 20, 2022, Duan, Zhenzhong wrote:
> >On Tue, Jul 19, 2022, Paolo Bonzini wrote:
> >> On 7/18/22 22:12, Sean Christopherson wrote:
> >> > On Mon, Jul 18, 2022, Paolo Bonzini wrote:
> >> > > This needs to be fixed in the kernel because old QEMU/new KVM is supported.
> >> >
> >> > I can't object to adding a quirk for this since KVM is breaking userspace,
> >> > but on the KVM side we really need to stop "sanitizing" userspace inputs
> >> > unless it puts the host at risk, because inevitably it leads to needing
> >> > a quirk.
> >>
> >> The problem is not the sanitizing, it's that userspace literally
> >> cannot know that this needs to be done because the feature bits are
> >> "backwards" (1 = unavailable).
> >
> >Yes, the bits being inverted contributed to KVM not providing a way for
> >userspace to enumerate PEBS and BTS support, but lack of enumeration is a
> >seperate issue.
> >
> >If KVM had simply ignored invalid guest state from the get go, then
> >userspace would never have gained a dependency on KVM sanitizing guest
> >state.  The fact that KVM didn't enumerate support in any way is an
> >orthogonal problem.  To play nice with older userspace, KVM will need to
> >add a quirk to restore the sanizting code, but that doesn't solve the
> >enumeration issue.  And vice versa, solving the enuemaration problem
> >doesn't magically fix old userspace.
> Hi,
> 
> I didn't clearly understand the boundary of when to use quirk and when to fix
> it directly, appreciate your guide.  My previous understanding for quirk is
> about backward compatibility, old behavior vs. new behavior.  But this issue
> is more like a regression or bug, and the sanitizing code is only in kvm/next
> branch, not in kernel upstream yet, why bother to use a quirk?

Oh!  Yay!  You're absolutely right.  And now I understand why Paolo is saying the
problem has nothing to do with sanitizing...

I was thinking that KVM had been doing the sanitizing before the PEBS enabling,
but that bad behavior was introduced by bef6ecca46ac ("KVM: x86/pmu: Set
MSR_IA32_MISC_ENABLE_EMON bit when vPMU is enabled").

Sorry for the noise.

