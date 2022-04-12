Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D3D4FE92C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 21:58:54 +0200 (CEST)
Received: from localhost ([::1]:52636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neMf7-0000Wv-AZ
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 15:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1neMdm-0007bO-Gt
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:57:30 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:39442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1neMdk-0002qO-Nk
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:57:30 -0400
Received: by mail-lj1-x231.google.com with SMTP id bn33so25426245ljb.6
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 12:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KPcbiORevCwEqMtvKJH++KF0drE74ilJoT8gFQ34EnA=;
 b=TSKs9eKW1GlEw++EEPezIbQGa8d6xcrKEr3la4XqzpfJPISA+7b9KTTEm23XMMJ1YV
 pcXKlpyq55urGdORKzGxmT1pTvZ/5QXhjKImBF6bFGimi25oLZDpt9M2DbzXX/bDQ+u3
 9OTNzI18CY7dO2LOX4qCsPXJJ34xmRx72tFYZ9ATSXhsUXzw1klZnP3cX0EZtk+eprNZ
 tCkMhSq3MAlnJi4/eKNm3VReaN0l0QUhoN+OmB8jE4MWy6cl5AMOOOgXwh+tCG2JI/WG
 9+gYtMY/ams5vv8fDesBL9oYXhTRQRnTpXvK1Fa0yRuSW4SuRnnTGhhsM6HBGKFzDmOM
 KMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KPcbiORevCwEqMtvKJH++KF0drE74ilJoT8gFQ34EnA=;
 b=UbZFvJW59QsQYv1VKkZpCHORhXbpU7dn7zF8+YxwKtQWeWU9edk6LtCxXS36uZFxRX
 5/K1WayFTd6oZ1AJmVcKCFz5IT7uFzDAfOfdNgjeXM4yPq7NvTotA9b+Wr/uwo7+50zh
 +nMeJLTgjCl22Fqb0RtUatmJNnunFhZeLQNjDtpgmyOLLJA8zmEpqZHhIyPuOKrgv1Gz
 /TNs7jpztHWfN6qkyvtXY5M0TVS2DziCXhyyJ035pqY57f2O5cgjIkHwEYDQVINhjtMo
 qLUYD23NgP7yKOuIUNQXOglWzsUKjsCUiuuxfCyv6LtsLLDrUU3zlhOZhH5+e4QNBAh6
 0mvg==
X-Gm-Message-State: AOAM531S9g1RYEjUU5Vnj6iZiG4R2KhW/rH28f2uXsiilnPgVtvGLnky
 aVLFWzqVFex9nYluu+y9uR9WCg==
X-Google-Smtp-Source: ABdhPJzmo2kVaO0teoqOt46A1/R+kt5G8p3jezRBHquWD+rDhCqurcBAW6KPrG7h2kWuiHcT+suCXg==
X-Received: by 2002:a2e:a795:0:b0:24c:7f68:b382 with SMTP id
 c21-20020a2ea795000000b0024c7f68b382mr1118017ljf.494.1649793446359; 
 Tue, 12 Apr 2022 12:57:26 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id
 g4-20020ac24d84000000b00464f178c0bbsm1843697lfe.96.2022.04.12.12.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 12:57:25 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 446751030D2; Tue, 12 Apr 2022 22:58:59 +0300 (+03)
Date: Tue, 12 Apr 2022 22:58:59 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220412195859.gjklfw3fz2lehpb5@box.shutemov.name>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <CALCETrWk1Y47JQC=V028A7Tmc9776Oo4AjgwqRtd9K=XDh6=TA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrWk1Y47JQC=V028A7Tmc9776Oo4AjgwqRtd9K=XDh6=TA@mail.gmail.com>
Received-SPF: none client-ip=2a00:1450:4864:20::231;
 envelope-from=kirill@shutemov.name; helo=mail-lj1-x231.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org, david@redhat.com,
 qemu-devel@nongnu.org, "J . Bruce Fields" <bfields@fieldses.org>,
 linux-mm@kvack.org, "H . Peter Anvin" <hpa@zytor.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, jun.nakajima@intel.com,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jim Mattson <jmattson@google.com>, dave.hansen@intel.com,
 linux-api@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Yu Zhang <yu.c.zhang@linux.intel.com>,
 Mike Rapoport <rppt@kernel.org>, Sean Christopherson <seanjc@google.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vishal Annapurve <vannapurve@google.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 28, 2022 at 01:16:48PM -0700, Andy Lutomirski wrote:
> On Thu, Mar 10, 2022 at 6:09 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> >
> > This is the v5 of this series which tries to implement the fd-based KVM
> > guest private memory. The patches are based on latest kvm/queue branch
> > commit:
> >
> >   d5089416b7fb KVM: x86: Introduce KVM_CAP_DISABLE_QUIRKS2
> 
> Can this series be run and a VM booted without TDX?  A feature like
> that might help push it forward.

It would require enlightenment of the guest code. We have two options.

Simple one is to limit enabling to the guest kernel, but it would require
non-destructive conversion between shared->private memory. This does not
seem to be compatible with current design.

Other option is get memory private from time 0 of VM boot, but it requires
modification of virtual BIOS to setup shared ranges as needed. I'm not
sure if anybody volunteer to work on BIOS code to make it happen.

Hm.

-- 
 Kirill A. Shutemov

