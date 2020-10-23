Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D4C296A68
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 09:41:17 +0200 (CEST)
Received: from localhost ([::1]:36434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVrhM-000883-1l
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 03:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kVrf5-0006df-8r
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:38:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kVrf3-0005DH-Ia
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603438731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pNauRd0D+ejimDAiMZ+zs4wuCBKhBPlISvaQY5N69cQ=;
 b=fu4/0T5G+0/KBKJHzoYG2alGumHfaKZTGDop9Y5Ufooh5ZAeIYOiGe0HPNHpefxTLyzMEC
 dSk7G3M2SQDQRTTrlzyPhYuSUYEH4Yh6ySC0T38KWcWR+sXV3x3sdRWkbeBSR/D9Y19245
 ydyDQJLsa0L+VPB8mT0b5dkCkoOs5Do=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-mn1y5HeYPC6sn8uCKN2-IQ-1; Fri, 23 Oct 2020 03:38:49 -0400
X-MC-Unique: mn1y5HeYPC6sn8uCKN2-IQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D5D384E214;
 Fri, 23 Oct 2020 07:38:48 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-206.ams2.redhat.com [10.36.113.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B407F65F5E;
 Fri, 23 Oct 2020 07:38:43 +0000 (UTC)
Date: Fri, 23 Oct 2020 09:38:42 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Zhengui li <lizhengui@huawei.com>
Subject: Re: [PATCH v3 0/2] qemu-img: add support for rate limit in commit
 and convert
Message-ID: <20201023073842.GA4793@merkur.fritz.box>
References: <1603205264-17424-1-git-send-email-lizhengui@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1603205264-17424-1-git-send-email-lizhengui@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: xieyingtai@huawei.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.10.2020 um 16:47 hat Zhengui li geschrieben:
> Currently, there is no rate limit for qemu-img commit and convert. This may
> cause the task of qemu-img commit and convert to consume all the bandwidth
> of the storage. This will affect the IO performance of other processes
> and virtual machines under shared storage.
> 
> The following patches add support for rate limit in qemu-img commit and
> convert to get better quality of sevice.

Thanks, applied to the block branch.

Kevin


