Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25E44B99AD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 08:13:39 +0100 (CET)
Received: from localhost ([::1]:57926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKayw-0002KO-FT
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 02:13:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afrosi@redhat.com>) id 1nKav0-0001O6-Jd
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:09:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afrosi@redhat.com>) id 1nKauu-0007Aa-K0
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645081767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PJwlrEigBYAbeDng+pA4J2ghsfpfNYKjHDIfIXfAcCk=;
 b=Wp4dBrZLCYr1YJBkdljN3MGUCxWF7KAT97USrtKcp1jouDn4w0H/F+vg0tc+w+NBY0p/Q1
 KvgHEQ0IZ3w3B+uQ+uPhdq0BF7VoxX9W2OjogaG0CKzDdPCzCg244NWE/42wlGggNNMbw4
 jb+Mo/LzJYXKZGFyoA0Tc6hfe8n2pb4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-seqx38R5NXKC-X3f4rGvLg-1; Thu, 17 Feb 2022 02:08:18 -0500
X-MC-Unique: seqx38R5NXKC-X3f4rGvLg-1
Received: by mail-lj1-f198.google.com with SMTP id
 s20-20020a2eb8d4000000b00244c0c07f5aso1891256ljp.7
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 23:08:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PJwlrEigBYAbeDng+pA4J2ghsfpfNYKjHDIfIXfAcCk=;
 b=298lugp5xmWkgOoia+puVTxtH9GlXZoBGLY9nAEQswXJNEm5tLAnjB+Afh3Objj8Io
 U0zJqVFmEXJY56jupM7vxRd3m+p4mzIxyoU9il8wNBzqS14COz6vCHj3k2x6hS/yVItl
 A5nAX/RJSVzcRAF2Fa/SkXnyRlVKniMT2amC83hfMTn+jVDbeumIcNspOM7L9KyijOof
 GkxembZ12yEwG8ZTvv8AZ8dNNmWwD22lUcbLllJnPefPBkQ9JJRgaT8MK9g77Mqy2TbJ
 Vhx9yWsBdB8eWDiKsjAOlg9/KPwUcaOEdywIxihZI+fwRoekaPtG/QyJI/QIFeVOn5GK
 +o0Q==
X-Gm-Message-State: AOAM5326S2F829w84rfP5rXKOtTbQ1euVdiGwHw2W2Kr1hSnN6BuDhwY
 d4ihrw1oN8TwM1FQ0THCtBR8UbUXbP0t9lG63Tf+x49h5kWt5srZp9mkocBc/HXHB0CCHaoU2dz
 mi+BEsnlXi+OyGYstrzyaFZLqu2mfgiw=
X-Received: by 2002:a05:6512:1581:b0:443:96c9:d1a0 with SMTP id
 bp1-20020a056512158100b0044396c9d1a0mr1165201lfb.501.1645081697356; 
 Wed, 16 Feb 2022 23:08:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9ZAveF3ctcDThUhmShOSbalf72WBbK0f6Bxv13o5sV4xVgG8OW3g25T+vumGT/qKP9gOoHKx2rUn5apiTujI=
X-Received: by 2002:a05:6512:1581:b0:443:96c9:d1a0 with SMTP id
 bp1-20020a056512158100b0044396c9d1a0mr1165171lfb.501.1645081697029; Wed, 16
 Feb 2022 23:08:17 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
In-Reply-To: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
From: Alice Frosi <afrosi@redhat.com>
Date: Thu, 17 Feb 2022 08:08:06 +0100
Message-ID: <CABBoX7PcqRFHDm0LCwWOwmYmOwH2x70pM-3OyxfDXD1sE_fHrw@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Stefan Hajnoczi <stefanha@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=afrosi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afrosi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Sergio Lopez Pascual <slp@redhat.com>, kvm <kvm@vger.kernel.org>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, John Snow <jsnow@redhat.com>,
 Alex Agache <aagch@amazon.com>, qemu-devel <qemu-devel@nongnu.org>, "Florescu,
 Andreea" <fandree@amazon.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, hreitz@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 28, 2022 at 6:04 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> Dear QEMU, KVM, and rust-vmm communities,
> QEMU will apply for Google Summer of Code 2022
> (https://summerofcode.withgoogle.com/) and has been accepted into
> Outreachy May-August 2022 (https://www.outreachy.org/). You can now
> submit internship project ideas for QEMU, KVM, and rust-vmm!
>
> If you have experience contributing to QEMU, KVM, or rust-vmm you can
> be a mentor. It's a great way to give back and you get to work with
> people who are just starting out in open source.
>
> Please reply to this email by February 21st with your project ideas.
>
> Good project ideas are suitable for remote work by a competent
> programmer who is not yet familiar with the codebase. In
> addition, they are:
> - Well-defined - the scope is clear
> - Self-contained - there are few dependencies
> - Uncontroversial - they are acceptable to the community
> - Incremental - they produce deliverables along the way
>
> Feel free to post ideas even if you are unable to mentor the project.
> It doesn't hurt to share the idea!
>

I'd like to propose this idea:

Title: Create encrypted storage using VM-based container runtimes

Cryptsetup requires root privileges in order to be able to encrypt
storage with luks. However, privileged containers are generally
discouraged for security reasons. A possible solution to avoid extra
privileges is using VM-based container runtimes (e.g crun with libkrun
or kata-containers) and running inside the Virtual Machine the tools
for the storage encryption.

This internship focus on a PoC for integrating and extending crun with
libkrun in order to be able to create encrypted storage. The initial
step will focus on creating encrypted images to demonstrate the
feasibility and the necessary changes in the stack. If the timeframe
allows it, an interesting follow-up of the first step is the
encryption of persistent storage using block-based PVCs.

Language: C, rust, golang
Skills: containers and virtualization would be a big plus
I won't put a level but the intern needs to be willing to dig into
different source codes like crun (written in C), libkrun (written in
Rust) and possibly podman or other kubernetes/containers projects
(written in go)
Mentor: Alice Frosi, Co-mentor: Sergio Lopez Pascual

Let me know if the idea sounds feasible to you!

Many thanks,

Alice


