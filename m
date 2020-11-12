Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DDA2B089E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 16:42:29 +0100 (CET)
Received: from localhost ([::1]:35348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdEk0-0007Os-1I
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 10:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdEhz-00067d-Ky
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:40:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdEhy-0000QG-2w
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605195621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QYdBlhMiF+nF4G3DLduV3dvnOVLs/rg5hPXdiT1bNW0=;
 b=GNJrQNh2HcNctAWb5w3MdZos5tucR4n+tDc2wYwZ5Dh7FFR5ATroZDN/L+4mpbryQLe3qa
 hRwUNgEK6/74/keP9CuzyE1nHc9AXpzOtrvNJ0ih/qn45LOlpBjPM+fq5Y/aLiwca47j6l
 l0mxThlU7VlTxzzCfXxjVYrnHZSp6Q0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-F9GSiZdPM3KjSNb2z8tpEg-1; Thu, 12 Nov 2020 10:40:19 -0500
X-MC-Unique: F9GSiZdPM3KjSNb2z8tpEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A42E80475A;
 Thu, 12 Nov 2020 15:40:18 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-37.ams2.redhat.com
 [10.36.114.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 292171002C0E;
 Thu, 12 Nov 2020 15:40:08 +0000 (UTC)
Subject: Re: [PATCH for-5.2 09/10] vhost-user-blk-test: test discard/write
 zeroes invalid inputs
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201111124331.1393747-1-stefanha@redhat.com>
 <20201111124331.1393747-10-stefanha@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <b900227e-37b1-3f59-ad66-0ef7078cdc4a@redhat.com>
Date: Thu, 12 Nov 2020 16:40:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111124331.1393747-10-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.11.20 13:43, Stefan Hajnoczi wrote:
> Exercise input validation code paths in
> block/export/vhost-user-blk-server.c.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/export/vhost-user-blk-server.c |   4 +-
>   tests/qtest/vhost-user-blk-test.c    | 124 +++++++++++++++++++++++++++
>   2 files changed, 126 insertions(+), 2 deletions(-)
> 
> diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
> index 3295d3c951..d88e41714d 100644
> --- a/block/export/vhost-user-blk-server.c
> +++ b/block/export/vhost-user-blk-server.c
> @@ -248,8 +248,8 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
>               break;
>           }
>   
> -        req->in->status = vu_blk_discard_write_zeroes(vexp, elem->out_sg,
> -                                                      out_num, type);
> +        req->in->status = vu_blk_discard_write_zeroes(vexp, out_iov, out_num,
> +                                                      type);
>           break;
>       }
>       default:

Looks like this hunk should be squashed into the previous patch.  I 
think that would lift my confusion.

Max


