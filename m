Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766946A6EDC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:55:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXNqU-000422-4y; Wed, 01 Mar 2023 09:54:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pXNqR-0003qL-Ra
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:54:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pXNqQ-0000Cw-9R
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:54:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677682453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hWNCgXdqBl1EHkw9a463OBU72rcKYVy1UAU7KZqXFjc=;
 b=MrNQ5AG3IzMyC017opmX4SWcnibFkviJwvwXjy0N6bXVsTf4bY7MSWMXP4FYnaPipeJF3W
 yFaDJl14cPRBYka2Dp0Hc8zEGKW23Vrm3FgWHwWtJDL1LzSbsdoD1uESrHJLuA3D8gh+53
 8VdnraV/o0IEcXXF+7Vy+uEWQav/FqM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-KxCUuG6iPcmJ6YmeMU66RA-1; Wed, 01 Mar 2023 09:54:12 -0500
X-MC-Unique: KxCUuG6iPcmJ6YmeMU66RA-1
Received: by mail-pj1-f69.google.com with SMTP id
 i6-20020a17090a650600b002372da4819eso4611177pjj.0
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 06:54:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hWNCgXdqBl1EHkw9a463OBU72rcKYVy1UAU7KZqXFjc=;
 b=24AyUboiDOqbwNyuzTWylTyuEUinGoe4GxT4wbO00XkrCJiB+9krDxwb1ii6zKQAiG
 LDykU1biJf1CBMGKUQPacDV9mbURL5TEZOOqy4+XSvLzKegpvBuHwAwP/DuaEu5xABnR
 +HoIOJ5f9UgRDHojTcIPHkD5w02txiChS8n89uS/FtlunPiMGeEqyeky+olpJN98pTat
 Fi8xBynq3/uadNNuCxfmUOEnG4gGVZATHAS5+NMmA+4ANymu0x6CwPbvQjkkmOzeF6Ux
 SSGrVFM+hYvonVx1WSCheo8e/oImiYzi5/XgN/kGPHOFLpt7IEzJxtsZLF5Cn+pCJ0HZ
 GCPw==
X-Gm-Message-State: AO0yUKXnHfACBEYdP3ImUNgBSbmztSGDenpRiNU6EF4wQxYnjJwCPbXt
 sp7nxDiDzrQXSQ8TZ37F2cSdpJWg/RALeP9NzMtUu69ciJU4VOSuWDafBOQ5KbQLdmkgbAdO84X
 V7HZOWvFFEcDpZaLIJO30FNYWA/zO9wM=
X-Received: by 2002:a62:8281:0:b0:5df:9809:6220 with SMTP id
 w123-20020a628281000000b005df98096220mr2649496pfd.3.1677682451400; 
 Wed, 01 Mar 2023 06:54:11 -0800 (PST)
X-Google-Smtp-Source: AK7set8AiQ0Z+/wGHQyI0AWyso+wjGffpjfQNHEZG705KAGNfYOG4iqXV+jKfxyo12DX/Lc2j49BdB27CacCsQgTowE=
X-Received: by 2002:a62:8281:0:b0:5df:9809:6220 with SMTP id
 w123-20020a628281000000b005df98096220mr2649478pfd.3.1677682451116; Wed, 01
 Mar 2023 06:54:11 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Mar 2023 06:54:10 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20230228150216.77912-1-cohuck@redhat.com>
 <20230228150216.77912-2-cohuck@redhat.com>
 <CABJz62OHjrq_V1QD4g4azzLm812EJapPEja81optr8o7jpnaHQ@mail.gmail.com>
 <874jr4dbcr.fsf@redhat.com>
 <CABJz62MQH2U1QM26PcC3F1cy7t=53_mxkgViLKjcUMVmi29w+Q@mail.gmail.com>
 <87sfeoblsa.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87sfeoblsa.fsf@redhat.com>
Date: Wed, 1 Mar 2023 06:54:10 -0800
Message-ID: <CABJz62PbzFMB3ifg7OvTXe34TS5b3xDHJk8XGs-inA5t5UEAtA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
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

On Wed, Mar 01, 2023 at 03:15:17PM +0100, Cornelia Huck wrote:
> On Wed, Mar 01 2023, Andrea Bolognani <abologna@redhat.com> wrote:
> > I'm actually a bit confused. The documentation for the mte property
> > of the virt machine type says
> >
> >   mte
> >     Set on/off to enable/disable emulating a guest CPU which implements
> >     the Arm Memory Tagging Extensions. The default is off.
> >
> > So why is there a need to have a CPU property in addition to the
> > existing machine type property?
>
> I think the state prior to my patches is actually a bit confusing: the
> user needs to set a machine type property (causing tag memory to be
> allocated), which in turn enables a cpu feature. Supporting the machine
> type property for KVM does not make much sense IMHO: we don't allocate
> tag memory for KVM (in fact, that would not work). We have to keep the
> previous behaviour, and explicitly instructing QEMU to create cpus with
> a certain feature via a cpu property makes the most sense to me.

I agree that a CPU feature makes more sense.

> We might want to tweak the documentation for the machine property to
> indicate that it creates tag memory and only implicitly enables mte but
> is a pre-req for it -- thoughts?

I wonder if it would be possible to flip things around, so that the
machine property is retained with its existing behavior for backwards
compatibility, but both for KVM and for TCG the CPU property can be
used on its own?

Basically, keeping the default of machine.mte to off when cpu.mte is
not specified, but switching it to on when it is. This way, you'd be
able to simply use

  -machine virt -cpu xxx,mte=on

to enable MTE, regardless of whether you're using KVM or TCG, instead
of requiring the above for KVM and

  -machine virt,mte=on -cpu xxx

for TCG.

Note that, from libvirt's point of view, there's no advantage to
doing things that way instead of what you already have. Handling the
additional machine property is a complete non-issue. But it would
make things nicer for people running QEMU directly, I think.

-- 
Andrea Bolognani / Red Hat / Virtualization


