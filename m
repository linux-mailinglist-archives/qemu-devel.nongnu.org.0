Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDA963BA51
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 08:10:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozukf-0000Gr-78; Tue, 29 Nov 2022 02:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ozukc-0000FE-Of
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 02:09:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ozuka-0005vT-IA
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 02:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669705791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aA1OvnxCjm3ip+ODInGvQxTouX6H/IEoRkT4rtKZtgM=;
 b=SDyKya+IiJAeyW1juoruia7VdYxk7Rgfntolu78++EBgXYGOyUAha27B0dw9xTLOF216TE
 zwrSY5tAZy8QsYNpMG5wXHDMo/fOXAIxIWEePWlPQwYoS4lK/nXYtpDtvggxWw6L6ntDnb
 wVnGY97KPjQf84E5jkpBFd/gFcxbCto=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-iTC9eS2sP0OcenXdbrUV9A-1; Tue, 29 Nov 2022 02:09:47 -0500
X-MC-Unique: iTC9eS2sP0OcenXdbrUV9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1E3E1C09B61;
 Tue, 29 Nov 2022 07:09:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 599222028DC1;
 Tue, 29 Nov 2022 07:09:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C12D21800080; Tue, 29 Nov 2022 08:09:42 +0100 (CET)
Date: Tue, 29 Nov 2022 08:09:42 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>
Subject: Re: [RFC PATCH-for-7.2 v3 3/5] hw/display/qxl: Pass requested buffer
 size to qxl_phys2virt()
Message-ID: <20221129070942.zvvnirxxnt2axvkr@sirius.home.kraxel.org>
References: <20221128202741.4945-1-philmd@linaro.org>
 <20221128202741.4945-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128202741.4945-4-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

> @@ -228,7 +230,8 @@ static void qxl_unpack_chunks(void *dest, size_t size, PCIQXLDevice *qxl,
>          if (offset == size) {
>              return;
>          }
> -        chunk = qxl_phys2virt(qxl, chunk->next_chunk, group_id);
> +        chunk = qxl_phys2virt(qxl, chunk->next_chunk, group_id,
> +                              sizeof(QXLDataChunk) + chunk->data_size);
>          if (!chunk) {
>              return;
>          }

Not checking the first chunk?

> @@ -314,7 +318,15 @@ int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
>      }
>      switch (cmd->type) {
>      case QXL_CURSOR_SET:
> -        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id);
> +        /* First read the QXLCursor to get QXLDataChunk::data_size ... */
> +        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id,
> +                               sizeof(QXLCursor));
> +        if (!cursor) {
> +            return 1;
> +        }
> +        /* Then read including the chunked data following QXLCursor. */
> +        cursor = qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id,
> +                               sizeof(QXLCursor) + cursor->chunk.data_size);
>          if (!cursor) {
>              return 1;
>          }

Ah, you do it here.  Good.

Series:
Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


