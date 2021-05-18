Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2581738785C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:03:58 +0200 (CEST)
Received: from localhost ([::1]:55652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liyS5-0001Wz-5W
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1liyO5-0007BL-5p
 for qemu-devel@nongnu.org; Tue, 18 May 2021 07:59:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1liyO1-0006bH-8J
 for qemu-devel@nongnu.org; Tue, 18 May 2021 07:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621339177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j4Odbv3gKsiTToKnajaRANjEZHiMzKemuVL6W37JAtw=;
 b=QGi1ajfXr2S4FuXlmTOiNcearmHttb20wtw9ppF/SJ8dfL8YcwCFBo6V5VZXGPJzAt31jx
 N2KyW02Xd/KCCk6BC2VA1ohOBN4QmIMHvfGYHDDo1WADvVCxXwC41S0onfHUui6PgQkFeI
 ZawbCY2eQwpM1HamIPo3ryVfIVx1W7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-dP7XgBTAOhurZ20xRPucKg-1; Tue, 18 May 2021 07:59:35 -0400
X-MC-Unique: dP7XgBTAOhurZ20xRPucKg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6511107ACCA
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:59:34 +0000 (UTC)
Received: from work-vm (ovpn-115-45.ams2.redhat.com [10.36.115.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A0405D703;
 Tue, 18 May 2021 11:59:33 +0000 (UTC)
Date: Tue, 18 May 2021 12:59:31 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 1/7] virtiofsd: Check for EINTR in preadv() and retry
Message-ID: <YKOsI4PH3xdza8gZ@work-vm>
References: <20210511213736.281016-1-vgoyal@redhat.com>
 <20210511213736.281016-2-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210511213736.281016-2-vgoyal@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> We don't seem to check for EINTR and retry. There are other places
> in code where we check for EINTR. So lets add a check.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/fuse_virtio.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index 1170f375a5..32914f7e95 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -421,6 +421,9 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
>  
>          if (ret == -1) {
>              ret = errno;
> +            if (ret == EINTR) {
> +                continue;
> +            }
>              fuse_log(FUSE_LOG_DEBUG, "%s: preadv failed (%m) len=%zd\n",
>                       __func__, len);
>              goto err;
> -- 
> 2.25.4
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


