Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E1F2FCEB5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 12:04:54 +0100 (CET)
Received: from localhost ([::1]:41714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2BID-0004L5-Fd
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 06:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l2BGt-0003ks-TJ
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 06:03:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l2BGr-0004Wt-Gt
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 06:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611140607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nPALbij9u3aOqz01KjjkE07CiDDnfwtI0VlgORvugns=;
 b=h929tsXVf10OYU9xFGob7pnk/4DPazTLGMf9tcuu88bSTYEkw2th3gEl8aQAbWjY2ijIar
 W4QM0xYrMrnGk4uQxE7z3xWYRSzJ4Pa/xPEvPde7DENGqM55Ro+yI4H48qhVSSZX99h/DC
 yDLnFthi0sK/gjmQpFCt7Fzbk3hr+7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-WTyb8GeNM3ix_9bh0-9MZw-1; Wed, 20 Jan 2021 06:03:25 -0500
X-MC-Unique: WTyb8GeNM3ix_9bh0-9MZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C81F806662;
 Wed, 20 Jan 2021 11:03:24 +0000 (UTC)
Received: from work-vm (ovpn-115-106.ams2.redhat.com [10.36.115.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1276271CB0;
 Wed, 20 Jan 2021 11:03:16 +0000 (UTC)
Date: Wed, 20 Jan 2021 11:03:14 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v2 01/20] migration/vmstate: Restrict vmstate_dummy
 to user-mode
Message-ID: <20210120110314.GD2930@work-vm>
References: <20210117192446.23753-1-f4bug@amsat.org>
 <20210117192446.23753-2-f4bug@amsat.org>
 <CAFEAcA_358tUe-O9Yb94p=xDXXLTNM8EoQRvwMKEY_bmSTfzJQ@mail.gmail.com>
 <004525a7-e8bb-9316-6ad5-ba5765471639@amsat.org>
MIME-Version: 1.0
In-Reply-To: <004525a7-e8bb-9316-6ad5-ba5765471639@amsat.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (f4bug@amsat.org) wrote:
> On 1/19/21 2:50 PM, Peter Maydell wrote:
> > On Sun, 17 Jan 2021 at 19:24, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> >>
> >> 'vmstate_dummy' is special and only used for user-mode. Rename
> >> it to something more specific.
> >> It was introduced restricted to user-mode in commit c71c3e99b8
> >> ("Add a vmstate_dummy struct for CONFIG_USER_ONLY") but this
> >> restriction was later removed in commit 6afc14e92ac ("migration:
> >> Fix warning caused by missing declaration of vmstate_dummy").
> >> Avoid the missing declaration warning by adding a stub for the
> >> symbol, and restore the #ifdef'ry.
> > 
> > So what is the actual use of vmstate_dummy ? I had a grep
> > through and as far as I can see the points where vmstate_cpu_common
> > is used are all in softmmu-only code.
> 
> No clue, maybe simply remnant from unfinished work?

Not sure either; but it looks like Paolo fixed some of it up in d9f24bf5724
a few months ago; prior to that cpu_exec_unrealizefn used it even on a
USER_ONLY build.

Dave

> > I tried this patch
> > and QEMU seems to compile OK:
> > 
> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index 140fa32a5e3..a827417a4d8 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> > @@ -1131,8 +1131,6 @@ bool target_words_bigendian(void);
> > 
> >  #ifdef CONFIG_SOFTMMU
> >  extern const VMStateDescription vmstate_cpu_common;
> > -#else
> > -#define vmstate_cpu_common vmstate_dummy
> >  #endif
> > 
> >  #define VMSTATE_CPU() {                                                     \
> 
> Great! Maybe even restricting VMSTATE_CPU() to softmmu-only:
> 
> -- >8 --
> @@ -1131,9 +1131,6 @@ bool target_words_bigendian(void);
> 
>  #ifdef CONFIG_SOFTMMU
>  extern const VMStateDescription vmstate_cpu_common;
> -#else
> -#define vmstate_cpu_common vmstate_dummy
> -#endif
> 
>  #define VMSTATE_CPU() {
>      \
>      .name = "parent_obj",
>      \
> @@ -1142,6 +1139,7 @@ extern const VMStateDescription vmstate_cpu_common;
>      .flags = VMS_STRUCT,
>      \
>      .offset = 0,
>      \
>  }
> +#endif
> 
>  #endif /* NEED_CPU_H */
> ---
> 
> I'll wait if David/Juan have any comment, else respin based
> on your patch.
> 
> Thanks,
> 
> Phil.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


