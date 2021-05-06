Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ED63751B0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:40:57 +0200 (CEST)
Received: from localhost ([::1]:38030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leaV6-0000nd-Jx
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1leaTo-0008Fy-Ln
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:39:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1leaTk-0004Su-DL
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:39:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620293971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i3DlAxkDxLreGF/67BXse8O2cbxWyFgeZepigJRHBDk=;
 b=Xg4+MC0DqWN/o7wulWTS/ceSrzFw5B4Sx3V9VN/x32LM7GsZAQCBbPLuLxiU0vx9dZTf11
 rZ1BVNGsBrJcDl8OKAxinI32TeCAmBqcpbwGRYm28sULXGp17gFRbFnFMj73Xkn/ETUbrt
 oLpDOZrWRahksvSZq12hUOZCgnNykUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-5A38Yn0vNzqKG9QCJPrHFQ-1; Thu, 06 May 2021 05:39:30 -0400
X-MC-Unique: 5A38Yn0vNzqKG9QCJPrHFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74F8E6D5C9;
 Thu,  6 May 2021 09:39:29 +0000 (UTC)
Received: from work-vm (ovpn-115-37.ams2.redhat.com [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52FEF1002388;
 Thu,  6 May 2021 09:39:21 +0000 (UTC)
Date: Thu, 6 May 2021 10:39:18 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v3 2/7] virtiofsd: Changed allocations of iovec to GLib's
 functions
Message-ID: <YJO5RsRYQzTbFH09@work-vm>
References: <YIf2d8HuyPqwqt9C@work-vm>
 <20210427181333.148176-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210427181333.148176-1-ma.mandourr@gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
> deallocation functions and used g_autofree when appropriate.
> 
> Replaced the allocation of in_sg_cpy to g_new() instead of a call
> to calloc() and a null-checking assertion. Not g_new0()
> because the buffer is immediately overwritten using memcpy.
> 
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Thanks,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> v2 -> v3:
>     * Removed a wrongful combination of g_autofree and g_steel_pointer().
>     * Removed some goto paths that IMHO were not so useful any more.
>     * In v2, I allocated in_sg_cpy through g_new0(). This patch, I use
>       g_new() because the buffer is memcpy'd into right away so no need
>       to zero-initialize.
>     * Moved the declaration of in_sg_cpy to the top of the function
>       to match QEMU's style guidelines. 
> 
>  tools/virtiofsd/fuse_lowlevel.c | 31 ++++++++++++-------------------
>  tools/virtiofsd/fuse_virtio.c   |  8 +++-----
>  2 files changed, 15 insertions(+), 24 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index c8bea246ab..7fe2cef1eb 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -217,9 +217,9 @@ static int send_reply(fuse_req_t req, int error, const void *arg,
>  int fuse_reply_iov(fuse_req_t req, const struct iovec *iov, int count)
>  {
>      int res;
> -    struct iovec *padded_iov;
> +    g_autofree struct iovec *padded_iov = NULL;
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
> @@ -568,7 +567,7 @@ static struct fuse_ioctl_iovec *fuse_ioctl_iovec_copy(const struct iovec *iov,
>      struct fuse_ioctl_iovec *fiov;
>      size_t i;
>  
> -    fiov = malloc(sizeof(fiov[0]) * count);
> +    fiov = g_try_new(struct fuse_ioctl_iovec, count);
>      if (!fiov) {
>          return NULL;
>      }
> @@ -586,8 +585,8 @@ int fuse_reply_ioctl_retry(fuse_req_t req, const struct iovec *in_iov,
>                             size_t out_count)
>  {
>      struct fuse_ioctl_out arg;
> -    struct fuse_ioctl_iovec *in_fiov = NULL;
> -    struct fuse_ioctl_iovec *out_fiov = NULL;
> +    g_autofree struct fuse_ioctl_iovec *in_fiov = NULL;
> +    g_autofree struct fuse_ioctl_iovec *out_fiov = NULL;
>      struct iovec iov[4];
>      size_t count = 1;
>      int res;
> @@ -603,13 +602,14 @@ int fuse_reply_ioctl_retry(fuse_req_t req, const struct iovec *in_iov,
>      /* Can't handle non-compat 64bit ioctls on 32bit */
>      if (sizeof(void *) == 4 && req->ioctl_64bit) {
>          res = fuse_reply_err(req, EINVAL);
> -        goto out;
> +        return res;
>      }
>  
>      if (in_count) {
>          in_fiov = fuse_ioctl_iovec_copy(in_iov, in_count);
>          if (!in_fiov) {
> -            goto enomem;
> +            res = fuse_reply_err(req, ENOMEM);
> +            return res;

That could have just been return fuse_reply_err(req, ENOMEM);
but that's minor.

Dave

>          }
>  
>          iov[count].iov_base = (void *)in_fiov;
> @@ -619,7 +619,8 @@ int fuse_reply_ioctl_retry(fuse_req_t req, const struct iovec *in_iov,
>      if (out_count) {
>          out_fiov = fuse_ioctl_iovec_copy(out_iov, out_count);
>          if (!out_fiov) {
> -            goto enomem;
> +            res = fuse_reply_err(req, ENOMEM);
> +            return res;
>          }
>  
>          iov[count].iov_base = (void *)out_fiov;
> @@ -628,15 +629,8 @@ int fuse_reply_ioctl_retry(fuse_req_t req, const struct iovec *in_iov,
>      }
>  
>      res = send_reply_iov(req, 0, iov, count);
> -out:
> -    free(in_fiov);
> -    free(out_fiov);
>  
>      return res;
> -
> -enomem:
> -    res = fuse_reply_err(req, ENOMEM);
> -    goto out;
>  }
>  
>  int fuse_reply_ioctl(fuse_req_t req, int result, const void *buf, size_t size)
> @@ -663,11 +657,11 @@ int fuse_reply_ioctl(fuse_req_t req, int result, const void *buf, size_t size)
>  int fuse_reply_ioctl_iov(fuse_req_t req, int result, const struct iovec *iov,
>                           int count)
>  {
> -    struct iovec *padded_iov;
> +    g_autofree struct iovec *padded_iov = NULL;
>      struct fuse_ioctl_out arg;
>      int res;
>  
> -    padded_iov = malloc((count + 2) * sizeof(struct iovec));
> +    padded_iov = g_try_new(struct iovec, count + 2);
>      if (padded_iov == NULL) {
>          return fuse_reply_err(req, ENOMEM);
>      }
> @@ -680,7 +674,6 @@ int fuse_reply_ioctl_iov(fuse_req_t req, int result, const struct iovec *iov,
>      memcpy(&padded_iov[2], iov, count * sizeof(struct iovec));
>  
>      res = send_reply_iov(req, 0, padded_iov, count + 2);
> -    free(padded_iov);
>  
>      return res;
>  }
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index 9e437618fb..9b00687cb0 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -295,6 +295,8 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
>      VuVirtqElement *elem = &req->elem;
>      int ret = 0;
>  
> +    g_autofree struct iovec *in_sg_cpy = NULL;
> +
>      assert(count >= 1);
>      assert(iov[0].iov_len >= sizeof(struct fuse_out_header));
>  
> @@ -347,8 +349,7 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
>       * Build a copy of the the in_sg iov so we can skip bits in it,
>       * including changing the offsets
>       */
> -    struct iovec *in_sg_cpy = calloc(sizeof(struct iovec), in_num);
> -    assert(in_sg_cpy);
> +    in_sg_cpy = g_new(struct iovec, in_num);
>      memcpy(in_sg_cpy, in_sg, sizeof(struct iovec) * in_num);
>      /* These get updated as we skip */
>      struct iovec *in_sg_ptr = in_sg_cpy;
> @@ -386,7 +387,6 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
>              ret = errno;
>              fuse_log(FUSE_LOG_DEBUG, "%s: preadv failed (%m) len=%zd\n",
>                       __func__, len);
> -            free(in_sg_cpy);
>              goto err;
>          }
>          fuse_log(FUSE_LOG_DEBUG, "%s: preadv ret=%d len=%zd\n", __func__,
> @@ -410,13 +410,11 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
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
>  
>      /* Need to fix out->len on EOF */
>      if (len) {
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


