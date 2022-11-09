Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04606237C5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 00:54:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osusz-0002xK-T7; Wed, 09 Nov 2022 18:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1osusw-0002wT-Ku
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 18:53:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1osuss-0004Pt-Mk
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 18:53:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668038009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7LvRy1bjb7DxzPdZjx1Ckxq/ftVi415szuObTWdvdTU=;
 b=FhRDou09vEq0RlU6CY3YZpQRZym3K9BHxOsmYcAywyDDKi+7xirtM2lsSu1jpT7zyS9ttK
 gJ8ZoaTtBm5Hjg5S3LRRKtKfieVoK1kRSknh90m5ZDZPmC+ULKLcC5Ce/AnYEvOKqmivuz
 JceCOgforsKruMKGi6/NsGDq52HEXiY=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-RZyVjgszPYGJiQG7SO99_w-1; Wed, 09 Nov 2022 18:53:28 -0500
X-MC-Unique: RZyVjgszPYGJiQG7SO99_w-1
Received: by mail-io1-f70.google.com with SMTP id
 g13-20020a056602072d00b006c60d59110fso76765iox.12
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 15:53:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7LvRy1bjb7DxzPdZjx1Ckxq/ftVi415szuObTWdvdTU=;
 b=0cnLj2IeTxFHd7gr8VpXdmS6HF3XrUfKIPsj8+EKpr+xCx9bC6sllb2e3tnT5PJ9MS
 B4Q5/UYYfATZ8LMCXiDOuSgKT0YJsgbv6M7r+UuY7Mvg3tuDclcXLwTBwWBQE+wXgu1z
 gfnnfAnwJF02jwbEJMu1pEj+4Tbt1FxBzg0Epxnl9F6u9BQEIxSIPTUX4sd/s7E2BV0Z
 dYM0FxPXqz21hM6SSWafMdJhtVRDd0vvmS53zMuae5Bx27kbXYhgnlywzehf0os+2Zpt
 islGFMaTPKMKCHxaOYEHU1PGGMgoKRapJUkfQ7wpx/klUIvZ5IKhimDx8xCWjSIkN7ZV
 T7Jw==
X-Gm-Message-State: ACrzQf3f1Xb3mxwISymQf/mlw8ym2/2jRZs9jz/pGIKOdo9gNe5orVLu
 EDw9kwPIRS64tn7beTGVvYhpYs6mWp9KZGVOzLfBjkh0e/ZuQS+xsY4Eie+iLOJx75VC112w8FU
 1IU89hWcGZSvin1+v4cK0y1wenjQ9kCY=
X-Received: by 2002:a5e:d506:0:b0:6a4:b8b3:a6f0 with SMTP id
 e6-20020a5ed506000000b006a4b8b3a6f0mr35621548iom.138.1668038007763; 
 Wed, 09 Nov 2022 15:53:27 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5s0Q6JNeEC5n6u83ApxtDKOsLaYknnFBIE7kK8JHxNkCNeqgS3T8GvQ9lD6rfjXe9OYRt/oz72IJxcanW8BrQ=
X-Received: by 2002:a5e:d506:0:b0:6a4:b8b3:a6f0 with SMTP id
 e6-20020a5ed506000000b006a4b8b3a6f0mr35621540iom.138.1668038007529; Wed, 09
 Nov 2022 15:53:27 -0800 (PST)
MIME-Version: 1.0
References: <20221104095700.4117433-1-eesposit@redhat.com>
 <20221104095700.4117433-3-eesposit@redhat.com>
 <197f2a27-4c3f-a62b-535c-d1db9ba22a32@yandex-team.ru>
 <88f02d19-84d8-d1a7-4250-416fd32f1435@redhat.com>
 <711f6d68-888e-bca0-972e-a05503a039c5@yandex-team.ru>
 <460d096e-c642-166c-a4fd-77f953bfe33a@redhat.com>
In-Reply-To: <460d096e-c642-166c-a4fd-77f953bfe33a@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Wed, 9 Nov 2022 23:52:51 +0000
Message-ID: <CAELaAXwR_t9JyL=iMATGCp0cd-rRtKJ_OaSnu1hLGk8B3RaYNQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] block-copy: add missing coroutine_fn annotations
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
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

On Wed, Nov 9, 2022 at 12:24 PM Emanuele Giuseppe Esposito
<eesposit@redhat.com> wrote:
> CCing also Alberto and Paolo
>
> So basically I think what we need is something that scans the whole
> block layer code and puts the right coroutine_fn annotations (or
> assertions, if you want) in the right places.
>
> The rule should be (anyone please correct me if I am wrong):
> - if a function is only called by coroutine_fn functions, then it's a
> coroutine_fn. Theoretically all these functions should eventually end up
> calling qemu_coroutine_yield or similar.
>
> - if it's called only from non-coroutine, then leave it as it is.
> Probably asserting is a good idea.
>
> - if it's used by both, then it's a case-by-case decision: I think for
> simple functions, we can use a special annotation and document that they
> should always consider that they could run in both cases.
> If it's a big function like the g_c_w, call only the _co_ version in
> coroutine_fn, and create a coroutine or call the non-coroutine
> counterpart if we are not in coroutine context.
> Which is also what I am trying to do with g_c_w_simple.
>
> However, it would be nice to assign this to someone and do this
> automatically, not doing it by hand. I am not sure if Alberto static
> analyzer is currently capable of doing that.
>
> What do you all think?

From what I've seen so far of coroutine_fn, its intended semantics
seem to align completely with the `async` of many languages. The only
restriction is that a function that calls coroutine_fn functions
(a.k.a. coroutines) must itself be coroutine_fn. Marking other
functions as coroutine_fn, as you mention in your first bullet above,
just artificially restricts them to coroutine context. Similarly,
restricting functions to non-coroutine context may not generally be
useful, except when there is an alternative version of the function
that is optimized for coroutine context in some way (e.g., calling a
coroutine_fn instead of the corresponding generated_co_wrapper).

But maybe you're writing a function that you predict will eventually
need to call a coroutine, even though it doesn't today. In those cases
it could make sense to mark it coroutine_fn, to prevent non-coroutine
callers from appearing and later breaking, but this should probably be
the exception, not the rule.

My WIP static analyzer [1] should be able to find most cases where a
non-coroutine_fn function calls a coroutine (some complicated cases
involving function pointers and typedefs are not yet implemented). It
also complains about cases where a coroutine calls a
generated_co_wrapper (see the no_coroutine_fn annotation, which you
can also apply to functions other than generated_co_wrappers). You can
use it today: just merge [1] with your code and run (after building
QEMU):

    ./static-analyzer.py build block

Alberto

[1] https://gitlab.com/albertofaria/qemu/-/tree/static-analysis


