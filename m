Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6AA45C824
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:58:20 +0100 (CET)
Received: from localhost ([::1]:38244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mptj0-0001HE-UF
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:58:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpthh-0008H3-7a
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:56:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpthf-0004Yu-LL
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637765814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ILnbQN5Gqw2aJngQMnTYrClWCn8EmfDis6qMjgpm+0=;
 b=FOrhtEKmvzfvXSLWoD/YCehzwYhjT7oc/AzXjDxJLRknn89BVeX1pgb7Clu9GZB3lvcV14
 Kb9Bxi//hdyv1OMFLPe78xt7NdXka4R/pPBGyMgqd0dlemvSYvPvl7D+fEdNBzy8prLTLR
 mbMwb8LwhMlW+NWvhrM1EIh+Ud/9rbg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-mz7YIJnFP4qSAmsZTQDUhA-1; Wed, 24 Nov 2021 09:56:52 -0500
X-MC-Unique: mz7YIJnFP4qSAmsZTQDUhA-1
Received: by mail-ed1-f71.google.com with SMTP id
 m17-20020aa7d351000000b003e7c0bc8523so2614031edr.1
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 06:56:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1ILnbQN5Gqw2aJngQMnTYrClWCn8EmfDis6qMjgpm+0=;
 b=NHw8jcXTXoJFwGKYRcQZUEJYLNE1nXx26+sZlxXvIUhYK7CT9a8do8d642SUke4Z8m
 7VQ/sGzbOUMb3p3zKtqxnTh+QZ2SWMacmtKUT4GbCsAvHK/YUS6k+TjreXtK16HMY7xx
 h+4myQZRHP5DkzgZkYvwyOVeNIY4zpDpx6tpkcqGoV/P/r22fWAa6sphIYEWayrzZsRh
 rwnXmjSaGJH73PANo+Fftmi4YkUVSZ/NRFD4qr0wTH4KO4IgHxWKqD4sW3ze1Ml72o/6
 Ioxl7PhjOrYXaBYSOACl0gXmEyeQzJU5WHBnVL0pJHb3meNh/GH4KNvDBnnj7EYb77TT
 ZZ6w==
X-Gm-Message-State: AOAM532b5Bas5YqxKb3sH/4EyYVX+AR/H107WfTDpS/3vLQ3kwz99k+S
 DqgMdDzsoypMsuOwPvi1hPgYWcjl3JonIhrY3qP9oZVE3/7ULuWZEq3EcPhAosDjyHoOw7WXMli
 ntb2TsVqiHB6hJFuelXrqmJtPAskEmr8=
X-Received: by 2002:a17:906:31c2:: with SMTP id
 f2mr21092866ejf.341.1637765811529; 
 Wed, 24 Nov 2021 06:56:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwooDLsdiWO/AkK6e7zxCey6SyOUPMpn2K2M2GhU+YBu4Uzi1r2C3r58g4md7J09iakWjMgOj7BNlJqD1axBEY=
X-Received: by 2002:a17:906:31c2:: with SMTP id
 f2mr21092826ejf.341.1637765811267; 
 Wed, 24 Nov 2021 06:56:51 -0800 (PST)
MIME-Version: 1.0
References: <CA+bd_6JS0t_COHiw2Y3Ej1gAeOGVTScNoS-=Seo+7udAe5wqZw@mail.gmail.com>
 <cc136013-2632-c149-d258-e2e7f964b07f@redhat.com>
In-Reply-To: <cc136013-2632-c149-d258-e2e7f964b07f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Wed, 24 Nov 2021 15:56:40 +0100
Message-ID: <CAP+75-VUKeuUo7a9bscEOqX+q_-qE7PbOb3GJb29Te21r_AOJg@mail.gmail.com>
Subject: Re: Give the fosshost.org VM a purpose or a retirement
To: Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 3:55 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
> On 11/24/21 15:16, Cleber Rosa wrote:
> > Hi,
> >
> > Fosshost.org was kind enough to supply the QEMU project with a public
> > VM hosted by them.  The original use case we anticipated was to set up
> > a GitLab CI runner, because we assumed the VM was KVM capable, but
> > that turned out not to be the case.
> >
> > So, at this point, adding it as a GitLab CI runner would not add any
> > significant improvement over the shared runners already provided, and
> > it would require more maintenance effort.
> >
> > If there are any ideas for making use of this resource, and volunteers
> > to configure and maintain it, please let me know.
> >
> > Otherwise, it seems fair to relinquish the resource back to Fosshost.or=
g.
>
> Cc'ing Warner, since for FreeBSD testing we use Cirrus-CI (via
> libvirt-ci and have sometime hit GitLab timeout). Series [*]
> provides most of what is required to register a FreeBSD runner.
> It could be useful to run the user-mode tests.

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg805902.html


