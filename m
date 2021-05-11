Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220CF37A605
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:48:42 +0200 (CEST)
Received: from localhost ([::1]:38156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQsT-0005lv-8p
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lgQmc-0007dP-KV
 for qemu-devel@nongnu.org; Tue, 11 May 2021 07:42:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lgQma-00049Q-Ao
 for qemu-devel@nongnu.org; Tue, 11 May 2021 07:42:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620733355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZqsHcor6qHlCWXsw4nNUwRpEWp5RZOZ3LQzyxoXulgY=;
 b=FoKPoYDCC9wzTNbR/yn0eYnWLFcpiYrFVilik+pglCtxOv3Zm82JKfu26aCM+JxfZ+0yq9
 cTZp8rtIQCuHDB7RfjU+VVECJo5O8UJAsoemidqWgsG+LjS1E2lCrZ9Wjws7Pa2FnvKK74
 8GXhtO8X3pRFo88FZgv5hCWg7MXrZ4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-pmSeCaKcM4S3UE2mC6wINw-1; Tue, 11 May 2021 07:42:33 -0400
X-MC-Unique: pmSeCaKcM4S3UE2mC6wINw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3EB58014D8;
 Tue, 11 May 2021 11:42:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4A686267D;
 Tue, 11 May 2021 11:42:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B53BC1800399; Tue, 11 May 2021 13:42:30 +0200 (CEST)
Date: Tue, 11 May 2021 13:42:30 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v3 14/20] virtio-gpu: Add initial definitions for explict
 flush feature
Message-ID: <20210511114230.aud4m3dijwqgrcpi@sirius.home.kraxel.org>
References: <20210511080818.366985-1-vivek.kasireddy@intel.com>
 <20210511080818.366985-15-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210511080818.366985-15-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

On Tue, May 11, 2021 at 01:08:12AM -0700, Vivek Kasireddy wrote:
> Add the property bit, conf flag and other relevant declarations
> associated with this feature.

I think this and the following patches should go to a separate series.
I expect we can merge 1-13 quicky.  The flush bits probably need a bit
longer because they depend on a virtio protocol update which must be
sorted first.

take care,
  Gerd


