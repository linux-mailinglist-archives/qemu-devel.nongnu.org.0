Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCED55E507
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:41:03 +0200 (CEST)
Received: from localhost ([::1]:35648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6BSg-00009I-0S
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o6BEW-0008Fm-Pe
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:26:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o6BEU-0002eZ-BL
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656422781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gEciMZGjPvnP0rOog6PN1J0d0ewoEd7/lTF6DtyWQhE=;
 b=fzO57VhWUYh72iI+4FoBtLOZH2otZH1XKWe0PS39q/jDkiF2P+GAv8ZJWyQKbAWf1ypY45
 k06dPUSgYwPT8Z1cSz7ZvwrGNR/CcqGkfaEQOg9h0u6t523KcRfpwu7il8Mf+rc05Ztorq
 6vUHDHB8ehZoxghjA6A3P1H7e3cJrtc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-XnxJGrYzNxGq7g7y6p7rRA-1; Tue, 28 Jun 2022 09:26:17 -0400
X-MC-Unique: XnxJGrYzNxGq7g7y6p7rRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3198B1857F09;
 Tue, 28 Jun 2022 13:26:17 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF55F2026D64;
 Tue, 28 Jun 2022 13:26:16 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH 08/12] pc-bios/s390-ccw/virtio: Beautify the code for
 reading virtqueue configuration
In-Reply-To: <20220628131032.213986-9-thuth@redhat.com>
Organization: Red Hat GmbH
References: <20220628131032.213986-1-thuth@redhat.com>
 <20220628131032.213986-9-thuth@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Tue, 28 Jun 2022 15:26:15 +0200
Message-ID: <87r138c420.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28 2022, Thomas Huth <thuth@redhat.com> wrote:

> It looks nicer if we separate the run_ccw() from the IPL_assert()
> statement, and the error message should talk about "virtio device"
> instead of "block device", since this code is nowadays used for
> non-block (i.e. network) devices, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/virtio.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


