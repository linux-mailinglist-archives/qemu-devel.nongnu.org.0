Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559925E7A29
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 14:07:48 +0200 (CEST)
Received: from localhost ([::1]:45078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obhT8-0004Ki-Bn
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 08:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obhIw-0008Qr-Bh
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 07:57:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obhIt-0007A7-47
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 07:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663934229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ijzOaF3la8HhIeYgAC7kdmM0K8Lp18mBkPnKG7gc31o=;
 b=Kmi1W7ijmQlqJMfl0h02iTON/qu8OAaHus6iMNl9bHPUb20ixp8TTJCOfUppfCKWBubap+
 SeNkV94aN0razPFR/gJyB3ReqVfKqDCcUCYu3JLpphDUYu6BUVeOFQXO5MXihAloJ5/sTI
 9YBDcJlST+gtnnhqBnsdvYwhBQD8Cew=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-UNYGGZ6ZOFyBB8ket544lA-1; Fri, 23 Sep 2022 07:57:06 -0400
X-MC-Unique: UNYGGZ6ZOFyBB8ket544lA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34082811E87;
 Fri, 23 Sep 2022 11:57:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B2EBC15BA4;
 Fri, 23 Sep 2022 11:57:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A1F4518000A3; Fri, 23 Sep 2022 13:57:04 +0200 (CEST)
Date: Fri, 23 Sep 2022 13:57:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Cal Peake <cp@absolutedigital.net>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [PATCH] ui/console: Get tab completion working again in the SDL
 monitor vc
Message-ID: <20220923115704.rzuuprby74gfq4qt@sirius.home.kraxel.org>
References: <7054816e-99c-7e2-6737-7cf98cc56e2@absolutedigital.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7054816e-99c-7e2-6737-7cf98cc56e2@absolutedigital.net>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Aug 11, 2022 at 06:01:38PM -0400, Cal Peake wrote:
> Define a QEMU special key constant for the tab key and add an entry for
> it in the qcode_to_keysym table. This allows tab completion to work again
> in the SDL monitor virtual console, which has been broken ever since the
> migration from SDL1 to SDL2.
> 
> Signed-off-by: Cal Peake <cp@absolutedigital.net>

Patch added to queue.

thanks,
  Gerd


