Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BAA5FC2AC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 11:07:36 +0200 (CEST)
Received: from localhost ([::1]:42138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiXiB-0007Mt-Lk
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 05:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oiXb3-0001BV-1U
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:00:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oiXb1-0008LI-DJ
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665565210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hdYjrdWh6bgeFVGZ45zuCuOoYD9YZgD2ekJQfTxkTIk=;
 b=KLMVzdNT7hzMGxZLyU2+0TabZqkFm340gdgIHhhoGEmN2A8oTvG4xGBUcF8U++KIXjJM3q
 2rGUpcoYm+Jchs7ZstWs/HIpri6zkkbzXD2zc2ybTrrjX6eNDsD7fLSHPOjaaeGLZaY04p
 h5qZo3RhsIQ19FdFsdPc77iNZPMEpn4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-veO-_eHxN6yVBqr4wjg5gw-1; Wed, 12 Oct 2022 05:00:07 -0400
X-MC-Unique: veO-_eHxN6yVBqr4wjg5gw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1438F811E67;
 Wed, 12 Oct 2022 09:00:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5134140EBF3;
 Wed, 12 Oct 2022 09:00:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0268B18003A8; Wed, 12 Oct 2022 11:00:04 +0200 (CEST)
Date: Wed, 12 Oct 2022 11:00:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] ui/gtk-egl: egl context needs to be unbound in the end
 of gd_egl_switch
Message-ID: <20221012090004.kccwng3eqdt3r5ie@sirius.home.kraxel.org>
References: <20220928215805.4661-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928215805.4661-1-dongwon.kim@intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 02:58:05PM -0700, Dongwon Kim wrote:
> A thread often fails to bind an egl context to itself after guest VM is
> rebooted because the context is still owned by another thread. It is not
> very clear what condition makes this happen but this can be prevented
> by unbinding the context from the thread in the end of gd_egl_switch.

Added to queue,

thanks,
  Gerd


