Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31690507A2A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 21:22:49 +0200 (CEST)
Received: from localhost ([::1]:52572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngtR2-0007QJ-B8
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 15:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ngtO6-0005N7-Pl
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:19:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ngtO3-0007uC-U7
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650395983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xDW/zodXB1w9lyNVcP2lQSKo+sSrcI1+f4qr4yuhlzo=;
 b=i/3QwFSxIOtWJYycKB5EDTkUYzXfYbD0nmKdj6WZ0LFfXFzq25Bdf+s/mDh/obGz7t7WtT
 uVaut5Vbjhvd3O/aqb/pT06ZS+dcKgxymJCrs5RHWhMR9z7GQrbqSJxKX2yv/3kb052OuF
 tfqjZqRyceBKvtdcU6N/HVL0CA++sOE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-oVGD9rozPA6bQ9Hzy0YPqQ-1; Tue, 19 Apr 2022 15:19:41 -0400
X-MC-Unique: oVGD9rozPA6bQ9Hzy0YPqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCBDD185A7A4;
 Tue, 19 Apr 2022 19:19:40 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6408C40D282A;
 Tue, 19 Apr 2022 19:19:40 +0000 (UTC)
Date: Tue, 19 Apr 2022 14:19:38 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 07/12] iotests: rebase qemu_io() on top of qemu_tool()
Message-ID: <20220419191938.v3csniozrscgejwq@redhat.com>
References: <20220418211504.943969-1-jsnow@redhat.com>
 <20220418211504.943969-8-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220418211504.943969-8-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-35-db88c3
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, Apr 18, 2022 at 05:14:59PM -0400, John Snow wrote:
> Rework qemu_io() to be analogous to qemu_img(); a function that requires
> a return code of zero by default unless disabled explicitly.
> 
> Tests that use qemu_io():
> 030 040 041 044 055 056 093 124 129 132 136 148 149 151 152 163 165 205
> 209 219 236 245 248 254 255 257 260 264 280 298 300 302 304
> image-fleecing migrate-bitmaps-postcopy-test migrate-bitmaps-test
> migrate-during-backup migration-permissions
> 
> Test that use qemu_io_log():
> 242 245 255 274 303 307 nbd-reconnect-on-open
> 
> Copy-pastables for testing/verification:
> 
> ./check -qcow2 030 040 041 044 055 056 124 129 132 151 152 163 165 209 \
>                219 236 242 245 248 254 255 257 260 264 274 \
>                280 298 300 302 303 304 307 image-fleecing \
>                migrate-bitmaps-postcopy-test migrate-bitmaps-test \
>                migrate-during-backup nbd-reconnect-on-open
> ./check -raw 093 136 148 migration-permissions
> ./check -nbd 205
> 
> # ./configure configure --disable-gnutls --enable-gcrypt
> # this ALSO requires passwordless sudo.
> ./check -luks 149
> 
> # Just the tests that were edited in this commit:
> ./check -qcow2 030 040 242 245
> ./check -raw migration-permissions
> ./check -nbd 205
> ./check -luks 149
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


