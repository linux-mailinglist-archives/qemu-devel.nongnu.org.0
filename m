Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E348369147A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 00:34:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQGPO-000682-Sa; Thu, 09 Feb 2023 18:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQGPM-00067j-TL
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:32:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQGPL-0006OD-39
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675985569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hdwhtRuz3Tc2X5o2eLs7X8BMjdVhWEIsCZT8gaqU8i0=;
 b=EPSroPni8d2vnTVsDmvcjhgOKXAN++5KuJysURPPgZFhpXdIN2WQIskl9QsgqNtuF0n9ty
 8C3wT4YW8AmP1NOpQzwme0aC8H1Fr/Vb99b+KxkYrg3nsZXK1MGuU5hgcXEVa7PXNmP2gM
 x4skHSgMrKasqWbymiZkXrwM/QJFoGs=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-315-Avhah4r7PhetmAjSKe7h-w-1; Thu, 09 Feb 2023 18:32:48 -0500
X-MC-Unique: Avhah4r7PhetmAjSKe7h-w-1
Received: by mail-pf1-f198.google.com with SMTP id
 e9-20020a62ee09000000b0058db55a8d7aso1725130pfi.21
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 15:32:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hdwhtRuz3Tc2X5o2eLs7X8BMjdVhWEIsCZT8gaqU8i0=;
 b=IXMeHMBtfcJrWwuFucKc18jZvzZiReJJ6u5Dt5rLAuguF/TOOaK/y3ARqAz7ja6p8Y
 TVqNRNKdnre9lcV35HyQSlSy+31N0EsVHLBrdklUpRzq4OKn5hi7DVBBLmRCc4B3CGae
 dDzDgxNWrMTCF2+XNnSI06WanKj0Jt+g5E9sfC2/uByi7ae3nAhthlczuyUCEg4WXNRj
 T9Up6cxMDufb64ZsNd900desZPwyqsB4QWuSY6vxwoMo+SDR5BiFJC2ek6gZLE7nJ+Oe
 MKhJEllnrxoTbu+dW73SPJhntrGsUmxBhZurMhL70GzvOWCNJujZ268Z2K+FivsAOO5F
 BACA==
X-Gm-Message-State: AO0yUKV/XT5SFQXPM/Df3OwPjJXQSvoIMUmKSh3S4YXKiEPNpYKYHhcx
 8709VIIrSHHBGyUB8ZgbPhVMTa8kSwIIx0dpIdc6kIn4zJ9OtsP5CcabegCbOxiOgSFOFZxpS5p
 HfIIhvtayA7jKtu4rDPbr354A7Cw+CqY=
X-Received: by 2002:a17:90a:474e:b0:231:2375:4c7b with SMTP id
 y14-20020a17090a474e00b0023123754c7bmr1539043pjg.64.1675985567672; 
 Thu, 09 Feb 2023 15:32:47 -0800 (PST)
X-Google-Smtp-Source: AK7set9dZysLQXOTGdncePmXJRPyzDc9vJXhq15rJM1/Lg/3CTbfOs1ONDrl2S6vUo2ILU0vVr4jcjcRcvgWj6ogbWA=
X-Received: by 2002:a17:90a:474e:b0:231:2375:4c7b with SMTP id
 y14-20020a17090a474e00b0023123754c7bmr1539028pjg.64.1675985567341; Thu, 09
 Feb 2023 15:32:47 -0800 (PST)
MIME-Version: 1.0
References: <20230209154034.983044-1-jsnow@redhat.com>
 <20230209154034.983044-7-jsnow@redhat.com>
 <CABgObfZ3taU=6=JB4MGeLfDsg6MhkLSUuYNH9unO0UjMSF4ciA@mail.gmail.com>
In-Reply-To: <CABgObfZ3taU=6=JB4MGeLfDsg6MhkLSUuYNH9unO0UjMSF4ciA@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 9 Feb 2023 18:32:36 -0500
Message-ID: <CAFn=p-b=RiZvOHOVYMByn1-awhO_cniSW4LVZ+h+fDMWHH7Crw@mail.gmail.com>
Subject: Re: [PATCH 6/7] CI: Stop building docs on centos8
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Daniel Berrange <berrange@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

On Thu, Feb 9, 2023 at 5:43 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
>
> Il gio 9 feb 2023, 16:40 John Snow <jsnow@redhat.com> ha scritto:
>>
>> CentOS 8 does not ship with a sphinx new enough for our purposes (It
>> necessarily uses Python 3.6), so drop this from this build. We can
>> resume building docs on CentOS 9 if we wish, but we also currently test
>> and build docs on Fedora, Ubuntu, Alpine and Debian.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>
>
> It's possible to teach lcitool to use pip instead to install docutils, sphinx and sphinx-rtd-theme
> Once we can drop the previous patch this one can go as well; as soon as the last lcitool prerequisite is in (https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/341) I will pick the rest of this series, if that's okay for you.

OK - Dan requested extra version information in the commit message to
7, which I am researching a bit more exhaustively now. I can reply to
that patch with the requested info and if you'd like to pick 1-4 & 7,
you can be my guest.

I will say that once upon a time, Peter Maydell expressed a preference
to use the version(s) of sphinx managed by the distro instead of
swallowing it into the python-managed parts of the codebase. It seemed
like a reasonable request at the time. We can revisit it once I get
the patches in to add a venv at configure time. (Which I was intending
to visit next.)

>
> Paolo
>


