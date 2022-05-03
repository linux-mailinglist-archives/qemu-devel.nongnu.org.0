Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4715B51878D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:59:16 +0200 (CEST)
Received: from localhost ([::1]:55382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltzf-00087w-9S
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nltxf-0006Db-EP; Tue, 03 May 2022 10:57:11 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e]:39520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nltxd-00070J-Fk; Tue, 03 May 2022 10:57:11 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 m3-20020a4ac683000000b0035f13dde9ccso363401ooq.6; 
 Tue, 03 May 2022 07:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ftIcnuDu9Q6DpntA6Qn628mdxfV0S3QB1LMgkAulvA=;
 b=AsWNwkhxSLwuRYc2dn4yx3RZl8KVvCPQC/yOZFmeTSI1+im9xMmKParqDqCU3mNXgQ
 q6Uoat89lsJ8RjTLxSBg6WxfxP0SpAF6Q7GgJqHc4oZnQSYGK6sPoFHQrUds1ANeRefX
 mcG7/1R4UmUtSdDRdO3khKkaw64TXv1BJihj3l0aTrSE4Rr/tU60h7es4sJB/EXwAcl2
 zncYpYjHitTuMQ5FqKlILAoVJFgj7hiClXCgHNEStAq8nVi9Cts/1qy9hCQlM8Z0WC0s
 xlTB/XobeQpaWCJbuhWk4voj8KeG4Bu58CSJZKW8yHCQ/ZppD0WgMGnJGIuCb9Ch/POw
 3djA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ftIcnuDu9Q6DpntA6Qn628mdxfV0S3QB1LMgkAulvA=;
 b=bADGWcmArtgGqEBPC5/8zjff9Bq9q5R2NrxfDfhrp6UshHvA7Mpy0a+SfDJdUP7QmA
 seOSvBYyqoMUBWV3H0g5wSZWkT232ucteR/oif2w/rJvqSzbOXUvGo9wQMgUq1hoopBl
 OKjrprvyTDbtg1JTw1oS7TYBsKx/7qIvQiR4q9iXUV/m0zXVqsHROqFLJVXQIVFvAapU
 OhGQWnvGMs+cot7EhDB6Ltw296Vtfmy/HbzL5iJIPKG/xsGZRgb1NkTjOzAsuliKS4UP
 M6B8Ir1v2UErAjtWgS0lVvbFjvO1jReDaR891eWjESZA/+bD1hW/H2TvkSdSi+C8LLeT
 /e8Q==
X-Gm-Message-State: AOAM5311xh3I9FI9PBfnlz6inoXXDS8BmsPpiaIKoB3ezePrFyQST7Lp
 VfHWQRWkt9wJb79PBYZAAgq3pq5ttKoRio4ZS9A=
X-Google-Smtp-Source: ABdhPJyUBlikxW1xZD1wFo2rk2ZYFp3wdh2nFGcBK13o+mUkawNidwpkXphXVsGooJgPbM0doxwqGduvHXsvgDBfD5o=
X-Received: by 2002:a4a:95c7:0:b0:35e:8a87:16e7 with SMTP id
 p7-20020a4a95c7000000b0035e8a8716e7mr5813987ooi.71.1651589828123; Tue, 03 May
 2022 07:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220428094708.84835-1-david@redhat.com>
 <97f9be15-4ccd-505b-a35e-8d95823df03a@redhat.com>
 <85dffe1d-a6d2-9e93-749b-29febb0b6dc5@redhat.com>
 <CAEgyohV9kjXUW_LMQM7YryQL1=0VW3pSCbffG2uFG7d5vNo5iw@mail.gmail.com>
 <348d3383-0bd4-1f18-2d14-08962be66c32@redhat.com>
 <CAEgyohUw8GBMaoKpVB4D0GCbKVQ1NTaT9px6LBX1BsS-ex-nxg@mail.gmail.com>
In-Reply-To: <CAEgyohUw8GBMaoKpVB4D0GCbKVQ1NTaT9px6LBX1BsS-ex-nxg@mail.gmail.com>
From: David Miller <dmiller423@gmail.com>
Date: Tue, 3 May 2022 10:57:32 -0400
Message-ID: <CAEgyohUk3cX32XXrecAKNbSxd9R8H-dvmesnAPPdW=Mz5Xi+7w@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] s390x/tcg: Implement Vector-Enhancements
 Facility 2
