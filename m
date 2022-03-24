Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198114E69F8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 21:49:30 +0100 (CET)
Received: from localhost ([::1]:40894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXUOe-00083P-LY
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 16:49:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUN0-000791-Rg
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:47:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUMx-0006kT-PX
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648154862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D0ZaUN+3J94e4vFDL9k7Gy4WAqVkhMjIyZhQ6EGMZtE=;
 b=NKm651hB+14jYS0rtIq69+qx76c6hITfWsn46SRva6dof2MtM+tj48CVekxJSf7fodYXyP
 uZGmrXOCM3IMiH+z7uhOuiZL6f8wuPoVDva8o/+aN9mhOFllxZYyu7qoB4CZfZSfwW8n3N
 u9UsOKMoYKXtB70upr2IjJ2nXOkZwYo=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-DMbhpw-7MciXXlt48zv58A-1; Thu, 24 Mar 2022 16:47:41 -0400
X-MC-Unique: DMbhpw-7MciXXlt48zv58A-1
Received: by mail-vs1-f71.google.com with SMTP id
 64-20020a670343000000b00320d34b992eso1234904vsd.1
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 13:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D0ZaUN+3J94e4vFDL9k7Gy4WAqVkhMjIyZhQ6EGMZtE=;
 b=l6Jw8X7mGkLFKVMqDFisRH1NAnrzsfMqMWhPwFOqjHBsOjARLKUtgXHcbK4YEkAtdu
 kEo85v7gutACo3yaD1g0wMlcPxsp3rBaN9DAmP6o2ZEZsX6eYpa3yoTKb1gbkEoY1WTn
 ckzWHWhOxkns2ruPvnofNUQu7tKeJ06pN/3y2P3EnhufvIT8ELj6CX/lTR11lgswW5AV
 I1JJ077DGD869yMbpbxbqmel9s/mqP73wW0Cb/eP9TG7vSt4ChW6Nd9hOk4WvQ8WCOZ2
 bchVd5U5OfF1yNseDtnQseqAG3wSSmeI0frko+ADD6/jxEjzDo7ARjwbzBL4Zkcb76I3
 pgTg==
X-Gm-Message-State: AOAM531doV9m9h6WnXOzyTHi1hWTZRxpR4phHvahOohzXDJUGDwEuaYK
 8MxB2S59K0Swyu/lI4n7vjIVX0vN0/jpLPyfByzfqaFnm6U744OhaURCEJyZOX6Q9N/i7IaH091
 aFaX4pQpaeZw772hYs+J2rAU5KCz+EwA=
X-Received: by 2002:a67:4c3:0:b0:324:ddd7:70d3 with SMTP id
 186-20020a6704c3000000b00324ddd770d3mr3655653vse.61.1648154861173; 
 Thu, 24 Mar 2022 13:47:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzMMdx/odUsud4GcahR58zgD9+oWJRyfVwhglvsIm6k6PFhmqDp75ORGLqUUWsp6dZeI65DIxvBC65M5QXlv4=
X-Received: by 2002:a67:4c3:0:b0:324:ddd7:70d3 with SMTP id
 186-20020a6704c3000000b00324ddd770d3mr3655648vse.61.1648154860955; Thu, 24
 Mar 2022 13:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-4-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-4-victortoso@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 16:47:30 -0400
Message-ID: <CAFn=p-ZAc3xB49KEYf2LOvUKFNVWq3C8EU-vbVpc9QdgAuMqqA@mail.gmail.com>
Subject: Re: [PATCH 03/14] qapi: fix example of BLOCK_IO_ERROR event
To: Victor Toso <victortoso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 1:50 PM Victor Toso <victortoso@redhat.com> wrote:
>
> Reason is not optional.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/block-core.json | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 585a9e020e..5b6c069dd9 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -5059,7 +5059,8 @@
>  #      "data": { "device": "ide0-hd1",
>  #                "node-name": "#block212",
>  #                "operation": "write",
> -#                "action": "stop" },
> +#                "action": "stop",
> +#                "reason": "Driver requires too large request alignment" },
>  #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
>  #
>  ##
> --
> 2.35.1
>

We discourage people using the reason programmatically, but there will
indeed be one. Where'd you pull the message out from?

I see this:

static void send_qmp_error_event(BlockBackend *blk,
                                 BlockErrorAction action,
                                 bool is_read, int error)
{
    IoOperationType optype;
    BlockDriverState *bs = blk_bs(blk);

    optype = is_read ? IO_OPERATION_TYPE_READ : IO_OPERATION_TYPE_WRITE;
    qapi_event_send_block_io_error(blk_name(blk), !!bs,
                                   bs ? bdrv_get_node_name(bs) : NULL, optype,
                                   action, blk_iostatus_is_enabled(blk),
                                   error == ENOSPC, strerror(error));
}


so it should be one of the "standard" strerror messages, right?

--js


