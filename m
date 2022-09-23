Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 589B55E7B02
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 14:42:18 +0200 (CEST)
Received: from localhost ([::1]:49092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obi0X-0003In-Ez
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 08:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obhr3-0005RR-7a
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:32:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obhr0-00076W-HS
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663936345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UnPp/GDLnYshUiSerJSg2VLco3wDkb+UL0BbJ5qvCOM=;
 b=W0zF9AJ7bG/714XmLUfPKXP7FDnJ/GfzVTWUnmcjZyaTk4dHu/NoHvQ6rI7hlEQqD3wsBh
 VD8UULmcIYQyvS31DdRPSn1X8H2M1rM057yvr+Xo0TSelOTBUCa+5FuDaOCQO9zRmZfUh7
 ZFodn2Wth3w5hmn53g4d20wk5fzqzCA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-57faNf0iOwqhGUTnq6iHtA-1; Fri, 23 Sep 2022 08:32:21 -0400
X-MC-Unique: 57faNf0iOwqhGUTnq6iHtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6526D185A7A4;
 Fri, 23 Sep 2022 12:32:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 125D11121314;
 Fri, 23 Sep 2022 12:32:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 953A21800622; Fri, 23 Sep 2022 14:32:19 +0200 (CEST)
Date: Fri, 23 Sep 2022 14:32:19 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: qemu-devel@nongnu.org, gert.wollny@collabora.com,
 dmitry.osipenko@collabora.com, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 4/4] virtio-gpu: Don't require udmabuf when blob
 support is enabled
Message-ID: <20220923123219.ofn2ygm4knljo6w2@sirius.home.kraxel.org>
References: <20220913105022.81953-1-antonio.caggiano@collabora.com>
 <20220913105022.81953-5-antonio.caggiano@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913105022.81953-5-antonio.caggiano@collabora.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 13, 2022 at 12:50:22PM +0200, Antonio Caggiano wrote:
> From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> Host blobs don't need udmabuf, it's only needed by guest blobs. The host
> blobs are utilized by the Mesa virgl driver when persistent memory mapping
> is needed by a GL buffer, otherwise virgl driver doesn't use blobs.
> Persistent mapping support bumps GL version from 4.3 to 4.5 in guest.
> Relax the udmabuf requirement.

What about blob=on,virgl=off?

In that case qemu manages the resources and continued to require
udmabuf.

Patches 1-3 look good, queued them up.

thanks,
  Gerd


