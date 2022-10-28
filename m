Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF3C61162A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 17:42:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooRU7-00015L-0O; Fri, 28 Oct 2022 11:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ooRSl-0000yz-2I
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 11:40:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ooRSj-0002Tj-E0
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 11:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666971599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6sgiR3pFfFVQNVjXKb+P/CIdnGo2/dZc1xJB59465Fg=;
 b=CA4E4RINXcuk/8p5kHT2/+i+eL2wIGtuO1MA2goDM+NvqbkFDp+PgQM6D5qc88tELrAKGI
 Ympf9PPyOa+RVaqMfj2GOgAQkt49zsIQw7QqY6xtRpf6sr7jcrW9++maBUCAdhB5m7jUX9
 gQR18eY6IcfLe6KBiQJ63iO8PX4Z4WY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-Fzh8C4nMNb2Yn8zuzEVcew-1; Fri, 28 Oct 2022 11:39:55 -0400
X-MC-Unique: Fzh8C4nMNb2Yn8zuzEVcew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BCFC887410;
 Fri, 28 Oct 2022 15:39:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66C6A40C6EC3;
 Fri, 28 Oct 2022 15:39:53 +0000 (UTC)
Date: Fri, 28 Oct 2022 17:39:52 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 1/3] linux-aio: use LinuxAioState from the running
 thread
Message-ID: <Y1v3yD+1wP6y1fFq@redhat.com>
References: <20221028122048.3101120-1-eesposit@redhat.com>
 <20221028122048.3101120-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028122048.3101120-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 28.10.2022 um 14:20 hat Emanuele Giuseppe Esposito geschrieben:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> Remove usage of aio_context_acquire by always submitting asynchronous
> AIO to the current thread's LinuxAioState.
> 
> In order to prevent mistakes from the caller side, avoid passing LinuxAioState
> in laio_io_{plug/unplug} and laio_co_submit.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

> @@ -354,14 +354,18 @@ static uint64_t laio_max_batch(LinuxAioState *s, uint64_t dev_max_batch)
>      return max_batch;
>  }
>  
> -void laio_io_plug(BlockDriverState *bs, LinuxAioState *s)
> -{
> +void laio_io_plug(void){

The brace should be on the next line.

> +    AioContext *ctx = qemu_get_current_aio_context();
> +    LinuxAioState *s = aio_get_linux_aio(ctx);
> +
>      s->io_q.plugged++;
>  }

Kevin


