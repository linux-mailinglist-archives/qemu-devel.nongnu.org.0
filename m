Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B07451B860
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 09:02:07 +0200 (CEST)
Received: from localhost ([::1]:56536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmVV0-0006cC-9y
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 03:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmVOy-0004Gq-JE
 for qemu-devel@nongnu.org; Thu, 05 May 2022 02:55:52 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:47534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmVOx-0005HH-4H
 for qemu-devel@nongnu.org; Thu, 05 May 2022 02:55:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651733750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fmgfyVFv+pHZlxcz1jB96K2r8aAm2xqIUEYhn19aUY0=;
 b=FZ9nFzXqrj9HBG4Wh14mptphJOxBLnYitEUyibr4dK8I5qHONXEDdwLbZrx4hhcbbpCqrY
 AhP45mekqiKUlA9Br63bFGapywcrvtWJhUHabf0Nc8eCz6Rx+xCeul+HxR6LtMxIkxQZiW
 0sFdr2Fk4Z2YLAY/pm3i8H0LYLEFE48=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-UiGN_CrTNEGFNo9HPmHALA-1; Thu, 05 May 2022 02:55:47 -0400
X-MC-Unique: UiGN_CrTNEGFNo9HPmHALA-1
Received: by mail-ej1-f70.google.com with SMTP id
 sd38-20020a1709076e2600b006f3e54b1dbcso214367ejc.4
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 23:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=fmgfyVFv+pHZlxcz1jB96K2r8aAm2xqIUEYhn19aUY0=;
 b=F1DW+sGO0Xg8q5pvGUVHUTDRQltZG20EtO/pk4dfVtkS6nnuF1lgoNfMOZAz2xk6n3
 KrsKmP/NIXNPMU+uLQ32HX5E/prUaA72O7BXOX/hUCtOz3SPA5sV4FizJpA+03hb1VbV
 xvDdx0C76697iLi/cdPxsxL624pj3h8Qrl7gCEbh4oSW3Q8QuUYThGXXUSB7n9dj6IW9
 SBaCOB493UQzc2J/+9jd/5vlY897xd1LlEy+Zg95Zfh0yDL2eqfOTTl9oAwu8brTJYSj
 5gUT0s1RdEpROFbjAL6ZYBvJkrYLQAlMsTxaz/BC6cdDL8tHpO1THZkmpM+MOpzuTsKI
 1dTA==
X-Gm-Message-State: AOAM533Aj7YP45e/baxHNuGNu1MMPSFvrhPe19Gyupo1RVNOwDn7lHln
 XhD5GltqsSQ8DBhQ6tbk38Ki6s5XBhrfQ/39j5xD6VXC5V1OLD51QRGxtyNRjBGjddf8gyp0l9r
 nyUXk02mmKecP92o=
X-Received: by 2002:aa7:c70f:0:b0:425:f70d:b34 with SMTP id
 i15-20020aa7c70f000000b00425f70d0b34mr28383283edq.306.1651733746106; 
 Wed, 04 May 2022 23:55:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfEoevAcoyYeoSnRz3vKOPuMng457LjbbHnNzlZuWwFJrl8TKzC3u2jl3XHU5VU800VFALfA==
X-Received: by 2002:aa7:c70f:0:b0:425:f70d:b34 with SMTP id
 i15-20020aa7c70f000000b00425f70d0b34mr28383259edq.306.1651733745942; 
 Wed, 04 May 2022 23:55:45 -0700 (PDT)
Received: from [127.0.0.1] (93-43-174-14.ip93.fastwebnet.it. [93.43.174.14])
 by smtp.gmail.com with ESMTPSA id
 qk13-20020a170906d9cd00b006f3ef214df3sm397186ejb.89.2022.05.04.23.55.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 May 2022 23:55:45 -0700 (PDT)
Date: Thu, 05 May 2022 08:55:36 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, marcandre.lureau@redhat.com
CC: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Bandan Das <bsd@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_04/16=5D_compiler=2Eh=3A_add_QEMU=5F=7B?=
 =?US-ASCII?Q?BEGIN=2C_END=7D=5FIGNORE=5FINITIALIZER=5FOVERRIDES?=
In-Reply-To: <CAFEAcA8F2+_K9+3-S=cb0TuDEw0GrdZrL2v47sc64uZTpR6_jw@mail.gmail.com>
References: <20220504173025.650167-1-marcandre.lureau@redhat.com>
 <20220504173025.650167-5-marcandre.lureau@redhat.com>
 <CAFEAcA8F2+_K9+3-S=cb0TuDEw0GrdZrL2v47sc64uZTpR6_jw@mail.gmail.com>
Message-ID: <C41C46BA-2BFD-47E4-967F-7D92B49A8248@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.74; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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




>If other projects want to borrow bits of QEMU code then
>they need to either (a) abide by our conventions for
>what compiler warnings to enable or disable, or else
>(b) fork the code and fiddle with their own copy=2E

Agreed, it's not a huge deal if a single add_project_arguments call is dup=
licated across a couple meson subprojects=2E

Paolo

>
>I don't really want to see QEMU's source code get littered
>with a pile of extra macros hiding diagnostic pragmas=2E
>(If we stop passing -Wno-initializer-overrides to the
>compiler then we set a bunch of new "built on gcc on the
>developer's machine but fails to build on clang in the
>CI jobs" traps for ourselves, and if we don't stop passing
>that then the places that should be marked up with the
>macros won't reliably be marked up=2E)
>
>thanks
>-- PMM
>


