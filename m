Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551434B4C9C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 11:49:21 +0100 (CET)
Received: from localhost ([::1]:45928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJYv2-0003vI-Bb
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 05:49:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nJYqQ-0000qa-T1
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:44:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nJYqO-0001Pd-Dc
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:44:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644835471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5vVVGRCh/TRMt9Q37Hb6YEwRqPFDs0fDb8Mgbw5Sp9o=;
 b=GmGWzWCRbINhimSmLa7rwa7kaSrjOO8DQdRnR5P9MaQKBRXxyB9heJNlKdnGieYpVbWscs
 IDSM4GoaB2GbFcjYWrhxYU7EWMCmlDycrP9A4dtLnRZcEFji3FbXF7kamP+q7dNxJu9omI
 5iC25ramgJRl7tZPEnDSAiwCH4b4Dl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-t5SsIE8wM-i5HxTd4j1-5Q-1; Mon, 14 Feb 2022 05:44:28 -0500
X-MC-Unique: t5SsIE8wM-i5HxTd4j1-5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2EB718B613A;
 Mon, 14 Feb 2022 10:44:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C2A47BB45;
 Mon, 14 Feb 2022 10:44:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 35FD61800091; Mon, 14 Feb 2022 11:44:03 +0100 (CET)
Date: Mon, 14 Feb 2022 11:44:03 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [RFC PATCH v2 00/25] Virtio Sound card Implementation
Message-ID: <20220214104403.xzzjy3iihnafe4vv@sirius.home.kraxel.org>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
 <20220211221319.193404-1-chouhan.shreyansh2702@gmail.com>
 <a910913f-9621-1b75-d9a1-e5e7e0e5a135@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <a910913f-9621-1b75-d9a1-e5e7e0e5a135@vivier.eu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> IMHO, all your patches can be merged in only one.

For the most part yes.  I'd keep the pci wrapper (aka -device
virtio-snd-pci) separate though.  Possibly also patches adding
significant functionality in the future (i.e. one patch with all
basics and playback support, one patch adding recording
functionality, ...).

> Morever it would help for
> review as some patches remove code done in previous patches.

Yes, squashing the incremental fixes at the end of the series makes
sense.

take care,
  Gerd


