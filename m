Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1D4445130
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 10:32:34 +0100 (CET)
Received: from localhost ([::1]:33212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miZ6n-0006c7-9b
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 05:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1miZ5R-0005pI-T7
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 05:31:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1miZ5P-0008By-9U
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 05:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636018266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vzrsZKhdGjh8TDHt4DgTSyadH73PAtnrdpvOgTUdGCM=;
 b=Sf8JJyU1n9nsNsaxM8ZfMzIUpEVqhOxtKFyrV+mfHAeHqq9TlBOBRMWj2dgdDMpDE1bBRB
 +LvKu4XLO1YY9aPYKBAB18gxqub0Y8qMp/7E4afRODhS5e3nwTwlzUAugivlAgWd0N5anv
 nNGjnEB7e7ActwGXlGHb/cA+SmL1/Uk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-Fi2lP-vTPv2EfKHiJldyBQ-1; Thu, 04 Nov 2021 05:31:03 -0400
X-MC-Unique: Fi2lP-vTPv2EfKHiJldyBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16D851017965;
 Thu,  4 Nov 2021 09:31:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8329360FB8;
 Thu,  4 Nov 2021 09:31:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CE7531800923; Thu,  4 Nov 2021 10:30:59 +0100 (CET)
Date: Thu, 4 Nov 2021 10:30:59 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [PATCH v2 1/2] virtio-gpu: splitting one extended mode guest fb
 into n-scanouts
Message-ID: <20211104093059.qfnnsb6ydpzxdt5e@sirius.home.kraxel.org>
References: <20210706235255.7575-1-dongwon.kim@intel.com>
 <20210726215950.26705-1-dongwon.kim@intel.com>
 <20211102135154.lfntfm7wdswa5kdf@sirius.home.kraxel.org>
 <20211103004110.GA751@dongwonk-MOBL.amr.corp.intel.com>
 <20211103053937.on4dg37wmkx2f2t5@sirius.home.kraxel.org>
 <20211104071937.GA1257@dongwonk-MOBL.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <20211104071937.GA1257@dongwonk-MOBL.amr.corp.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, vivek.kasireddy@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 04, 2021 at 12:19:37AM -0700, Dongwon Kim wrote:
> I found the virtio-gpu-splitting-one-extended-mode-guest-fb-into.patch
> didn't include the func interface change in one of stubs. I believe
> that was the reason for win32/64 build failure (verified it with gitlab
> CI). I updated that patch then I combined all 6 (4 for untabifying issue
> and 2 for multiple guest scanouts with blob) into one patch series and just
> sent it to as a reply.

Versioning the individual patches doesn't work very well, it confuses
tools like b4 (https://pypi.org/project/b4/).  Just bumb the version for
all patches.

One is applied already, probably slipped through when dropping the
failing patches.

Current patch queue: https://gitlab.com/kraxel/qemu/-/commits/queue/egl/
CI running right now.

> Regarding Vivek's series for default sync mechanism that you referred
> below, that series has already been merged.

That explains nicely why it doesn't apply cleanly ;)

take care,
  Gerd


