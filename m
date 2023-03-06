Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B276ABFDB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 13:50:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAHV-0000SS-2T; Mon, 06 Mar 2023 07:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZAHS-0000Ru-7V
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:49:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZAHQ-0006TR-BF
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:49:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678106967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4Q1K98zRZThQ1a4Yk28HkVvwqCoS8yWmJVCxOH1ehQ=;
 b=gkjmIt1aiBdf8WwdRDotsyXKkvSpLivArDrF5SNjnPG2X4j+rJj9YTrWalA589NcEVP4Zh
 P7OzyTtfsFviMG96qWzbbBdvljtUsBt9J7FZ4miFyAy6FhRdh0VAGjDMkv3EwhOQry6Lze
 apjy2QkfjZc8TvidLZfS8H700cinjUE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-JTKlEwE8N3CbPkMxsEVufQ-1; Mon, 06 Mar 2023 07:49:26 -0500
X-MC-Unique: JTKlEwE8N3CbPkMxsEVufQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 ef20-20020a0562140a7400b004c72d0e92bcso5383619qvb.12
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 04:49:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678106966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w4Q1K98zRZThQ1a4Yk28HkVvwqCoS8yWmJVCxOH1ehQ=;
 b=ZZ78QQSC0os1bRDrGBwQQgBJ8UbEyqxxtrl2LT0ywWX7I/7/9kW/QhiVDVhr98uWCd
 Fude5rO8R+N9zrKwvwVG4srwraGK6r0yPLfPdad0xbiD+xhtbMsXVOV0k86jW+Nyw5wQ
 n+xI1FDucAUSBfDAZ3099YyazGzGbH/JRwi9tmSaBqZ+cM+iDQXqp1OKxfXrq/m7kcOu
 p+zJPbp1njh8c3AJ7YmF4P3SgVeMAQQs0O2RsoDbKMxs2NsICEARBWBH5fneE7iujBAA
 I/Cg8CiGJquJkwQRsVKrB5LA2ASCHbVyAFGXLe+vqBX7lNsxm6cd2S5328FljmO+9j3s
 vX6g==
X-Gm-Message-State: AO0yUKXO3Q1OWICalV9iB0iON5bmF6gpXcL4/BttQA1qH4vm87UnTTmd
 GQE+0i9sfRTRBsxvaXaf2bK5DOiVF4TfU/5wLweUGitWKQ6UhINd7FVwqsQEo6ZGHNtO7ldYPmq
 +v4hVQkKLEgMhXgQ=
X-Received: by 2002:a05:622a:174d:b0:3bf:b8b9:1b45 with SMTP id
 l13-20020a05622a174d00b003bfb8b91b45mr18041280qtk.41.1678106965834; 
 Mon, 06 Mar 2023 04:49:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8a+VJA/x2mCoMoA56e2WuE5n7dZxN5tZmo3jYJYPX+s3PKfj8enuW7RzIvpkLmq2jHGziU7w==
X-Received: by 2002:a05:622a:174d:b0:3bf:b8b9:1b45 with SMTP id
 l13-20020a05622a174d00b003bfb8b91b45mr18041251qtk.41.1678106965530; 
 Mon, 06 Mar 2023 04:49:25 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 w17-20020ac84d11000000b003b86b99690fsm7400511qtv.62.2023.03.06.04.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 04:49:25 -0800 (PST)
Date: Mon, 6 Mar 2023 13:49:21 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Wang, Lei" <lei4.wang@intel.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 berrange@redhat.com, xiaoyao.li@intel.com, yang.zhong@linux.intel.com
Subject: Re: [PATCH v3 0/6] Support for new CPU model SapphireRapids
Message-ID: <20230306134921.1a47eb36@imammedo.users.ipa.redhat.com>
In-Reply-To: <22fde3ed-a4e7-db65-2e8a-ce6346fe6ac0@intel.com>
References: <20230106083826.5384-1-lei4.wang@intel.com>
 <20230202120533.37972585@imammedo.users.ipa.redhat.com>
 <22fde3ed-a4e7-db65-2e8a-ce6346fe6ac0@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 7 Feb 2023 10:50:56 +0800
"Wang, Lei" <lei4.wang@intel.com> wrote:

