Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD621D30B3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 15:09:33 +0200 (CEST)
Received: from localhost ([::1]:55980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZDcC-0006qa-IR
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 09:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZDbH-00064y-Lg
 for qemu-devel@nongnu.org; Thu, 14 May 2020 09:08:35 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29697
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZDbF-00066g-Qx
 for qemu-devel@nongnu.org; Thu, 14 May 2020 09:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589461711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0/2rmgRy+EgyCb/joCoJcg4jcJpQeFFLQLYdC8Ww+e0=;
 b=XSoVurluROWERsWNZpOalJtWlQSdIX/xRLJZOyl+apqA/Lv8odKEf4RuBgoji4Rfx8/uPQ
 Cu90eXU/Oc9hKMu1FawRtFguSm4g1ZoubvClhYXk5Zzk7SjrPoiFJ0nWd+yUxDi0idN+fS
 aQwar+kqBCTveVOYDYEdzEib6FAlTCw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-AuDi4-aKOR2ByDlZxSmKvA-1; Thu, 14 May 2020 09:08:04 -0400
X-MC-Unique: AuDi4-aKOR2ByDlZxSmKvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F83E1902EA0;
 Thu, 14 May 2020 13:08:03 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-9.ams2.redhat.com [10.36.114.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F8126E71C;
 Thu, 14 May 2020 13:08:01 +0000 (UTC)
Date: Thu, 14 May 2020 15:08:00 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 0/4] block: Do not call BlockDriver.bdrv_make_empty()
 directly
Message-ID: <20200514130800.GF5518@linux.fritz.box>
References: <20200429141126.85159-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200429141126.85159-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 29.04.2020 um 16:11 hat Max Reitz geschrieben:
> v1: https://lists.nongnu.org/archive/html/qemu-block/2020-04/msg01245.html
> 
> Branch: https://github.com/XanClic/qemu.git fix-bdrv_make_empty-v2
> Branch: https://git.xanclic.moe/XanClic/qemu.git fix-bdrv_make_empty-v2
> 
> Based-on: <20200428192648.749066-1-eblake@redhat.com>
>           (“qcow2: Allow resize of images with internal snapshots”)
> 
> Hi,
> 
> As described in v1’s cover letter (linked above), this series ensures
> that all calls to BlockDriver.bdrv_make_empty() go through a wrapper
> bdrv_make_empty() function that ensures the caller does have the
> necessary permissions.

Thanks, fixed up the test output in patch 4 and applied to the block
branch.

Kevin


