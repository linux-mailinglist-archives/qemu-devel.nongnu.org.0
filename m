Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAA3662955
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 16:07:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEtij-0005dB-7M; Mon, 09 Jan 2023 10:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEtie-0005aS-Ty
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 10:05:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEtid-0004nB-0H
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 10:05:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673276743;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CDdCqu1yle6f5NoNmhvVbJnLg923QayWCBQuVAG2z44=;
 b=jFncORPFGluumIEU8P1JX6EJNBPHOe46R8m8PK10jsM0x4woFbWgiW3w1GLZQgp+VlpgCs
 oAOAiXWhvYvPrO82tE/YuJKPQDykowspLvPYBapaI4oskADhsjzJiSHzPpjSVKcpTJIpFE
 uJOw1o+PMRtEipRLmvJXYj3LFHbFFhg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-alfL5uYRN2Obwp6RIUvb7g-1; Mon, 09 Jan 2023 10:05:42 -0500
X-MC-Unique: alfL5uYRN2Obwp6RIUvb7g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EC6D1991C6C;
 Mon,  9 Jan 2023 15:05:41 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76825492B00;
 Mon,  9 Jan 2023 15:05:38 +0000 (UTC)
Date: Mon, 9 Jan 2023 15:05:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH 0/4] Qemu SEV reduced-phys-bits fixes
Message-ID: <Y7wtPwK3m/K0bco4@redhat.com>
References: <cover.1664550870.git.thomas.lendacky@amd.com>
 <82c766a6-fe48-fe01-a3ec-5adb320fed75@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <82c766a6-fe48-fe01-a3ec-5adb320fed75@amd.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Jan 04, 2023 at 12:13:09PM -0600, Tom Lendacky wrote:
> On 9/30/22 10:14, Tom Lendacky wrote:
> > This patch series fixes up and tries to remove some confusion around the
> > SEV reduced-phys-bits parameter.
> > 
> > Based on the "AMD64 Architecture Programmer's Manual Volume 2: System
> > Programming", section "15.34.6 Page Table Support" [1], a guest should
> > only ever see a maximum of 1 bit of physical address space reduction.
> > 
> > - Update the documentation, to change the default value from 5 to 1.
> > - Update the validation of the parameter to ensure the parameter value
> >    is within the range of the CPUID field that it is reported in. To allow
> >    for backwards compatibility, especially to support the previously
> >    documented value of 5, allow the full range of values from 1 to 63
> >    (0 was never allowed).
> > - Update the setting of CPUID 0x8000001F_EBX to limit the values to the
> >    field width that they are setting as an additional safeguard.
> > 
> > [1] https://www.amd.com/system/files/TechDocs/24593.pdf
> 
> Ping, any concerns with this series?

Looks like you got postive review from David in Oct, so this
needs one of the x86 maintainers to queue the series.

> > Tom Lendacky (4):
> >    qapi, i386/sev: Change the reduced-phys-bits value from 5 to 1
> >    qemu-options.hx: Update the reduced-phys-bits documentation
> >    i386/sev: Update checks and information related to reduced-phys-bits
> >    i386/cpu: Update how the EBX register of CPUID 0x8000001F is set
> > 
> >   qapi/misc-target.json |  2 +-
> >   qemu-options.hx       |  4 ++--
> >   target/i386/cpu.c     |  4 ++--
> >   target/i386/sev.c     | 17 ++++++++++++++---
> >   4 files changed, 19 insertions(+), 8 deletions(-)
> > 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


