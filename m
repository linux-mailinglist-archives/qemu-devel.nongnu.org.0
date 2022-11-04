Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39B36193CB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 10:46:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtGx-0000nW-6y; Fri, 04 Nov 2022 05:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1oqtGP-0000mn-Bb
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:45:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1oqtGN-0006iE-Ei
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667555122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXmWFMPWiLjyR/+5yAWEy15f0QKOsFRRWviQlJ5EU9I=;
 b=g5Zj4iBVTC6wCyQ1zkHU2c/ownCtLBR9qBJkkOIzE0v7phtlw8gEz+SLs7a6JorPo2H1TC
 3QqDykmD5D3mJWIiiLYloPAe5+yqwoVzhwElRIljQCXUi4tNdRLRf8FPTOMQRCKBdbqSvj
 sqmgQMf9NAKDEpc02M69IT9h84i/nuI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-434-aAHOi5Y5PfmDsPHRgoxzZA-1; Fri, 04 Nov 2022 05:45:21 -0400
X-MC-Unique: aAHOi5Y5PfmDsPHRgoxzZA-1
Received: by mail-ej1-f70.google.com with SMTP id
 sc40-20020a1709078a2800b007ae024e5e82so2888833ejc.13
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 02:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xXmWFMPWiLjyR/+5yAWEy15f0QKOsFRRWviQlJ5EU9I=;
 b=irUayTKjUtGNZnq7hcb4uc44fDjApPJpm4Oz4xR2LOCe59i5AdthNlFGLe1frgOD1d
 u9DjbuLFOIBoTEgDHateoNrPP+gL6icyRCMgzbLL6YxmmNGtuwljuUbVjVyFyTUMJ7CK
 Q0Oby1AFXUlgtjQgbIMotBm5T0a+p6aOB0JDICb9nwDnbsNYE13uxsKJhXwZX4g0cNNO
 twJ3vUPXdFaqDu+zkRbP943X1XiDS5EuePmRdt8m6z3/7RRkglNhqmc3HJdiGyeAdKrQ
 VFx8/8xnD3eulm75VTDEYKzEyMwA1DlKVbmaKV8eGgXQjsULcNwDqyabkjsz1Il0AUcY
 Qi8A==
X-Gm-Message-State: ACrzQf0k4UTSmrVywPl5ZW2bhn4vuFkTo0NC42ajXqBLv33qLutdn4od
 oZX5RkIT7eOtj2552dfyVEbV0xAXA/2mBJn0V8H61NpssyenIvdfJmG1i+w9jHncYSb0V0GFnva
 FEejVO3mNu64jctKg6UA4UitcBkvaxzk=
X-Received: by 2002:a17:907:3e20:b0:7ad:b54a:442f with SMTP id
 hp32-20020a1709073e2000b007adb54a442fmr31215522ejc.636.1667555119949; 
 Fri, 04 Nov 2022 02:45:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7LAM9Qm69pIJH6zLWlvZjOaQd83UqYY3UvuBNhMlGG1O/VKijHBQW00Ik0m4h/ZgfXOi5/nzWSt5h9OWrqbJE=
X-Received: by 2002:a17:907:3e20:b0:7ad:b54a:442f with SMTP id
 hp32-20020a1709073e2000b007adb54a442fmr31215498ejc.636.1667555119725; Fri, 04
 Nov 2022 02:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221103104716.179635-1-zhenyzha@redhat.com>
 <7eecb87f-7d37-93d0-db93-21f7c6374d91@linaro.org>
 <CAJFLiBJSYLm11xUfWPFTOi9xMPk6WYE+G+v3-mhWzV=xp-YHAQ@mail.gmail.com>
 <949eb8d1-2298-de8e-6492-33a8cd4ee100@linaro.org>
In-Reply-To: <949eb8d1-2298-de8e-6492-33a8cd4ee100@linaro.org>
From: Zhenyu Zhang <zhenyzha@redhat.com>
Date: Fri, 4 Nov 2022 17:44:43 +0800
Message-ID: <CAJFLiBKsYwpJQ8a0rbF0yk2xUK0difmShnT5aDQDFs_-Ae+_bA@mail.gmail.com>
Subject: Re: [PATCH] qom.json: default the prealloc-threads to smp-cpus
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, shan.gavin@gmail.com, liuyd.fnst@fujitsu.com, 
 eric.auger@redhat.com, Igor Mammedov <imammedo@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=zhenyzha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ok, many thanks for the clarification.
I'll post a v2 patch to correct it.

On Fri, Nov 4, 2022 at 5:29 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> On 4/11/22 02:57, Zhenyu Zhang wrote:
> > Hello Philippe
> >
> > I checked out this modified patch:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg888815.html
> > It should have been merged in 7.1
>
> This changed the default value, not the property availability.
>
> IIUC the '(since X)' format document when a property got added,
> regardless its default value.
>
> This property is available since 5.0.
>
> The default value changed in 7.1. You are correct we need to update
> the new value in documentation, but the 'since' tag should refer
> to when the property got added: 5.0.
>
> > On Thu, Nov 3, 2022 at 7:00 PM Philippe Mathieu-Daud=C3=A9 <philmd@lina=
ro.org> wrote:
> >>
> >> On 3/11/22 11:47, Zhenyu Zhang wrote:
> >>> Since the amount of prealloc-threads to smp-cpus is
> >>> defaulted in hostmem, so sync this information.
> >>>
> >>> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
> >>> ---
> >>>    qapi/qom.json | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/qapi/qom.json b/qapi/qom.json
> >>> index 87fcad2423..ac4cd213a7 100644
> >>> --- a/qapi/qom.json
> >>> +++ b/qapi/qom.json
> >>> @@ -576,7 +576,7 @@
> >>>    #
> >>>    # @prealloc: if true, preallocate memory (default: false)
> >>>    #
> >>> -# @prealloc-threads: number of CPU threads to use for prealloc (defa=
ult: 1)
> >>> +# @prealloc-threads: number of CPU threads to use for prealloc (defa=
ult: smp-cpus) (since 7.1)
> >>
> >> The property is present since 5.0. Shouldn't this be "(default:
> >> smp-cpus) (since 5.0)"?
> >>
> >>>    #
> >>>    # @prealloc-context: thread context to use for creation of preallo=
cation threads
> >>>    #                    (default: none) (since 7.2)
> >>
> >
>


