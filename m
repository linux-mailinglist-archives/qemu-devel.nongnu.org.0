Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7C424639B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 11:42:08 +0200 (CEST)
Received: from localhost ([::1]:35862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7beZ-0003qG-9V
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 05:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k7bdn-0002we-DF
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 05:41:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54910
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k7bdl-00037e-KF
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 05:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597657276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OG5JfaGdHFNk+97yCsvah4rXyd4oF1UYbN3+/CFmAPs=;
 b=bGdHuq8fxT2jpUy4HITxKOab+9YASmXR4AU5dtam5t8vr4/8s0WnLmxfYbNWrEYgMyCIQU
 zDOPMb9HldFbuKtBALihmYUXBSPAHqF/1b36uf+WbopLsDVNco/sprKUA93fq+Iz1pYucC
 Y4zJA7bZTrznksC0AZJ/q81fgkrbJHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-TS_RQlA7Nv2gtpBMgw0xSg-1; Mon, 17 Aug 2020 05:41:14 -0400
X-MC-Unique: TS_RQlA7Nv2gtpBMgw0xSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA1CA425CC;
 Mon, 17 Aug 2020 09:41:12 +0000 (UTC)
Received: from linux.fritz.box (ovpn-112-160.ams2.redhat.com [10.36.112.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47C1B610AF;
 Mon, 17 Aug 2020 09:41:11 +0000 (UTC)
Date: Mon, 17 Aug 2020 11:41:09 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Pan Nengyuan <pannengyuan@huawei.com>
Subject: Re: [PATCH 09/12] blockdev: Fix a memleak in drive_backup_prepare()
Message-ID: <20200817094109.GC11402@linux.fritz.box>
References: <20200814160241.7915-1-pannengyuan@huawei.com>
 <20200814160241.7915-10-pannengyuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200814160241.7915-10-pannengyuan@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 00:24:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 euler.robot@huawei.com, kuhn.chenqun@huawei.com, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.08.2020 um 18:02 hat Pan Nengyuan geschrieben:
> 'local_err' seems forgot to propagate in error path, it'll cause
> a memleak. Fix it.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>

I wonder if using ERRP_GUARD() wouldn't simplify this. Anyway, the fix
looks correct:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


