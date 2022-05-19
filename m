Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BF052D0DB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 12:53:06 +0200 (CEST)
Received: from localhost ([::1]:34204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrdm3-00042N-PM
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 06:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nrdho-00023m-78
 for qemu-devel@nongnu.org; Thu, 19 May 2022 06:48:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nrdhm-0004Hi-IC
 for qemu-devel@nongnu.org; Thu, 19 May 2022 06:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652957309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B3AXvWhl0llqq3l6Xp5FJm7Ssi9rdW6QJrpoKrjALYs=;
 b=F+AYYY1YtqQMdOZej063LiaDhdk6u0RV5RkpcCK8fzdeqvu9VO96b0uq2qOIXPSdKjkbFD
 a+G52cdA+noLV6RCu8m0b62j/xLxhZWeVrCUljrlJvXXzCl1vH2m7UfFFeSxrAkET+Z1FT
 aa/vRu331/XtBoXkNVFpzWcUCu4v6cM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-rc6Er2fsOcyAJReraBQmNA-1; Thu, 19 May 2022 06:48:26 -0400
X-MC-Unique: rc6Er2fsOcyAJReraBQmNA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CF6D85A5A8;
 Thu, 19 May 2022 10:48:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEBDB2026D6A;
 Thu, 19 May 2022 10:48:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 86DDF18000A3; Thu, 19 May 2022 12:48:24 +0200 (CEST)
Date: Thu, 19 May 2022 12:48:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Ryan El Kochta <relkochta@gmail.com>
Subject: Re: [PATCH v2 2/3] ui: Switch "-display sdl" to use the QAPI parser
Message-ID: <20220519104824.gkrkbsbs3xwuytgr@sirius.home.kraxel.org>
References: <20220518134446.211632-1-thuth@redhat.com>
 <20220518134446.211632-3-thuth@redhat.com>
 <87pmkakhdk.fsf@pond.sub.org>
 <f1e31bd1-551e-0366-8a59-d012b23bb88e@redhat.com>
 <fa3d97ca-ae63-30aa-4b0b-10f786069e15@redhat.com>
 <0fa5a892-0053-4172-60f3-d6e5a49a23fd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fa5a892-0053-4172-60f3-d6e5a49a23fd@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Oh well, I just noticed that we already have a GrabToggleKeys enum in
> qapi/common.json ... I wonder whether I should try to use that instead? It
> seems to be used in a slightly different context, though, if I get that
> right ...?

qemu/ui/input-linux.c

Those switch the input routing between host and guest, and they act on
their own (i.e. by default both control keys without anything else).

For SDL it defines the modifiers to press in addition to the hotkeys
(i.e. ctrl + shift + 'G' for grab release, IIRC there a are more, 'F'
for fullscreen?).

So I don't think it makes sense to merge them.

take care,
  Gerd


