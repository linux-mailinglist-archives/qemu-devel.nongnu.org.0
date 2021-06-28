Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE093B69F6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 23:02:17 +0200 (CEST)
Received: from localhost ([::1]:48680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxyOW-0005Ul-Ix
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 17:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lxyN9-0004mQ-Km
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:00:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lxyN5-0004Sf-QZ
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624914046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yxB/k98ah63MY40ISgMKhHV4eoHD5tPjQE2VQdgsj+Q=;
 b=c12qSM48VqVJ3Ogo98VX45ph8l5d7EeQcUoCOqxT2xPD24uqlNBZkPFl57gxo4muP6xtk4
 Ul7joutWqnG98iFEwXcR32fnWVhF8TQ86qRz3IycWBsPkA/lRwE3eFhyXV2OuIgbtjF/Kn
 ctFwcUGGjEb9kueFqxTnnOHv4GmpJoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-xPKVGHMDOd-frilEx60fhw-1; Mon, 28 Jun 2021 17:00:12 -0400
X-MC-Unique: xPKVGHMDOd-frilEx60fhw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E65D192AB7E;
 Mon, 28 Jun 2021 21:00:11 +0000 (UTC)
Received: from redhat.com (ovpn-113-39.phx2.redhat.com [10.3.113.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE69710016FE;
 Mon, 28 Jun 2021 21:00:10 +0000 (UTC)
Date: Mon, 28 Jun 2021 16:00:09 -0500
From: Eric Blake <eblake@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v7 14/16] docs/devel/testing: add -valgrind option to the
 debug section of QEMU iotests
Message-ID: <20210628210009.ntb7l7xy7rhwplsd@redhat.com>
References: <20210628123150.56567-1-eesposit@redhat.com>
 <20210628123150.56567-15-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210628123150.56567-15-eesposit@redhat.com>
User-Agent: NeoMutt/20210205-557-802118
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 02:31:48PM +0200, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/devel/testing.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 8b24e6fb47..fa85592a38 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -240,6 +240,13 @@ a failing test:
>    If the ``-gdb`` option is not used, ``$GDB_OPTIONS`` is ignored,
>    regardless on whether it is set or not.
>  
> +* ``-valgrind`` attaches a valgrind instance to QEMU. If it detects
> +  warnings, it will print and save the log in
> +  ``$TEST_DIR/<valgrind_pid>.valgrind``.
> +  The final command line will be ``valgrind --log-file=$TEST_DIR/
> +  <valgrind_pid>.valgrind --error-exitcode=99 $QEMU ...``
> +  Note: if used together with ``-gdb``, this command will be ignored.

Ignored? Or did the previous patch make it an error to try and use
both at once?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


