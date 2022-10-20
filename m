Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6E360694C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 22:04:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olbm2-0002q6-IX
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 16:04:14 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olbhC-00075J-4B
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 15:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lk@c--e.de>)
 id 1olbh0-00071H-JZ; Thu, 20 Oct 2022 15:59:04 -0400
Received: from cae.in-ulm.de ([217.10.14.231])
 by eggs.gnu.org with esmtp (Exim 4.90_1) (envelope-from <lk@c--e.de>)
 id 1olbgy-0005k1-Aj; Thu, 20 Oct 2022 15:59:01 -0400
Received: by cae.in-ulm.de (Postfix, from userid 1000)
 id 4D03B1402D3; Thu, 20 Oct 2022 21:58:47 +0200 (CEST)
Date: Thu, 20 Oct 2022 21:58:47 +0200
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric DeVolder <eric.devolder@oracle.com>,
 qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/acpi/erst.c: Fix memset argument order
Message-ID: <Y1God1/x+A71ID7+@cae.in-ulm.de>
References: <20221019191522.1004804-1-lk@c--e.de> <87r0z3dnsn.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0z3dnsn.fsf@pond.sub.org>
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


Hi Markus,

On Thu, Oct 20, 2022 at 08:14:32AM +0200, Markus Armbruster wrote:
> "Christian A. Ehrhardt" <lk@c--e.de> writes:
> 
> > Fix memset argument order: The second argument is
> > the value, the length goes last.
> 
> Impact of the bug?

Well, this is a memory error, i.e. the potential impact is
anything from silent data corruption to arbitrary code execution.
Phillipe described this accurately as "Ouch".

> > Cc: Eric DeVolder <eric.devolder@oracle.com>
> > Cc: qemu-stable@nongnu.org
> > Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
> > Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
> >          /* Write the record into the slot */

[ ... ]

> This first copies @record_length bytes into the exchange buffer.
> 
> > -        memset(nvram + record_length, exchange_length - record_length, 0xFF);
> > +        memset(nvram + record_length, 0xFF, exchange_length - record_length);
> 
> The new code pads it to the full exchange buffer size.
> 
> The old code writes 0xFF bytes.
> 
> If 0xFF < exchange_length - record_length, the padding doesn't extend to
> the end of the buffer.  Impact?

Incorrect and insufficient data is written.

> If 0xFF > exchange_length - record_length, we write beyond the end of
> the buffer.  Impact?

Buffer overrun with well known potentially catastrophic consequences.
Additionally, incorrect data is used for the padding.

      regards    Christian


