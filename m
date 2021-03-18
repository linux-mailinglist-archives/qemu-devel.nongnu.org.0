Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD19340C77
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:07:51 +0100 (CET)
Received: from localhost ([::1]:47258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMx3m-0003FP-9L
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lMwo3-00007e-OF
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:51:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lMwnx-0000wv-Ov
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616089883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZLrySQOLEYLsKV5NF3SpeTIN8SG+7u9DfeWiXT/JzVw=;
 b=gsyOPPcyxMGAY+U5YDsHH6Wpq+QT1nnLeKk5wLw9J42ZwczuHFt0jCM+j4uh4Ev1b4wWY8
 bIbakYtTFcXO5TqGVFSpx0Jy2l5MFl8r21kjsM9ZpZUH2qrlywYd2L5U+Q5EaK7EPPneqf
 ahCuiWZgnUBQeqwWMtmjeozuyJvOJZM=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-NRLoKaLbPS20NXaE0XX2Qw-1; Thu, 18 Mar 2021 13:51:21 -0400
X-MC-Unique: NRLoKaLbPS20NXaE0XX2Qw-1
Received: by mail-vk1-f199.google.com with SMTP id s69so12505972vkd.20
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 10:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZLrySQOLEYLsKV5NF3SpeTIN8SG+7u9DfeWiXT/JzVw=;
 b=sxNRP+mhwRVHYz0gU5LqtCreNAzqKmYwI7p4Xhc87Uf6j1F4KxiItBS1b11zux5nxH
 uf2Bkq8/xaNaQ6MTpcitnXpO3IKi4yOc9fqizo1lUE27i7FHoZbUzjonw1F9d/orK+Xx
 ls/KYV6RzTNrFMUBFKYyoOrWLZ+G5LnXJI3wRD7Bhpbx6MWDU8k0ylQf3K6xl9lx0odB
 OHE7/cJ1hbx4w0pwePEplJx5oMMfdktLJi7rpJIi8C7tpRIDhZLmlaso/L580XOOp4M8
 jveR66rfLoqz10x/h+9ptA9W3l9PL0Y6op9xPhuw5rQNhsksY1+371ZE/yhdHK7jcF0v
 R+zQ==
X-Gm-Message-State: AOAM531bd1v+fhkKASthbqOz6Xc0JqXK+OagfqALATJp7XgZFIRtts1c
 EKOI7Y06GZTU8tgGqIUnc3XC8P+CqDpH2x67SUycN/Qld6SB8A7cfUgoYzZ/BlBCMJNAdI5zlRX
 22nYrZjXPQMOgpBg05a0lQfzypG3af8A=
X-Received: by 2002:ab0:3388:: with SMTP id y8mr3234897uap.113.1616089881407; 
 Thu, 18 Mar 2021 10:51:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymxKozgua9JvqoRC7ToVgSa0jsjSFBqWJwyaXI+R0324dOPpjcRqcHScg0LpCwfo7UYt1Sql1q4UmDTfxpKLE=
X-Received: by 2002:ab0:3388:: with SMTP id y8mr3234886uap.113.1616089881224; 
 Thu, 18 Mar 2021 10:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210318174407.2299930-1-wainersm@redhat.com>
In-Reply-To: <20210318174407.2299930-1-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 18 Mar 2021 14:50:55 -0300
Message-ID: <CAKJDGDZeADLuQs-h4rqsgoLSohriJCv2VkUE2xoOOW2Je3PQwA@mail.gmail.com>
Subject: Re: [PATCH v2] docs/devel/testing.rst: Fix references to unit tests
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 18, 2021 at 2:49 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> With the recent move of the unit tests to tests/unit directory some
> instructions under the "Unit tests" section became imprecise, which
> are fixed by this change.
>
> Fixes: da668aa15b99 ("tests: Move unit tests into a separate directory")
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
> v1->v2:
>  * Fixed typo on subject [jsnow]
>  * Replaced Related-to with Fixes [jsnow]
>
>  docs/devel/testing.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


