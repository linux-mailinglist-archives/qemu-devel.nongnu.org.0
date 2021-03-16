Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F6A33D5D8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:35:55 +0100 (CET)
Received: from localhost ([::1]:49488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMAna-00015F-7E
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMAm9-0000cD-KP
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMAm4-00088H-NZ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615905258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oTZ8oFKu/nfrlGf/N6ohaiyzMevze2nIwjz2Sc9iguY=;
 b=QLd+sn1XocrQVruuXXdC1eQ+7BM/Sz7ZE5cGGlrRNeRT7ojEFKnPjFy452J6DDRykFdDHl
 DoqJYsnXC2lDx02zGoAf/lQHKSCyrhfe0hA4TN6SN71F7EyoucQJfoHKQNFScBd29UUHAS
 FxGsf/RqYUHgWbBhPXOaLtw1hmQ++Lo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-8BMQ2kl9PzqjnhHvEawbjA-1; Tue, 16 Mar 2021 10:34:17 -0400
X-MC-Unique: 8BMQ2kl9PzqjnhHvEawbjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1AE01084D68;
 Tue, 16 Mar 2021 14:34:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 931B110023B0;
 Tue, 16 Mar 2021 14:34:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D58A31800626; Tue, 16 Mar 2021 15:34:13 +0100 (CET)
Date: Tue, 16 Mar 2021 15:34:13 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "mail@knazarov.com" <mail@knazarov.com>
Subject: Re: [PATCH v3 1/3] edid: move timing generation into a separate
 function
Message-ID: <20210316143413.hxzt3wk5hk62syed@sirius.home.kraxel.org>
References: <20210315114639.91953-1-mail@knazarov.com>
 <20210316133228.ew4j6f5yoxds4iyy@sirius.home.kraxel.org>
 <593A5DAE-F6DE-4239-839D-D0202D06C980@knazarov.com>
MIME-Version: 1.0
In-Reply-To: <593A5DAE-F6DE-4239-839D-D0202D06C980@knazarov.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 05:01:50PM +0300, mail@knazarov.com wrote:
> I've based my work on Akihiko Odaki's previous patchset that introduced dynamic refresh rate (see "Based-on" in the description).
> Should I rebase it to master?

Not needed.  Noticed that Based-on meanwhile, and applying in order
works fine.

take care,
  Gerd


