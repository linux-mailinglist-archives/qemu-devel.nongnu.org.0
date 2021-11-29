Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B3A462139
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 20:58:30 +0100 (CET)
Received: from localhost ([::1]:53708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrmnF-0002eI-KK
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 14:58:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrmkW-0008Fz-Pj
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:55:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrmkT-0006vP-AT
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638215735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vTRCnp1cOxMmUEw10TXel/KyGgA2SHPhjU1hXe8YDfU=;
 b=jBBTlY1VNsjLZU6DPaT5pRvicNg8LMfRmZ2O1zGcMHpu6QEmyi0bXkOZ7HZsaaT2/ASC0y
 3G09qH3xWSNF3JOskqQvPM9PtxpD1z/PkKBMj5/DN0Tgvofjp73DeQvRe0ANVCastnU4ia
 O0wsGu/U4m5LqA32IhA8Hr32mL27oh4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-ky082sG0MYWpmptSX0_V1Q-1; Mon, 29 Nov 2021 14:55:34 -0500
X-MC-Unique: ky082sG0MYWpmptSX0_V1Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 a85-20020a1c7f58000000b0033ddc0eacc8so10548195wmd.9
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 11:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vTRCnp1cOxMmUEw10TXel/KyGgA2SHPhjU1hXe8YDfU=;
 b=wUDOh22qmA48mq6wyv9Qr/orT8SEWZCtgO01Y48ZPyS1xjwXbIPRhZnENhmjygtOog
 52cLxXaoKeWaEVwSr4nuQyscUET4Ggg3jFyPqtiZPTH2nlrzLAFa1pXYW+VsEmmtYFWL
 dQHmQjHe6goEx9IjAWQDHQCFS6CXNKHcoeRPirfnsT/3eMmeabufaMVMrDmTzsY51oy/
 F7DfEFc/AhPCK/A1haA2VYbQOgyr7GeAPotvksl5b2hafcnD16YP8a4UYFZSK20yl72m
 OZH57foFiETQ/Dlc1j83P35eVPh3cGukReZEgf0fImI6KJP9su6GQh/pYtFZ4YXkX9w9
 H2jw==
X-Gm-Message-State: AOAM531eROj4hisNhp/dI4DF097JNnN1ZNI43xmjAwNyS4r2nNuDJbbB
 DXR9kVaEsi5+u8TVenfY1RGISAHVmADwMhPOEbugRQdJK62mLXFKy+GP7hHmRHce74uGKD3uoQB
 ArBWQTPu5CmFB2WA=
X-Received: by 2002:a1c:f418:: with SMTP id z24mr131794wma.95.1638215733480;
 Mon, 29 Nov 2021 11:55:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxS2NpD68wHgsFh0nTbdoDtqlhkEulxcXZqBzWE6aW7HW9fi1fzxHYTLgS+iG3/CF/rlQaAEw==
X-Received: by 2002:a1c:f418:: with SMTP id z24mr131769wma.95.1638215733244;
 Mon, 29 Nov 2021 11:55:33 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id u23sm253250wmc.7.2021.11.29.11.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 11:55:32 -0800 (PST)
Date: Mon, 29 Nov 2021 19:55:30 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v3 0/5] QMP support for cold-plugging devices
Message-ID: <YaUwMhZg+TbYwHAg@work-vm>
References: <20211117144703.16305-1-damien.hedde@greensocs.com>
 <87y25jw69i.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87y25jw69i.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, edgar.iglesias@xilinx.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> Damien Hedde <damien.hedde@greensocs.com> writes:

> > Patches 1, 3 and 5 miss a review.
> >
> > The series is organized as follow:
> >
> > + Patches 1 and 2 converts the MachinePhase enum to a qapi definition
> >   and add the 'query-machine-phase'. It allows to introspect the
> >   current machine phase during preconfig as we will now be able to
> >   reach several machine phases using QMP.
> 
> If we fold MachinePhase into RunState, we can reuse query-status.
> 
> Having two state machines run one after the other feels like one too
> many.

Be careful, the RunState is API and things watch for events on it, so
any changes to it are delicate.

Dave

> > + Patch 3 adds the 'x-machine-init' QMP command to stop QEMU at
> >   machine-initialized phase during preconfig.
> > + Patch 4 allows issuing device_add QMP command during the
> >   machine-initialized phase.
> > + Patch 5 improves the doc about preconfig in consequence. 
> 
> I understand you want to make progress towards machine configuration
> with QMP.  However, QEMU startup is (in my educated opinion) a hole, and
> we should be wary of digging deeper.
> 
> The "timeline" you gave above illustrates this.  It's a complicated
> shuffling of command line options and QMP commands that basically nobody
> can keep in working memory.  We have reshuffled it / made it more
> complicated quite a few times already to support new features.  Based on
> your cover letter, I figure you're making it more complicated once more.
> 
> At some point, we need to stop digging us deeper into the hole.  This is
> not an objection to merging your work.  It's a call to stop and think.
> 
> Let me quote the sketch I posted to the "Stabilize preconfig" thread:
> 
> 1. Start event loop
> 
> 2. Feed it CLI left to right.  Each option runs a handler just like each
>    QMP command does.
> 
>    Options that read a configuration file inject the file into the feed.
> 
>    Options that create a monitor create it suspended.
> 
>    Options may advance the phase / run state, and they may require
>    certain phase(s).
> 
> 3. When we're done with CLI, resume any monitors we created.
> 
> 4. Monitors now feed commands to the event loop.  Commands may advance
>    the phase / run state, and they may require certain phase(s).
> 
> Users can do as much or as little with the CLI as they want.  You'd
> probably want to set up a QMP monitor and no more.
> 
> device_add becomes possible at a certain state of the phase / run state
> machine.  It changes from cold to hot plug at a certain later state.
> 
> > [1]: https://lore.kernel.org/qemu-devel/b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com
> >
> > Thanks for your feedback.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


