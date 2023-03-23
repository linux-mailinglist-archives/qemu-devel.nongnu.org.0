Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20736C6076
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 08:15:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfF9d-0004qL-HJ; Thu, 23 Mar 2023 03:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfF9b-0004p0-4Z
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 03:14:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfF9Z-00083J-Fh
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 03:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679555668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=43ejkovPDeSvkZYThQw50buKihsZBioA5QB7A7P269I=;
 b=Zx/w0c7VcYMxjfPWX8YTWocCfFvzLzcQfzM0F/XBPWFWsR2sYD4Tv+hrnXL7VnSMDvRotJ
 zj/KfF3rm9ebM0/MmTzx92B5V3Xp8BXgyagjiZtJ2j/kFVZ0GqcL1915OBKZ4LLy1C6WSQ
 mvAXDTfs+JkW1xdAgCR2P3Q1ttCILz0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-jCOaue0oNpCXqdBksbTq-g-1; Thu, 23 Mar 2023 03:14:26 -0400
X-MC-Unique: jCOaue0oNpCXqdBksbTq-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E68D855300;
 Thu, 23 Mar 2023 07:14:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40BCA40C6E67;
 Thu, 23 Mar 2023 07:14:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3585621E6926; Thu, 23 Mar 2023 08:14:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org,  Kevin Wolf <kwolf@redhat.com>,  Raphael Norwitz
 <raphael.norwitz@nutanix.com>,  qemu-block@nongnu.org,  Stefan Hajnoczi
 <stefanha@redhat.com>,  damien.lemoal@opensource.wdc.com,
 kvm@vger.kernel.org,  hare@suse.de,  Paolo Bonzini <pbonzini@redhat.com>,
 dmitry.fomichev@wdc.com,  Hanna Reitz <hreitz@redhat.com>,  Cornelia Huck
 <cohuck@redhat.com>,  Eric Blake <eblake@redhat.com>,  "Michael S.
 Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v8 3/4] block: add accounting for zone append operation
References: <20230323052828.6545-1-faithilikerun@gmail.com>
 <20230323052828.6545-4-faithilikerun@gmail.com>
Date: Thu, 23 Mar 2023 08:14:24 +0100
In-Reply-To: <20230323052828.6545-4-faithilikerun@gmail.com> (Sam Li's message
 of "Thu, 23 Mar 2023 13:28:27 +0800")
Message-ID: <87y1no0wj3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Sam Li <faithilikerun@gmail.com> writes:

> Taking account of the new zone append write operation for zoned devices,
> BLOCK_ACCT_ZONE_APPEND enum is introduced as other I/O request type (read,
> write, flush).
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>

[...]

> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index c05ad0c07e..501b554fc5 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -849,6 +849,9 @@
>  # @min_wr_latency_ns: Minimum latency of write operations in the
>  #                     defined interval, in nanoseconds.
>  #
> +# @min_zone_append_latency_ns: Minimum latency of zone append operations
> +#                              in the defined interval, in nanoseconds.

Lacks (since 8.1).  Your other additions, too.

[...]


