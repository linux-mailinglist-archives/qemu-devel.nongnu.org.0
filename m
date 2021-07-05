Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422D63BC395
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:19:09 +0200 (CEST)
Received: from localhost ([::1]:59232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Vzg-0005yZ-Br
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0VyQ-00055k-E5
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:17:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0VyO-00030X-Np
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:17:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625519868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0agd9Ryzh9R5SD+OnDw+VfTjImpVPrg9U2BcdANCGNY=;
 b=HVUR3b0M1DLA3KvczA00pKeQUfU82uZrPULel/9WueCZhRUJ6yQtMoezMSU9GzrQ2WDfCU
 zflGvVL1Swm0eBFJZjkMq8VvDJcBMHXYg7Rl5g2ycuKFpkaaegSA9+32Euxt5A4U5XNIYz
 hiKN3krDvqvE354FF624JMedhW6wgBE=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-8fb7Z4LVN7abdb2jki4tNA-1; Mon, 05 Jul 2021 17:17:47 -0400
X-MC-Unique: 8fb7Z4LVN7abdb2jki4tNA-1
Received: by mail-vs1-f69.google.com with SMTP id
 b26-20020a67f85a0000b029028ad8073dc0so745846vsp.12
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 14:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0agd9Ryzh9R5SD+OnDw+VfTjImpVPrg9U2BcdANCGNY=;
 b=kecbny4W0Ct+HYPUWRk98/91ZmmqBUT2iml142gtyp5Xg6O7xMkkkctrGJNG7qEKM9
 g2eqQfPmsaDIVhOR09jrlylrk9GT62dHjZHGj1Oxi4d1A1gU1LM63+Fxr6EgXX1WlHgf
 sL6+CkqQHH7CnHRXtZ+75l1JmHdtHBbxgZGE4zyGISpRGcau5V67f0/3BEZC5YuSfuUy
 UJEQzwvnohK7K9UG5CyGd9yIJVObD3jXkV0h6zY6TJUuT1rBM0SDGgCT3RDLst6bMJSd
 Seaj7shj97VGSiUbfwspSwYhZBrlRZbwnFJKuRhC3v6qBtYg/rY4JKoOeD9FiOI4tHLh
 Msgg==
X-Gm-Message-State: AOAM530WAimn6fp4+zA9wHrJAjTYFKQrBoQk1dXwQfH4g3bLoDfUpvTl
 sqncm7rilfFyO9eNhi90rWWibq5svBUeBr+4eV7/9OKmsFIScx9my4McMvZGlCA8MERBJI0Kmls
 FWdkI0MmUbgxulIos41lXQnVczXOStng=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr12624918uam.110.1625519866807; 
 Mon, 05 Jul 2021 14:17:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo4jzdCpUFtIXw5P5sDn4lcaUVgxURsXZXcj18H378IBE+3lSBh2/D5tVnfI7fK/IwPmLDWStt20bRSmZ4O6E=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr12624905uam.110.1625519866689; 
 Mon, 05 Jul 2021 14:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210629143621.907831-1-eric.auger@redhat.com>
 <20210629143621.907831-5-eric.auger@redhat.com>
In-Reply-To: <20210629143621.907831-5-eric.auger@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 5 Jul 2021 18:17:20 -0300
Message-ID: <CAKJDGDbmkRNoruTwW80G=joJUyXoFQgxxQKgAj9MTpsSaQ=m_g@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] avocado_qemu: Fix KNOWN_DISTROS map into the
 LinuxDistro class
To: Eric Auger <eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 11:36 AM Eric Auger <eric.auger@redhat.com> wrote:
>
> From: Wainer dos Santos Moschetta <wainersm@redhat.com>
>
> As the KNOWN_DISTROS grows, more loosely methods will be created in
> the avocado_qemu/__init__.py file.
>
> Let's refactor the code so that KNOWN_DISTROS and related methods are
> packaged in a class
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> [Eric] rebase and add commit message
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 160 +++++++++++-----------
>  tests/acceptance/intel_iommu.py           |  12 +-
>  tests/acceptance/smmu.py                  |  12 +-
>  3 files changed, 94 insertions(+), 90 deletions(-)
>

As suggested in the cover letter, moving the changes from Wainer to
the beginning of the patches makes more sense and reduces the amount
of changes.

The code refactoring from Wainer is here:
https://gitlab.com/willianrampazzo/qemu/-/commits/test_eric_auger_v5


