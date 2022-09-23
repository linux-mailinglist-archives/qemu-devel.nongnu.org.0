Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B29D5E7A46
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 14:12:44 +0200 (CEST)
Received: from localhost ([::1]:37784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obhXu-0008WE-JT
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 08:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obhLy-0001dK-ME
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:00:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obhLw-0008IZ-IP
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663934399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/vp+xlXETIC9s7StE8kDbMTLJMFSgVa6cPHNSupGhjY=;
 b=ASPl6LcSo6QCDHMM5APbmOnWVZF4PkUfxfHvM1OUjv7ymvqhFSnViYyU+XXklH0EfdA4sk
 /xeW1cuA/ZjOpb/d4uoNqbNgUKQEDkZGVyEgXsiWKjOUjkZyY11NspIdlQxhCqfv4rp6Nv
 TMuZooBbpxc45wQF6pAq1vmjrxEXqoE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-MpoJv_CvN_euBtlIxbhk1w-1; Fri, 23 Sep 2022 07:59:56 -0400
X-MC-Unique: MpoJv_CvN_euBtlIxbhk1w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B380882820;
 Fri, 23 Sep 2022 11:59:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C9594B3FCD;
 Fri, 23 Sep 2022 11:59:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 767E218000A3; Fri, 23 Sep 2022 13:59:53 +0200 (CEST)
Date: Fri, 23 Sep 2022 13:59:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 0/3] ui/cocoa: Run qemu_init in the main thread
Message-ID: <20220923115953.r3nxyoealq37jvz6@sirius.home.kraxel.org>
References: <20220819132756.74641-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220819132756.74641-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

On Fri, Aug 19, 2022 at 10:27:53PM +0900, Akihiko Odaki wrote:
> This work is based on:
> https://patchew.org/QEMU/20220317125534.38706-1-philippe.mathieu.daude@gmail.com/
> 
> Simplify the initialization dance by running qemu_init() in the main
> thread before the Cocoa event loop starts. The secondary thread only
> runs only qemu_main_loop() and qemu_cleanup().
> 
> This fixes a case where addRemovableDevicesMenuItems() calls
> qmp_query_block() while expecting the main thread to still hold
> the BQL.
> 
> Overriding the code after calling qemu_init() is done by dynamically
> replacing a function pointer variable, qemu_main when initializing
> ui/cocoa, which unifies the static implementation of main() for
> builds with ui/cocoa and ones without ui/cocoa.
> 
> v5: Rebased to 4d65d4ba57372c57a1236fb5cb789dbcc100645c, restoring the
>     exit() call in call_qemu_main() and dropping Reviewed-by from
>     "ui/cocoa: Run qemu_init in the main thread".
> 
> v4: Asynchronously call -[NSApplication terminate:] to avoid potential
>     deadlock with qemu_thread_join(). (Paolo Bonzini)
> 
> v3: Document functions involved in startup. (Peter Maydell)
> 
> v2: Restore allow_events flag to fix the crash reported by
>     Philippe Mathieu-Daudé.
> 
> Akihiko Odaki (3):
>   ui/cocoa: Run qemu_init in the main thread
>   Revert "main-loop: Disable block backend global state assertion on
>     Cocoa"
>   meson: Allow to enable gtk and sdl while cocoa is enabled

Patches added to queue.

thanks,
  Gerd


