Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193C9573A56
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 17:40:39 +0200 (CEST)
Received: from localhost ([::1]:49464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBeTc-0006bF-Vn
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 11:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBeP1-0003VU-5i
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 11:35:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBeOz-0003Ze-Bp
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 11:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657726548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZ09SuVevgPsM++U59/MI7bRFzMfPjrG0ddDOFgzuCM=;
 b=VbOYcx4Cp5Xj8OtEG/PMaFYcZtl+HAO4lElZYfEhyZjIuT6EbDZk/xkQCrbsBOkeCIMRYM
 D5vaXeqrAsijcq2VahAx2rbfAXoJGvK2RPJTfntI+A2qWdywCvyeiQMOiMHMvR2JQxOWoX
 wF1fl3SXn9oxPcZPtNkx2BnxMBVFxYs=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-VRRiajbjPgOGgNAOwdkquQ-1; Wed, 13 Jul 2022 11:35:47 -0400
X-MC-Unique: VRRiajbjPgOGgNAOwdkquQ-1
Received: by mail-ot1-f71.google.com with SMTP id
 by5-20020a056830608500b00616c152aefbso4607509otb.6
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 08:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FZ09SuVevgPsM++U59/MI7bRFzMfPjrG0ddDOFgzuCM=;
 b=VmBD0ZGVlRSf8OMmO+uumxtXE/z3w3Cahfx2bAj9nSdLvEe7oao/IKhrBtcc6JsyGy
 f3J2whfCDt1iD1qzYlA1+ZNGA6CIq2Hoxp6a+AAmixqvbwzhAkNyWXHZWhrmXuB79++/
 0lxBtIzJNLe8VA4ktyyqYieumtyxgfgBuPAfOezFjxUplZ1kND86kV6rtwg6Ier28xlB
 SCJB3B5+B7C7tGhQVIn3XvAqxf2qjY3om4DN9icZoyj5ResrMpAVRivuynlFgNMVZjrB
 dkwRU8Tit2x+881cclFJ4xWeBsmoWPjA/hkQMCPcjop1JQ5xJ76kJoq7S4MC7r1LmfXl
 zY2Q==
X-Gm-Message-State: AJIora9gw9dWHBffFPyi7RItw3oAfO/lLWCcthhZkf9TCBSPaM8uYVEe
 rvCsCUbyi7S/w9dbZmxxMJ86nhwNptEMqt4RbpkHmNwVGFHXrRPuwKaCgEe4E2nLEEPnIqSC85L
 eAcTA4Z41LIMcn4TTJNXS1838q+xo3k4=
X-Received: by 2002:a9d:7098:0:b0:61c:3c53:2e8a with SMTP id
 l24-20020a9d7098000000b0061c3c532e8amr1583339otj.378.1657726546542; 
 Wed, 13 Jul 2022 08:35:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tLGkF+x1Ag/w1TIjHh4masD9PISPS1sB4KzQUEW3dB/eKp1Y73x8+wXuRrWpnKHyuhmce9lnuXKcjuO1yHuk0=
X-Received: by 2002:a9d:7098:0:b0:61c:3c53:2e8a with SMTP id
 l24-20020a9d7098000000b0061c3c532e8amr1583320otj.378.1657726546314; Wed, 13
 Jul 2022 08:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220713130322.25517-1-frankja@linux.ibm.com>
 <20220713130322.25517-2-frankja@linux.ibm.com>
 <CAMxuvaz=erLFMasq1CK_Y1Ku+dU0ZMR3EPF8ehDnPjQ94R9Rfw@mail.gmail.com>
 <fd62d8e8-a9f0-1e19-c8da-c8f31248983e@linux.ibm.com>
In-Reply-To: <fd62d8e8-a9f0-1e19-c8da-c8f31248983e@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 13 Jul 2022 19:35:35 +0400
Message-ID: <CAMxuvaxJ7e6A4n-UOiUKWwh9-9k-yP-rUR47PYER3RT=vzLBCg@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] dump: Cleanup memblock usage
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, "Henderson,
 Richard" <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi

On Wed, Jul 13, 2022 at 7:30 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:
>
> On 7/13/22 17:09, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Jul 13, 2022 at 5:07 PM Janosch Frank <frankja@linux.ibm.com> w=
rote:
> >>
> >> The iteration over the memblocks is hard to understand so it's about
> >> time to clean it up.
> >>
> >> struct DumpState's next_block and start members can and should be
> >> local variables within the iterator.
> >>
> >> Instead of manually grabbing the next memblock we can use
> >> QTAILQ_FOREACH to iterate over all memblocks.
> >>
> >> The begin and length fields in the DumpState have been left untouched
> >> since the qmp arguments share their names.
> >>
> >> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> >
> > After this patch:
> > ./qemu-system-x86_64 -monitor stdio -S
> > (qemu) dump-guest-memory foo
> > Error: dump: failed to save memory: Bad address
>
> If you have more ways to check for dump errors then please send them to
> me. I'm aware that this might not have been a 100% conversion and I'm a
> bit terrified about the fact that this will affect all architectures.

Same feeling here. Maybe it's about time to write real dump tests!

>
>
> Anyway, I'll have a look.
>
> [...]
>
> >> +static inline int64_t dump_get_memblock_start(GuestPhysBlock *block, =
int64_t filter_area_start,
> >> +                                  int64_t filter_area_length)
> >> +{
> >> +    if (filter_area_length) {
> >> +        /*
> >> +         * Check if block is within guest memory dump area. If not
> >> +         * go to next one.
> >> +         */
> >
> > Or rather "return -1 if the block is not within filter area"
>
> Sure
>
> >
> >> +        if (block->target_start >=3D filter_area_start + filter_area_=
length ||
> >> +            block->target_end <=3D filter_area_start) {
> >> +            return -1;
> >> +        }
> >> +        if (filter_area_start > block->target_start) {
> >> +            return filter_area_start - block->target_start;
> >> +        }
> >> +    }
> >> +    return block->target_start;
> >
> > This used to be 0. Changing that, I think the patch looks good.
> > Although it could perhaps be splitted to introduce the two functions.
>
> Yes but the 0 was used to indicate that we would have needed continue
> iterating and the iteration is done via other means in this patch.
>
> Or am I missing something?

Well, you changed the way the loop used to work. it used to return 1/0
to indicate stop/continue and rely on s->start / s->next_block. Now
you return memblock_start.

>
> >
> >> +}
> >>   #endif
> >> --
> >> 2.34.1
> >>
> >
> >
>


