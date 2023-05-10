Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FB56FDD9C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:21:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwioI-000101-CM; Wed, 10 May 2023 08:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwio7-0000qU-4K
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:20:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwio4-0007PF-9G
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721230;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UODU+LbLVxEv1z1cNqdUXDD/6EeETsVku4rEhpmMbyY=;
 b=itInWQ5yxZ2zu+6nDNNFxIBFyL2bd0gHQaqIs2Wk+3ZENsiW+yl57F+YXnNvvu25KjtOlV
 NqQeKm0TdXmyFTnfEerwCX7PV9yM4Ya4RcKG1AFn8ON5GLEEbZQvcrZLoAMeMsqquOjWHM
 PhDBRvTgs3oWc2Fp8Rs83ZrlBQ71uEo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-PnEEIi9_P2-yOuKvbZmrpg-1; Wed, 10 May 2023 08:20:29 -0400
X-MC-Unique: PnEEIi9_P2-yOuKvbZmrpg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f33f8ffa95so28551085e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 05:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683721227; x=1686313227;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UODU+LbLVxEv1z1cNqdUXDD/6EeETsVku4rEhpmMbyY=;
 b=hmpkG++dQaBbYqMuXS56pIV+OmI+VU6BsNew5NnhD6cqRCTzY14hsSsySKk91jhGS5
 bF5c3WPipgGJ1ADfew9QwN3v5+Z11lSjNbCkyVTU1RPrJlWLs1UeUBaU92AyQ6ssxc/x
 i+hy/p0ebxsySTSK0wMtgIv0yhK4/9/KsQubmTx3KBS4GOnc54Oo6+BavbczdZs4zSXE
 Jc6Hkv8F/NVx7J7DDTZbrLY71FZJ0knB7T/hYJTH2toEySHDc9kXLown+eDBQclO9v1n
 ufm14llEmn2qo7Y3yW4cMDGEej5U1pVF3+JAfL9pSYTN0LKJnHcTuZoQdBWBvUby7/sj
 h5nA==
X-Gm-Message-State: AC+VfDxGwXkA1+EQeedcf6tMB+lEsd/IOtrjm/vIhVGDeH/2vNsutsq2
 Dgj6PRwhCyiHPJk2BHDFWd49MtbtKpvIM8X5KKEGGLlxgPfSupku5S/wQr5fnowbG3H/tR69DMW
 fi3GWO8fF3NqreW0=
X-Received: by 2002:a05:600c:28f:b0:3f1:8430:523 with SMTP id
 15-20020a05600c028f00b003f184300523mr12229858wmk.14.1683721227338; 
 Wed, 10 May 2023 05:20:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ69l/IuQGFbGcRkIMDFa+Frzk9bzw0NaBiqY8WInKepCVRGJzam04nmcwiUbVWZtif3wPFqqw==
X-Received: by 2002:a05:600c:28f:b0:3f1:8430:523 with SMTP id
 15-20020a05600c028f00b003f184300523mr12229841wmk.14.1683721227067; 
 Wed, 10 May 2023 05:20:27 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 z24-20020a1cf418000000b003f3e50eb606sm22422447wma.13.2023.05.10.05.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 05:20:26 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dave@treblig.org>,
 Leonardo Bras <leobras@redhat.com>,  Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,  Eric Blake
 <eblake@redhat.com>,  qemu-block@nongnu.org,  Peter Xu
 <peterx@redhat.com>,  Markus Armbruster <armbru@redhat.com>
Subject: Re: [PULL 00/10] Migration 20230509 patches
In-Reply-To: <19eff026-1a50-b0f3-15a5-b0251ab443dd@linaro.org> (Richard
 Henderson's message of "Wed, 10 May 2023 11:17:15 +0100")
References: <20230509191724.86159-1-quintela@redhat.com>
 <19eff026-1a50-b0f3-15a5-b0251ab443dd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 14:20:25 +0200
Message-ID: <87ild08jjq.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Richard Henderson <richard.henderson@linaro.org> wrote:
> On 5/9/23 20:17, Juan Quintela wrote:
>> The following changes since commit 271477b59e723250f17a7e20f139262057921b6a:
>>    Merge tag 'compression-code-pull-request' of
>> https://gitlab.com/juan.quintela/qemu into staging (2023-05-08
>> 20:38:05 +0100)
>> are available in the Git repository at:
>>    https://gitlab.com/juan.quintela/qemu.git
>> tags/migration-20230509-pull-request
>> for you to fetch changes up to
>> 5f43d297bc2b9530805ad8602c6e2ea284b08628:
>>    migration: block incoming colo when capability is disabled
>> (2023-05-09 20:52:21 +0200)
>> ----------------------------------------------------------------
>> Migration Pull request (20230509 vintage)
>> Hi
>> In this PULL request:
>> - 1st part of colo support for multifd (lukas)
>> - 1st part of disabling colo option (vladimir)
>> Please, apply.
>
> Build failures.
>
> https://gitlab.com/qemu-project/qemu/-/jobs/4257605099#L2241
>
>    85 | void colo_record_bitmap(RAMBlock *block, ram_addr_t *normal, uint normal_num);
>       |                                                              ^~~~
>       |                                                              u_int
>

Grrr

And the worst thing is that hate those types, tried to get then out
long, long ago for a similar problem.

Will resend, sorry for the noise.

Later, Juan.


