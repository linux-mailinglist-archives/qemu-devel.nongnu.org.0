Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7431D48C8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 10:49:45 +0200 (CEST)
Received: from localhost ([::1]:51432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZW2K-00031b-Eg
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 04:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZW13-0001yc-FT
 for qemu-devel@nongnu.org; Fri, 15 May 2020 04:48:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44439
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZW12-0003k9-2c
 for qemu-devel@nongnu.org; Fri, 15 May 2020 04:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589532502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQhoWATu0c3kALn1sz3oRSpyo1Pom0fSDXYCrRDVslA=;
 b=Rd4fQCamWN17BT2Fi5MbPtiVjZipisi0qO4pjQ0Zcrj7U/CCbWxScD5pSysFFChIk9+r+/
 lMNYqaqyX6vop6KhGDZUr9MrtDael8a9h6zP2Dewrh/5LEeVMtro6bwQqcYy84w0ePDkVG
 sWgRIzXm0EhfHIC0qR++XUvW1E266Yo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-C04L7KQwPCuerTCm3T4iyw-1; Fri, 15 May 2020 04:48:20 -0400
X-MC-Unique: C04L7KQwPCuerTCm3T4iyw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB371835B46;
 Fri, 15 May 2020 08:48:19 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-110.ams2.redhat.com [10.36.113.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B38835C1D6;
 Fri, 15 May 2020 08:48:18 +0000 (UTC)
Date: Fri, 15 May 2020 10:48:17 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] hw/ide: Make IDEDMAOps handlers take a const IDEDMA
 pointer
Message-ID: <20200515084817.GA93011@linux.fritz.box>
References: <20200512194917.15807-1-philmd@redhat.com>
 <01f5f413-d1d0-43cb-65cc-9f7bd1e59893@redhat.com>
MIME-Version: 1.0
In-Reply-To: <01f5f413-d1d0-43cb-65cc-9f7bd1e59893@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 22:56:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.05.2020 um 22:21 hat John Snow geschrieben:
> 
> 
> On 5/12/20 3:49 PM, Philippe Mathieu-Daudé wrote:
> > Handlers don't need to modify the IDEDMA structure.
> > Make it const.
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> I'll trust your judgment. As long as it still compiles and passes
> qtests, I'm happy if you're happy.
> 
> Acked-by: John Snow <jsnow@redhat.com>

Does this mean you assume someone else will merge it? If that someone is
me, please let me know.

Kevin


