Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786FD3876B4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:39:22 +0200 (CEST)
Received: from localhost ([::1]:32940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lix8D-0005oF-G7
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lix0X-0001wv-Fd
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:31:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lix0V-0004AO-7w
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621333882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oyxZRTVaEWq2eAn1ko65PvkcmvKiNYjdqgsKR8Tfu+c=;
 b=JTgiqp2XD5Beu5O/z4VMUY+67BmAkVcJhjndB6W9JVa8lNXYubWDzZ25GxwGSrtFiIkrZg
 2u2oEBgZrPBzeWAYnahC1Gx9336XPC4b3FJoqL08CaM+cpsqAiufoRD2aL/o42ZSlXYgAL
 o8Ivbe+FWwpq2Ps/LqQuJF1tqiQVEOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-D9pZNujWORyefaE2BCzkWQ-1; Tue, 18 May 2021 06:31:20 -0400
X-MC-Unique: D9pZNujWORyefaE2BCzkWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B99C91005E40;
 Tue, 18 May 2021 10:31:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E17617A9B;
 Tue, 18 May 2021 10:31:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 813C2180079B; Tue, 18 May 2021 12:31:14 +0200 (CEST)
Date: Tue, 18 May 2021 12:31:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Li Qiang <liq3ea@163.com>
Subject: Re: [PATCH v2 0/8] vhost-user-gpu: fix several security issues
Message-ID: <20210518103114.lkycbxm2iixenpy5@sirius.home.kraxel.org>
References: <20210516030403.107723-1-liq3ea@163.com>
MIME-Version: 1.0
In-Reply-To: <20210516030403.107723-1-liq3ea@163.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: mcascell@redhat.com, liq3ea@gmail.com, qemu-devel@nongnu.org,
 ppandit@redhat.com, marcandre.lureau@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, May 15, 2021 at 08:03:55PM -0700, Li Qiang wrote:
> These security issue is low severity and is similar with the
> virtio-vga/virtio-gpu device. All of them can be triggered by
> the guest user.
> 
> Change since v1:
> Add the CVE information:
> Several memory leak issues is combined assigned CVE-2021-3544.
> Information disclosure is assigned CVE-2021-3545.
> OOB memory write access is assigned CVE-2021-3545.
> 
> Abstract 'vg_cleanup_mapping_iov' to make code more clearly.

Added all ti vga queue.

thanks,
  Gerd


