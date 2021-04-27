Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D24136C35C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 12:28:19 +0200 (CEST)
Received: from localhost ([::1]:58832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbKwz-0000r9-L3
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 06:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbKtt-0008Ad-TJ
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:25:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbKtp-0003kL-N5
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619519100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ltPM7XxxSBxSKDRFyhmHsMKJYhXmBDDws/ZTXEQpWE0=;
 b=a4Rv1+HcY7gPsn7GeEdh4fQ/E8z+iuzG9JrPCRvfAwFj91aiA2imV5iCboa7OUI3LT9P47
 MnzyVakIX4p14WZCoOMJtSP7tPU0rbnBleIqs1NM222MaOvcbhaLa9051vmcyhp89WMnG4
 nDGh0xaa6NNs5L94J9fzNRbJXkiNK/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-fxG39d3YMzu6U9s0c8HYVQ-1; Tue, 27 Apr 2021 06:24:58 -0400
X-MC-Unique: fxG39d3YMzu6U9s0c8HYVQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E32F5A0CAE;
 Tue, 27 Apr 2021 10:24:57 +0000 (UTC)
Received: from work-vm (ovpn-114-253.ams2.redhat.com [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31C0360CC6;
 Tue, 27 Apr 2021 10:24:45 +0000 (UTC)
Date: Tue, 27 Apr 2021 11:24:42 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v2 2/7] virtiofds: Changed allocations of iovec to GLib's
 functions
Message-ID: <YIfmaleNOwhLLD9W@work-vm>
References: <20210420154643.58439-1-ma.mandourr@gmail.com>
 <20210420154643.58439-3-ma.mandourr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210420154643.58439-3-ma.mandourr@gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: "open list:virtiofs" <virtio-fs@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Mahmoud Mandour (ma.mandourr@gmail.com) wrote:
> Replaced the calls to malloc()/calloc() and their respective
> calls to free() of iovec structs with GLib's allocation and
> deallocation functions.
> 
> Also, in one instance, used g_new0() instead of a calloc() call plus
> a null-checking assertion.
> 
> iovec structs were created locally and freed as the function
> ends. Hence, I used g_autofree and removed the respective calls to
> free().
> 
> In one instance, a struct fuse_ioctl_iovec pointer is returned from a
> function, namely, fuse_ioctl_iovec_copy. There, I used g_steal_pointer()
> in conjunction with g_autofree, this gives the ownership of the pointer
> to the calling function and still auto-frees the memory when the calling
> function finishes (maintaining the symantics of previous code).
> 
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c | 19 +++++++------------
>  tools/virtiofsd/fuse_virtio.c   |  6 +-----
>  2 files changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index 812cef6ef6..f965299ad9 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -217,9 +217,9 @@ static int send_reply(fuse_req_t req, int error, const void *arg,
>  int fuse_reply_iov(fuse_req_t req, const struct iovec *iov, int count)
>  {
>      int res;
> -    struct iovec *padded_iov;
> +    g_autofree struct iovec *padded_iov;
>  
> -    padded_iov = malloc((count + 1) * sizeof(struct iovec));
> +    padded_iov = g_try_new(struct iovec, count + 1);
>      if (padded_iov == NULL) {
>          return fuse_reply_err(req, ENOMEM);
>      }
> @@ -228,7 +228,6 @@ int fuse_reply_iov(fuse_req_t req, const struct iovec *iov, int count)
>      count++;
>  
>      res = send_reply_iov(req, 0, padded_iov, count);
> -    free(padded_iov);
>  
>      return res;
>  }

OK.

> @@ -565,10 +564,10 @@ int fuse_reply_bmap(fuse_req_t req, uint64_t idx)
>  static struct fuse_ioctl_iovec *fuse_ioctl_iovec_copy(const struct iovec *iov,
>                                                        size_t count)
>  {
> -    struct fuse_ioctl_iovec *fiov;
> +    g_autofree struct fuse_ioctl_iovec *fiov;
>      size_t i;
>  
> -    fiov = malloc(sizeof(fiov[0]) * count);
> +    fiov = g_try_new(fuse_ioctl_iovec, count);
>      if (!fiov) {
>          return NULL;
>      }
> @@ -578,7 +577,7 @@ static struct fuse_ioctl_iovec *fuse_ioctl_iovec_copy(const struct iovec *iov,
>          fiov[i].len = iov[i].iov_len;
>      }
>  
> -    return fiov;
> +    return g_steal_pointer(&fiov);
>  }

This is OK, but doesn't gain anything - marking it as g_autofree'ing and
always stealing is no benefit.

>  
>  int fuse_reply_ioctl_retry(fuse_req_t req, const struct iovec *in_iov,
> @@ -629,9 +628,6 @@ int fuse_reply_ioctl_retry(fuse_req_t req, const struct iovec *in_iov,
>  
>      res = send_reply_iov(req, 0, iov, count);
>  out:
> -    free(in_fiov);
> -    free(out_fiov);
> -

I don't think you can do that - I think you're relying here on the
g_autofree from fuse_ioclt_iovec_copy - but my understanding is that
doesn't work; g_autofree is scoped, so it's designed to free at the end
of fuse_ioctl_iovec_copy, fuse_reply_ioctl_retry doesn't know that the
ion_fiov were allocated that way, so it won't get autocleaned up.

>      return res;
>  
>  enomem:
> @@ -663,11 +659,11 @@ int fuse_reply_ioctl(fuse_req_t req, int result, const void *buf, size_t size)
>  int fuse_reply_ioctl_iov(fuse_req_t req, int result, const struct iovec *iov,
>                           int count)
>  {
> -    struct iovec *padded_iov;
> +    g_autofree struct iovec *padded_iov;
>      struct fuse_ioctl_out arg;
>      int res;
>  
> -    padded_iov = malloc((count + 2) * sizeof(struct iovec));
> +    padded_iov = g_try_new(struct iovec, count + 2);
>      if (padded_iov == NULL) {
>          return fuse_reply_err(req, ENOMEM);
>      }
> @@ -680,7 +676,6 @@ int fuse_reply_ioctl_iov(fuse_req_t req, int result, const struct iovec *iov,
>      memcpy(&padded_iov[2], iov, count * sizeof(struct iovec));
>  
>      res = send_reply_iov(req, 0, padded_iov, count + 2);
> -    free(padded_iov);
>  
>      return res;
>  }

OK

> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index 3e13997406..07e5d91a9f 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -347,8 +347,7 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
>       * Build a copy of the the in_sg iov so we can skip bits in it,
>       * including changing the offsets
>       */
> -    struct iovec *in_sg_cpy = calloc(sizeof(struct iovec), in_num);
> -    assert(in_sg_cpy);
> +    g_autofree struct iovec *in_sg_cpy = g_new0(struct iovec, in_num);
>      memcpy(in_sg_cpy, in_sg, sizeof(struct iovec) * in_num);
>      /* These get updated as we skip */
>      struct iovec *in_sg_ptr = in_sg_cpy;
> @@ -386,7 +385,6 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
>              ret = errno;
>              fuse_log(FUSE_LOG_DEBUG, "%s: preadv failed (%m) len=%zd\n",
>                       __func__, len);
> -            free(in_sg_cpy);
>              goto err;
>          }
>          fuse_log(FUSE_LOG_DEBUG, "%s: preadv ret=%d len=%zd\n", __func__,
> @@ -410,13 +408,11 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
>          if (ret != len) {
>              fuse_log(FUSE_LOG_DEBUG, "%s: ret!=len\n", __func__);
>              ret = EIO;
> -            free(in_sg_cpy);
>              goto err;
>          }
>          in_sg_left -= ret;
>          len -= ret;
>      } while (in_sg_left);
> -    free(in_sg_cpy);

Yes, this is where the autofree really helps; getting rid of a few
free's.

Dave

>      /* Need to fix out->len on EOF */
>      if (len) {
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


