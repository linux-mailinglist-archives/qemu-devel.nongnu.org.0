Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F5A253F5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 17:33:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT6lN-00029A-N9
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 11:33:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hT6gr-0007Oy-KZ
	for qemu-devel@nongnu.org; Tue, 21 May 2019 11:28:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hT6gq-0001Lo-ME
	for qemu-devel@nongnu.org; Tue, 21 May 2019 11:28:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38242)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hT6gq-0001L7-Fd
	for qemu-devel@nongnu.org; Tue, 21 May 2019 11:28:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D63E13A6A;
	Tue, 21 May 2019 15:28:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D9FA608C2;
	Tue, 21 May 2019 15:28:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D4EDE1138648; Tue, 21 May 2019 17:28:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <20190521081227.30799-1-richardw.yang@linux.intel.com>
	<c184d4f7-686b-d54a-f969-a05ab965028a@redhat.com>
Date: Tue, 21 May 2019 17:28:27 +0200
In-Reply-To: <c184d4f7-686b-d54a-f969-a05ab965028a@redhat.com> (Eric Blake's
	message of "Tue, 21 May 2019 07:00:12 -0500")
Message-ID: <87lfyzrfms.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 21 May 2019 15:28:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] Makefile: simplify qapi-py definition with
 wildcard
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: berrange@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
	kraxel@redhat.com, philmd@redhat.com,
	Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 5/21/19 3:12 AM, Wei Yang wrote:
>> All the python script in scripts/qapi is used to generate qapi code. Use
>> wildcard to simplify it.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  Makefile | 8 +-------
>>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> I'm not a fan of $(wildcard). It makes your tarball creation
> non-deterministic - if there is a leftover file from development that is
> no longer part of the build, wildcard will still pick it up.  Explicit

Actually, in this case can "only" adds spurious prerequisites.

> lists are better.  I'm inclined to NACK this, but Markus has final say
> since he maintains the qapi generator.

I consider use of $(wildcard) for the purpose of collecting sources a
lazy mistake.

