Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A722A36B2F0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 14:21:17 +0200 (CEST)
Received: from localhost ([::1]:35820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb0Em-0000iY-OU
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 08:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lb0Cr-0000CO-JQ
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:19:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lb0Cp-00089x-Qg
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619439555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Fj64BEJ3qvAnLT+NXgGebuCM85YYA0vCjmI5tpe5Hk=;
 b=YmFoX5KKaxT8urApKBsZW1sRtPKsDeysFfUkxvsl700u7g9doyf1A35WFm4KcIKIGHBqPV
 MxiAmftTSEUV0hc0dE1Ib7Zpi+eHXRSDs/mdKeqW12WjuOIMHGjjCviFOMQQmOSVa/a6sn
 6kbAD7h0rxEdHHTDh35VE39TX0uFOtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-F-zUrG_mOBeWpJsuAPHIvw-1; Mon, 26 Apr 2021 08:19:13 -0400
X-MC-Unique: F-zUrG_mOBeWpJsuAPHIvw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 038081008068;
 Mon, 26 Apr 2021 12:19:12 +0000 (UTC)
Received: from work-vm (ovpn-115-8.ams2.redhat.com [10.36.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 030921002388;
 Mon, 26 Apr 2021 12:19:07 +0000 (UTC)
Date: Mon, 26 Apr 2021 13:19:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Edge NFV <edgenfv@gmail.com>, alex.williamson@redhat.com
Subject: Re: [PATCH] make vfio and DAX cache work together
Message-ID: <YIavueU/GRbAEyK0@work-vm>
References: <CAED3YRr-8ACi5FzsHy8AtijTMMS68aDW2sE1Qy5kmexkhGvETQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAED3YRr-8ACi5FzsHy8AtijTMMS68aDW2sE1Qy5kmexkhGvETQ@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Edge NFV (edgenfv@gmail.com) wrote:
>  Signed-off-by: Edge NFV <edgenfv@gmail.com>

Hi,
  I take it that 'Edge NFV' isn't your real name; apologies if it is.
It's unusual not to use a real name; I would be interested to know
why you feel uncomfortable not doing.

> ---
>  hw/vfio/common.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ae5654fcdb..83e15bf7a3 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -668,6 +668,15 @@ static void vfio_listener_region_add(MemoryListener
> *listener,
>                  int128_get64(int128_sub(section->size, int128_one())));
>          return;
>      }
> +
> +    /* Do not add virtio fs cache section */
> +    if (!strcmp(memory_region_name(section->mr), "virtio-fs-cache")) {

So first, this is a patch that fixes something that isn't yet in qemu;
the DAX mode of virtiofs.
Secondly, hard coding the name like this is probably the wrong thing to
do; we need a way for the cache to declare it wants to be omitted.
Thirdly, shouldn't this actually be a change to
vfio_listener_skip_section to add this test?

Dave

> +        trace_vfio_listener_region_add_skip(
> +                section->offset_within_address_space,
> +                section->offset_within_address_space +
> +                int128_get64(int128_sub(section->size, int128_one())));
> +        return;
> +    }
> 
>      if (unlikely((section->offset_within_address_space &
>                    ~qemu_real_host_page_mask) !=
> -- 
> 2.25.1
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


