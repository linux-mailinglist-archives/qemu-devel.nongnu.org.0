Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07F537A5B0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:24:14 +0200 (CEST)
Received: from localhost ([::1]:32980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQUn-0007NM-Qv
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lgQT7-0005Oj-OD
 for qemu-devel@nongnu.org; Tue, 11 May 2021 07:22:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lgQT0-0000fV-4t
 for qemu-devel@nongnu.org; Tue, 11 May 2021 07:22:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620732141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RG8T1iAyeLN0djsxCKLK1mvTZosoRglYv+1SEnrSSLc=;
 b=DIiK4fL912PKPwwlyn0qefwK/kNEW5h1ZY/tXW7Lc6xXqRGRFEg5Na89xiLlfl21ogvcH7
 bmuyfsM0rX2fcZA40wRJl4P3d9XDcst6846B7EABb3yjZTFp+mHt65NqzeX0McOeHVLaGe
 ee08A/O2jlY72xhPI73lDaPb8lR1XRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-Zt5EuMYzMM2t4DxFgDxG2g-1; Tue, 11 May 2021 07:22:19 -0400
X-MC-Unique: Zt5EuMYzMM2t4DxFgDxG2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A802803620;
 Tue, 11 May 2021 11:22:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE43C63C40;
 Tue, 11 May 2021 11:22:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 258F91800399; Tue, 11 May 2021 13:22:16 +0200 (CEST)
Date: Tue, 11 May 2021 13:22:16 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v3 03/20] virtio-gpu: Add udmabuf helpers
Message-ID: <20210511112216.za6wa54nmrxs7sil@sirius.home.kraxel.org>
References: <20210511080818.366985-1-vivek.kasireddy@intel.com>
 <20210511080818.366985-4-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210511080818.366985-4-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
> +{
> +    uint32_t size = res->width * res->height * 4;

Hmm, no.  We'll go use udmabufs for blob resources only, so this should
not be needed.  Maybe squash this with patch #8?

take care,
  Gerd


