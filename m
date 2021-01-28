Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F236307581
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 13:08:16 +0100 (CET)
Received: from localhost ([::1]:41718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l565v-0004ym-09
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 07:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l55iX-0004ca-UV
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:44:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l55iV-0006jI-A4
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:44:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611834241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8R6kgoxYpavOMQMPBsq7KnAEVjamgNB4emGLrOleOeM=;
 b=IT25lUJPtaGMt2EoLDEX4i0yseEhnlC88IxkoomDf5ZGI+FUkmv+K7TVYlLtzeWtq8dWYg
 F6O+wtScnrpi7A03Rjsi+xxlUZi7CD69IFdquokNmNE6sMX5/Mxi7t5r1HW0e4JEPsUM1Q
 Vexg0CAFydsVMErP8u8v5Aj2Z71uWX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-W1lBGf78OtCGo2qme_PJeA-1; Thu, 28 Jan 2021 06:43:59 -0500
X-MC-Unique: W1lBGf78OtCGo2qme_PJeA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99E591005513
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 11:43:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C2065D743;
 Thu, 28 Jan 2021 11:43:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EA61A18000B1; Thu, 28 Jan 2021 12:43:52 +0100 (CET)
Date: Thu, 28 Jan 2021 12:43:52 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH] spice: delay starting until display are initialized
Message-ID: <20210128114352.tvwnx435qbqcv4a4@sirius.home.kraxel.org>
References: <20210128111319.329755-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210128111319.329755-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> diff --git a/ui/spice-display.c b/ui/spice-display.c
> index 0178d5766d..3d3e3bcb22 100644
> --- a/ui/spice-display.c
> +++ b/ui/spice-display.c
> @@ -1188,4 +1188,6 @@ void qemu_spice_display_init(void)
>          }
>          qemu_spice_display_init_one(con);
>      }

       if (runstate_is_running()) {
            qemu_spice_display_start();
       }

Isn't that enough?

take care,
  Gerd


