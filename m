Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D5CD91FA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 15:06:45 +0200 (CEST)
Received: from localhost ([::1]:42502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKj0m-0005fZ-GW
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 09:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54127)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iKizs-0005B3-Nb
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 09:05:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iKizq-0005Ay-HA
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 09:05:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61405)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iKizq-0005AJ-Be
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 09:05:46 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 281673175283;
 Wed, 16 Oct 2019 13:05:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-113.ams2.redhat.com
 [10.36.117.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8860860605;
 Wed, 16 Oct 2019 13:05:39 +0000 (UTC)
Date: Wed, 16 Oct 2019 15:05:37 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 6/7] qapi: Split up scripts/qapi/common.py
Message-ID: <20191016130537.GB4940@localhost.localdomain>
References: <20191001191514.11208-1-armbru@redhat.com>
 <20191001191514.11208-7-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001191514.11208-7-armbru@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 16 Oct 2019 13:05:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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

Am 01.10.2019 um 21:15 hat Markus Armbruster geschrieben:
> The QAPI code generator clocks in at some 3100 SLOC in 8 source files.
> Almost 60% of the code is in qapi/common.py.  Split it into more
> focused modules:
> 
> * Move QAPISchemaPragma and QAPISourceInfo to qapi/source.py.
> 
> * Move QAPIError and its sub-classes to qapi/error.py.
> 
> * Move QAPISchemaParser and QAPIDoc to parser.py.  Use the opportunity
>   to put QAPISchemaParser first.
> 
> * Move check_expr() & friends to qapi/expr.py.  Use the opportunity to
>   put the code into a more sensible order.
> 
> * Move QAPISchema & friends to qapi/schema.py
> 
> * Move QAPIGen and its sub-classes, ifcontext,
>   QAPISchemaModularCVisitor, and QAPISchemaModularCVisitor to qapi/gen.py
> 
> A number of helper functions remain in qapi/common.py.  I considered
> moving the code generator helpers to qapi/gen.py, but decided not to.
> Perhaps we should rewrite them as methods of QAPIGen some day.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

This patch seems to forget to change qapi-py in the Makefile, so that
when you change one of the new source files, the generator won't run
again.

Kevin

