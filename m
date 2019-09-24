Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6823ABD39E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 22:32:55 +0200 (CEST)
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCrUT-0007kQ-Ml
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 16:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49520)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iCrH1-0002iS-Lp
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:19:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iCrH0-0007es-Pj
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:18:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49354)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iCrH0-0007ei-Kk
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:18:58 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E74C630820C9;
 Tue, 24 Sep 2019 20:18:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D5C319C58;
 Tue, 24 Sep 2019 20:18:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E51C7113864E; Tue, 24 Sep 2019 22:18:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 03/25] qapi: New QAPISourceInfo, replacing dict
References: <20190924132830.15835-1-armbru@redhat.com>
 <20190924132830.15835-4-armbru@redhat.com>
 <4ff086cb-7c96-a25a-be19-d78af40afd9b@redhat.com>
Date: Tue, 24 Sep 2019 22:18:53 +0200
In-Reply-To: <4ff086cb-7c96-a25a-be19-d78af40afd9b@redhat.com> (Eric Blake's
 message of "Tue, 24 Sep 2019 09:51:40 -0500")
Message-ID: <87ftkla1n6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 24 Sep 2019 20:18:57 +0000 (UTC)
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
Cc: mdroth@linux.vnet.ibm.com, marcandre.lureau@redhat.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 9/24/19 8:28 AM, Markus Armbruster wrote:
>> We track source locations with a dict of the form
>> 
>>     {'file': FNAME, 'line': LINENO, parent': PARENT}
>
> Missing ' on parent
>
>> 
>> where PARENT is None for the main file, and the include directive's
>> source location for included files.
>> 
>> This is servicable enough, but the next commit will add information,
>
> serviceable

Will fix both.

>> and that's going to come out cleaner if we turn this into a class.  So
>> do that.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  scripts/qapi/common.py | 69 +++++++++++++++++++++++++-----------------
>>  1 file changed, 41 insertions(+), 28 deletions(-)
>> 
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!

