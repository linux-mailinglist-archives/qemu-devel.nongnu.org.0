Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD46B21A8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 16:15:11 +0200 (CEST)
Received: from localhost ([::1]:44464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8mLu-0001jj-A7
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 10:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43882)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1i8mKx-0001Jl-6e
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 10:14:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1i8mKw-0003Rt-Af
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 10:14:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56938)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1i8mKw-0003Rd-5o
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 10:14:10 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 550DC3082E55;
 Fri, 13 Sep 2019 14:14:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A71415C207;
 Fri, 13 Sep 2019 14:14:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 394BE113865F; Fri, 13 Sep 2019 16:14:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <20190910063724.28470-1-armbru@redhat.com>
 <20190910063724.28470-2-armbru@redhat.com>
 <c9680a3e-317e-0d5c-4908-22d56bea27c9@redhat.com>
Date: Fri, 13 Sep 2019 16:14:05 +0200
In-Reply-To: <c9680a3e-317e-0d5c-4908-22d56bea27c9@redhat.com> (Eric Blake's
 message of "Tue, 10 Sep 2019 08:41:24 -0500")
Message-ID: <87tv9g9tci.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 13 Sep 2019 14:14:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 01/16] scripts/git.orderfile: Match QAPI
 schema more precisely
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

> On 9/10/19 1:37 AM, Markus Armbruster wrote:
>> Pattern *.json also matches the tests/qapi-schema/*.json.  Separates
>> them from the tests/qapi-schema/*.{err,exit,out} in diffs.  I hate
>> that.  Change the pattern to match just the "real" QAPI schemata.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  scripts/git.orderfile | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>
> Should we ever do a mass rename of *.json into *.qapi (since our qapi
> files are NOT quite JSON)?  But that doesn't change the viability of
> this patch.

Naming them .json is misleading.  We're closer to Python than to JSON.
Many .json files ask Emacs for Python mode, because that works better
than JavaScript mode.

Options:

* Rename to .qapi.  The files that don't ask for Python mode now get
  Fundamental mode instead of JavaScript mode.  Minor regression.

* Rename to .py, and drop the lines asking for Python mode.  Still
  misleading, but less so.

* Likewise, and tweak the syntax so it's actually Python.

* Switch to some less egregiously ill-suited syntax.  TOML, perhaps.

* Do nothing.

Right now, I'd prefer to do nothing.

