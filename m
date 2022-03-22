Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C426A4E4461
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:40:01 +0100 (CET)
Received: from localhost ([::1]:51308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhY8-0002S3-Ts
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:40:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWhWT-0000PN-Cm
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWhWP-0000EQ-MB
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647967093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4mEnPEHDS7TkybIXJDSsUzNzur2oqO6HMBMOW+R552E=;
 b=iI61BhYEgETl6WQ3LiyidxDpsMiFn4sAzgmrW57cn6CKbzAreHR0rsckz/V3LhSesGQpaI
 C/NqJ2iVHV3uUTOc77FQaVH5nVxgq6vxIt/eKxgAjMjAzYdBaRdeJVdnaxYcOSaDYDLX2i
 2TR9nQYufc7RykRk3IJ9E9r5b6PAhWE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-XlpenDuaMkiRi4mTw53zJA-1; Tue, 22 Mar 2022 12:38:11 -0400
X-MC-Unique: XlpenDuaMkiRi4mTw53zJA-1
Received: by mail-ej1-f72.google.com with SMTP id
 i14-20020a17090639ce00b006dabe6a112fso8928428eje.13
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4mEnPEHDS7TkybIXJDSsUzNzur2oqO6HMBMOW+R552E=;
 b=T6HhoUOsTcDalNPcJgalmHr7Tup51hcjP1Hs+wtijUngUscpbYEOSQJ8jd/LCPw7Cw
 Zx71PUHji8Fz3FMBrIAaS38zz2neEEPtkJSwR4VB7POw4hGmJ9fGSeH1me5WSaOehrY9
 GNbIn1PJHnzEEnjWLAX9kEK+OsEbw/MQkgRytyLkgCP6Vo7B187qpSjdLnCVPlF1uNon
 QLKEA94JhMzQQ8AUKng6a4EgdjPEOZKJaoa5+22xUPsmYV4np09dqzeKlgFv9qf+rPTR
 QBeCXYwAeCPmU8QYtOi/b0CyvNE/H58PcBnYhWuTvOpmqb5dAKfGlfq6DNuY4M3Adpvk
 5Cow==
X-Gm-Message-State: AOAM531fz1siPbb+ekbib8b0kh/OnL/pkhnLXbTOaAmV8rEw5ar432FY
 ihbCRuuO0cXFgr16r4APjER3LQpiCq5OBrBnogdwp8g/AjEwShRpReSgpWPFpIUqE7AXNP6pUJ2
 Oh46tEnyZAvu54/s=
X-Received: by 2002:aa7:c157:0:b0:418:f8e3:4c87 with SMTP id
 r23-20020aa7c157000000b00418f8e34c87mr27876968edp.271.1647967090704; 
 Tue, 22 Mar 2022 09:38:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE+3KDBpCRXvm2CTJs9lCHmXCfvcyIAqh0oFQle9Tm3glP7NZ2FY7nSXr0yDOJNxma9oQGSA==
X-Received: by 2002:aa7:c157:0:b0:418:f8e3:4c87 with SMTP id
 r23-20020aa7c157000000b00418f8e34c87mr27876937edp.271.1647967090427; 
 Tue, 22 Mar 2022 09:38:10 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a170906161900b006d43be5b95fsm8609410ejd.118.2022.03.22.09.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 09:38:09 -0700 (PDT)
Message-ID: <5413f357-717c-cdf2-12a6-0a9d35a09388@redhat.com>
Date: Tue, 22 Mar 2022 17:38:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/15] iotests/245: fixup
To: John Snow <jsnow@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-11-jsnow@redhat.com>
 <258fcd46-38a6-2258-a39f-4126be26c8ce@redhat.com>
 <CAFn=p-Z2fEck2Zd2VYFCOPcYjbfGBt4gkDU0Lvx8ATFaHULeaQ@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-Z2fEck2Zd2VYFCOPcYjbfGBt4gkDU0Lvx8ATFaHULeaQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.03.22 17:36, John Snow wrote:
>
>
> On Tue, Mar 22, 2022, 12:30 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
>     On 18.03.22 21:36, John Snow wrote:
>     > (Merge with prior patch.)
>     >
>     > Signed-off-by: John Snow <jsnow@redhat.com>
>     > ---
>     >   tests/qemu-iotests/242 | 2 +-
>     >   tests/qemu-iotests/245 | 2 +-
>     >   2 files changed, 2 insertions(+), 2 deletions(-)
>     >
>     > diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
>     > index 4b7ec16af6..ecc851582a 100755
>     > --- a/tests/qemu-iotests/242
>     > +++ b/tests/qemu-iotests/242
>     > @@ -22,7 +22,7 @@
>     >   import iotests
>     >   import json
>     >   import struct
>     > -from iotests import qemu_img_create, qemu_io, qemu_img_info, \
>     > +from iotests import qemu_img_create, qemu_io_log, qemu_img_info, \
>     >       file_path, img_info_log, log, filter_qemu_io
>     >
>     >   iotests.script_initialize(supported_fmts=['qcow2'],
>     > diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
>     > index 8cbed7821b..efdad1a0c4 100755
>     > --- a/tests/qemu-iotests/245
>     > +++ b/tests/qemu-iotests/245
>     > @@ -217,7 +217,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
>     >       # Reopen an image several times changing some of its options
>     >       def test_reopen(self):
>     >           # Check whether the filesystem supports O_DIRECT
>     > -        if 'O_DIRECT' in qemu_io('-f', 'raw', '-t', 'none',
>     '-c', 'quit', hd_path[0]):
>     > +        if 'O_DIRECT' in qemu_io('-f', 'raw', '-t', 'none',
>     '-c', 'quit', hd_path[0]).stdout:
>
>     This is to verify that O_DIRECT works or not.  If it doesn’t work,
>     this
>     will fail, so we need to pass check=False here.
>
>     (Or this test fails on tmpfs.)
>
>     Hanna
>
>
> Oh, I didn't realize a solitary "quit" command could still fail. 
> Thanks for the tip.
>

What’s being tested is the implicit `open`. :)

Hanna


