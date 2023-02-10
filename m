Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D9D692341
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:27:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWFF-0002P7-UR; Fri, 10 Feb 2023 11:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQWFA-0002N3-9W
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:27:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQWF9-0006Qg-11
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676046442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/d/iPl2DxI0v9T3Ad+bwX/0tJyJox1a5yxtcIsCUNkE=;
 b=gPF4y5xmBJHS9U7DxHw/SwovfouNUWZGyFft+ck/eFw1kDcieJtNb8wtmP7LUmvBl1Fk+a
 YLA2ObOjWVfGJPYrjXeHuMzDHn9jBZLx9eZuNMCmevVVLvWFW8yn0cXx7h9wuAuwXgehR3
 VgjddCCDbbV86J905NVVsR0VXXItaUA=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-173-jVFOOL0xNoOEMNDEpsxexg-1; Fri, 10 Feb 2023 11:27:13 -0500
X-MC-Unique: jVFOOL0xNoOEMNDEpsxexg-1
Received: by mail-ua1-f70.google.com with SMTP id
 o6-20020ab01506000000b004f8c11096a9so2034402uae.20
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/d/iPl2DxI0v9T3Ad+bwX/0tJyJox1a5yxtcIsCUNkE=;
 b=hGIo15aceGCPArtLLuK5ocABt4BOIh6psZoLYU4NwsQWIYo9bHAKWLmyKVi8nD7q1X
 ZYFOKMXhg0dwaz8npZgfYevUNLT03MT1PL0MjXEQwC97ZlyOaK/xrngvsLxjfIWYQbH2
 Y1rnfegUrZEHhjwKzGvb+2u2AyzZ1HeMhqD3yeSve/o2im5uIvaQncpVwVy80a+0+JAu
 Lk3ruKjfeMa5oGcFbIDPJ0GVoj1FN0IS46iUWfWP2jwb2u+HNeO/xbC03mnGlBlqOouf
 d8ghH+83Jt7KRLNyz0tY5GdGWouccZTuj797oP76QfY/0WWYW9gHFaCR2w8BX3F6ld45
 lLlg==
X-Gm-Message-State: AO0yUKXHi8onUSkC8LPUAuRgVSbhgfTsmU7vvh7aomdUABm9A1dAbix+
 nk7j6KeAv81rSVPZUAEO16pVyk8G1a3WQv5jXCaLXEBzFJjilHihuo271cEozBDyqSQfwo+n0X+
 rFyOLSmqDayKsw6O1jKBijroA2Our3Hg=
X-Received: by 2002:a1f:72cd:0:b0:400:b9b1:a650 with SMTP id
 n196-20020a1f72cd000000b00400b9b1a650mr3140921vkc.10.1676046433218; 
 Fri, 10 Feb 2023 08:27:13 -0800 (PST)
X-Google-Smtp-Source: AK7set99mwgEnbfuIsLSrvntbIwkpdLFgeOrbWDXt4yRywbkT6JpBBDbE/+pjwhqPqBixaEUMyJR6HNlZhHEo3P7qp4=
X-Received: by 2002:a1f:72cd:0:b0:400:b9b1:a650 with SMTP id
 n196-20020a1f72cd000000b00400b9b1a650mr3140916vkc.10.1676046432917; Fri, 10
 Feb 2023 08:27:12 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-4-jsnow@redhat.com>
 <3bb14d43-4dbe-62f3-679f-4b7823b29d41@redhat.com>
 <CAFn=p-Yyus2zipaUgLwonpMRdfZp-CKEisiXgZBLjgG6UxXagw@mail.gmail.com>
 <CABgObfa79AStZ8DnGEs2GmdZeLecijW3Um9O4XmguVNLwdfs2g@mail.gmail.com>
 <CAFn=p-bWLfV7miK5NB3XqVEJXA1MHK26aN07otLJhUa2xbDHTg@mail.gmail.com>
In-Reply-To: <CAFn=p-bWLfV7miK5NB3XqVEJXA1MHK26aN07otLJhUa2xbDHTg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 10 Feb 2023 17:26:59 +0100
Message-ID: <CABgObfaSGLKUXXJJf2S-C5cMhDHPNxvQfXS7YL2=vM6SXtg6RQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] configure: Look for auxiliary Python installations
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Feb 10, 2023 at 5:22 PM John Snow <jsnow@redhat.com> wrote:
>> Though part of me thinks that your new loop is slightly overengineered
>> and we should just require /usr/bin/env python3 and call it a day.
>
> Well, but that'd be a problem for CentOS 8, wouldn't it? python3 is gonna resolve to python3.6.

The user would have to specify --python=/usr/bin/python3.8, or could
also set up "alternatives" so that python3 resolves to modular Python
(3.8 or newer). I think it's a fair requirement for users of
enterprise distributions, and it works because it forces usage of
QEMU's meson submodule.

My lcitool update does the former by placing ENV PYTHON
"/usr/bin/python3.8" in the Dockerfile.

Paolo


