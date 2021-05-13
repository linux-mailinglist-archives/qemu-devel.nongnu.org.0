Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38FD37F7F4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:29:55 +0200 (CEST)
Received: from localhost ([::1]:51874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhATR-0003IR-Gq
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhANn-0003BV-DK
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:24:03 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhANl-00037g-Ni
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:24:03 -0400
Received: by mail-ej1-x62d.google.com with SMTP id t4so39660139ejo.0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TFz3uQ3NEcT/Q3F9GeXoEG+APbnxxOumDhgQ8adfrvw=;
 b=dycxLt0g2Q0IZT6sbbnHL/kgbtxWmEDeS9vRMEBGyX0Rna8EE6N9IQWZQjOITrnAe3
 Pd1FU9oGhZvIT/fGQSMNm23H4Ejk2uXZGWBxhl4V2hGgEcLymDSD7dCPotnspyaQxIQs
 cX+YtwU21ne9dKOL3eUU3CW4+ZxZ3pgCsqQNpqijq2i8gNlMtN7cyLZ+iBlJW2i5ASAK
 Lpuv0ZRWuSpcSxZfribbiWyKy+Gj8g1cUJrzfWDGBnecSrVHmYbHCzayNkcWt9jTRBb+
 4aSrKeuOHcTBf9ecNzCAXf3W/yg/QHUBTHIoHMkysVvOM2n994cr5iofdw8coxGBNaRw
 ZxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TFz3uQ3NEcT/Q3F9GeXoEG+APbnxxOumDhgQ8adfrvw=;
 b=EY55UZ9fLd48gqb/GOyo8OqDASmI0zN9X9haqcYDDFUZjvaVQnG4lm9umvwPRq3t8I
 x+TYzRhLTfR7nfZRz01H8j9xkAjXbh2J+pSX9JLbQGEeTkblWwN2Q6+EHfMOJQaOqi5c
 odcZBt6okD3d3seTKZ8Bf0G6YZcD6nv+ygWmjyD/3HdhHUIqug6maSAKqRStobJzWeSu
 +4hIryY9tz4ZCPd0KkQi88aNpVawgpi+hbJZmvgvo2T/y2Gl+01y1imtG8BWPxyjkSpF
 cXDwOVJ+V6vEQznVJ2KkH8ALJ4n0bHapWkKJiDgcnBkp3izDmhb07Wv/I8+oLTwGXs++
 sCgg==
X-Gm-Message-State: AOAM5324B1DNol/1zo3mxBy21Bpr2hSzVL/G2emEciNAAvN5TVoPOp0c
 l4nTj+sXArHJpRjUmZbbfkh3u6TbgtEO09Em4cCyFg==
X-Google-Smtp-Source: ABdhPJyVW5/H6IwnANS7Q2505TOnoWKqUl/r9evpMRm7UG9UM057NUWpbOmSAnXSUGQ50dw01+TRdmutTHQsegXFKow=
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr42916962ejb.382.1620908640400; 
 Thu, 13 May 2021 05:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210513124737.00002b2d@Huawei.com>
In-Reply-To: <20210513124737.00002b2d@Huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 13:23:48 +0100
Message-ID: <CAFEAcA8a+A2u=sF6L-A1ZK7hSiAd2n24Xf0J6j5LeBFa-RTMFw@mail.gmail.com>
Subject: Re: RFC: Memory region accesses where .valid.min_access_size <
 .impl.min_access_size
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chris Browy <cbrowy@avery-design.com>, Linuxarm <linuxarm@huawei.com>,
 Peter Xu <peterx@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 May 2021 at 12:49, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
> My initial suggestion was to fix this by adding the relatively
> simple code needed in the driver to implement byte read / write,
> but Ben pointed at the QEMU docs - docs/devel/memory.rst which
> says
> "
> .impl.min_access_size, .impl.max_access_size define the access sizes
>    (in bytes) supported by the *implementation*; other access sizes will be
>    emulated using the ones available. For example a 4-byte write will be
>    emulated using four 1-byte writes, if .impl.max_access_size = 1.
> "
>
> This isn't true when we have the situation where
> .valid.min_access_size < .imp.min_access_size
>
> So change the docs or try to make this work?

I don't (yet) have a view on what the in-principle right thing
should be, but in practice: how many devices do we have which
set .valid.min_access_size < .imp.min_access_size ? If we want
to change the semantics we'd need to look at those to see if they
need to be adjusted (or if they're just currently buggy and would
be fixed by the change).

thanks
-- PMM

