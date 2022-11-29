Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4C763C9EC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 21:54:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p07cX-0004YP-0S; Tue, 29 Nov 2022 15:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p07cL-0004Y2-RK; Tue, 29 Nov 2022 15:54:13 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p07cI-0002CE-QO; Tue, 29 Nov 2022 15:54:12 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-3b10392c064so151822297b3.0; 
 Tue, 29 Nov 2022 12:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/4MUeXEFHXcBMhRxMct1efFeEhq1CAuF6IGxjeqM9vE=;
 b=Y4B5qK5xNQjyykzmhLCjRdfqEsUZCmfz+6kHza9UKMqaegQju3kCnqPfPRl2Mu/n9F
 lgwbzVdPAfJkoKHe65M71sR6vMgtYYVFDu5JU3QjLhzrQz+0MAq7MPVvPMqMXoNMfjMq
 q9IGkCm+wxc+XEr12nB1sE1miIx/v1EV+KA2Kq06nFKvY2yyq57ZLL6hWqsb4cPJVZce
 fH/GmaEIFq/grYGqgFI04S9mjbwUqI1J8tw5abi+NeuoWi6RQC5AMNKc7UYmOeLV0uox
 a/Eo7Jr6Ad+H6EyNtOZ3D3O3clACGrvwEttiolE8Qr0q1aPxwgoXzZ/Q9ctTdvu7Sb1G
 meew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/4MUeXEFHXcBMhRxMct1efFeEhq1CAuF6IGxjeqM9vE=;
 b=4hap3XCyCfe+lGJUu1humo4TknRSVjbqsHjCrHy6BNXWBSHl5t0z65m1jHKNBvXwGC
 r+4XvaO6LEewo7yBLItp7Sjzr7h8iF5rGRzb22T5Z+WEbNZPcfaYRHgaN1+Ijyxlbi+W
 XCvmgiw9WRmmAd3DZU9GuwAfX0h0lE4uq2LLEhBMH7U6P7Co+CqyOXInXrn72VoVNhtX
 ZMJ8HyE0msK1DCx15Z1XQtlRd7CrXoOSbZ+ZZ0gE3dJ+lAdasYTTz38TU5+EMpkIbCRi
 HdXiFcpBuqfEWKkVn5Bfgk8liG9Eyic34+2M1C18WGuxEC2wFBrYyKBEo+pStgWJaD+/
 +Uvw==
X-Gm-Message-State: ANoB5pl0MsagkOio3mQrt6Iow8FBuJU23zyuASEcuXPHKPuCx7TqByyI
 pumUW9s1NUlOq+9P+STuK5MqAcSVYEmsBaRk78M=
X-Google-Smtp-Source: AA0mqf5yygTRv/Xhxa6EQ8lnkWVUOVxlHeYl1xW9WeYTvmLA8L/il82iTTp2ohY558ulj3jWPjU/qPKVP2F1x4WKuks=
X-Received: by 2002:a81:1d84:0:b0:3ce:492c:ae78 with SMTP id
 d126-20020a811d84000000b003ce492cae78mr6514601ywd.62.1669755249449; Tue, 29
 Nov 2022 12:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20221121211923.1993171-1-stefanha@redhat.com>
 <Y3yGeRWfJn2fGF9x@redhat.com>
In-Reply-To: <Y3yGeRWfJn2fGF9x@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 29 Nov 2022 15:53:57 -0500
Message-ID: <CAJSP0QXhW1YOiqr3AZ6a=y9DWLvj+ByMQrM9pYUUOc-Ukp3r8A@mail.gmail.com>
Subject: Re: [PATCH for-7.2] block-backend: avoid bdrv_unregister_buf() NULL
 pointer deref
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 22 Nov 2022 at 03:22, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 21.11.2022 um 22:19 hat Stefan Hajnoczi geschrieben:
> > bdrv_*() APIs expect a valid BlockDriverState. Calling them with bs=NULL
> > leads to undefined behavior.
> >
> > Jonathan Cameron reported this following NULL pointer dereference when a
> > VM with a virtio-blk device and a memory-backend-file object is
> > terminated:
> > 1. qemu_cleanup() closes all drives, setting blk->root to NULL
> > 2. qemu_cleanup() calls user_creatable_cleanup(), which results in a RAM
> >    block notifier callback because the memory-backend-file is destroyed.
> > 3. blk_unregister_buf() is called by virtio-blk's BlockRamRegistrar
> >    notifier callback and undefined behavior occurs.
> >
> > Fixes: baf422684d73 ("virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint")
> > Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
>
> This raises some questions, though. What happens if the graph isn't
> static between creation and deletion of the device? Do we need to do
> something with registered buffers when a node is attached to or detached
> from an existing device?

I think you are right. Graph changes need to be handled. Right now they aren't.

Stefan

