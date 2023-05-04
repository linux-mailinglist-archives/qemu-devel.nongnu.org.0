Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF376F694D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 12:53:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puWaW-0002cH-HP; Thu, 04 May 2023 06:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1puWaU-0002Wq-Uz
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:53:26 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1puWaT-0006lX-E7
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=IxbDaIfBalgMo2RJRQrPB8v4ZUbWTjagq6R7ow68/1k=; b=qkRaboEAynS6vpxpRNbV9zf1wu
 rThlTVwnJVT6IztqG/oMOG3+NecWUxOmWDCaeL99fuXKQ28bnUuO8wBBhN5a7h3SLANdQb3J7Wtx8
 Jk+K1mCoWSa3PUUPNa8eNy0HpHVyWhFQjPSvX2ScX/TZMMsdHk4wOxFl6VFxkvUJwvDIJ6F/tOMam
 I/qzpZ5Ik247RUVaAV29K9+8xtNizLyub8F2LywD2/irBFQkaxTRSXC45u/sacH5NZtOrnmkSf+3Y
 2PbMjqhDciOMfYvVlLgcNkAsbnus7xbqEHRPaxKFteynA/LXWD5UUcmycfMUNFjg2NUhXEbx0Nd2n
 Xvb0VDxLYyOFCkXApfDdXaOTnhDZeK6n+4HGMJwXt3MXiKyUF/Am1vppOhPqeAhnKoTkdx7vnxmj/
 WJCF8HbaF+c+KAKAwnAM/i9Zf5/a3cFu51u7wejSn8Y/ps6ZmU33WZNIP7cdDs6zCalIzNeOl49tg
 NWhT87OpghSv6GI6IdlnVKAqHen+2D/mA7V2i1MjWSbClvspztoA0jqsqhvm11LSfMQbV778Y2wQb
 +nCD3o7kDd6P9TmzbdV8plCyt7i2oK4VVq3XpgH1VJAziBZWSiGRiiy/5Uv4x/UFiwKTLQSTR3a4Q
 gNg7cnhCJxQ0chbxIy13jFavykHdad0CwmazlTZ90=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] tests/9p: fix potential leak in v9fs_rreaddir()
Date: Thu, 04 May 2023 12:53:23 +0200
Message-ID: <1693120.2MmiF5DkHb@silver>
In-Reply-To: <E1psh5T-0002XN-1C@lizzy.crudebyte.com>
References: <E1psh5T-0002XN-1C@lizzy.crudebyte.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Saturday, April 29, 2023 11:25:33 AM CEST Christian Schoenebeck wrote:
> Free allocated directory entries in v9fs_rreaddir() if argument
> `entries` was passed as NULL, to avoid a memory leak. It is
> explicitly allowed by design for `entries` to be NULL. [1]
> 
> [1] https://lore.kernel.org/all/1690923.g4PEXVpXuU@silver
> 
> Reported-by: Coverity (CID 1487558)
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck

>  tests/qtest/libqos/virtio-9p-client.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
> index e4a368e036..b8adc8d4b9 100644
> --- a/tests/qtest/libqos/virtio-9p-client.c
> +++ b/tests/qtest/libqos/virtio-9p-client.c
> @@ -594,6 +594,8 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
>  {
>      uint32_t local_count;
>      struct V9fsDirent *e = NULL;
> +    /* only used to avoid a leak if entries was NULL */
> +    struct V9fsDirent *unused_entries = NULL;
>      uint16_t slen;
>      uint32_t n = 0;
>  
> @@ -612,6 +614,8 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
>              e = g_new(struct V9fsDirent, 1);
>              if (entries) {
>                  *entries = e;
> +            } else {
> +                unused_entries = e;
>              }
>          } else {
>              e = e->next = g_new(struct V9fsDirent, 1);
> @@ -628,6 +632,7 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
>          *nentries = n;
>      }
>  
> +    v9fs_free_dirents(unused_entries);
>      v9fs_req_free(req);
>  }
>  
> 



