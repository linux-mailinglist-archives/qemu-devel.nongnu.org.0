Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0921357A6C9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:54:40 +0200 (CEST)
Received: from localhost ([::1]:43424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDsMg-0004eW-M2
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oDsLK-0003KU-BL
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:53:14 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oDsLI-00016d-N4
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:53:14 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 j1-20020a17090aeb0100b001ef777a7befso2102987pjz.0
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hN9l+86KDsXhg/aYjZrod+iWMkiiyV7lr97CPW4jFNw=;
 b=ENY1zws27tpQRUQqbeUqy7Qz/v1A9QjbvZZyFLwm4eRxYewCuB3/Eu91Delh7ueUra
 UbQURcEUImv1PapEAlJ8ZQ0+YRxNw3rZ33Ks1tBknIuHMbDh3mFEpyZSXCM2AdH53wOS
 UpoSVD9iJaMDH0yseXNj50XkQQ1MvHukcUfDBQAR7oWT3VES+q46sRSVCAgCcVUbYEJQ
 2/hrwzZvHnHcqEbokiYIKscq2s/8+mVGgp7NfCkIKWi5rfxRgk6NRcGHvgmeAMGLtAQc
 2MF+289KQpkr2oOuo4IrEd40dGoZOv4QDINJul4Kb02sMMgQsmTtYxsvH5YhQuLcpSpL
 3OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hN9l+86KDsXhg/aYjZrod+iWMkiiyV7lr97CPW4jFNw=;
 b=5t1LQpa343pKjhUgeoptWWa79IxwTsjdO2OkH4bIaGc8iVlImWN/OGZV2iabVtxg6T
 6mzl1tPmO3cxo1a04OmMmdo2HP3gUAfmLh27ECp9iNpwICIqnzq7K2PVfphWPOh90M0N
 FtNs6TjtRj5m1E/Dk0nlRBW1BPYIHcjiODcSQy5LbHm4dcnHUDKYH1ggDZGAqm7yX8z4
 /jcwDkyTmgvBfusqpTxq6YmBxjro1QvaWkEMrYid4VvAJKusEF/JriCajCr9kKZBoSst
 FjQ4Lkr0WmqBoVnRu7hBecyYPQ44DsxYSiy4jD5rq5BuI3zTef6L4qyGCJRcAPQrgy8Q
 GB/A==
X-Gm-Message-State: AJIora9fyqIWhOYPpxye5Dbb1YyMP9iIyPIxr6Q9u/Lw1iwcHnaqVQ7b
 kIWo6TRPUGM41uqnOLAiEVpf0w==
X-Google-Smtp-Source: AGRyM1tCg22OSDmc0qmQImKfTDqbqp8uqOloU6EyEKnpAvk6M+uyvPVbt2T/WYLLie8e/z11t3lA+Q==
X-Received: by 2002:a17:903:3252:b0:16b:ef4e:d40d with SMTP id
 ji18-20020a170903325200b0016bef4ed40dmr35015338plb.71.1658256789409; 
 Tue, 19 Jul 2022 11:53:09 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com.
 [35.230.65.123]) by smtp.gmail.com with ESMTPSA id
 z6-20020a1709027e8600b0016c1fdaa38fsm11909894pla.231.2022.07.19.11.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:53:09 -0700 (PDT)
Date: Tue, 19 Jul 2022 18:53:05 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org,
 mtosatti@redhat.com, likexu@tencent.com, xiangfeix.ma@intel.com
Subject: Re: [PATCH] i386: Disable BTS and PEBS
Message-ID: <Ytb9kTFtnltT3fdf@google.com>
References: <20220718032206.34488-1-zhenzhong.duan@intel.com>
 <a7bccbc5-fcb7-eaa8-ce95-fa7f380b8af9@redhat.com>
 <YtW+ymE654W662X4@google.com>
 <9dbe748c-57b4-eab5-3933-0e9891b031c1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dbe748c-57b4-eab5-3933-0e9891b031c1@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1036.google.com
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

On Tue, Jul 19, 2022, Paolo Bonzini wrote:
> On 7/18/22 22:12, Sean Christopherson wrote:
> > On Mon, Jul 18, 2022, Paolo Bonzini wrote:
> > > This needs to be fixed in the kernel because old QEMU/new KVM is supported.
> > 
> > I can't object to adding a quirk for this since KVM is breaking userspace, but on
> > the KVM side we really need to stop "sanitizing" userspace inputs unless it puts
> > the host at risk, because inevitably it leads to needing a quirk.
> 
> The problem is not the sanitizing, it's that userspace literally cannot know
> that this needs to be done because the feature bits are "backwards" (1 =
> unavailable).

Yes, the bits being inverted contributed to KVM not providing a way for userspace
to enumerate PEBS and BTS support, but lack of enumeration is a seperate issue.

If KVM had simply ignored invalid guest state from the get go, then userspace would
never have gained a dependency on KVM sanitizing guest state.  The fact that KVM
didn't enumerate support in any way is an orthogonal problem.  To play nice with
older userspace, KVM will need to add a quirk to restore the sanizting code, but
that doesn't solve the enumeration issue.  And vice versa, solving the enuemaration
problem doesn't magically fix old userspace.

> The right way to fix it is probably to use feature MSRs and, by default,
> leave the features marked as unavailable.  I'll think it through and post a
> patch tomorrow for both KVM and QEMU (to enable PEBS).

Yeah, lack of CPUID bits is annoying.

