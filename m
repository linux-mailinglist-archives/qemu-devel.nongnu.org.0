Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A452DA91E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 09:25:55 +0100 (CET)
Received: from localhost ([::1]:60300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp5ec-0002QN-CS
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 03:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kp5cg-0001tM-SO
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:23:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kp5cf-0005Zj-9r
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:23:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608020632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wl3NGaLuuseJ2dh2M+rB6F+K8gncdIMlFqrrSyqLeKE=;
 b=bk2Fh48Es6wTPiWaYEiDPXYwfHsVWjUYdovBMThusHL6eak2wz7YeUE5QEX3H6ZRPiRa5y
 lFNN6nANsgJ/yqVmcUdHVCWAQWrsSZsFPU4KmBF5ATwuWyspTj3NSHPNRGIWGkCtg7M+ow
 +Hh4XA6B9S8O6xneDOBuYNJ9BK4i2FM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-F3_KxZSUPaKZKuFvNiCh2A-1; Tue, 15 Dec 2020 03:23:51 -0500
X-MC-Unique: F3_KxZSUPaKZKuFvNiCh2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D34A107ACE6;
 Tue, 15 Dec 2020 08:23:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1267262467;
 Tue, 15 Dec 2020 08:23:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3400217532; Tue, 15 Dec 2020 09:23:46 +0100 (CET)
Date: Tue, 15 Dec 2020 09:23:46 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] audio: Simplify audio_bug() removing old code
Message-ID: <20201215082346.i5sboprra42jh3s2@sirius.home.kraxel.org>
References: <20201210223506.263709-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201210223506.263709-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 10, 2020 at 11:35:06PM +0100, Philippe Mathieu-Daudé wrote:
> This code (introduced in commit 1d14ffa97ea, Oct 2005)
> is likely unused since years. Time to remove it.  If
> the condition is true, simply call abort().
> 
> Suggested-by: Gerd Hoffmann <gerd@kraxel.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Added to audio queue.

thanks,
  Gerd


