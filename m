Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5A230AEA4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 19:03:47 +0100 (CET)
Received: from localhost ([::1]:35816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6dY9-0005NZ-Jj
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 13:03:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6dXB-0004sE-HB
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 13:02:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6dX8-0003dZ-Gc
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 13:02:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612202559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MTvpNjYQTWkA0iFactoZyPTQRnFQ0tI+ZuPm1bThMjA=;
 b=S0IhRtyQltSZK9rqhv5b7VwhTkAvpKJfq53YQ/hL7iJRXQmNSUwR/0j0BeoVxlcOevYtEv
 Pms5kklj5hesxMcpKSGuGjT/35Vi3xeVyUKqqDNvbU2OlMzex0xzieWafNz9IwV/jXqcay
 QjwYptxkJv86F/VGudUGKBGMm7O9Phg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-wTxtRHsrNCi9_oNZPLJTBw-1; Mon, 01 Feb 2021 13:02:37 -0500
X-MC-Unique: wTxtRHsrNCi9_oNZPLJTBw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8D5880400F
 for <qemu-devel@nongnu.org>; Mon,  1 Feb 2021 18:02:36 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACBED5C27C;
 Mon,  1 Feb 2021 18:02:30 +0000 (UTC)
Date: Mon, 1 Feb 2021 19:02:29 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 3/3] qmp: Resume OOB-enabled monitor before processing
 the request
Message-ID: <20210201180229.GK13157@merkur.fritz.box>
References: <20210201161504.1976989-1-armbru@redhat.com>
 <20210201161504.1976989-4-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210201161504.1976989-4-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.02.2021 um 17:15 hat Markus Armbruster geschrieben:
> monitor_qmp_dispatcher_co() needs to resume the monitor if
> handle_qmp_command() suspended it.  Two cases:
> 
> 1. OOB enabled: suspended if mon->qmp_requests has no more space
> 
> 2. OOB disabled: suspended always
> 
> We resume only after we processed the request.  Which can take a long
> time.
> 
> Resume the monitor right when the queue has space to keep the monitor
> available for out-of-band commands even in this corner case.
> 
> Leave the "OOB disabled" case alone.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

> +        /*
> +         * We need to resume the monitor if handle_qmp_command()
> +         * suspended it.  Two cases:
> +         * 1. OOB enabled: mon->qmp_requests has no more space
> +         *    Resume right away, so that OOB commands can get executed while
> +         *    this request is being processed.
> +         * 2. OOB disabled: always
> +         *    Resume only after we're done processing the request, 

This line has trailing whitespace.

With this fixed, the whole series is:
Reviewed-by: Kevin Wolf <kwolf@redhat.com>


