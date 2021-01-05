Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EBA2EB155
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:26:24 +0100 (CET)
Received: from localhost ([::1]:45706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwq6B-0000xK-Bh
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kwpiv-0007qY-3R
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:02:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kwpis-0002ep-C1
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:02:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609866136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g72Q7sZXJwKTMIAaBAz5/XGN3hBZke+KdshVEZc5VXg=;
 b=RPh3Vie5E4gAinYucmzjo8YakfRiN9CXnHO6biZViP29y57fohRW9iSna+2/+n8cPrr3WH
 Gb4N2Yi+wP7xO1pJbOxJ+rQsGty3l6IGLGSqO5pOlWX0d6gRFR8eDCVucYV1gu86ofkGtw
 CHTQhBF5BNE0jF/XQusLzkSObaK5clY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-De5A3mubMNKNSiC8tc2Qxw-1; Tue, 05 Jan 2021 12:02:15 -0500
X-MC-Unique: De5A3mubMNKNSiC8tc2Qxw-1
Received: by mail-ed1-f70.google.com with SMTP id a9so232697edy.8
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:02:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=g72Q7sZXJwKTMIAaBAz5/XGN3hBZke+KdshVEZc5VXg=;
 b=sJLh9Kqh1cRAA3CAbm8yA7zL1ypsmfDiYKCf41QhNzWk7V34DVdB89G6vg0xFq3ju0
 Wh3ejqXvH8JgXpSHTBXCL3mvNOwSqaXHnhgiTIFMYHDav5CvqPLGON6/7Pt0luB0y++O
 yKzhlX6bE0Iq/f/0H/iGPesG0QGC0XQiozklARtNT8attwqzuGsWr4OX6t2GysrhQctY
 VXCqXt6wmeySudI9sYISW/Ltuy/CHykcUKbH0Sb6EjkYKVerxlcg99dxe99q57Ze8oOC
 6rmAJM9wFIkjG5KPJtFFts8jKbd54Dv7b6QhA5qyaLmOaEXuY2ETTPcPeK9SeQ7ZoMFR
 Yu0g==
X-Gm-Message-State: AOAM531kZh6GvZAbg1Ps0rMunyudAyWCUaQ7uLIa9/u9d7smoRQ0bSey
 436ngppHEqc+ImV7mFrhjy3psL7LXBqSDxGOG0UMkGpnFxKhPykyhQektTpFv+aCcj3wkCp3+Kc
 +2CB9OEk+J4LBoIxnLWWw/6SVOIpHmQZrl7qjDTGH0Nk0YFAtR0VdRsn9U1hjY2H8OwA=
X-Received: by 2002:a50:f61b:: with SMTP id c27mr693633edn.61.1609866134104;
 Tue, 05 Jan 2021 09:02:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcdyeBA0SqFI0ygzTtDrlXgMo4s9sXg6yeGYhnMPDNt8aVbS7UmDTpQ7AipqQNMC4UTbQDPA==
X-Received: by 2002:a50:f61b:: with SMTP id c27mr693594edn.61.1609866133866;
 Tue, 05 Jan 2021 09:02:13 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id cb14sm89510ejb.105.2021.01.05.09.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:02:13 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 5/5] i386: provide simple 'hyperv=on' option to x86
 machine types
In-Reply-To: <20210105173141.2fafe61b@redhat.com>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
 <20201119103221.1665171-6-vkuznets@redhat.com>
 <20201216205202.GJ3140057@habkost.net>
 <20201218181340.5e398280@redhat.com> <87r1n0j20n.fsf@vitty.brq.redhat.com>
 <20210104182906.GD18467@habkost.net> <20210105003650.71f39045@redhat.com>
 <20210105143431.GL18467@habkost.net> <20210105173141.2fafe61b@redhat.com>
Date: Tue, 05 Jan 2021 18:02:12 +0100
Message-ID: <877doriagb.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

...
>
> i was talking about user interface here, i.e.:
>  (QMP) create_machine(hyperv=on)
>  (QMP) device_add(cpu, hv_foo=x)
> vs:
>  (QMP) device_add(cpu, hyperv_defaults=on,=onhv_foo=x)
>
> i.e. in the later case cpu specific options are consolidate within device stanza
> and mgmt doesn't need to be aware and split cpu config in to steps.
>

FWIW,

'hv_foo=x' only makes sense if 'x' == 'off' as currently we enable all
existing enlightenments. Also, this requires upper layer tools to know
something about 'hv_foo' (to be able to disable it) and AFAICT layers
above libvirt don't actually want to know such low-level details.
Don't get me wrong, I'm not against 'hv_defaults=on', just trying to
give the perspective so we won't need to change the interface again
anytime soon.

-- 
Vitaly


