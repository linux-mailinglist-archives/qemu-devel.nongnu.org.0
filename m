Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 630D64DCE83
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 20:12:16 +0100 (CET)
Received: from localhost ([::1]:36130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUvXi-0002NL-UR
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 15:12:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1nUvWW-00016y-Bg
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 15:11:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1nUvWS-0004rn-TS
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 15:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647544255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtIupofGn+T1TyxXxreTpE8xGYbnCO8dca9H6LIkqaQ=;
 b=anmGg9BXbOfmN/gJUElnN5eF0zgmG2fZnrxJDpxilUX/Zc6ASeX0y+Pf0JK9EBGm9U53cW
 9YzLeqO/lGEVwMmbPIoQ6pJeBWV61LA1SuyS3gXTk3omaBy2ZORYKUf4KrQVjzZR2NH5Fs
 wVIXswYqu5o8V/mcA2KXHLnAXQYZVXk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-g46iTfV7OYeG89TuTK_n9A-1; Thu, 17 Mar 2022 15:10:52 -0400
X-MC-Unique: g46iTfV7OYeG89TuTK_n9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24373802803;
 Thu, 17 Mar 2022 19:10:52 +0000 (UTC)
Received: from starship (unknown [10.40.192.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F77D1454539;
 Thu, 17 Mar 2022 19:10:49 +0000 (UTC)
Message-ID: <ce037d5ccd515787dfa0ab47f54bfd0a1756f30f.camel@redhat.com>
Subject: Re: [PATCH v3 0/1] Patch to adjust coroutine pool size adaptively
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>, qemu-devel@nongnu.org
Date: Thu, 17 Mar 2022 21:10:48 +0200
In-Reply-To: <20220128083616.6083-1-hnarukaw@yahoo-corp.jp>
References: <20220128083616.6083-1-hnarukaw@yahoo-corp.jp>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com, f4bug@amsat.org,
 hreitz@redhat.com, stefanha@redhat.com, aoiwa@yahoo-corp.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2022-01-28 at 17:36 +0900, Hiroki Narukawa wrote:
> Resending patch with decreasing coroutine pool size on device remove
> 
> We encountered random disk IO performance drop since qemu-5.0.0, and this patch fixes it.
> 
> Commit message in c740ad92 implied to adjust coroutine pool size adaptively, so I tried to implement this.
> 
> Changes from v2:
> Decrease coroutine pool size on device remove
> 
> Changes from v1:
> Use qatomic_read properly
> 
> 
> Hiroki Narukawa (1):
>   util: adjust coroutine pool size to virtio block queue
> 
>  hw/block/virtio-blk.c    |  5 +++++
>  include/qemu/coroutine.h | 10 ++++++++++
>  util/qemu-coroutine.c    | 20 ++++++++++++++++----
>  3 files changed, 31 insertions(+), 4 deletions(-)
> 

I just bisected this to break my 32 bit qemu setup that I use for testing.

L1 is 32 bit VM with 16 GB of RAM (with PAE) with 16 vCPUs, and
L2 is 32 bit VM with 1.3 GB of RAM and 14 vCPUs (2 less)


Qemu runs out of memory, because new number of coroutines is quite high (14 * 256).
I understand that 32 bit qemu is very limited anyway, so I won't argue
against this patch. Just FYI. 

As a workaround I reduced the virtio-blk queue-size to 16
and it seems to work again. I am only keeping this configuration to test
that it boots thus performance is not an issue.

Option to override the coroutine pool size would be ideal in this case IMHO though.

Best regards,
	Maxim Levitsky


