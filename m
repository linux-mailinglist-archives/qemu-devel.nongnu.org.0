Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA041F0B27
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Jun 2020 14:52:15 +0200 (CEST)
Received: from localhost ([::1]:42136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhumb-0002m4-P1
	for lists+qemu-devel@lfdr.de; Sun, 07 Jun 2020 08:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jhulk-0002GN-VV
 for qemu-devel@nongnu.org; Sun, 07 Jun 2020 08:51:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49915
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jhulj-0004kn-Ur
 for qemu-devel@nongnu.org; Sun, 07 Jun 2020 08:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591534278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+BktcmVc3MxZOCnk2+omLUGJVmlXT5UIKRxlgMpZ7gs=;
 b=R9lrSLWyPOR9AfL5ZggKO9gciX6fYv1327ybk+rYfAzoi16WpHvHZjNhn9yyd8dK28flgt
 YdsioAsYYhKEr1tiGc/F6nuOqSduqSp2gnyKMe40cNU3yFXI9BASZfo9a54aaI9ZK75Qn4
 ZVGPPWivluK726FVqm0AdhU0ChOWYkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-WshTFW97OgGmh0eWzy3InA-1; Sun, 07 Jun 2020 08:51:14 -0400
X-MC-Unique: WshTFW97OgGmh0eWzy3InA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75AE3107ACCA;
 Sun,  7 Jun 2020 12:51:12 +0000 (UTC)
Received: from starship (unknown [10.35.206.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F89F7E7F9;
 Sun,  7 Jun 2020 12:51:08 +0000 (UTC)
Message-ID: <637776f353f0037f29ed3da9563cd40314aefef6.camel@redhat.com>
Subject: Re: [PATCH v6 00/20] nvme: small fixes, refactoring and cleanups
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Date: Sun, 07 Jun 2020 15:51:07 +0300
In-Reply-To: <20200602153134.GJ5940@linux.fritz.box>
References: <20200514044611.734782-1-its@irrelevant.dk>
 <20200602153134.GJ5940@linux.fritz.box>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/07 08:00:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-06-02 at 17:31 +0200, Kevin Wolf wrote:
> Am 14.05.2020 um 06:45 hat Klaus Jensen geschrieben:
> > From: Klaus Jensen <k.jensen@samsung.com>
> > 
> > Changes since v5
> > ~~~~~~~~~~~~~~~~
> > * Prefixed all patches with "hw/block/nvme" to avoid confusion with the
> >   nvme block driver.
> > 
> > * Added patch two patches:
> > 
> >     hw/block/nvme: fix pin-based interrupt behavior
> >     hw/block/nvme: allow use of any valid msix vector
> > 
> >   These were previously posted separately, but I'm including them in this
> >   series since I didnt get any response on the separate series anyway.
> > 
> > * Fixed Maxim's email in the R-b on "hw/block/nvme: refactor
> >   nvme_addr_read"
> 
> Thanks, applied to the block branch.

Great to see that code merged!

Note that while I kind of didn't review some of
the latest patches mostly becasue I was doing other things,
I do plan to keep on reviewing following patches in this activety.

Best regards,
	Maxim Levitsky

> 
> Kevin
> 
> 



