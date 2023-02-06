Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB96C68B96D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 11:08:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOyOi-0004Qy-H1; Mon, 06 Feb 2023 05:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pOyOe-0004Q2-Ng
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 05:06:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pOyOb-0007L0-Rp
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 05:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675678004;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rjZALzcfU0CPgQmgr/q9uFwuLz4H2xKeJz1pJ2JeS+4=;
 b=cO+n3SnyBMwqEfPi3Klqvz+2+8bSn0J1uQ7tLr9nVCtgNFUJIwzyTzgwkU0Ph3cNuxEv3C
 6r8ZZulmnikZFgsM6nmEfjHhDg7xtPxM/j02a+Y6gHmC5pW0JZ1mLrviGDjme+nqZwEoQU
 XGiTcapYEcUq7u8W6OTzHQNuiuNrc7Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-99-OcOFig7vNlOxNq1a8cPuhA-1; Mon, 06 Feb 2023 05:06:43 -0500
X-MC-Unique: OcOFig7vNlOxNq1a8cPuhA-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg32-20020a05600c3ca000b003dc0df8c77dso6327388wmb.6
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 02:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rjZALzcfU0CPgQmgr/q9uFwuLz4H2xKeJz1pJ2JeS+4=;
 b=8OqcfNTQMTMLuE2Ujg2F/qiiQA+wq//dWM+NaBwy19u5hUuP81rnYu5IAIBNAVFtPt
 x4trHVT/C0QbjBMVbgUaH67+XLWo0S4m9tI1aRjNkSJypZXBaZGXta7BNwdt4F6Aqg1C
 ev6VQJ4arIn+ofvD04z3iXI+ZoUdjCZRSSwsFlhtlMy6DF0B5y6ZD9wP31LIPvmuWSDL
 yP064bMJSiRRzfCnA6nFHZN4J4tfKMyElw7Mn/knLJS4ofHlkWVzBclTdx52otrhaNyy
 PnVDczqtGh7NrciAC9IFAuELTg3zbQm5Gp2BQVwvwYA2bx0CqvyD4SPALUEbmySyJT7b
 2IUg==
X-Gm-Message-State: AO0yUKU4andoHJ6Po7v6nqoMK4WioYnj3F6xwcqs/2Y+xCDecgEjwNsj
 /gh0pnoyBLReSA0vAqk7dpO8JY87UY0M2v+l5jv8DfwXWp6MeKTExiObSGCVOuJ1602q4Vx1IVu
 azemaarD74Cj8NxI=
X-Received: by 2002:a5d:4109:0:b0:2c3:ebf9:fbe8 with SMTP id
 l9-20020a5d4109000000b002c3ebf9fbe8mr1671204wrp.71.1675678002198; 
 Mon, 06 Feb 2023 02:06:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8UJzVebO7AUPcbTBydq0fOLpvjBUDv4/Ck0dnyuC4k6MFu1Lm6pruDE5jM6EsmgKczWaMdKg==
X-Received: by 2002:a5d:4109:0:b0:2c3:ebf9:fbe8 with SMTP id
 l9-20020a5d4109000000b002c3ebf9fbe8mr1671179wrp.71.1675678002004; 
 Mon, 06 Feb 2023 02:06:42 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 f9-20020adff989000000b002c3e6b39512sm2983406wrr.53.2023.02.06.02.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 02:06:41 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Bernhard Beschow <shentey@gmail.com>,  qemu-devel@nongnu.org,  Thomas
 Huth <thuth@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,
 qemu-trivial@nongnu.org,  BALATON Zoltan <balaton@eik.bme.hu>,  Laurent
 Vivier <lvivier@redhat.com>,  Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Igor
 Mammedov <imammedo@redhat.com>,  Ani Sinha <ani@anisinha.ca>,  "Dr. David
 Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 8/9] hw/i386/x86: Make TYPE_X86_MACHINE the owner of
 smram
In-Reply-To: <10bf125e-85a4-72cc-07de-0d6206941f62@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sun, 5 Feb 2023 12:21:45
 +0100")
References: <20230204151027.39007-1-shentey@gmail.com>
 <20230204151027.39007-9-shentey@gmail.com>
 <10bf125e-85a4-72cc-07de-0d6206941f62@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 06 Feb 2023 11:06:40 +0100
Message-ID: <87h6vzcdlb.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> On 4/2/23 16:10, Bernhard Beschow wrote:
>> Treat the smram MemoryRegion analoguous to other memory regions such as
>> ram, pci, io, ... , making the used memory regions more explicit when
>> instantiating q35 or i440fx.
>> Note that the q35 device uses these memory regions only during the
>> realize phase which suggests that it shouldn't be the owner of smram.
>
> Few years ago I tried something similar and it wasn't accepted because
> the MR owner name is used in the migration stream, so this was breaking
> migrating from older machines.

I don't remember the details O:-)

Migration code, really depends on RAMBlocks names, not memory region
names.  But as far as I remember, that don't matter too much because the
memory region names ends tangled quite a bit with the RAMBlock name, right?

> Adding David/Juan for double-checking that.

    trace_vmstate_save(se->idstr, se->vmsd ? se->vmsd->name : "(old)");

You can try to enable this trace and see that every section has the same
name with and without your change (i.e. that memory region name is not
seen by the migration stream).

But that is the only help that I can came with.

The code that you are changing (smram) is something that I don't know
about to give you more help.

Looking at the patch, it looks that the name was before and now the
"sram", so perhaps it could help.  But I don't know.

In the i440fx you say that you only use it until realize, so you should
be safe.

For q35, it is not clear to me.

If the trace don't show new names, I will just try:
- migrate a i440fx machine from binary without your patch to one with
  your patch
- the same for q35.

And depending on the result, we can go from there.

Later, Juan.


