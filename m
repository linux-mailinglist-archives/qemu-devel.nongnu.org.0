Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE2555E562
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:40:12 +0200 (CEST)
Received: from localhost ([::1]:58676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6CNv-0008EU-Pt
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6CMK-0006t9-N7
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:38:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6CMI-0007Lh-TO
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:38:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656427110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mk2po78YXQtyjSEMhee1W028xPdx2xT6A5W7TQW5jxM=;
 b=coTAhz0P7M/73OwJeb/+yJOROY21Ms6yxpm7M0aJN6HjFJyWBTwiugE6zwzpiSGM8l7q5t
 e5t2+E5yrrnlaVsskxheqRiQ6ftvmMuBc+xqQ5roHivxsQNgxqfA9BwRsWPbUr6ccddR+f
 zQzXNShFbRaqe8NkUxltzprHZwedDmc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-o0qUiFXgPOq0kZwZp-GHVw-1; Tue, 28 Jun 2022 10:38:28 -0400
X-MC-Unique: o0qUiFXgPOq0kZwZp-GHVw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r132-20020a1c448a000000b003a02a3f0beeso837008wma.3
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 07:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mk2po78YXQtyjSEMhee1W028xPdx2xT6A5W7TQW5jxM=;
 b=EeZZ1L63Z5iAX7YUxZGJr4XxKAG+q2Z5tUYqnYJNFQ1XyRFG5FqfldrrLcs26HrZ3Y
 XQl/9d5FkrATnVvpWxCOCsV3RC0nuQPYoiaQ19VbplFQsJy8EyiNrMO4toLVuUetzPV/
 dOmrDKD+KXURTznJS6+8tj3zLl/PE6tEwL6ClYQ0MnIJZY6S4dNoTHomAPG2MCtb9nru
 vEm8GcVKd8kDXLXuYAKC8SgONwXxsKVnc/9NHTY8ZGfuRPWqjqLm8PER4VsnbH0ffQrp
 DcKl0rS/pA3XsqOPYn/V8AKHYWr8aub/w2V4tJZWSj5CNSsdH8cZCVwCGBfrtTNtxTuL
 qc9g==
X-Gm-Message-State: AJIora8hUveLrHppG6mSCAJntsJjpRZCwpj03hriV7kDYiNzo90O+iRU
 PPbH3ehDpVJgLTM4eCx3gtbxP9dIdfVFvK4JDBM98LKlcm/53GwgRtcMK7BOzdXhfzJ9f6y6gGV
 qCJDPHcLFiYwffoM=
X-Received: by 2002:a5d:598e:0:b0:219:ea16:5a2a with SMTP id
 n14-20020a5d598e000000b00219ea165a2amr17628110wri.343.1656427107341; 
 Tue, 28 Jun 2022 07:38:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tcwzOkpojbnejT737F3Ab5rCaLeoJFfR+RLw98d5a2CDH9fcMmsSX0n0QEou3r7LCraZ1aRw==
X-Received: by 2002:a5d:598e:0:b0:219:ea16:5a2a with SMTP id
 n14-20020a5d598e000000b00219ea165a2amr17628088wri.343.1656427107101; 
 Tue, 28 Jun 2022 07:38:27 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 u2-20020a5d5142000000b0021b966abc19sm13822034wrt.19.2022.06.28.07.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 07:38:26 -0700 (PDT)
Date: Tue, 28 Jun 2022 10:38:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <20220628103639-mutt-send-email-mst@kernel.org>
References: <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <YrrSFig7Qo/PKqNx@redhat.com>
 <20220628060510-mutt-send-email-mst@kernel.org>
 <CAARzgwwdWkqXnP=QHqme-GACa5LvfN5cO1PZpFhZ-G6NR73sEw@mail.gmail.com>
 <YrrbHYJn5soL/V6n@redhat.com>
 <20220628072610-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Z9uasRtyf5=oFx7ScFO_+T01ooH-zWLdkjECMaZpuQw@mail.gmail.com>
 <CAARzgwyLbVFCKJZXwdwwweVxgmG8VX1wc1bBYEaNpvKiPcU+TQ@mail.gmail.com>
 <Yrr6VDCuKpp8SqW9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yrr6VDCuKpp8SqW9@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, Jun 28, 2022 at 01:55:48PM +0100, Daniel P. Berrangé wrote:
> On Tue, Jun 28, 2022 at 06:06:19PM +0530, Ani Sinha wrote:
> > On Tue, Jun 28, 2022 at 5:40 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Tue, 28 Jun 2022 at 12:50, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > I think the main difference is not even in how it works, it's
> > > > in what it does. Which is check that ACPI tables are sane.
> > > > Who cares about that? Well developers do when they change the
> > > > tables. Users really don't because for users we have the expected
> > > > tables in tree and we check against these.
> > >
> > > It wants to build and run a big guest binary blob -- that to me is
> > > the main difference. Users don't much care about any of our tests,
> > 
> > perhaps but we do enforce patch submitters to make sure make check
> > passes before submitting patches. make check-avocado is not run as
> > part of make check, requires considerable disk space to download all
> > guest images and hence generally not run by patch submitters. Making
> > bits parts of avocado tests almost defeats the purpose of having this
> > test at all.
> 
> This proposed biosbits test also involves a considerable download.
> The test is said to be irrelevant for anyone except those working
> on a fairly narrow set of QEMU firmware related bits. So by the same
> rationale we shouldn't impose that burden on everyone working on
> QEMU by having it in qtest. Making it entirely optional, only
> downloaded by avocado on demand, for the people who need to run
> the tests is best.
> 
> With regards,
> Daniel

Optional is fine. I would like to make life easy for
developers working on ACPI though, the field is unforgiving
enough as it is.
How about we skip the test if the submodule is not checked out?

> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


