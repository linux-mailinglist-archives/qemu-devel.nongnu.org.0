Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BDDAA3DF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 15:06:12 +0200 (CEST)
Received: from localhost ([::1]:45808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5rSl-0006cQ-30
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 09:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42353)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i5rRp-00065B-2G
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 09:05:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i5rRk-00049p-9C
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 09:05:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49436)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i5rRg-00048M-PC; Thu, 05 Sep 2019 09:05:04 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BC0AC1DA0;
 Thu,  5 Sep 2019 13:05:03 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-80.ams2.redhat.com
 [10.36.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 833EF6061E;
 Thu,  5 Sep 2019 13:05:02 +0000 (UTC)
Date: Thu, 5 Sep 2019 15:05:01 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190905130501.GA4911@localhost.localdomain>
References: <20190809161407.11920-1-mreitz@redhat.com>
 <20190809161407.11920-10-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809161407.11920-10-mreitz@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Thu, 05 Sep 2019 13:05:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6 09/42] block: Include filters when
 freezing backing chain
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.08.2019 um 18:13 hat Max Reitz geschrieben:
> In order to make filters work in backing chains, the associated
> functions must be able to deal with them and freeze all filter links, be
> they COW or R/W filter links.
> 
> In the process, rename these functions to reflect that they now act on
> generalized chains of filter nodes instead of backing chains alone.

I don't think this is a good idea. The functions are still following the
backing chain. A generic "chain" could mean following the bs->file links
or any other children, so the new name is confusing because it doesn't
really tell you any more what the function does. I'd prefer the name to
stay specific.

> While at it, add some comments that note which functions require their
> caller to ensure that a given child link is not frozen, and how the
> callers do so.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Kevin

