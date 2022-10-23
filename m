Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89B4609531
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 19:34:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omeFu-00048f-60
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 12:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lk@c--e.de>)
 id 1omc6J-0001wM-Jj; Sun, 23 Oct 2022 10:37:19 -0400
Received: from cae.in-ulm.de ([217.10.14.231])
 by eggs.gnu.org with esmtp (Exim 4.90_1) (envelope-from <lk@c--e.de>)
 id 1omc6H-00079W-8F; Sun, 23 Oct 2022 10:37:19 -0400
Received: by cae.in-ulm.de (Postfix, from userid 1000)
 id 089E8140241; Sun, 23 Oct 2022 16:37:04 +0200 (CEST)
Date: Sun, 23 Oct 2022 16:37:03 +0200
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Eric DeVolder <eric.devolder@oracle.com>,
 qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH] hw/acpi/erst.c: Fix memset argument order
Message-ID: <Y1VRj0Eu4iGp0smF@cae.in-ulm.de>
References: <20221019191522.1004804-1-lk@c--e.de>
 <20221021190524.433s2uh6i5md74gf@mozz.bu.edu>
 <20221022053727.flc3bq3opyjimwgb@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221022053727.flc3bq3opyjimwgb@mozz.bu.edu>
Received-SPF: none client-ip=217.10.14.231; envelope-from=lk@c--e.de;
 helo=cae.in-ulm.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Sat, Oct 22, 2022 at 01:37:27AM -0400, Alexander Bulekov wrote:
> On 221021 1505, Alexander Bulekov wrote:
> > On 221019 2115, Christian A. Ehrhardt wrote:
> > > Fix memset argument order: The second argument is
> > > the value, the length goes last.
> > > 
> > > Cc: Eric DeVolder <eric.devolder@oracle.com>
> > > Cc: qemu-stable@nongnu.org
> > > Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
> > > Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
> > > ---
> > >  hw/acpi/erst.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> > > index df856b2669..26391f93ca 100644
> > > --- a/hw/acpi/erst.c
> > > +++ b/hw/acpi/erst.c
> > > @@ -716,7 +716,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
> > >      if (nvram) {
> > >          /* Write the record into the slot */
> > >          memcpy(nvram, exchange, record_length);
> > > -        memset(nvram + record_length, exchange_length - record_length, 0xFF);
> > > +        memset(nvram + record_length, 0xFF, exchange_length - record_length);
> > 
> > Hi, 
> > I'm running the fuzzer over this code. So far, it hasn't complained
> > about this particular memset call, but it has crashed on the memcpy,
> > directly preceding it. I think the record_length checks might be
> > insufficient. I made an issue/reproducer:
> > https://gitlab.com/qemu-project/qemu/-/issues/1268
> > 
> > In that particular case, record_length is ffffff00 and passes the
> > checks. I'll keep an eye on the fuzzer to see if it will be able to
> > crash the memset.
> 
> Here's a testcase for the memset issue:

Looks like this check in {read,write}_erst_record():
|   if ((s->record_offset + record_length) > exchange_length) {
|       return STATUS_FAILED;
|   }

has an integer overrun and should be re-written as:
|   if (record_length > exchange_length - s->record_offset) {
|       return STATUS_FAILED;
|   }

       regards    Christian


