Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0D762F606
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 14:30:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow1QK-0003tz-SX; Fri, 18 Nov 2022 08:28:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ow1QG-0003tl-C8
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 08:28:48 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ow1QB-0000gK-2U
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 08:28:45 -0500
Received: by mail-wr1-x42d.google.com with SMTP id cl5so9239427wrb.9
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 05:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jFuAN0qalS8PXGclZBpJGpqKwSse98B1zaIXuj/qhsM=;
 b=X/gqqsl/WLpKtb9vOD4WiP4Oi7fWHjwjntx8mX7OxhsG5wzq+ZEu37/nMAgR/K0NTa
 w3qxyDj/5ysz05YJVpUs55kmmloX1IkC2zB1+/KzU94RHSvVV8QJIGUQUlri/5EUyK2r
 mGh3S7znVf5hxcm2FIq10hXZNhSXHhkk0XSUejjdU6tvjBJaDulCkhJ1yHJ5qUwTLhSd
 MoeZaDkThsztpF4G73yNPcJGkFAhdKPv1GGINAnUYMuW1RHIMFNHAh629fNId0Ygj6h4
 QlGc8/i2b3sseFW3mxLr72CnhypCMQDx+K68Ypw8eLM56TGZBoLoX2zeC77yyHo3GfeR
 z9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jFuAN0qalS8PXGclZBpJGpqKwSse98B1zaIXuj/qhsM=;
 b=T6P32VSZoNbc7hei1JrA+CfAxLw3btG+anBHwqBeymFOwe9nlI1pkcG9zZYeRmlBuD
 1Mv7AsVi88QThLoVaKPWAHaAlzMmZX8ob7q/xUsqItQMaaJoKRgklxx2YgQE8JPkRjM8
 FxwPCObWaftdlf1ryNxwJgujEkV9dxeDateHZmp4+gmPfEclZh+dc7UqYU1ZUc+oTgsh
 Qxs89ouKeMHmLQL2J2+yMcHdrLqdrDscazQYcfoCvqsS3QOKlE7nsSQtTSdcL2vo9Aew
 A8c6LmHI6bHar/EMR6FKzoVjqcgEb0WPJK53zFPifjTt5Ofcq6Q7XNIK7d5mDCYAxvf2
 BVoQ==
X-Gm-Message-State: ANoB5pkgBtJMeMiJWr8svmuplIkgngdYbVGsq+cnhEG4XV1D8MtiZOAu
 ByI5zlQ3Nff2lvVpXVDjgZd/hw==
X-Google-Smtp-Source: AA0mqf6tYbIf5kiwBxBEeJpBK3Zoi0R3hbVIR4uxKZjI5EAk4XwJowCkhnyQfuyrbXxeKsj5OY9J7w==
X-Received: by 2002:adf:aa91:0:b0:241:b2b2:a71d with SMTP id
 h17-20020adfaa91000000b00241b2b2a71dmr4389646wrc.326.1668778121454; 
 Fri, 18 Nov 2022 05:28:41 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y10-20020adfe6ca000000b00236860e7e9esm3459102wrm.98.2022.11.18.05.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 05:28:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 11C631FFB7;
 Fri, 18 Nov 2022 13:28:40 +0000 (GMT)
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-4-chao.p.peng@linux.intel.com>
 <87cz9o9mr8.fsf@linaro.org> <20221116031441.GA364614@chaop.bj.intel.com>
 <87mt8q90rw.fsf@linaro.org> <20221117134520.GD422408@chaop.bj.intel.com>
 <87a64p8vof.fsf@linaro.org> <20221118013201.GA456562@chaop.bj.intel.com>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>, Vitaly
 Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim
 Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, "J .
 Bruce Fields" <bfields@fieldses.org>, Andrew Morton
 <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Steven Price <steven.price@arm.com>, "Maciej S .
 Szmigiero" <mail@maciej.szmigiero.name>, Vlastimil Babka <vbabka@suse.cz>,
 Vishal Annapurve <vannapurve@google.com>, Yu Zhang
 <yu.c.zhang@linux.intel.com>, "Kirill A . Shutemov"
 <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 tabba@google.com, Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v9 3/8] KVM: Add KVM_EXIT_MEMORY_FAULT exit
Date: Fri, 18 Nov 2022 13:23:51 +0000
In-reply-to: <20221118013201.GA456562@chaop.bj.intel.com>
Message-ID: <87o7t475o7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


Chao Peng <chao.p.peng@linux.intel.com> writes:

> On Thu, Nov 17, 2022 at 03:08:17PM +0000, Alex Benn=C3=A9e wrote:
>>=20
<snip>
>> >> >> > +
>> >> >> > +		/* KVM_EXIT_MEMORY_FAULT */
>> >> >> > +		struct {
>> >> >> > +  #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1 << 0)
>> >> >> > +			__u32 flags;
>> >> >> > +			__u32 padding;
>> >> >> > +			__u64 gpa;
>> >> >> > +			__u64 size;
>> >> >> > +		} memory;
>> >> >> > +
>> >> >> > +If exit reason is KVM_EXIT_MEMORY_FAULT then it indicates that =
the VCPU has
>> >> >> > +encountered a memory error which is not handled by KVM kernel m=
odule and
>> >> >> > +userspace may choose to handle it. The 'flags' field indicates =
the memory
>> >> >> > +properties of the exit.
>> >> >> > +
>> >> >> > + - KVM_MEMORY_EXIT_FLAG_PRIVATE - indicates the memory error is=
 caused by
>> >> >> > +   private memory access when the bit is set. Otherwise the mem=
ory error is
>> >> >> > +   caused by shared memory access when the bit is clear.
>> >> >>=20
>> >> >> What does a shared memory access failure entail?
>> >> >
>> >> > In the context of confidential computing usages, guest can issue a
>> >> > shared memory access while the memory is actually private from the =
host
>> >> > point of view. This exit with bit 0 cleared gives userspace a chanc=
e to
>> >> > convert the private memory to shared memory on host.
>> >>=20
>> >> I think this should be explicit rather than implied by the absence of
>> >> another flag. Sean suggested you might want flags for RWX failures so
>> >> maybe something like:
>> >>=20
>> >> 	KVM_MEMORY_EXIT_SHARED_FLAG_READ	(1 << 0)
>> >> 	KVM_MEMORY_EXIT_SHARED_FLAG_WRITE	(1 << 1)
>> >> 	KVM_MEMORY_EXIT_SHARED_FLAG_EXECUTE	(1 << 2)
>> >>         KVM_MEMORY_EXIT_FLAG_PRIVATE            (1 << 3)
>> >
>> > Yes, but I would not add 'SHARED' to RWX, they are not share memory
>> > specific, private memory can also set them once introduced.
>>=20
>> OK so how about:
>>=20
>>  	KVM_MEMORY_EXIT_FLAG_READ	(1 << 0)
>>  	KVM_MEMORY_EXIT_FLAG_WRITE	(1 << 1)
>>  	KVM_MEMORY_EXIT_FLAG_EXECUTE	(1 << 2)
>>         KVM_MEMORY_EXIT_FLAG_SHARED     (1 << 3)
>>         KVM_MEMORY_EXIT_FLAG_PRIVATE    (1 << 4)
>
> We don't actually need a new bit, the opposite side of private is
> shared, i.e. flags with KVM_MEMORY_EXIT_FLAG_PRIVATE cleared expresses
> 'shared'.

If that is always true and we never expect a 3rd type of memory that is
fine. But given we are leaving room for expansion having an explicit bit
allows for that as well as making cases of forgetting to set the flags
more obvious.

--=20
Alex Benn=C3=A9e

