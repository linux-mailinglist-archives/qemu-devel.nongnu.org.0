Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AB0372815
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:28:31 +0200 (CEST)
Received: from localhost ([::1]:46114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrLy-0007oL-Eh
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldr8l-0005bm-SV
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:14:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldr8j-0000Zj-5b
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620119686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DLKqF+7U5VCSddBeJ6lSKvupku1YOSccGBTKRfn7eZU=;
 b=cLdt0r9q95+zqdNkBNuX2FKgutCpL/9A3GDqTXaCRVzYhid199qSPD1WipFQe+FpB4KEnz
 HW8wg9Zz1O5a83l27AW/w8xmyMpg7sLiy3tQxFQZ7Q47nXljRwcnphBy6eRs5yA2Rvkcwn
 +X5MfIoswY7nca6hIyKBqfOdNwrMuRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-yGSxjw3sP1qDVw6WKwOi0Q-1; Tue, 04 May 2021 05:14:42 -0400
X-MC-Unique: yGSxjw3sP1qDVw6WKwOi0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A17B107ACC7;
 Tue,  4 May 2021 09:14:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E32B660D08;
 Tue,  4 May 2021 09:14:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7F0D31800383; Tue,  4 May 2021 11:14:38 +0200 (CEST)
Date: Tue, 4 May 2021 11:14:38 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Rainer =?utf-8?Q?M=C3=BCller?= <raimue@codingfarm.de>
Subject: Re: [PATCH 1/2] input-linux: Delay grab toggle if keys are pressed
Message-ID: <20210504091438.p7kk3heyowpduyzq@sirius.home.kraxel.org>
References: <20210501190622.153901-1-raimue@codingfarm.de>
 <20210501190622.153901-2-raimue@codingfarm.de>
MIME-Version: 1.0
In-Reply-To: <20210501190622.153901-2-raimue@codingfarm.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, May 01, 2021 at 09:06:21PM +0200, Rainer Müller wrote:
> When multiple keyboards are passed to the guest with input-linux, there
> could still be keys pressed on the other keyboard when toggling grab.
> Delay toggling grab on the other keyboard until all keys are released,
> otherwise keys could be stuck on host without a key up event.

Hmm, if you have two keyboards plugged into your machine, why would you
assign both to a virtual machine?  Instead of simply using one for the
host and one for the guest?

take care,
  Gerd


