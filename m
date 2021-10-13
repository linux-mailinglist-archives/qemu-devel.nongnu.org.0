Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAFA42C2E4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 16:23:17 +0200 (CEST)
Received: from localhost ([::1]:46396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mafA4-0003dA-JF
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 10:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1maf8a-0002m7-Pu
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 10:21:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1maf8W-0005Co-TP
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 10:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634134899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x4xJAXWNbu7fLqdMrchve/AwgwQD3+INdENKsXyZxOQ=;
 b=DkCDjkK1sckNcWtByidNKTIdIgUiQwemVW5VRO0jqIvOpUBzjzvdjNe5kE4JR/wAqw2F5Z
 cRchMMpo0mHAEaaT10zyZqj2ZJZnZ3yTWA8x04gb7myDqSPlp59815YI/8LmLGsx5dcWeN
 nuQKqYUtH0JiDfmlQP44zE0LmhO9A44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-lS1iFlaCNayaJUwZMORYuA-1; Wed, 13 Oct 2021 10:21:33 -0400
X-MC-Unique: lS1iFlaCNayaJUwZMORYuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 051BC69728;
 Wed, 13 Oct 2021 14:21:33 +0000 (UTC)
Received: from redhat.com (ovpn-114-130.phx2.redhat.com [10.3.114.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 091DC10016F5;
 Wed, 13 Oct 2021 14:21:31 +0000 (UTC)
Date: Wed, 13 Oct 2021 09:21:30 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 7/7] python, iotests: replace qmp with aqmp
Message-ID: <20211013142106.by4uct2g6tientmi@redhat.com>
References: <20211012223445.1051101-1-jsnow@redhat.com>
 <20211012223445.1051101-8-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012223445.1051101-8-jsnow@redhat.com>
User-Agent: NeoMutt/20210205-852-339c0c
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 06:34:45PM -0400, John Snow wrote:
> Swap out the synchronous QEMUMonitorProtocol from qemu.qmp with the sync
> wrapper from qemu.aqmp instead.
> 
> Add an escape hatch in the form of the environment variable
> QEMU_PYTHON_LEGACY_QMP which allows you to cajole QEMUMachine into using
> the old implementatin, proving that both implementations work

implementation

> concurrently.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> Tested-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  python/qemu/machine/machine.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


