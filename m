Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FDFD3E6E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 13:28:00 +0200 (CEST)
Received: from localhost ([::1]:48672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIt5T-00068Z-1t
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 07:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44203)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iIt3D-0004Pj-Sv
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 07:25:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iIt3C-00056S-Qx
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 07:25:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51950)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iIt3A-00054N-Im; Fri, 11 Oct 2019 07:25:36 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AC7C518CB8EB;
 Fri, 11 Oct 2019 11:25:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.118.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1EFB5DA2C;
 Fri, 11 Oct 2019 11:25:31 +0000 (UTC)
Date: Fri, 11 Oct 2019 13:25:30 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v2 2/4] qemu-iotests: remove forceful execution success
 from library files
Message-ID: <20191011112530.GE5158@localhost.localdomain>
References: <20191009194740.8079-1-crosa@redhat.com>
 <20191009194740.8079-3-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009194740.8079-3-crosa@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Fri, 11 Oct 2019 11:25:35 +0000 (UTC)
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
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.10.2019 um 21:47 hat Cleber Rosa geschrieben:
> Should not be necessary on files that are not executed standalone.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Looks fine for common.filter and common.rc, nobody ever checks their
return value.

common.config is included like this:

    if ! . "$source_iotests/common.config"
    then
        _init_error "failed to source common.config"
    fi

So as long as we keep this, don't we want to make sure that it returns
success?

Of course, we never really want to return an error from common.config,
so instead of keeping the final 'true' statement, we might consider
changing its inclusion to not check for errors. The case that
potentially changes is when common.config doesn't exist or isn't
readable, but this isn't supposed to ever happen anyway.

Kevin

