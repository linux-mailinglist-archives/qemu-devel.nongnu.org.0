Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFD83872D2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 09:05:24 +0200 (CEST)
Received: from localhost ([::1]:35094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1litn9-0003Tc-Cm
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 03:05:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1litlh-0002Ju-Q8
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:03:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1litle-00024v-Kn
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:03:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621321429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2IPvAeZ04YNKYEkIBTC6+qlC+f83y2IdlnvIIw1YcAc=;
 b=Cp9bcTptjX6RYBofG1rxc5wn0BrVDie/mkXRDoGqiyqkH3Kdky6HzglZCPgmq5DibKybHo
 OmYc3ooLd9fOGGjLoMk+m13lWpDIJ87c0VotW6TxtbAmmz8IJ3zJHVfFJiDYjV46Xrxcah
 89qAhS3bmFeZ2XLQ5dBHP/ltJVf292g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-DkP0H09HMJq4uwyjg0Kp8Q-1; Tue, 18 May 2021 03:03:47 -0400
X-MC-Unique: DkP0H09HMJq4uwyjg0Kp8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0F91180FD66;
 Tue, 18 May 2021 07:03:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A1E8687D4;
 Tue, 18 May 2021 07:03:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B5019180079B; Tue, 18 May 2021 09:03:44 +0200 (CEST)
Date: Tue, 18 May 2021 09:03:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: maobibo <maobibo@loongson.cn>
Subject: Re: [PATCH] hw/display/qxl: Set pci rom address aligned with page size
Message-ID: <20210518070344.eucma2btkgq3dcgp@sirius.home.kraxel.org>
References: <1621065983-18305-1-git-send-email-maobibo@loongson.cn>
 <20210517071900.q3kff56ixqgxj5lo@sirius.home.kraxel.org>
 <90aba8a2-acdc-73b7-a83d-7bca630e9176@loongson.cn>
MIME-Version: 1.0
In-Reply-To: <90aba8a2-acdc-73b7-a83d-7bca630e9176@loongson.cn>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_TONAME_EQ_TOLOCAL_SHORT=1.878, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, May 18, 2021 at 09:06:31AM +0800, maobibo wrote:
> Sorry I do not state the background clearly.
> 
> Page size is 16K on my MIPS machine, and it supports running
> guest OS in kvm mode and qxl vga card can used for VM.

Ok.  Please add that to the commit message.

Also there is no need to rewrite the function and drop the
BUILD_BUG_ON().  Just using "return QEMU_ALIGN_UP(QXL_ROM_SZ, pagesize)"
should work fine.

Is the host page size fixed on mips?

take care,
  Gerd


