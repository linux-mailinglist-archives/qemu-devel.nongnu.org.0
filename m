Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B901C4E2FE5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 19:24:21 +0100 (CET)
Received: from localhost ([::1]:55276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWMhY-0000bM-D8
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 14:24:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWMfU-0008EB-Sh
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 14:22:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWMfS-0001xd-TX
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 14:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647886929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kswne+N6nKHXw8VnGBTWVx20S7ULH9uCQmyu/GeGGLY=;
 b=a01+Ai0N/dbS4vIa03Xm+MfmsLSJLAEe++nSgWv7moLSxMuHcyC/JrUoDffVf7NCr5pE9z
 mpYVtOIpxzy75T1GEgIrk+WQ9Atu3fg24WxMeqP91LuxhZ7go3Qr88Bl5y9LVW/S28nEy7
 O/zpRyLyLAPMQurazL+pxj9CEJHOq1U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-5qcOuOdHNBiev_VwqcV3fQ-1; Mon, 21 Mar 2022 14:22:08 -0400
X-MC-Unique: 5qcOuOdHNBiev_VwqcV3fQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08BA1185A7BA;
 Mon, 21 Mar 2022 18:22:08 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 824E840CF8FB;
 Mon, 21 Mar 2022 18:22:07 +0000 (UTC)
Date: Mon, 21 Mar 2022 13:22:05 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 15/15] iotests: make qemu_io_log() check return codes by
 default
Message-ID: <20220321182205.s7fuxglvfbj3qjyr@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-16-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220318203655.676907-16-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 04:36:55PM -0400, John Snow wrote:
> Just like qemu_img_log(), upgrade qemu_io_log() to enforce a return code
> of zero by default.
> 
> Affected tests: 242 245 255 274 303 307 nbd-reconnect-on-open
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py                  | 5 +++--
>  tests/qemu-iotests/tests/nbd-reconnect-on-open | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>

If I'm reading the commit message correctly, 'Affected tests' are all
tests that used qemu_io_log, but only nbd-reconnect-on-open needed a
change because it was the only one that explicitly tested a scenario
that triggers an expected non-zero status.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


