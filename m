Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CC3698599
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:33:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSORh-0005we-9l; Wed, 15 Feb 2023 15:32:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pSORf-0005v9-CU
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:32:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pSORd-0004vz-N6
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676493120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7eJ3V2LwLoBVNF5/NGsjdLyfdgrwrvAGSFRw9ViIs9I=;
 b=WJPa//nkS6/HncGSQFSxe6pVQr44wPFL5Hxd99JjRh5yEhw9uSJuBazUcof/jd9izPotNC
 fNimpQd2VEY0PTWBv6bipEiFt3XQ8JkdxmL0pn4T/eVV6i5SZZEyzcHD4EVY7w8Z61WBwO
 KYckMKMVFybhwRm++emR2j+TkOiCdas=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-262-6EZz1cz1NU-cuEK-zPs6yA-1; Wed, 15 Feb 2023 15:31:59 -0500
X-MC-Unique: 6EZz1cz1NU-cuEK-zPs6yA-1
Received: by mail-pj1-f72.google.com with SMTP id
 mp1-20020a17090b190100b00233cc25fc7bso5448684pjb.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7eJ3V2LwLoBVNF5/NGsjdLyfdgrwrvAGSFRw9ViIs9I=;
 b=ds85zLTDM1tuKmK/ZGiDH6bB/mUbJzSRJnd9/7DqZCad2B1gxLPK98NjheisU3uMlL
 zeH4DIFuZ83bmaIZyFD4sDNLX3ZQZW8LTlwZ/3RI0mUiXcDAsM2lEdGe40j2dyt1aECL
 kPEPTbKPQHRPyPLMs+ZlZvgvEchxniQ7by3qMJaIfpPupoZ27GiUoLBUH+qBr7PWHyYm
 W22khj9sBnnMXyvAPdKzqpE5AsRPJ8n26uRVlcVq9B9FLGWSuEvPW8N14DMAggSvAkxX
 l7fwQEGJN6in23H30No6L8zlc8sascjlVFmIY/UxV6USU7daBYLxCZYkmzJtNtjNGzfL
 NxpQ==
X-Gm-Message-State: AO0yUKXdSC+kUy3dNtdzd/8tBZdn8auiI1EgjkuNNGcGHqmBtSWrljQJ
 Xm8IJgncnnavRCTxisTE8V0mR4+NyPL0N6y9F5HyFZ7jEHR3QtUWdLdt8hBCPx9YvIbKvYSgeBk
 HXtvZCaFjXx0mJyD/NZnBqUvLRpFsTMo=
X-Received: by 2002:a63:7f59:0:b0:4e8:51a5:137a with SMTP id
 p25-20020a637f59000000b004e851a5137amr572971pgn.6.1676493118481; 
 Wed, 15 Feb 2023 12:31:58 -0800 (PST)
X-Google-Smtp-Source: AK7set9jRbZYInGDj0TGAXjt5F0wpJBk9XzaiSH3WiL58T35Dcig+do/3bBrEHyIyHJSCo6updlten6yyfnMdmUVMqw=
X-Received: by 2002:a63:7f59:0:b0:4e8:51a5:137a with SMTP id
 p25-20020a637f59000000b004e851a5137amr572956pgn.6.1676493118204; Wed, 15 Feb
 2023 12:31:58 -0800 (PST)
MIME-Version: 1.0
References: <20230209154034.983044-1-jsnow@redhat.com>
 <20230209154034.983044-7-jsnow@redhat.com>
 <CABgObfZ3taU=6=JB4MGeLfDsg6MhkLSUuYNH9unO0UjMSF4ciA@mail.gmail.com>
 <CAFn=p-b=RiZvOHOVYMByn1-awhO_cniSW4LVZ+h+fDMWHH7Crw@mail.gmail.com>
 <86b31d9a-88f1-05db-3f4a-be7cc0762047@redhat.com>
In-Reply-To: <86b31d9a-88f1-05db-3f4a-be7cc0762047@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 15 Feb 2023 15:31:47 -0500
Message-ID: <CAFn=p-ZSVVCkvNjv2uCvOJ1WY4pZrryqOFLFvvV4RSb_uN4K+w@mail.gmail.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

On Fri, Feb 10, 2023 at 5:30 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 2/10/23 00:32, John Snow wrote:
> >> It's possible to teach lcitool to use pip instead to install
> >> docutils, sphinx and sphinx-rtd-theme
> >
> > I will say that once upon a time, Peter Maydell expressed a
> > preference to use the version(s) of sphinx managed by the distro
> > instead of swallowing it into the python-managed parts of the
> > codebase. It seemed like a reasonable request at the time.
>
> Note that this is not about using pip in a venv set up by e.g.
> configure; simply, lcitool falls back to pip if a package is not
> available as an RPM/DEB/APK, so it's a matter of telling it that the
> python3.8 runtime in CentOS 8 does not have either docutils or sphinx.
>
> In other words, since lcitool takes care of building the container
> dockerfile, this "pip install" would be done in the container phase and
> configure in general cannot care less whether sphinx comes from an RPM
> or a "pip install".
>
> Paolo
>

Understood - I am just recalling changes I proposed to 'configure'
several years back to specifically allow it to find and utilize
versions of sphinx installed via pip, but Peter Maydell wasn't as sure
of the idea, believing that QEMU should stick to only the system
packages. I wasn't talking about specifically *creating* the
environments with pip, this time.

(But, I'd still like to, but realize that's a separate discussion.)


