Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9882854CED7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:38:55 +0200 (CEST)
Received: from localhost ([::1]:60990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1W2g-0001Af-3D
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1o1VP8-0002ch-3J
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:58:02 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:36226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1o1VP6-0008Hc-2x
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:58:01 -0400
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-lGrU5rIqMTKrBpQ_3dPErg-1; Wed, 15 Jun 2022 11:57:55 -0400
X-MC-Unique: lGrU5rIqMTKrBpQ_3dPErg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6F771C03360;
 Wed, 15 Jun 2022 15:57:54 +0000 (UTC)
Received: from bahia (unknown [10.39.192.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2839F2026D64;
 Wed, 15 Jun 2022 15:57:54 +0000 (UTC)
Date: Wed, 15 Jun 2022 17:57:53 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 7/7] tests/9pfs: check fid being unaffected in
 fs_walk_2nd_nonexistent
Message-ID: <20220615175753.1a43e4b0@bahia>
In-Reply-To: <6f0813cafdbf683cdac8b1492dd4ef8699c5b1d9.1647339025.git.qemu_oss@crudebyte.com>
References: <cover.1647339025.git.qemu_oss@crudebyte.com>
 <6f0813cafdbf683cdac8b1492dd4ef8699c5b1d9.1647339025.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Tue, 15 Mar 2022 11:08:47 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Extend previously added test case by checking that fid was unaffected
> by 'Twalk' request (i.e. when 2nd path component of request being
> invalid). Do that by subsequently sending a 'Tgetattr' request with
> the fid previously used for 'Twalk'; that 'Tgetattr' request should
> return an 'Rlerror' response by 9p server with error code ENOENT as
> that fid is basically invalid.
> 
> And as we are at it, also check that the QID returned by 'Twalk' is
> not identical to the root node's QID.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  tests/qtest/virtio-9p-test.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index f6e78d388e..2784ee4b2d 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -721,14 +721,19 @@ static void fs_version(void *obj, void *data, QGuestAllocator *t_alloc)
>      do_version(obj);
>  }
>  
> -static void do_attach(QVirtio9P *v9p)
> +static void do_attach_rqid(QVirtio9P *v9p, v9fs_qid *qid)
>  {
>      P9Req *req;
>  
>      do_version(v9p);
>      req = v9fs_tattach(v9p, 0, getuid(), 0);
>      v9fs_req_wait_for_reply(req, NULL);
> -    v9fs_rattach(req, NULL);
> +    v9fs_rattach(req, qid);
> +}
> +
> +static void do_attach(QVirtio9P *v9p)
> +{
> +    do_attach_rqid(v9p, NULL);
>  }
>  
>  static void fs_attach(void *obj, void *data, QGuestAllocator *t_alloc)
> @@ -1101,19 +1106,32 @@ static void fs_walk_2nd_nonexistent(void *obj, void *data,
>  {
>      QVirtio9P *v9p = obj;
>      alloc = t_alloc;
> +    v9fs_qid root_qid;
>      uint16_t nwqid;
> +    uint32_t fid, err;
> +    P9Req *req;
>      g_autofree v9fs_qid *wqid = NULL;
>      g_autofree char *path = g_strdup_printf(
>          QTEST_V9FS_SYNTH_WALK_FILE "/non-existent", 0
>      );
>  
> -    do_attach(v9p);
> -    do_walk_rqids(v9p, path, &nwqid, &wqid);
> +    do_attach_rqid(v9p, &root_qid);
> +    fid = do_walk_rqids(v9p, path, &nwqid, &wqid);
>      /*
>       * The 9p2000 protocol spec says: "nwqid is therefore either nwname or the
>       * index of the first elementwise walk that failed."
>       */
>      assert(nwqid == 1);
> +
> +    /* returned QID wqid[0] is file ID of 1st subdir */
> +    g_assert(wqid && wqid[0] && !is_same_qid(root_qid, wqid[0]));
> +
> +    /* expect fid being unaffected by walk above */
> +    req = v9fs_tgetattr(v9p, fid, P9_GETATTR_BASIC, 0);
> +    v9fs_req_wait_for_reply(req, NULL);
> +    v9fs_rlerror(req, &err);
> +
> +    g_assert_cmpint(err, ==, ENOENT);
>  }
>  
>  static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)


