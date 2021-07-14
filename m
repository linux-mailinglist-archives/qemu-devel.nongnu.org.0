Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D0D3C7E17
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 07:47:47 +0200 (CEST)
Received: from localhost ([::1]:60830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3XkI-0002vP-IS
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 01:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3Xix-00026R-RG
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 01:46:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3Xiw-0006sT-DX
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 01:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626241581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=muLlHglvgt+Zg4AtPOjMuFzgYXoxN3u9fMKZPAMXhlo=;
 b=Swtgz0fKs6G5WV9PyRo6kkC8SS5r9kgoUj0HWdITyJYLXXO8+FLh8O8gq09IVA2CT2qaXN
 uDtQRZHvZSnYme4w7SUTSyYI7OU5uwxtFc603qb3vYwCbVye6+Wv/iHNkwuTwNrIBrcvPU
 OP5P9GUOjKmL4AAYUZk1Fdg7JYdCshM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-az_JeWTMPv-8ReKsEA6fOQ-1; Wed, 14 Jul 2021 01:46:19 -0400
X-MC-Unique: az_JeWTMPv-8ReKsEA6fOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E94E79EE8;
 Wed, 14 Jul 2021 05:46:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-81.ams2.redhat.com
 [10.36.112.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53B2F6267C;
 Wed, 14 Jul 2021 05:46:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BFCB8113865F; Wed, 14 Jul 2021 07:46:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH v3 1/3] msix/hmp: add hmp interface to dump MSI-X info
References: <20210714004754.22243-1-dongli.zhang@oracle.com>
 <20210714004754.22243-2-dongli.zhang@oracle.com>
Date: Wed, 14 Jul 2021 07:46:12 +0200
In-Reply-To: <20210714004754.22243-2-dongli.zhang@oracle.com> (Dongli Zhang's
 message of "Tue, 13 Jul 2021 17:47:52 -0700")
Message-ID: <8735shmorf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, joe.jin@oracle.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dongli Zhang <dongli.zhang@oracle.com> writes:

> This patch is to add the HMP interface to dump MSI-X table and PBA, in
> order to help diagnose the loss of IRQ issue in VM (e.g., if an MSI-X
> vector is erroneously masked permanently). Here is the example with
> vhost-scsi:
>
> (qemu) info msix /machine/peripheral/vscsi0
> Msg L.Addr Msg U.Addr Msg Data   Vect Ctrl
> 0xfee00000 0x00000000 0x00004041 0x00000000
> 0xfee00000 0x00000000 0x00004051 0x00000000
> 0xfee00000 0x00000000 0x00004061 0x00000000
> 0xfee00000 0x00000000 0x00004071 0x00000000
> 0xfee01000 0x00000000 0x000040b1 0x00000000
> 0xfee02000 0x00000000 0x000040c1 0x00000000
> 0xfee03000 0x00000000 0x000040d1 0x00000000
>
> MSI-X PBA
> 0 0 0 0 0 0 0
>
> Since the number of MSI-X entries is not determined and might be very
> large, it is sometimes inappropriate to dump via QMP.

Why?  What makes HMP different?

> Therefore, this patch dumps MSI-X information only via HMP, which is
> similar to the implementation of hmp_info_mem().
>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Acked-by: Jason Wang <jasowang@redhat.com>