> On 2/2/2023 7:05 PM, Igor Mammedov wrote:
> > On Fri,  6 Jan 2023 00:38:20 -0800
> > Lei Wang <lei4.wang@intel.com> wrote:
> >   
> >> This series aims to add a new CPU model SapphireRapids, and tries to
> >> address the problem stated in
> >> https://lore.kernel.org/all/20220812055751.14553-1-lei4.wang@intel.com/T/#mcf67dbd1ad37c65d7988c36a2b267be9afd2fb30,
> >> so that named CPU model can define its own AMX values, and QEMU won't
> >> pass the wrong AMX values to KVM in future platforms if they have
> >> different values supported.
> >>
> >> The original patch is
> >> https://lore.kernel.org/all/20220812055751.14553-1-lei4.wang@intel.com/T/#u.  
> > 
> > MultiBitFeatureInfo looks like an interesting
> > idea but among fixing whatever issues this has atm,
> > you'd probably need to introduce a new  qdev_bitfield property
> > infrastructure so that such features could be treated like any
> > other qdev properties.
> > Also when MultiBitFeatureInfo is added, one should convert all
> > other usecases where it's applicable (not only for new code)
> > so that we would end up with consolidated approach instead of
> > zoo mess.
> > 
> > I'm not sure all MultiBitFeatureInfo complexity is necessary
> > just for adding a new CPU model, I'd rather use ad hoc approach
> > that we were using before for non boolean features.  
> 
> Hi, Igor. I do not quite understand what does the "ad hoc approach" mean,

by ah hoc I've mean instead of introducing MultiBitFeatureInfo
try to opencode fixups and checks for AMX properties.
(we do have a number of of such cpuid 'features')
For example look at [x]level (it's just a case MultiBitFeatureInfo that takes 32 bits).
Yes that would be ugly but much less complicated than new infrastructure.

And when/if  MultiBitFeatureInfo is ready for usage, you can convert
cpu models to it (AMX and all other 'legacy' features that were open coded).

> currently if we specify a multi-bit non-boolean CPUID value which is different
> from the host value to CPU model, e.g., consider the following scenario:
> 
> - KVM **ONLY** supports value 5 (101) and,
> - QEMU user want to pass value 3 (011) to it,
> 
> and follow the current logic:
> 
>     uint64_t unavailable_features = requested_features & ~host_feat;
> 
> then:
> 
> 1. The warning message will be messy and not intuitive:
> 
> requested_features bit 1 is 1 and host_feat bit 1 is 0, so it will warn on this
> non-sense bit.
> 
> 
> 2. Some CPUID bits will "leak" into the final CPUID passed to KVM:
> 
> requested_features bit 0 is 1 and host_feat bit 0 is also 1, so it will pass
> this CPUID bit to host, the request_features value is 3 (011), finally we get 1
> (001), this is not we want.
> 
> Am I understanding it correctly?
> 
> > 
> > And then try to develop MultiBitFeatureInfo & co as a separate
> > series to demonstrate how much it will improve current
> > cpu models definitions.
> > 
> > PS:
> >  'make check-acceptance' are broken with this
> >   
> >> ---
> >>
> >> Changelog:
> >>
> >> v3:
> >>  - Rebase on the latest QEMU (d1852caab131ea898134fdcea8c14bc2ee75fbe9).
> >>  - v2: https://lore.kernel.org/qemu-devel/20221102085256.81139-1-lei4.wang@intel.com/
> >>
> >> v2:
> >>  - Fix when passing all zeros of AMX-related CPUID, QEMU will warn
> >>    unsupported.
> >>  - Remove unnecessary function definition and make code cleaner.
> >>  - Fix some typos.
> >>  - v1: https://lore.kernel.org/qemu-devel/20221027020036.373140-1-lei4.wang@intel.com/T/#t
> >>
> >>
> >> Lei Wang (6):
> >>   i386: Introduce FeatureWordInfo for AMX CPUID leaf 0x1D and 0x1E
> >>   i386: Remove unused parameter "uint32_t bit" in
> >>     feature_word_description()
> >>   i386: Introduce new struct "MultiBitFeatureInfo" for multi-bit
> >>     features
> >>   i386: Mask and report unavailable multi-bit feature values
> >>   i386: Initialize AMX CPUID leaves with corresponding env->features[]
> >>     leaves
> >>   i386: Add new CPU model SapphireRapids
> >>
> >>  target/i386/cpu-internal.h |  11 ++
> >>  target/i386/cpu.c          | 311 +++++++++++++++++++++++++++++++++++--
> >>  target/i386/cpu.h          |  16 ++
> >>  3 files changed, 322 insertions(+), 16 deletions(-)
> >>
> >>
> >> base-commit: d1852caab131ea898134fdcea8c14bc2ee75fbe9  
> >   
> 


