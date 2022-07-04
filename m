Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E8F56542E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 13:55:34 +0200 (CEST)
Received: from localhost ([::1]:59128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Kft-0008D1-As
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 07:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o8KYh-0006Nd-DT
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:48:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o8KYe-0002fA-RL
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656935281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2PKPTe85MaNypld1CUdLD3gx02JoapUMegFUQfkP2c=;
 b=LnamuZf/4QAiLVyzccGRzb/Z90jPiAszbRc0TFEowSXyRG5cQYlarixU7Jrl/oyVnZpiks
 I1gjo3Jeg5OimshHGSamX7DnPwB1avEwTvftoEkDzfEbjK1SmoMLrbCtF5JN/tIrwYbXs4
 gwPH6DOg4LUnB5/rqXalynW6oDKDaW4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-doR0KlqsPcuqupg-n6qgSQ-1; Mon, 04 Jul 2022 07:47:56 -0400
X-MC-Unique: doR0KlqsPcuqupg-n6qgSQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 170E5803478;
 Mon,  4 Jul 2022 11:47:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C88F840E7F28;
 Mon,  4 Jul 2022 11:47:54 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, Eric Farman
 <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: [PATCH v2 02/12] pc-bios/s390-ccw/virtio: Introduce a macro for
 the DASD block size
In-Reply-To: <20220704111903.62400-3-thuth@redhat.com>
Organization: Red Hat GmbH
References: <20220704111903.62400-1-thuth@redhat.com>
 <20220704111903.62400-3-thuth@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Mon, 04 Jul 2022 13:47:53 +0200
Message-ID: <874jzx2j6e.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 04 2022, Thomas Huth <thuth@redhat.com> wrote:

> Use VIRTIO_DASD_DEFAULT_BLOCK_SIZE instead of the magic value 4096.
>
> Reviewed-by: Eric Farman <farman@linux.ibm.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/virtio.h        | 1 +
>  pc-bios/s390-ccw/virtio-blkdev.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