To: Thomas Huth <thuth@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=dmiller423@gmail.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

It looks like google killed allowing password access early, nothing
makes it work anymore.
They had plans to disable 'less secure app' in may,  but it thought it
was the end of the month.
I'll try copy/paste as plain text as well though I Know it will likely
screw it up..

On Tue, May 3, 2022 at 10:42 AM David Miller <dmiller423@gmail.com> wrote:
>
> Sorry,  It was in the discussion for v4 patches,  as an attachment .
> mail thread:
> [PATCH v4 10/11] tests/tcg/s390x: Tests for Vector Enhancements Facility 2
> So it likely never made it to the mailing list.
>
> I've reattached and will forward the patch (by itself) to the mailing list.
>
> I think the other solution works just as well by ignoring if compiler
> doesn't support z15.
>
> I just thought I'd bring it back up as I saw discussion about it.
>
> Thanks
> - David Miller
>
>
>
>
>
>
> On Tue, May 3, 2022 at 2:55 AM Thomas Huth <thuth@redhat.com> wrote:
> >
> >   Hi!
> >
> > On 02/05/2022 18.06, David Miller wrote:
> > > There was also the patch that had them as .insn in the other series of emails.
> >
> > Sorry, I missed that patch, could you please point me to the mail on
> > https://lore.kernel.org/qemu-devel/ ? I remember that there was a discussion
> > about the vri-d encoding, but I apparently missed the patch that came out of
> > this discussion...
> >
> >   Thomas
> >
> > > On Mon, May 2, 2022 at 11:52 AM David Hildenbrand <david@redhat.com> wrote:
> > >>
> > >> On 02.05.22 09:20, Thomas Huth wrote:
> > >>> On 28/04/2022 11.46, David Hildenbrand wrote:
> > >>>> Implement Vector-Enhancements Facility 2 for s390x
> > >>>>
> > >>>> resolves: https://gitlab.com/qemu-project/qemu/-/issues/738
> > >>>>
> > >>>> implements:
> > >>>>       VECTOR LOAD ELEMENTS REVERSED               (VLER)
> > >>>>       VECTOR LOAD BYTE REVERSED ELEMENTS          (VLBR)
> > >>>>       VECTOR LOAD BYTE REVERSED ELEMENT           (VLEBRH, VLEBRF, VLEBRG)
> > >>>>       VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO  (VLLEBRZ)
> > >>>>       VECTOR LOAD BYTE REVERSED ELEMENT AND REPLICATE (VLBRREP)
> > >>>>       VECTOR STORE ELEMENTS REVERSED              (VSTER)
> > >>>>       VECTOR STORE BYTE REVERSED ELEMENTS         (VSTBR)
> > >>>>       VECTOR STORE BYTE REVERSED ELEMENTS         (VSTEBRH, VSTEBRF, VSTEBRG)
> > >>>>       VECTOR SHIFT LEFT DOUBLE BY BIT             (VSLD)
> > >>>>       VECTOR SHIFT RIGHT DOUBLE BY BIT            (VSRD)
> > >>>>       VECTOR STRING SEARCH                        (VSTRS)
> > >>>>
> > >>>>       modifies:
> > >>>>       VECTOR FP CONVERT FROM FIXED                (VCFPS)
> > >>>>       VECTOR FP CONVERT FROM LOGICAL              (VCFPL)
> > >>>>       VECTOR FP CONVERT TO FIXED                  (VCSFP)
> > >>>>       VECTOR FP CONVERT TO LOGICAL                (VCLFP)
> > >>>>       VECTOR SHIFT LEFT                           (VSL)
> > >>>>       VECTOR SHIFT RIGHT ARITHMETIC               (VSRA)
> > >>>>       VECTOR SHIFT RIGHT LOGICAL                  (VSRL)
> > >>>
> > >>> Thanks, queued to my s390x-next branch now:
> > >>>
> > >>>    https://gitlab.com/thuth/qemu/-/commits/s390x-next/
> > >>>
> > >> Thanks for fixing up. At this point I would have suggested to exclude
> > >> the tests for now.
> > >>
> > >> --
> > >> Thanks,
> > >>
> > >> David / dhildenb
> > >>
> > >
> >

