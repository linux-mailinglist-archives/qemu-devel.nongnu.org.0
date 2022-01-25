Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA3B49AE0E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 09:33:29 +0100 (CET)
Received: from localhost ([::1]:58760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCHGa-0004yh-5N
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 03:33:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCH9Z-00020R-3f
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 03:26:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCH9Q-0003PW-9u
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 03:26:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643099162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KH+aoVZxmMeXzWKrbqpQbkwBJT6cYJkDQqYKeFtWK00=;
 b=T6bgFO5ncgPRhzQxs48OsJtzAkIOx1+n41zRM6ev7umuVrGzV6uR/YEIjd5oo6j4CwiLun
 nWQSnR4dDP2quU7j/3NEOVDN0c6nPRM/RXdsjZkE6KyNNsdMREU2G12Gg2p3vwK0ZJDknM
 Kub0tyRS6lOR1Qy6amSiSDmJjWSBh10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-Yat8xYjLPeyiKeqqZVrL1g-1; Tue, 25 Jan 2022 03:25:56 -0500
X-MC-Unique: Yat8xYjLPeyiKeqqZVrL1g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE18084BA40;
 Tue, 25 Jan 2022 08:25:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7879D78DD9;
 Tue, 25 Jan 2022 08:25:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CD15218003A0; Tue, 25 Jan 2022 09:25:52 +0100 (CET)
Date: Tue, 25 Jan 2022 09:25:52 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sven Schnelle <svens@stackframe.org>
Subject: Re: [PATCH 3/3] hw/display/artist: rewrite vram access mode handling
Message-ID: <20220125082552.uupa7yyqdnpxgopw@sirius.home.kraxel.org>
References: <20220121221619.1069447-1-svens@stackframe.org>
 <20220121221619.1069447-4-svens@stackframe.org>
MIME-Version: 1.0
In-Reply-To: <20220121221619.1069447-4-svens@stackframe.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +static void artist_vram_write4(ARTISTState *s, struct vram_buffer *buf,
> +                               uint32_t offset, uint32_t data)

> +static int get_vram_offset(ARTISTState *s, struct vram_buffer *buf,
> +                           int pos, int posy)

> +    case 0x13a0:
> +        artist_vram_write4(s, buf, get_vram_offset(s, buf, pos >> 2, posy),
> +                           data);

That is asking for trouble.

You should pass around offsets not pointers.  An offset can trivially be
checked whenever it is within the valid range (i.e. smaller than vram
size), or it can be masked to strip off high bits when accessing virtual
vram.  You need that for robustness and security reasons (i.e. make sure
the guest can't write to host memory by tricking your get_vram_offset
calculations).

grep cirrus for 'cirrus_addr_mask' to see sample code.

take care,
  Gerd


