Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C854C0FBE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:02:43 +0100 (CET)
Received: from localhost ([::1]:48986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMoTq-0004zx-MJ
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:02:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nMnjO-0005PS-Vh
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:14:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nMnjM-0003DS-4w
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645607671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cXyJaV+cI0Myh2go7WYykLDLMeijKaW3dTh/CQgWrPc=;
 b=X+orI2BVnnJJZmO+PqX+kSpTjp+B1WoGz2L/Ht9dn1bDQuinn1wEaCKefx33Ue4fWJDaFG
 DcLMV21PC9WcJXofj6v6C6AIXH/ZXPFRtqNE/J2eh8ftMOLo79skIvPl05beGvf8vOCjqT
 +TOGRO2wLp4HBPtrqHIMAmXE/gew5WA=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-_I7tdh-0MV2yYKg0enNE0w-1; Wed, 23 Feb 2022 04:14:30 -0500
X-MC-Unique: _I7tdh-0MV2yYKg0enNE0w-1
Received: by mail-yb1-f197.google.com with SMTP id
 r14-20020a5b018e000000b00624f6f97bf4so741064ybl.12
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 01:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cXyJaV+cI0Myh2go7WYykLDLMeijKaW3dTh/CQgWrPc=;
 b=g8+AUdo4DiSgJqkYSQy54vITPzrC0tekWby4BRs2cgl3KyGDQGlafMCilDm27Nb6zx
 Owc+lz1tIzgUQ9jr8RfQWwsg1Pg6G9EsRRtkKB6uG72UYpyir3feU86ez1kZNb4pR2K5
 q7UQD41xapfyd89b5J/M2sXwOeUVAOsKdXxJ0+56Qa1/0PPoCjtDzsVolg+tfI763F8F
 2KyrMDdE9fCmbaDh/JS3VekwIJlIE5sTs5xE5rVB1UzofZaAedMRQUzwyo0zbv+RdSPT
 b0wJ+9PqKnbVa16Iu7MwmVajrpPvh1W9+1oPTtFbiI2qwYmAn4NEvcj9jqIebHXES2v1
 WiYw==
X-Gm-Message-State: AOAM532OTrQlCLNq0EgdHFkb1NxmJ0uR6IC2IYCOVLFYI8hSwL9UWVn5
 WzXPfZqbgR9X9X+30xOF999HedkSJCHO0R9Mp9ihr24szTSzP4yh1qKYKS134WeiccoiWvJoSna
 bG0P1jDlipxIKnYn1oQTEQAQBCdYiybo=
X-Received: by 2002:a25:d792:0:b0:624:c76:e824 with SMTP id
 o140-20020a25d792000000b006240c76e824mr26337351ybg.343.1645607669601; 
 Wed, 23 Feb 2022 01:14:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZa3F1JKeqhYCVq7bM6aXyJccyMUqKg0PkKHsON7ZIZEICZlV0wdMJyLK7BIjW7BeFyqscDhfUH5IJQDTnA6s=
X-Received: by 2002:a25:d792:0:b0:624:c76:e824 with SMTP id
 o140-20020a25d792000000b006240c76e824mr26337343ybg.343.1645607669424; Wed, 23
 Feb 2022 01:14:29 -0800 (PST)
MIME-Version: 1.0
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
 <20220222194008.610377-5-marcandre.lureau@redhat.com>
 <9cdd93f2-af65-ba5c-c5df-8f9e4d42eeaf@redhat.com>
In-Reply-To: <9cdd93f2-af65-ba5c-c5df-8f9e4d42eeaf@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 23 Feb 2022 13:14:18 +0400
Message-ID: <CAMxuvaykS_4tbQwz=EFWATRVdhabwDdM4x-uH-efXUfw3DcEbQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] meson: drop the .fa library suffix
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Feb 23, 2022 at 1:08 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 2/22/22 20:40, marcandre.lureau@redhat.com wrote:
> >
> > The .fa suffix was a temporary hack introduced in commit
> > 1f0a1d8a51 ("build-sys hack: link with whole .fa archives") when the
> > build system was mixed between meson & makefiles. It is no longer
> > needed.
>
> It is still needed to separate internal and system archives, otherwise
> the oss-fuzz build fails.  Meson adds a --start-group/--end-group pair

Ah, but gitlab oss-fuzz build passed
https://gitlab.com/marcandre.lureau/qemu/-/pipelines/476763089

> around all libraries, and the fork-fuzz.ld linker script should be
> outside it.  If the libraries are named .a, the --start-group is placed
> much earlier.
>
> This is of course a very ugly workaround; Meson should just use the
> objects instead of the archives when link_whole is used with an internal
> convenience archive.

Any meson github issue we can point to?


