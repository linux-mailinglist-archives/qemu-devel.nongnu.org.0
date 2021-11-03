Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0693E443CD6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 06:45:36 +0100 (CET)
Received: from localhost ([::1]:51352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi95a-00061R-OZ
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 01:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mi901-0004hy-Cf
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 01:39:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mi8zy-00076X-Vf
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 01:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635917984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fRh/Ps6VaquJl0BLOU5aT1KqpepWTIbgu9JinG7cCCE=;
 b=MTeGUYsfYjxsIt9IEu1UPL3DjCdICrAcgnk9ZNU+6FMNL9LH8j3eWkDLjsnBXGUD1Qu74U
 ag4FIo5Fxax4sIa7OGgT3De6LYNOnJLFyItt45/Gg2S2zyJmDfbmyUUkM9oYR7kr491bs1
 yeOif1x9HDruPbnkaE3AbCcHgqhEby0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-TPRzXb-lOgSctBcHpzwY6Q-1; Wed, 03 Nov 2021 01:39:41 -0400
X-MC-Unique: TPRzXb-lOgSctBcHpzwY6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FFCC10A8E00;
 Wed,  3 Nov 2021 05:39:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B85F55D9D3;
 Wed,  3 Nov 2021 05:39:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D85BD1800924; Wed,  3 Nov 2021 06:39:37 +0100 (CET)
Date: Wed, 3 Nov 2021 06:39:37 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [PATCH v2 1/2] virtio-gpu: splitting one extended mode guest fb
 into n-scanouts
Message-ID: <20211103053937.on4dg37wmkx2f2t5@sirius.home.kraxel.org>
References: <20210706235255.7575-1-dongwon.kim@intel.com>
 <20210726215950.26705-1-dongwon.kim@intel.com>
 <20211102135154.lfntfm7wdswa5kdf@sirius.home.kraxel.org>
 <20211103004110.GA751@dongwonk-MOBL.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <20211103004110.GA751@dongwonk-MOBL.amr.corp.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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

On Tue, Nov 02, 2021 at 05:41:10PM -0700, Dongwon Kim wrote:
> I double-checked the patch and also tried to build with --disable-opengl
> but couldn't find any issue. Can you please give me some hint? Like
> build errors you saw. What are changed by the patch are pretty much
> limited to virtio-gpu blob case and just one change in common area is
> egl_fb_blit function but the function interface stays same and there are
> no variables enabled only with certain define.
> 
> Is there any chance that the build system was building it with the
> previous patch, "ui/gtk-egl: un-tab and re-tab should destroy egl
> surface and context" still applied?

Hmm, I had applied both, then dropped the failing series, but possibly I
missed some broken patch.

Trying to apply the series on top of the v2 just sent failed.

Any chance you can send a single patch series with all pending patches
(including the "virtio-gpu: Add a default synchronization mechanism for
blobs" series by Vivek which also doesn't apply cleanly any more)?

Ideally tested in gitlab ci?

thanks,
  Gerd


