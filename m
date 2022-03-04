Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF1E4CDFC8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 22:28:30 +0100 (CET)
Received: from localhost ([::1]:41516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQFTR-00089p-OT
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 16:28:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQFSV-0007Kl-HJ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 16:27:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQFSO-0001qF-7H
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 16:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646429242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hZKOjIE3S5OMByLXAHM5kZKDvwUbSLQ4kaSAoU4mIik=;
 b=DfVz0pWs6Yp5u2LmTScLPfXCqieGnI+igEM+YOFkijcMtPi4nnJvetH0bdt3WRyIAKrD0Q
 ENwHCPy2Py8WcsbHfP+rIzUjpHQ3oQWcakbGez2BQtTUMcMZpvSnwCACSN5bDepOrUxD/P
 NiNirk4gDlndf4qUJILQDNkeBISl7F4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-NqHkvNrVOm-KJIsIYaR8pg-1; Fri, 04 Mar 2022 16:27:17 -0500
X-MC-Unique: NqHkvNrVOm-KJIsIYaR8pg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6823E8070ED;
 Fri,  4 Mar 2022 21:27:16 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 492382D1F7;
 Fri,  4 Mar 2022 21:27:06 +0000 (UTC)
Date: Fri, 4 Mar 2022 15:27:04 -0600
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 12/12] tests/qemu-iotests: validate NBD TLS with UNIX
 sockets and PSK
Message-ID: <20220304212704.flvwwgzwhkmkk4cp@redhat.com>
References: <20220304193610.3293146-1-berrange@redhat.com>
 <20220304193610.3293146-13-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304193610.3293146-13-berrange@redhat.com>
User-Agent: NeoMutt/20211029-383-c6e293
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 07:36:10PM +0000, Daniel P. Berrangé wrote:
> This validates that connections to an NBD server running on a UNIX
> socket can use TLS with pre-shared keys (PSK).
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/qemu-iotests/233        | 28 ++++++++++++++++++++++++++++
>  tests/qemu-iotests/233.out    | 17 +++++++++++++++++
>  tests/qemu-iotests/common.tls | 24 ++++++++++++++++++++++++
>  3 files changed, 69 insertions(+)

Same as in 11, and just as in there,

Tested-by: Eric Blake <eblake@redhat.com>

Thanks; I'll be queueing this series through my NBD tree.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


