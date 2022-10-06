Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C4C5F6649
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 14:43:20 +0200 (CEST)
Received: from localhost ([::1]:37818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogQDe-00062l-FK
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 08:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogPjo-00045Y-Gs
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 08:12:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogPjl-0006YW-GY
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 08:12:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665058344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lKuy1tCJfMdk8ezi3mAIpq75BAOcPKgiOMEzxb4tQ8c=;
 b=SHZ+QLAxJMtdvVbuHA3RztzWPzgabTVgHoYbIk20bsgpFFs4XsBifbIZLL/ruhQG/ZxKCP
 KS3NTuqBu+jqFB+yLYFbKHXD35dLd9oelAQ1avHj4oU0uSp4pJNsxdwfg/P7iBSMc4OPWC
 tineY3c9r106IKyBYFPO2fIZyQxZuj8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-G4klpVpAPHS5yDkjDCjjkg-1; Thu, 06 Oct 2022 08:12:23 -0400
X-MC-Unique: G4klpVpAPHS5yDkjDCjjkg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r4-20020adfbb04000000b0022e5ec02713so462688wrg.18
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 05:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lKuy1tCJfMdk8ezi3mAIpq75BAOcPKgiOMEzxb4tQ8c=;
 b=Gt9F9T5o5J20oSJslK7UwZ8P6uvnTjuQmAjjsEEbcYD0STl113FhMnu6ef0Y8RsnqD
 9EHTH+G6132FD8Ra/QXYIZck9KD8rqlzwIerWhrhW73ZZZ+AQZQ31mz4X01GlqfGCOf9
 9MBAC8mLEKfKSn8FmH3Xcdaqtfzv9kprMxtdLcRvNO7ZSnF9HFv80hHJSube3QUrYr0C
 0Cpj076Lhfr86U+TdtaNbbYcy82fPARu6enHwsbIGDsrinmETAcEUAg0eZ1tBVbz8EWZ
 2oYXTUkPeU8gOam8ubOx9ViSTjkTJPtc/wQIuFZspaOLM3oWg3iLe0QkZVKa5k/nomjD
 lPEw==
X-Gm-Message-State: ACrzQf2/BFNrG3gngUc/cf3AbXY+E/gVAJyrTKx4aPL6KPdu3jNW8Jf1
 3/+9eKC89QIDCzNnDo389y41pTnkhhgIVbPzF8QuzmiSUr2o0hrHQdg4NDybKcGk9LCNrWfr/bM
 TSRzt29XvOLXnlPg=
X-Received: by 2002:a7b:c4c2:0:b0:3b4:fdc4:6df9 with SMTP id
 g2-20020a7bc4c2000000b003b4fdc46df9mr2918439wmk.123.1665058341009; 
 Thu, 06 Oct 2022 05:12:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7D39oF6/vUCRwYtdbkK2JuP0PgLj1HtIts0zVwfB6ZhDDe07FgqJ+gshTHDU27HdyA8ZN3bA==
X-Received: by 2002:a7b:c4c2:0:b0:3b4:fdc4:6df9 with SMTP id
 g2-20020a7bc4c2000000b003b4fdc46df9mr2918417wmk.123.1665058340806; 
 Thu, 06 Oct 2022 05:12:20 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 p16-20020adff210000000b0022ae0965a8asm17388451wro.24.2022.10.06.05.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 05:12:19 -0700 (PDT)
Date: Thu, 6 Oct 2022 08:12:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 imammedo@redhat.com, jsnow@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, thuth@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <20221006072335-mutt-send-email-mst@kernel.org>
References: <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
 <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
 <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com>
 <20220927171601-mutt-send-email-mst@kernel.org>
 <CAARzgwx=514Q8hMMLP4OpczRH4U2iiMnHqhJ6p3vg-8O3_aK=w@mail.gmail.com>
 <20220927233925-mutt-send-email-mst@kernel.org>
 <CAARzgwwBBheVucSwRYBkKfEcifmFY20AWK14nxS4NdpgKqcQyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgwwBBheVucSwRYBkKfEcifmFY20AWK14nxS4NdpgKqcQyw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SORTED_RECIPS=2.499, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, Sep 28, 2022 at 11:36:51AM +0530, Ani Sinha wrote:
> On Wed, Sep 28, 2022 at 9:28 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Sep 28, 2022 at 08:38:54AM +0530, Ani Sinha wrote:
> > > > I don't really care where we upload them but only having the
> > > > latest version is just going to break anything expecting
> > > > the old binary.
> > >
> > > In fairness, I am not entirely certain if there is a tight coupling
> > > between the qemu tests and the bits binaries. I have written the test
> > > framework in a way such that test modifications and new tests can be
> > > pushed into the bits binaries and the iso gets regenerated with the
> > > new tests from QEMU itself before running the tests. Only when we need
> > > bits bugfixes or say upgrade to new acpica that we would need to
> > > regenerate the bits binaries.
> >
> > Theoretically, that's correct. But if we did not have bugs we would
> > not need tests.
> 
> Hmm, you might have a point. Curious, do we keep versioned binaries of
> edk for example?

We keep them in git, don't we? Under pc-bios.

> If so, why we can't do the same for bits?

What can I say - let's get this upstream in some form and
then worry about improving the infrastructure.




-- 
MST


