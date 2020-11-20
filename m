Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868722BB906
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 23:31:28 +0100 (CET)
Received: from localhost ([::1]:46040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgEwA-0003Cm-TX
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 17:31:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jannh@google.com>) id 1kgEuk-0002kF-6p
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 17:29:58 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:34904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jannh@google.com>) id 1kgEuh-0006IT-PZ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 17:29:57 -0500
Received: by mail-lf1-x142.google.com with SMTP id a9so15653143lfh.2
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 14:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rN2oDMLkDXvF2d0qSHyE1KGJoI0coYurxX8BvFhI+bY=;
 b=G5VJUQuazvZ46rb86s40Pn6WkJ8vF48RjwI203WsXZ9Dd/97U9zAuv02njfWIOciBV
 QuSh0dRcRHb6kNB5R91cqfNYC3Nx6BskGC8Id4k04GJmqF+iTSL0z/vx19itSZMS+dny
 GX6UFvM4nLEOfv88ofsMR/2MQJp/CTfeCiBq4RMzNChRcKghzB+b2vhazIrHXFWol38n
 pfrMAxiWdO7fXF7LhFiySxUhhlwuVHmMt2IU2HAhlY57qt8oywDFoatbjiKMM0J1tI0a
 F2+QJ/feDTYc37U0EswhVkKC6ECmTYbgvZ1lbayAJ7xC0KxdUPr0mf9Jsvw5GLqRUrhv
 ttbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rN2oDMLkDXvF2d0qSHyE1KGJoI0coYurxX8BvFhI+bY=;
 b=hvEkrU0DmUHJuA5VuRn0Oqid8mIHjMnhCFmlXW3TVoewGobTQonpjj5itKo2Su1F9Q
 qUJ9sJVJqEjFmIRqfO1OvrHLxTEQvv3Qqe2O2KSh0WiBQtFjQHagV6Lgc3wJL/dU3PBt
 JLIoYLDQbmXe7rQ6+J8XAfWiTYarJ2dvfAGha+EHoqh6Daxlb7JfrIYxVxPBr8wTGJ3W
 1PIJKtV2bS4rf+3btbadlRDdjy+TVA8/xVAm335SpC4ZUq6dInsry1LuQK5A76FodJaz
 7QtkQ1h3x5fpAuCRc1HXXl1OjMDwn2nrtBgb/yQjrl++/PDQoodGy6MNxwceDSowhF81
 8LeA==
X-Gm-Message-State: AOAM531TGYsRpAepsG7NKsH53IbTLPYj84lqOdilKvIFpBZBhVl1O+Lq
 X+lXcWgkqCLCCkQPMkVSZNy1PkrjwgSzXcB1zM330g==
X-Google-Smtp-Source: ABdhPJz7KhY3kkkWmPWTE7oEp1RrYqakWRzVBA4phAIJXfRGBYOb72PMtSpg2EcEFuNfIDhSB+mhcRErvgpdubnMvSw=
X-Received: by 2002:a19:686:: with SMTP id 128mr8504175lfg.198.1605911392397; 
 Fri, 20 Nov 2020 14:29:52 -0800 (PST)
MIME-Version: 1.0
References: <3E05451B-A9CD-4719-99D0-72750A304044@amazon.com>
In-Reply-To: <3E05451B-A9CD-4719-99D0-72750A304044@amazon.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 20 Nov 2020 23:29:25 +0100
Message-ID: <CAG48ez2VAu6oARGVZ+muDK9_6_38KVUTJf7utz5Nn=AsmN17nA@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/virt: vmgenid: add vm generation id driver
To: "Catangiu, Adrian Costin" <acatan@amazon.com>
Cc: "Graf (AWS), Alexander" <graf@amazon.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Willy Tarreau <w@1wt.eu>, "MacCarthaigh,
 Colm" <colmmacc@amazon.com>, 
 Andy Lutomirski <luto@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Eric Biggers <ebiggers@kernel.org>, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 kernel list <linux-kernel@vger.kernel.org>, 
 "Woodhouse, David" <dwmw@amazon.co.uk>, "bonzini@gnu.org" <bonzini@gnu.org>,
 "Singh, Balbir" <sblbir@amazon.com>, 
 "Weiss, Radu" <raduweis@amazon.com>, "oridgar@gmail.com" <oridgar@gmail.com>, 
 "ghammer@redhat.com" <ghammer@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Qemu Developers <qemu-devel@nongnu.org>, KVM list <kvm@vger.kernel.org>, 
 Michal Hocko <mhocko@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Linux API <linux-api@vger.kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, 
 linux-s390 <linux-s390@vger.kernel.org>,
 "areber@redhat.com" <areber@redhat.com>, 
 Pavel Emelyanov <ovzxemul@gmail.com>, Andrey Vagin <avagin@gmail.com>,
 Mike Rapoport <rppt@kernel.org>, Dmitry Safonov <0x7f454c46@gmail.com>,
 Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
 "gil@azul.com" <gil@azul.com>, "asmehra@redhat.com" <asmehra@redhat.com>, 
 "dgunigun@redhat.com" <dgunigun@redhat.com>,
 "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=jannh@google.com; helo=mail-lf1-x142.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On Mon, Nov 16, 2020 at 4:35 PM Catangiu, Adrian Costin
<acatan@amazon.com> wrote:
> This patch is a driver that exposes a monotonic incremental Virtual
> Machine Generation u32 counter via a char-dev FS interface that
> provides sync and async VmGen counter updates notifications. It also
> provides VmGen counter retrieval and confirmation mechanisms.
>
> The hw provided UUID is not exposed to userspace, it is internally
> used by the driver to keep accounting for the exposed VmGen counter.
> The counter starts from zero when the driver is initialized and
> monotonically increments every time the hw UUID changes (the VM
> generation changes).
>
> On each hw UUID change, the new hypervisor-provided UUID is also fed
> to the kernel RNG.

As for v1:

Is there a reasonable usecase for the "confirmation" mechanism? It
doesn't seem very useful to me.

How do you envision integrating this with libraries that have to work
in restrictive seccomp sandboxes? If this was in the vDSO, that would
be much easier.

