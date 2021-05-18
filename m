Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D2E387361
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 09:37:58 +0200 (CEST)
Received: from localhost ([::1]:58886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liuIf-0004Sj-Eu
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 03:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1liuHw-0003oA-82
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:37:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1liuHu-00070j-69
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:37:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621323428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SMyEufS+z0f4I5mENOrCNC7nMe4Av00D/YOwSqdmaWs=;
 b=iK+wnYIQXgK8sshBXW4fKgnB00w4rIrQRda16/jzpW5NVBvMxXELeUE1ZYMJYkg5Jo0TQz
 3hUyWxB7RaX04tpoMiw16MPcl1xpfhQSzBVRel7HD29D7QGPvbt5F6xn8PW/tWxcGhkOrj
 /Tb3MrRwBa2Bi9bUv2khr8tyZYRzOS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-tbygslhIMWGBz3s-hTGTvQ-1; Tue, 18 May 2021 03:37:06 -0400
X-MC-Unique: tbygslhIMWGBz3s-hTGTvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D08E7501F4;
 Tue, 18 May 2021 07:37:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87B5B2C2C8;
 Tue, 18 May 2021 07:37:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D2E59180079B; Tue, 18 May 2021 09:37:03 +0200 (CEST)
Date: Tue, 18 May 2021 09:37:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: maobibo <maobibo@loongson.cn>
Subject: Re: [PATCH] hw/display/qxl: Set pci rom address aligned with page size
Message-ID: <20210518073703.i5gzjdmsem4aqsva@sirius.home.kraxel.org>
References: <1621065983-18305-1-git-send-email-maobibo@loongson.cn>
 <20210517071900.q3kff56ixqgxj5lo@sirius.home.kraxel.org>
 <90aba8a2-acdc-73b7-a83d-7bca630e9176@loongson.cn>
 <20210518070344.eucma2btkgq3dcgp@sirius.home.kraxel.org>
 <e50f51d3-3779-985e-4c56-39ea0446aa13@loongson.cn>
MIME-Version: 1.0
In-Reply-To: <e50f51d3-3779-985e-4c56-39ea0446aa13@loongson.cn>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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

  Hi,

> > Is the host page size fixed on mips?
> 
> No, it is not fixed on mips, and it can be selected by linux kernel config.

Hmm.  So the rom size can differ depending on host kernel config.
Which is bad.  It'll break live migration between hosts with
different page sizes (or wouldn't that work anyway for other reasons?).

What page sizes are supported on mips?  4k and 16k I assume?
So maybe just use 16k unconditionally on mips?

take care,
  Gerd


