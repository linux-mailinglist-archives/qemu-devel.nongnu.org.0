Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4266D642E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:57:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjh9H-00027Q-CL; Tue, 04 Apr 2023 09:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjh9F-00027G-7h
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:56:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjh9D-0002e6-Jl
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680616590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTCVD5Frp1j12qePatxZ98x7+F3tWllXGKbYuQmf1fw=;
 b=As+i64jrJ6PQBu+VOQdITqIlVrmT3rbTNmluzXj0GGGnHsymnVgzbO9G3mu+J9nXwlietJ
 kdIPe6G26q19jqSNWKojJhKJVwg0QcmFqWZw4MJxCoSxUwCkO0LYun2sFmDjeLHM7ePkal
 Jj4ddlD0U6UIoCKDBiWDUEwBgBxZkuc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-TmINPegGNauMbAQK4kci7A-1; Tue, 04 Apr 2023 09:56:28 -0400
X-MC-Unique: TmINPegGNauMbAQK4kci7A-1
Received: by mail-ed1-f72.google.com with SMTP id
 c1-20020a0564021f8100b004acbe232c03so45481636edc.9
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 06:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680616584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PTCVD5Frp1j12qePatxZ98x7+F3tWllXGKbYuQmf1fw=;
 b=4OvOyav3BS3EhfSc3zX8395ThIZbAK+U8NspWeGAgPLa97DiF0wudt6pGIPPfB/QAt
 wehmoOswbt1hMA56JUwmQS393GJ9xlvUp3/iUXRQLB560/H/a7bReoRedwfT9GYctI5h
 ZeviQGulbmO5maPW6ROl4MIDkZS2vRGSnvs8hkQTxN8YIFxN/RuEp7/HVRL6fUYKqJVt
 tKpQ3MQPB4rQK39P3GbzfuzYr2SdXZ4vzkGgRoWP5Nu8udRyFlY31Yt60Kbva2e6SJA9
 9cWTsP2gusA0VbKg2L6ei0CUQxfdhMY651uQASjPpIX3FkypkKmaXwPJ2HIGwz3CPYX2
 IKig==
X-Gm-Message-State: AAQBX9diYpQbZXmcl+hEqpM0AstBJ3fItu2dJLu77jyGjvG11ilWagZC
 NBmOD9vFVqWgAOPndqx/L0JVoSw/bDVYfn6bXngtm4EWbxpQ4geKlGHgTa1s6tAOxuoqhUnvYCw
 u4KCRZ9WuqNXzx/A=
X-Received: by 2002:a17:906:6a0b:b0:93e:8791:7d8e with SMTP id
 qw11-20020a1709066a0b00b0093e87917d8emr2871082ejc.2.1680616584640; 
 Tue, 04 Apr 2023 06:56:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350YS9wz7smWMWhw0cu/umkgUxZNGd0j0YVxBPziKNgClgvJ6ftnY45zSgKPD5py/nIOWua4ooA==
X-Received: by 2002:a17:906:6a0b:b0:93e:8791:7d8e with SMTP id
 qw11-20020a1709066a0b00b0093e87917d8emr2871064ejc.2.1680616584374; 
 Tue, 04 Apr 2023 06:56:24 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 l22-20020a1709061c5600b00927f6c799e6sm5975252ejg.132.2023.04.04.06.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:56:23 -0700 (PDT)
Date: Tue, 4 Apr 2023 15:56:22 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org, jusual@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
Message-ID: <20230404155622.4525ee14@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230404084019-mutt-send-email-mst@kernel.org>
References: <20230403161618.1344414-1-imammedo@redhat.com>
 <20230403131833-mutt-send-email-mst@kernel.org>
 <qdzi3oh24okot23eccd6d453wehyagbxhldoss4bup2whfohfo@hkzr2p3fq6na>
 <1de406aa-338f-277a-96a2-dcf6afbc8aec@redhat.com>
 <20230404084019-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Tue, 4 Apr 2023 08:40:45 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Apr 04, 2023 at 01:06:38PM +0530, Ani Sinha wrote:
> > 
> > 
> > On Tue, 4 Apr 2023, Gerd Hoffmann wrote:
> >   
> > >   Hi,
> > >  
> > > > > Allowing pending delete expire brings ACPI PCI hotplug on par
> > > > > with native PCIe unplug behavior [1] which in its turn refers
> > > > > back to ACPI PCI hotplug ability to repeat unplug requests.  
> > >  
> > > > A bit concerned about how this interacts with failover,
> > > > and 5sec is a lot of time that I hoped we'd avoid with acpi.
> > > > Any better ideas of catching such misbehaving guests?  
> > >
> > > The 5sec are coming from the pcie spec: The hot-unplug request can be
> > > canceled within 5 seconds by pressing the button again. The problem here
> > > is that both hotplug and hot-unplug use the same signaling path, so we
> > > really have to wait the 5 seconds to avoid the OS mis-interpreting the
> > > button press as 'cancel' event.
> > >
> > > ACPI hotplug hasn't this problem.  A unplug request is a unplug request,  
> > 
> > For ACPI case, I think all we want is to make sure that the first unplug
> > event to not stick forever. A non-zero but small delay would make sure
> > that the first
> > unplug event would get cleared after that interval and subsequent unplug
> > events will get registered without that error.
> >   
> > > period.  And it can't be canceled.  So it should be possible to use a
> > > shorter period.  Possibly even no delay at all.
> > >
> > > take care,
> > >   Gerd
> > >
> > >  
> 
> 
> But why do we want a delay at all? for acpi you can resend
> the interrupt as many times as you like.

yep, we can. It makes possible for user to cause limited
"interrupt storm". That also leads to device_del abuse [1]

1) https://www.mail-archive.com/qemu-devel@nongnu.org/msg952738.html


