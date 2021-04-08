Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5176335812E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:53:57 +0200 (CEST)
Received: from localhost ([::1]:40740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUSIO-0001hM-E3
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUSGi-0000tt-DI
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:52:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUSGh-00065r-42
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:52:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617879130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jFriI4r632GGodsr57aRv6Oss/q4XYlODTbHN0vPTBQ=;
 b=BlbgcckT8qKWlbkG6cVg/m+//3W4jFfem9pmvci+0T/J+ob3RFg1KBmq15/gizhjpoDDmV
 uSkDzM4H3++USBJ96MWT1knPgMo4fWsm0VDXpospaznnVEnT1yIgDG9RLnZo3gCV13eADn
 AobZjoHVNe2lQ38Bvvq9BblwNwB0PiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-9zQ-IyNuOW-BNOmeqNIepg-1; Thu, 08 Apr 2021 06:52:06 -0400
X-MC-Unique: 9zQ-IyNuOW-BNOmeqNIepg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A399379EC3;
 Thu,  8 Apr 2021 10:52:05 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-19.ams2.redhat.com [10.36.115.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A415319D9F;
 Thu,  8 Apr 2021 10:52:03 +0000 (UTC)
Date: Thu, 8 Apr 2021 12:52:02 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-6.0?] hw/block/fdc: Fix 'fallback' property on sysbus
 floppy disk controllers
Message-ID: <YG7gUkZjCIaGAKbV@merkur.fritz.box>
References: <20210407133742.1680424-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210407133742.1680424-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-block@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.04.2021 um 15:37 hat Philippe Mathieu-Daudé geschrieben:
> Setting the 'fallback' property corrupts the QOM instance state
> (FDCtrlSysBus) because it accesses an incorrect offset (it uses
> the offset of the FDCtrlISABus state).
> 
> Fixes: a73275dd6fc ("fdc: Add fallback option")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks, applied to the block branch.

Kevin


