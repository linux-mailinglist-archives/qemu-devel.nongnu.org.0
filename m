Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D3F4E3CAD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 11:43:09 +0100 (CET)
Received: from localhost ([::1]:33668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbym-0004Oy-Ie
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 06:43:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nWbxR-0003gm-OT
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:41:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nWbxP-0002Y6-2a
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647945701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AuhVeXIKzJnWugLcRjBF/hz/aaKZF81UvAYelnvfVb4=;
 b=JseWDYZdcttf9yJk5Ue7+ZLkYuano0+L9mOw0phx0kDZTwvzhXzLTDHlWVPQJsyOHT2UaV
 Scb8O9NeEvxl0dnS0snJei8sDmK705zL0noWkfrfPLXmjHxKNrAiZy+yuGced38kUdlxtR
 j7I0gmFXz8PdKrtmtRHzi4E36odt9Wo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-RzEATh-XNnuAe1AYAFJcLg-1; Tue, 22 Mar 2022 06:41:38 -0400
X-MC-Unique: RzEATh-XNnuAe1AYAFJcLg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59825803D7A;
 Tue, 22 Mar 2022 10:41:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29F734B6105;
 Tue, 22 Mar 2022 10:41:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AEF3B180062E; Tue, 22 Mar 2022 11:41:36 +0100 (CET)
Date: Tue, 22 Mar 2022 11:41:36 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Subject: Re: [PATCH v4 0/6] Introduce CanoKey QEMU
Message-ID: <20220322104136.qoqvfn2xbyjbnoev@sirius.home.kraxel.org>
References: <YfJozy5qjVYh24Xp@Sun> <Yge2Sy2sA6JpUvcj@Sun>
 <20220304105119.wcmgrlefsawnqmc2@sirius.home.kraxel.org>
 <Yjl4KqzeVBjNL1z0@Sun>
MIME-Version: 1.0
In-Reply-To: <Yjl4KqzeVBjNL1z0@Sun>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > I'd suggest to run the patch series through the qemu gitlab CI
> > before sending out v5.
> 
> I have gone through qemu gitlab CI and the result is in
> https://gitlab.com/ZenithalHourlyRate/qemu/-/pipelines/497317417
> Except check-dco and check-patch (I only generate Signed-off-by line
> when `git format-patch`), other failed checks are "allowed to fail" and
> I've checked the log, these failures are about Debian RISC-V packages
> instead of qemu itself.

Sounds fine.  The risc-v bits seem to be in progress still, I have
failures with them too.

> Is this appropriate for sending out v5?
> 
> By the way, we are planning to separate libcanokey-qemu.so
> from canokey-core to a dedicated repo at
> https://github.com/canokeys/canokey-qemu
> (not done yet), which would result in changes in documentation.
> I will contain these changes in v5 once we are done.

If you want split the library it makes sense to do that (and test in CI)
before sending out v5.

No need to hurry right now, qemu is in freeze for the 7.0 release so it
can be merged only after the tree re-opens for 7.1 development (roughly
one month from now).

take care,
  Gerd


