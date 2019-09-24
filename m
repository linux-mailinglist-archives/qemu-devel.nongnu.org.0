Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA280BD3AA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 22:36:38 +0200 (CEST)
Received: from localhost ([::1]:50824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCrY5-0003v3-MM
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 16:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49412)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iCrGe-0002K3-Hh
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:18:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iCrGc-0007Z2-G3
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:18:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39104)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iCrGc-0007Yl-B3
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:18:34 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A520930013A1;
 Tue, 24 Sep 2019 20:18:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADC105B69A;
 Tue, 24 Sep 2019 20:18:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 12349113864E; Tue, 24 Sep 2019 22:18:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 01/25] qapi: Tighten QAPISchemaFOO.check() assertions
References: <20190924132830.15835-1-armbru@redhat.com>
 <20190924132830.15835-2-armbru@redhat.com>
 <d71d1b04-42dc-9d9b-d37d-53db2ec867b8@redhat.com>
Date: Tue, 24 Sep 2019 22:18:29 +0200
In-Reply-To: <d71d1b04-42dc-9d9b-d37d-53db2ec867b8@redhat.com> (Eric Blake's
 message of "Tue, 24 Sep 2019 09:39:31 -0500")
Message-ID: <87k19xa1nu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 24 Sep 2019 20:18:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 9/24/19 8:28 AM, Markus Armbruster wrote:
>> When we introduced the QAPISchema intermediate representation (commit
>> ac88219a6c7), we took a shortcut: we left check_exprs() & friends
>> alone instead of moving semantic checks into the
>> QAPISchemaFOO.check().  check_exprs() still checks and reports errors,
>> and the .check() assert check_exprs() did the job.  There are a few
>> gaps, though.
>> 
>> QAPISchemaArrayType.check() neglects to assert the element type is not
>> an array.  Add the assertion.
>> 
>> QAPISchemaObjectTypeVariants.check() neglects to assert the tag member
>> is not optional.  Add the assertion.
>> 
>> It neglects to assert the tag member is not conditional.  Add the
>> assertion.
>> 
>> It neglects to assert we actually have variants.  Add the assertion.
>> 
>> It asserts the variants are object types, but neglects to assert they
>> don't have variants.  Tighten the assertion.
>> 
>> QAPISchemaObjectTypeVariants.check_clash() has the same issue.
>> However, it can run only after .check().  Delete the assertion instead
>> of tightening it.
>> 
>> QAPISchemaAlternateType.check() neglects to assert the branch types
>> don't conflict.  Fixing that isn't trivial, so add just a TODO comment
>> for now.  It'll be resolved later in this series.
>
> I'm guessing you found these by deleting check_exprs() and seeing what
> failed due to inadequate .check()

The first two or three I found by staring at the code.  The remainder I
found when I moved checks from check_exprs() to .check() [PATCH 16]: any
check that doesn't replace an assertion means the assertion was missing.

>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  scripts/qapi/common.py | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!

