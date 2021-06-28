Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8237D3B69F5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 23:00:13 +0200 (CEST)
Received: from localhost ([::1]:46308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxyMW-0003ld-78
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 17:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lxyLZ-000360-Jx
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:59:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lxyLX-0003LO-Vw
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:59:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624913951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bd+4/G04Q1eUGkUnBcSOU1IWTAgnY/hEy8Tk7kvsU2s=;
 b=WtH30hMn5GWBTPceEi2LgadGnpK4qjDd030wkzyT3SQnzsB+Vv/4qiod9+fifJ2yQ+4jtE
 E3GuvJWWsoc63VP5NIAp3f9YXUqixFgM3XAHlf1kA56r8ijxGwdIDGBId99YXMj5rHSXmP
 L5kzJjfZFym9z/AIiePlXvQ9kPZDroU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-facFLhfgMJO1n39saYJ_Cg-1; Mon, 28 Jun 2021 16:59:08 -0400
X-MC-Unique: facFLhfgMJO1n39saYJ_Cg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF388804141;
 Mon, 28 Jun 2021 20:59:06 +0000 (UTC)
Received: from redhat.com (ovpn-113-39.phx2.redhat.com [10.3.113.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DC1F60843;
 Mon, 28 Jun 2021 20:59:06 +0000 (UTC)
Date: Mon, 28 Jun 2021 15:59:04 -0500
From: Eric Blake <eblake@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v7 13/16] qemu-iotests: insert valgrind command line as
 wrapper for qemu binary
Message-ID: <20210628205904.zffp23qy3vkmf25h@redhat.com>
References: <20210628123150.56567-1-eesposit@redhat.com>
 <20210628123150.56567-14-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210628123150.56567-14-eesposit@redhat.com>
User-Agent: NeoMutt/20210205-557-802118
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 02:31:47PM +0200, Emanuele Giuseppe Esposito wrote:
> If -gdb and -valgrind are both defined, return an error.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/iotests.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 85d8c0abbb..7aa6707032 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -591,7 +591,11 @@ class VM(qtest.QEMUQtestMachine):
>      def __init__(self, path_suffix=''):
>          name = "qemu%s-%d" % (path_suffix, os.getpid())
>          timer = 15.0 if not (qemu_gdb or qemu_valgrind) else None
> -        super().__init__(qemu_prog, qemu_opts, wrapper=qemu_gdb,
> +        if qemu_gdb and qemu_valgrind:
> +            sys.stderr.write('Either use gdb or valgrind, not together\n')

Perhaps:

'gdb and valgrind are mutually exclusive'

gets the same message across in a more idiomatic manner.

(It _is_ possible to use both gdb and valgrind at the same time - but
that tends to be for developers of one of those two programs: either
using gdb to debug how valgrind is working, or using valgrind to check
gdb itself for bad memory behavior. You're correct that you can't
expect sane results by using both together on a program under test)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


