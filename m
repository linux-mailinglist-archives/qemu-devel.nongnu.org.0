Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E026C2EA9B8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 12:20:02 +0100 (CET)
Received: from localhost ([::1]:34084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwkNd-0000vn-Fe
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 06:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kwkML-0000Hr-NY
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 06:18:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kwkMG-0005ed-Hh
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 06:18:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609845515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SFfJUOoDIJOGOmgaY3q4qM8JSKbGPw2WzfP2s2upGeQ=;
 b=Sykbp/30NjWH8af7paFGNJZyFOPSpy4BP8Arvoa6ykfDGl20MIKTBbBbhj8l+dZuutRbsc
 WjZr+WYQay6JeCL3qz7pCG9yiZJcxVTn9JkDb/5r58OBZCSbcxabLEfcCS3Zdkc8sgdU/w
 FwslbCZM9X+7b8P8STBO3eUkFZUVSDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-7tlEX8W8OCmzkFIFcWVVjQ-1; Tue, 05 Jan 2021 06:18:33 -0500
X-MC-Unique: 7tlEX8W8OCmzkFIFcWVVjQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D70EC10054FF;
 Tue,  5 Jan 2021 11:18:31 +0000 (UTC)
Received: from work-vm (ovpn-114-8.ams2.redhat.com [10.36.114.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C594670955;
 Tue,  5 Jan 2021 11:18:21 +0000 (UTC)
Date: Tue, 5 Jan 2021 11:18:18 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jinhao Gao <gaojinhao@huawei.com>
Subject: Re: [PATCH v3 3/3] vmstate: Fix memory leak in vmstate_handle_alloc()
Message-ID: <20210105111818.GA2945@work-vm>
References: <20201231061020.828-1-gaojinhao@huawei.com>
 <20201231061020.828-4-gaojinhao@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201231061020.828-4-gaojinhao@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 zhukeqian1@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jinhao Gao (gaojinhao@huawei.com) wrote:
> Some memory allocated for fields having a flag of VMS_ALLOC in SaveState
> may not free before VM load vmsd in migration. So we pre-free memory before
> allocation in vmstate_handle_alloc() to avoid memleaks.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Yes, I think that's OK; it's actually pretty rare for this to happen;
normally inwards migrations either succeed or fail and exit; doing
multiple loads from snapshots is valid and I guess COLO hits this as well.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/vmstate.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/migration/vmstate.c b/migration/vmstate.c
> index e9d2aef66b..873f76739f 100644
> --- a/migration/vmstate.c
> +++ b/migration/vmstate.c
> @@ -70,6 +70,7 @@ static void vmstate_handle_alloc(void *ptr, const VMStateField *field,
>          gsize size = vmstate_size(opaque, field);
>          size *= vmstate_n_elems(opaque, field);
>          if (size) {
> +            g_free(*(void **)ptr);
>              *(void **)ptr = g_malloc(size);
>          }
>      }
> -- 
> 2.23.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


