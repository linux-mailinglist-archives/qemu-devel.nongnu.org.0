Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3483C8A39
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:53:51 +0200 (CEST)
Received: from localhost ([::1]:49394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3j4w-0005Ax-8U
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1m3iz9-0001Y8-7z
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:47:51 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1m3iz7-0004b4-MX
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:47:50 -0400
Received: by mail-pl1-x62f.google.com with SMTP id p17so1823187plf.12
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 10:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/9pS1QCv9xpqY6zBCLWOgW4Q4GovlrCgOON/GP7k/MM=;
 b=Gz8IK/zPySNLRA9LzukO74GvNd7If2jgfUZU2DUeZ3TGBlnpnsrQrlGMqOcsv7/amR
 vPoYn/B13dKV1duqUnsuYByAVZS5Oq0Pt7nED44iL1erSdzPULHEoIcPL/v4qdeOkH20
 0pbxHkuNEmstHDSkh6wdT3wACC9+ckfe77X7GcTwBpWOHL9axtd5EfYWvmzLs/e7lZ2p
 eUWbrGjRGqkpuMzHszTpcLD7JaAxZe5XavWxm+wZ5no8wEeOjYa9bbKHzQkIQH9iQ21o
 SlOxujX1fLDDY+Cv6vKEeWxk1eRjQumfFe07xwKJ3//lcPNB+jdZYY1KC1dz8JrsfK7j
 4uuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/9pS1QCv9xpqY6zBCLWOgW4Q4GovlrCgOON/GP7k/MM=;
 b=tEXDaUCCiVAkZlXB77VWQQBWrxrS7lbF73Ha2VZhVovORlmVzFw4OATizZNbouxC71
 P8+GEWrvtOpm12aOA3zja45WZn1uLcyjdCx3+mKRCXOr3N6mQrxxooIURKEuGcAD20mm
 wd2NSRl/LxH1+29Z7hiTG3FHmKnMPZG/fcXar2pkv92RfNsQ1Ev+vpo18DYwQRyAblSN
 HLD2Fm7pFLLFiD2Vk1txajSif6jODIxd+X5fjKTmgl4Zk+VQVWf7lhnAHxfRSww1knM6
 LavSqcsIGLUS6gvk0zjmNoNildq1Wr+Fc2B6RBfk0xtZYwm7lT7OweJA7xRn14kRzNBn
 /y5A==
X-Gm-Message-State: AOAM530Z/JaUrrV+xjqb76yEdZ1kNkMrZ5xq0giwg283sD7rbFA/0fLv
 grNTFZc+5WlZvnR2mev87c9Lnw==
X-Google-Smtp-Source: ABdhPJxg4D1y8Sj9rVBv04R+sLhAh7a7fMtuK9QDtH+fvY8IszXx7xFpeDh3rYaZJ67mxx9XbSbByA==
X-Received: by 2002:a17:90a:710a:: with SMTP id
 h10mr4844569pjk.103.1626284867227; 
 Wed, 14 Jul 2021 10:47:47 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id v10sm3615500pfg.160.2021.07.14.10.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 10:47:46 -0700 (PDT)
Date: Wed, 14 Jul 2021 17:47:42 +0000
From: Sean Christopherson <seanjc@google.com>
To: harry harry <hiharryharryharry@gmail.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, stefanha@redhat.com,
 mathieu.tarral@protonmail.com
Subject: Re: About two-dimensional page translation (e.g., Intel EPT) and
 shadow page table in Linux QEMU/KVM
Message-ID: <YO8jPvScgCmtj0JP@google.com>
References: <CA+-xGqNUX4dpzFV7coJSoJnPz6cE5gdPy1kzRKsQtGD371hyEg@mail.gmail.com>
 <d79db3d7c443f392f5a8b3cf631e5607b72b6208.camel@redhat.com>
 <CA+-xGqOdu1rjhkG0FhxfzF1N1Uiq+z0b3MBJ=sjuVStHP5TBKg@mail.gmail.com>
 <d95d40428ec07ee07e7c583a383d5f324f89686a.camel@redhat.com>
 <YOxYM+8qCIyV+rTJ@google.com>
 <CA+-xGqOSd0yhU4fEcobf3tW0mLb0TmLGycTwXNVUteyvvnXjdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+-xGqOSd0yhU4fEcobf3tW0mLb0TmLGycTwXNVUteyvvnXjdw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=seanjc@google.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -146
X-Spam_score: -14.7
X-Spam_bar: --------------
X-Spam_report: (-14.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=2.896, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

On Wed, Jul 14, 2021, harry harry wrote:
> > Heh, because the MMUs are all per-vCPU, it actually wouldn't be that much effort
> > beyond supporting !TDP and TDP for different VMs...
> 
> Sorry, may I know what do you mean by "MMUs are all per-vCPU"? Do you
> mean the MMUs walk the page tables of each vCPU?

No, each vCPU has its own MMU instance, where an "MMU instance" is (mostly) a KVM
construct.  Per-vCPU MMU instances are necessary because each vCPU has its own
relevant state, e.g. CR0, CR4, EFER, etc..., that affects the MMU instance in
some way.  E.g. the MMU instance is used to walk guest page tables when
translating GVA->GPA for emulation, so per-vCPU MMUs are necessary even when
using TDP.

However, shadow/TDP PTEs are shared between compatible MMU instances.  E.g. in
the common case where all vCPUs in a VM use identical settings, there will
effectively be a single set of TDP page tables shared by all vCPUs.

