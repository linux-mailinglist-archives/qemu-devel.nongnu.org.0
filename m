Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7FA337322
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:55:21 +0100 (CET)
Received: from localhost ([::1]:46578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKqW-0005HJ-HJ
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:55:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKo3-0003sI-RQ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:52:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKo2-0000kX-DR
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615467165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9juw3j3p9Hp3euCUGwjQfalC3AHD7GWAWoIa54aEWRs=;
 b=d0z/Fr6K7S5R4mYXa3eGY7vr4P2FtKYjhtQ8ODpdJO8Wy3ujgoHFamEzsIQXXKWLsx2BFq
 SgeVjzWNZY2IAMpBhOepW3ARRgBLhy8AaNDJaVRO3y5AXc3yB+NhMIEsEBd/EUAHgebIi7
 CYXo91MoK96+jQ4LQi3ku4GNutbedxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-gDsi8-w7OsqT98-r6OaTTQ-1; Thu, 11 Mar 2021 07:52:43 -0500
X-MC-Unique: gDsi8-w7OsqT98-r6OaTTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA83080982E;
 Thu, 11 Mar 2021 12:52:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6790607CB;
 Thu, 11 Mar 2021 12:52:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3257F180087E; Thu, 11 Mar 2021 13:52:40 +0100 (CET)
Date: Thu, 11 Mar 2021 13:52:40 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Do not exit immediately after shutdown
Message-ID: <20210311125240.fx5fgdiewoiydatf@sirius.home.kraxel.org>
References: <CAFEAcA_eKtZ--p=S9P7_9cEDxfvBVsb_aP4p6Luc+9XutGDxYA@mail.gmail.com>
 <20210219111652.20623-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210219111652.20623-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 08:16:52PM +0900, Akihiko Odaki wrote:
> ui/cocoa used to call exit immediately after calling
> qemu_system_shutdown_request, which prevents QEMU from actually
> perfoming system shutdown. Just sleep forever, and wait QEMU to call
> exit and kill the Cocoa thread.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Added to UI patch queue.

thanks,
  Gerd


