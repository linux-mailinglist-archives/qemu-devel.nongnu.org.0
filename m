Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A14E13E4D7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 18:11:14 +0100 (CET)
Received: from localhost ([::1]:45564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is8fo-0004yJ-Np
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 12:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55263)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1is8eu-0004FY-5N
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 12:10:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1is8ep-0002lt-Bs
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 12:10:15 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:22993
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1is8ep-0002l8-4N
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 12:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579194609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+YK8qYKOtZxmyeDoFXqKuKE3uRsglNGylMKmX4bJrA=;
 b=UOvjlgQK+Aq6k2CFCcI8PWah6iAoU15gews1KVpCWgCEu7LWvem++xqQYm4fBc4/+BGJpe
 h5oVuVAqS1tnaRHxevDKGJ4KK74h18Wi7UeEKHpJhmsPJq59M6OpH8GqAshtG9BVxIi1EZ
 z/hEbHFI0Hc+GHYgtq5wQR8hXzM8b7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-HELCeKoBP-G5n1O61nEeoA-1; Thu, 16 Jan 2020 12:10:06 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9AB7800EBF;
 Thu, 16 Jan 2020 17:10:05 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E9CB858B4;
 Thu, 16 Jan 2020 17:10:01 +0000 (UTC)
Date: Thu, 16 Jan 2020 18:10:00 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 85/86] numa: make exit() usage consistent
Message-ID: <20200116181000.7ab83443@redhat.com>
In-Reply-To: <a4feb8cd-a105-bcfd-b8c3-27ac5bb0f474@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-86-git-send-email-imammedo@redhat.com>
 <a4feb8cd-a105-bcfd-b8c3-27ac5bb0f474@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: HELCeKoBP-G5n1O61nEeoA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, ehabkost@redhat.com,
 Riku Voipio <riku.voipio@linaro.org>, qemu-devel@nongnu.org,
 David Gibson <dgibson@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Jan 2020 17:43:30 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 15/01/2020 16.07, Igor Mammedov wrote:
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > CC: ehabkost@redhat.com
> > ---
> >  hw/core/numa.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/core/numa.c b/hw/core/numa.c
> > index 3177066..47d5ea1 100644
> > --- a/hw/core/numa.c
> > +++ b/hw/core/numa.c
> > @@ -718,7 +718,7 @@ void numa_complete_configuration(MachineState *ms)
> >          /* Report large node IDs first, to make mistakes easier to spot */
> >          if (!numa_info[i].present) {
> >              error_report("numa: Node ID missing: %d", i);
> > -            exit(1);
> > +            exit(EXIT_FAILURE);
> >          }
> >      }
> >  
> > @@ -759,7 +759,7 @@ void numa_complete_configuration(MachineState *ms)
> >              error_report("total memory for NUMA nodes (0x%" PRIx64 ")"
> >                           " should equal RAM size (0x" RAM_ADDR_FMT ")",
> >                           numa_total, ram_size);
> > -            exit(1);
> > +            exit(EXIT_FAILURE);
> >          }
> >  
> >          if (!numa_uses_legacy_mem()) {  
> 
> Please don't. We've had exit(1) vs. exit(EXIT_FAILURE) discussions in
> the past already, and IIRC there was no clear conclusion which one we
> want to use. There are examples of changes to the numeric value in our
> git history (see d54e4d7659ebecd0e1fa7ffc3e954197e09f8a1f for example),
> and example of the other way round (see 4d1275c24d5d64d22ec4a30ce1b6a0
> for example).
> 
> Your patch series here is already big enough, so I suggest to drop this
> patch from the series. If you want to change this, please suggest an
> update to CODING_STYLE.rst first so that we agree upon one style for
> exit() ... otherwise somebody else might change this back into numeric
> values in a couple of months just because they have a different taste.

Ok, will do.

There are other patches that introduce new exit(EXIT_FAILURE),
is it fine to use that or should I stick to the style used in nearby code?

> 
>  Thomas


