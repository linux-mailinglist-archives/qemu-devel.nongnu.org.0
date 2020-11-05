Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFE72A7FA8
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 14:26:14 +0100 (CET)
Received: from localhost ([::1]:35048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kafHJ-0002qI-92
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 08:26:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kafFL-00024n-Fs
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 08:24:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kafFJ-0006Xv-0g
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 08:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604582648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TmvMCspfBG80wVmNo0k16POpK1C4+ywqnsRp1qPd8zo=;
 b=WXqacNTZtFgHpkZfBnC3end1+gKl5750IBBeyyMa0l38wvvTlpBsV0Mnz18WWsdVCz/sgC
 DQdszviEAN3BQLf5NjHYcRlLgmBlFm5zfgYLppYJdHPAJMmkCSRiGc+mbBDerk9J75Njd5
 jPtSeLgX4z1BqRFPTFM8eciqMC8N7tg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-clg7JT8iNjqCe9Tz3_l1yw-1; Thu, 05 Nov 2020 08:24:06 -0500
X-MC-Unique: clg7JT8iNjqCe9Tz3_l1yw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DEA8803F42;
 Thu,  5 Nov 2020 13:24:05 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-31.ams2.redhat.com
 [10.36.114.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 050E75129E;
 Thu,  5 Nov 2020 13:24:03 +0000 (UTC)
Subject: Re: [PATCH 1/2] block: make bdrv_drop_intermediate() less wrong
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201031123502.4558-1-vsementsov@virtuozzo.com>
 <20201031123502.4558-2-vsementsov@virtuozzo.com>
 <384f5bfc-238e-6b7f-473b-6aa5cd93ef52@redhat.com>
Message-ID: <1e4a2227-3557-4b3f-5aab-5aa8c98cc0ac@redhat.com>
Date: Thu, 5 Nov 2020 14:24:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <384f5bfc-238e-6b7f-473b-6aa5cd93ef52@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 22:46:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.11.20 14:22, Max Reitz wrote:
> On 31.10.20 13:35, Vladimir Sementsov-Ogievskiy wrote:
>> First, permission update loop tries to do iterations transactionally,
>> but the whole update is not transactional: nobody roll-back successful
>> loop iterations when some iteration fails.

[...]

> And besides rolling back on error, we don’t commit on success either.

(Oh, we do, through bdrv_replace_child().  Well.)

Max


