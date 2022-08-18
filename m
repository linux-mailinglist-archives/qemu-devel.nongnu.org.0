Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372FF5982CF
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 13:59:48 +0200 (CEST)
Received: from localhost ([::1]:47320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOeBf-0007gp-CB
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 07:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oOe8P-000356-Jh
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 07:56:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oOe8M-0001Ih-2D
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 07:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660823780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gqxJ/gXgAcmzs/WgW0EsaX1H9rF7rqCZUBmSsoDHhLc=;
 b=gF6XP6ZWKNh1pmxKDoJ1GCh/aVRiA0C56fdc+QCJFmljJDJukd+79MmgEXHkRserckJGf/
 it7/xecBHXiq+YLdk4P3oei3JlsxMLocdVWt8wUEztGtJ533xuGdJPeinUG9CXOpEkRp5b
 S775ulEIHMeVpr6H0JuB0GnSpjpzR3s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-RNlyEw-dPyaRKiYwfJg0zg-1; Thu, 18 Aug 2022 07:56:17 -0400
X-MC-Unique: RNlyEw-dPyaRKiYwfJg0zg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C2C23C0E230;
 Thu, 18 Aug 2022 11:56:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22BA1492C3B;
 Thu, 18 Aug 2022 11:56:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B9A581800083; Thu, 18 Aug 2022 13:56:14 +0200 (CEST)
Date: Thu, 18 Aug 2022 13:56:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Sergio Lopez <slp@redhat.com>
Subject: Re: [PULL 05/10] x86: disable rng seeding via setup_data
Message-ID: <20220818115614.olhzz6nai5vware5@sirius.home.kraxel.org>
References: <20220817161342.240674-1-mst@redhat.com>
 <20220817161342.240674-6-mst@redhat.com>
 <52a9fe51-335c-c3a1-a4ed-53d5f46b4fd8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52a9fe51-335c-c3a1-a4ed-53d5f46b4fd8@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > index 3a35193ff7..2e5dae9a89 100644
> > --- a/hw/i386/pc_q35.c
> > +++ b/hw/i386/pc_q35.c
> > @@ -376,6 +376,7 @@ static void pc_q35_7_1_machine_options(MachineClass *m)
> >       pc_q35_machine_options(m);
> >       m->alias = "q35";
> >       pcmc->default_cpu_version = 1;
> > +    pcmc->legacy_no_rng_seed = true;
> >   }
> >   DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
> > @@ -386,7 +387,6 @@ static void pc_q35_7_0_machine_options(MachineClass *m)
> >       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> >       pc_q35_7_1_machine_options(m);
> >       m->alias = NULL;
> > -    pcmc->legacy_no_rng_seed = true;
> >       pcmc->enforce_amd_1tb_hole = false;
> >       compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
> >       compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
> 
> Why not just revert the whole patch?

Tried that first.  Plain revert not working, there are conflicts.
So just disabling the code looked simpler and safer to me.

take care,
  Gerd


