Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34051D7BE4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 16:54:20 +0200 (CEST)
Received: from localhost ([::1]:33528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jah9n-0003CK-DK
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 10:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1jah96-0002jK-AH
 for qemu-devel@nongnu.org; Mon, 18 May 2020 10:53:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49406
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1jah94-0007e5-BZ
 for qemu-devel@nongnu.org; Mon, 18 May 2020 10:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589813612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UewsP9zX//wwuL7LPs/5U9Vh1TIYH9zHEoUHxee0ea4=;
 b=Jum4Fcik5aU2U5NKzeVq26sNLp31vXDA2S+15cqVhwwCV98NUZE5owVBi8fKlo/AeCfOdn
 NFPePvI57/jTkpwNSqA8kGGKTsr505sPp54gXqZXyW/eEUWOBVY3HYaE/i2q3DrPixUnlU
 8VLfAw9BDUBMa4QnE72eRftZ7ginj0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-0A5CLx2GNQq2KxtRtPwQeg-1; Mon, 18 May 2020 10:53:00 -0400
X-MC-Unique: 0A5CLx2GNQq2KxtRtPwQeg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 822951005512;
 Mon, 18 May 2020 14:52:59 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C68EE1002394;
 Mon, 18 May 2020 14:52:49 +0000 (UTC)
Date: Mon, 18 May 2020 16:52:45 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH RFC v2 0/5] block: add block-dirty-bitmap-populate job
Message-ID: <20200518145245.GA2995787@angien.pipo.sk>
References: <20200514034922.24834-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200514034922.24834-1-jsnow@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:51:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 13, 2020 at 23:49:17 -0400, John Snow wrote:
> Hi,
> 
> This is a new (very small) block job that writes a pattern into a
> bitmap. The only pattern implemented is the top allocation information.
> 
> This can be used to "recover" an incremental bitmap chain if an external
> snapshot was taken without creating a new bitmap first: any writes made
> to the image will be reflected by the allocation status and can be
> written back into a bitmap.
> 
> This is useful for e.g. libvirt managing backup chains if a user creates
> an external snapshot outside of libvirt.

I've dusted-off my patches for using this blockjob for this very
specific case and it works for me.

Tested-by: Peter Krempa <pkrempa@redhat.com>

For now I'll continue the integration with other blockjobs where we
merge bitmaps.


