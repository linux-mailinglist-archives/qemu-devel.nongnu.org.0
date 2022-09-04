Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4105AC831
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 01:51:14 +0200 (CEST)
Received: from localhost ([::1]:47722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUzOT-0003ma-QE
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 19:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oUz9x-0008R5-8h
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 19:36:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oUz9p-0005Et-KH
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 19:36:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662334565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LHadEMusjhOnNSYZztn2eRUOwuLEz2nWyck5dNBUxMU=;
 b=hdHuveWTtpjVlvmioMcnW6Xr5RNUcca3HTqMakmDejlZ75YiiSGbH9qfwl77jggKQ9axxn
 qXTgCJfDI/Rw3Kh40/CrmYEXo/aJKzws0CqEUlAy7ffRPJ75QcD9wtIPtnfYbtsqE9W1sP
 fG2IZCcHaPMwYd/laM1rCM2kORJwxi4=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-599-DgZ0C-nONrmntum4s780tA-1; Sun, 04 Sep 2022 19:36:02 -0400
X-MC-Unique: DgZ0C-nONrmntum4s780tA-1
Received: by mail-il1-f200.google.com with SMTP id
 n4-20020a056e02100400b002f09be72a53so4714376ilj.18
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 16:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=LHadEMusjhOnNSYZztn2eRUOwuLEz2nWyck5dNBUxMU=;
 b=1TyeyOhf8FZfyOmahxSCJGFFlMY0Xe+pZ4hr01QcPjAqp2eh9Y3TL+sf8FQpF6O4LD
 eupHBC7DW7BmIkQE9raKi/V9pNqB2LRZZ0gYRd+U36C0zXS9L5BjBYHvY8+NlMiATA2E
 Dsg+k55O466zZIu0gwARjMC2hQCY1NLyRVLPCgOrDWhmhQ3dLbkD6SL/pkDSz/IYqtZp
 O+p30u62UbassJRUf4XqgI5XCY0YlX3n5Yju/vujWUGxqJwH9F0LqaCmDkgozaSrQfiX
 /Lih39J6g+hieRRStdNnrRtQ5JMWKq9Y4iWdZqlB4+jY5TGcV/MAJZhUL13PsURiLBTI
 xFCA==
X-Gm-Message-State: ACgBeo1AOEDWO64aSjTR+67ZLck+ZniWSu746Puv9xjtx+7t6FD8rpQU
 dteBwHPJmFaeURK3TDhHAIpO0zDyhiH7cBAEe4H9QyZFWOKK+9Y6kh8vD80su5DAf/ZegOOx0Mb
 wxZxd7eQYoJZSSnf26WaZZPit+LE6J8w=
X-Received: by 2002:a05:6602:2c95:b0:689:e4e2:2c02 with SMTP id
 i21-20020a0566022c9500b00689e4e22c02mr20791643iow.94.1662334561641; 
 Sun, 04 Sep 2022 16:36:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4AxTKJsjlMhqGdqgZexdj1h7KRHLDqFrkeeHVBCnaw4KfLQ0wQ3iGVn7didjqNaBQGpjRALR+ZU7kdV7jwTRA=
X-Received: by 2002:a05:6602:2c95:b0:689:e4e2:2c02 with SMTP id
 i21-20020a0566022c9500b00689e4e22c02mr20791640iow.94.1662334561477; Sun, 04
 Sep 2022 16:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220826160927.322797-1-afaria@redhat.com>
 <YwppmYUOLTqQ7K25@xz-m1.local>
 <CAELaAXyRSpqVj+KmvfG6ghCwf6WfxE+ym7F7O-rKZpsVKyQbUA@mail.gmail.com>
In-Reply-To: <CAELaAXyRSpqVj+KmvfG6ghCwf6WfxE+ym7F7O-rKZpsVKyQbUA@mail.gmail.com>
From: Alberto Campinho Faria <afaria@redhat.com>
Date: Mon, 5 Sep 2022 00:35:25 +0100
Message-ID: <CAELaAXwaMoX2cHM7mvvbGHNjkj=6wzWZU0vTNhBys+FcH_=smQ@mail.gmail.com>
Subject: Re: [PATCH] softmmu/physmem: Fix address of FlatView access in
 address_space_(read|write)_cached_slow()
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Mon, Sep 5, 2022 at 12:32 AM Alberto Campinho Faria
<afaria@redhat.com> wrote:
> Hi Peter,
>
> On Sat, Aug 27, 2022 at 7:59 PM Peter Xu <peterx@redhat.com> wrote:
> > Any bug encountered?  It'll be great to add more information into the
> > commit message if there is.  We could also mention the issue was observed
> > by code review or so.
>
> I came across this when performing unaligned 8-byte writes on
> x86_64-softmmu. The write was aligned to 4 bytes but not 8, so the
> first 4 bytes were written just fine by
> address_space_translate_cached(), but flatview_write_continue() failed
> to write the following 4 bytes as it was translating the wrong
> address. I'll mention this in the commit description.

Oops, I meant that the first 4 bytes were written just fine by
flatview_write_continue(), but since it couldn't write the 8 bytes in
one go, it then called flatview_translate(), which translated the
wrong address.


