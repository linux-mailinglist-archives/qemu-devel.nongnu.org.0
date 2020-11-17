Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64C12B5E7E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:42:01 +0100 (CET)
Received: from localhost ([::1]:33868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezN2-0004rA-TY
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:42:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kezKC-0002Ke-VL
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:39:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kezK5-0005im-TP
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605613136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cmm70jvTv3RMkA/eF2Is6R+HVYkwNqJgBA9i+eboA1I=;
 b=hYeHtxAcBwMSyunrv4uDf/e8Hi6QyXP+Z6ijGrwcqY5t4pWobHxchbm3RymUmT33tVbi7+
 93uIW/Pu93m396WYFkw7OEDkDon9F6NuxngTpg+CV8sdSVQaFsFf+2XD+aDR5ytV0rbBaS
 xG9N0XBZ3ixrWsKvj2Pi+ZPBLVB9WwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-QHsSV3dAMUKJillXo3aTLQ-1; Tue, 17 Nov 2020 06:38:54 -0500
X-MC-Unique: QHsSV3dAMUKJillXo3aTLQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CD2E81A3FF;
 Tue, 17 Nov 2020 11:38:53 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-113.ams2.redhat.com [10.36.114.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 187AA5D707;
 Tue, 17 Nov 2020 11:38:51 +0000 (UTC)
Date: Tue, 17 Nov 2020 12:38:50 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 0/3] quorum: Require WRITE perm with rewrite-corrupted
Message-ID: <20201117113850.GA5306@merkur.fritz.box>
References: <20201113211718.261671-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201113211718.261671-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.11.2020 um 22:17 hat Max Reitz geschrieben:
> Hi,
> 
> While reviewing Berto’s block-status/write-zeroes series for quorum, I
> wondered how quorum’s permission code handles rewrite-corrupted.  It
> turns out it doesn’t, and so qemu with a read-only rewrite-corrupted
> quorum node simply crashes once there is a mismatch that leads to a
> rewrite.
> 
> It looks to me like this bug has existed for quite some time, so I don’t
> think this series must go into 5.2.  OTOH, it’s a simple bug fix, so I
> suppose it might as well.

Thanks, applied to the block branch.

Kevin


