Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20AA52AEDD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 01:53:28 +0200 (CEST)
Received: from localhost ([::1]:37886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr70J-0003FY-A4
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 19:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nr6ys-0002Se-37
 for qemu-devel@nongnu.org; Tue, 17 May 2022 19:51:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nr6yp-0003P1-6q
 for qemu-devel@nongnu.org; Tue, 17 May 2022 19:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652831514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fRmn+5+B4Qq5c1qqzs0jQRoUKnJ+VTZYznNao4fSCec=;
 b=DMwo8MPM5sC6MjJHbrl0P7zoBeGKJ3iiAzq6IOG0C/8A0mnpF9tD6XasL2Y4lMRZZO3h1Q
 QlS710M2kt2ukyDSFbSa+BubyySjRPDSQz+IpRWsTr+d4U153Np3iSo1oatanpEUd/Buin
 BFi9XU1J5hxj/1kk6Zg8z6gq6PvCtWc=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-fDEyo2V9NX6ERz2-EfFa6g-1; Tue, 17 May 2022 19:51:52 -0400
X-MC-Unique: fDEyo2V9NX6ERz2-EfFa6g-1
Received: by mail-vk1-f200.google.com with SMTP id
 y187-20020a1f7dc4000000b003523a47f39fso54270vkc.19
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 16:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fRmn+5+B4Qq5c1qqzs0jQRoUKnJ+VTZYznNao4fSCec=;
 b=bNyCDpHg4R8hnj0u/7291TUHrRnUAQmC3zIhMwYjjMz1OcrVhZENFS/ZfejAgD8G2o
 OJZCJFCY3DTo0lw2AX7EVpQrKbyEXKVSXy1vZk20mAED0ZxNXGQwRhp6/OkKVkNCutsY
 3bT3vrx1hjUp3efiW4Gr88N7SKPbPajVJ9AhcH98YnqM+BmHTXvxW6QP5djkkwUBfLJZ
 uJsPySnuFEQgr8c+6DcDsoRBWf0imLQHYvsW0BWFc0YfixCXrgR+Wh2G7deqjAQS8R5j
 xPpI1wiqmZo2SEf6LAlygQj8QPYiNTjdN3UzdO/1S0FyNGpvyv52bP11O1vag6dWQEfd
 zZPA==
X-Gm-Message-State: AOAM532zrOguh/KXzDtBBQ8sdna1evtDC4gH6dnW3MTyN16H/Y0zqH1E
 o7TBXbbEUq7KSX/p2U4vUSBOOV7bP3HWhTbFvDt4x/yq5huQSisMQTLd2M1adGsjYRuikSpLLtJ
 JYTAypT7uQSgX89oHn3BeEIkiwOlr6RI=
X-Received: by 2002:ab0:5a85:0:b0:35d:20c3:5463 with SMTP id
 w5-20020ab05a85000000b0035d20c35463mr9548923uae.103.1652831512198; 
 Tue, 17 May 2022 16:51:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbzq9oGBt3/1GvffZrjQOEq0RHamRtItpkOCLw6ulMxBNyMskbS+jtXNF09kcZy4EKCAbp4Sd6grbKT59M7Wc=
X-Received: by 2002:ab0:5a85:0:b0:35d:20c3:5463 with SMTP id
 w5-20020ab05a85000000b0035d20c35463mr9548913uae.103.1652831512030; Tue, 17
 May 2022 16:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-10-jsnow@redhat.com>
 <ab6d4171-74f0-3b6c-9ffc-1ed8f4fb0493@redhat.com>
 <CAFn=p-b19dDshg7ShuNqhH+1h_ptYL4qpZSkTvnVnZOPT3g8HQ@mail.gmail.com>
 <b30dd93b-0ced-0aea-5e84-57fa4294f4ad@redhat.com>
 <CAFn=p-bqbcXBLLmT3Fqu1b7Y0Hu=M6B5oKT7J9idXn=tmrt4UA@mail.gmail.com>
 <15a9d6cb-e7c6-98f0-4b6f-766600b36274@redhat.com>
In-Reply-To: <15a9d6cb-e7c6-98f0-4b6f-766600b36274@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 17 May 2022 19:51:41 -0400
Message-ID: <CAFn=p-bNo3-6zunCSb1dCKjjGR0JJX65BEbWS_WmbcrANe3PSw@mail.gmail.com>
Subject: Re: [RFC PATCH 9/9] iotests: use tests/venv for running tests
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Mon, May 16, 2022 at 3:41 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 5/14/22 17:55, John Snow wrote:
> > On Fri, May 13, 2022, 11:33 AM Paolo Bonzini <pbonzini@redhat.com
> > <mailto:pbonzini@redhat.com>> wrote:
> >     IIRC we have some cases (FreeBSD?) where only the python3.x executable
> >     is available.  This is why we 1) default to Meson's Python 3 if neither
> >     --meson nor --python are passed, and 2) use the shebang you mention but
> >     with *non-executable* files, which Meson treats magically as "invoke
> >     with the Python interpreter that was used to launch me".
> >
> > pkg install python3 on fbsd 13.0-R gives you /usr/bin/python3 fwiw. do
> > you know in what circumstances you get only a point release binary?
>
> Aha, tests/vm/freebsd installs python37, not python3.  But I guess it's
> still a plausible configuration for this packaging setup.
>

Just confirming here that if you do 'pkg install python37' and you
have no 'python3' link, the venv package will still make 'python' and
'python3' links. I think it's likely best to use the 'python3' one.


