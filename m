Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB6E63ABFB
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 16:10:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozfks-0003HO-Rz; Mon, 28 Nov 2022 10:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ozfkq-0003H7-Me
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:09:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ozfkp-0006ce-92
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669648146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g/0MfCsrG3LMlNTSoDTgNdxLpItel2pOGDccOh/DEIU=;
 b=e/7LDQgMrPNVqW021wLEtpQJbP6qntDV0C3eMzmcCD4NiBTWHr0XSG/QPgqJFXTyVyAa1Y
 NB0ULuz/JRRqNsoGXSB/HFQ1XfkXbH+rvxXNirx3xSU3Z+cKbzXBpds4QdOmdXhBcsAib1
 JjohlqbIw4fl0NEYaLnaxae0GNjZHkY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-d0PUFl36MLekD2Kk7qtzJQ-1; Mon, 28 Nov 2022 10:09:02 -0500
X-MC-Unique: d0PUFl36MLekD2Kk7qtzJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BEE8833A1A;
 Mon, 28 Nov 2022 15:09:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C43FE1415125;
 Mon, 28 Nov 2022 15:09:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3514B1800080; Mon, 28 Nov 2022 16:08:53 +0100 (CET)
Date: Mon, 28 Nov 2022 16:08:53 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH-for-7.2 3/5] hw/display/qxl: Pass requested buffer
 size to qxl_phys2virt()
Message-ID: <20221128150853.lp2hdkdzt6ou6f6g@sirius.home.kraxel.org>
References: <20221128134832.84867-1-philmd@linaro.org>
 <20221128134832.84867-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128134832.84867-4-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

> @@ -228,7 +230,7 @@ static void qxl_unpack_chunks(void *dest, size_t size, PCIQXLDevice *qxl,
>          if (offset == size) {
>              return;
>          }
> -        chunk = qxl_phys2virt(qxl, chunk->next_chunk, group_id);
> +        chunk = qxl_phys2virt(qxl, chunk->next_chunk, group_id, bytes);
>          if (!chunk) {
>              return;
>          }

Naa, its not that simple.  You get a QXLDataChunk passed in which
typically is verified *excluding* dynamically-sized chunk->data.

Also at least one code path (processing SPICE_CURSOR_TYPE_MONO in
qxl_cursor) goes access chunk.data[] without calling
qxl_unpack_chunks(), that needs additional verification too (or
switch it to call qxl_unpack_chunks, or just drop it because nobody
uses mono chrome cursors anyway).

take care,
  Gerd


