Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D89E366001
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 21:05:46 +0200 (CEST)
Received: from localhost ([::1]:60058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYvgv-0004AP-Ep
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 15:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lYvey-0003ZT-Ug
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 15:03:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lYvex-0008KS-6j
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 15:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618945422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zVdPnvSxfUK7BAGiz+KPF1pjX7ufMZfaqyAIMQlvZE0=;
 b=UuO7AxZVUoy+imeqoFRTjuk26cI+H+m9w0dko1ZQQoFqKNFb+QrGw5goaOv26vt1MDzBTC
 SOk32QXaCSPUoO7UAmEovegfTUjfGDPMGlpoAB5a7F2M6Ereq6Bf76cOGghs6CusqSmqmu
 ryZ6x0F5EPPRCwLnZxvdPq46S6nepHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-LMx6uoU5MVKoEzbbvB289Q-1; Tue, 20 Apr 2021 15:03:40 -0400
X-MC-Unique: LMx6uoU5MVKoEzbbvB289Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 771DB1B18BC0;
 Tue, 20 Apr 2021 19:03:38 +0000 (UTC)
Received: from horse.redhat.com (ovpn-119-80.rdu2.redhat.com [10.10.119.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F6E119C95;
 Tue, 20 Apr 2021 19:03:34 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 2E3F322054F; Tue, 20 Apr 2021 15:03:34 -0400 (EDT)
Date: Tue, 20 Apr 2021 15:03:34 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [Virtio-fs] [PATCH v2 1/7] virtiofsd: Changed allocations of
 fuse_req to GLib functions
Message-ID: <20210420190334.GE1529659@redhat.com>
References: <20210420154643.58439-1-ma.mandourr@gmail.com>
 <20210420154643.58439-2-ma.mandourr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210420154643.58439-2-ma.mandourr@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "open list:virtiofs" <virtio-fs@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 20, 2021 at 05:46:36PM +0200, Mahmoud Mandour wrote:
> Replaced the allocation and deallocation of fuse_req structs
> using calloc()/free() call pairs to a GLib's g_try_new0()
> and g_free().

Hi,

What's the context of these patches. I see all of them are switching
to glib functions. Why to do that? What's the advantage.

Vivek

> 
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index 58e32fc963..812cef6ef6 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -106,7 +106,7 @@ static void list_add_req(struct fuse_req *req, struct fuse_req *next)
>  static void destroy_req(fuse_req_t req)
>  {
>      pthread_mutex_destroy(&req->lock);
> -    free(req);
> +    g_free(req);
>  }
>  
>  void fuse_free_req(fuse_req_t req)
> @@ -130,7 +130,7 @@ static struct fuse_req *fuse_ll_alloc_req(struct fuse_session *se)
>  {
>      struct fuse_req *req;
>  
> -    req = (struct fuse_req *)calloc(1, sizeof(struct fuse_req));
> +    req = g_try_new0(struct fuse_req, 1);
>      if (req == NULL) {
>          fuse_log(FUSE_LOG_ERR, "fuse: failed to allocate request\n");
>      } else {
> @@ -1684,7 +1684,7 @@ static struct fuse_req *check_interrupt(struct fuse_session *se,
>          if (curr->u.i.unique == req->unique) {
>              req->interrupted = 1;
>              list_del_req(curr);
> -            free(curr);
> +            g_free(curr);
>              return NULL;
>          }
>      }
> -- 
> 2.25.1
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs


