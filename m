Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371D52D63E2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 18:44:54 +0100 (CET)
Received: from localhost ([::1]:57064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPz8-0001Xu-J8
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 12:44:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knPph-0004Zy-S5
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:34:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knPpg-0004y4-8q
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607621663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7JPNKlTpkrBPE6V6ElrqU+15h5pIhZJ2I3E4H3mttEg=;
 b=idQFln6gOMGN8S8B6/U/Q0VhLIpPgaHFHEIyRABsgRCsL+nH6sOksnwYSFya8poeF8Ae9t
 cgg4Rp1/9yZxRzuDeSA3D2emYa9ia2pEMYQIpZlCiZVtUeNweSxa/qm2PEURhN1VpexlfI
 4swXLyaaZgsAVHMTLllVnszN4plmHpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-7u-C9maSNGegxrGVGeiuSA-1; Thu, 10 Dec 2020 12:34:21 -0500
X-MC-Unique: 7u-C9maSNGegxrGVGeiuSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82E2210051AF;
 Thu, 10 Dec 2020 17:34:20 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-58.ams2.redhat.com
 [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0CE86F134;
 Thu, 10 Dec 2020 17:34:14 +0000 (UTC)
Subject: Re: [PATCH v14 03/13] copy-on-read: add filter drop function
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-4-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <f2f6bb29-757a-a700-6b88-0ea6a2eb868e@redhat.com>
Date: Thu, 10 Dec 2020 18:34:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204220758.2879-4-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> 
> Provide API for the COR-filter removal. Also, drop the filter child
> permissions for an inactive state when the filter node is being
> removed.
> To insert the filter, the block generic layer function
> bdrv_insert_node() can be used.
> The new function bdrv_cor_filter_drop() may be considered as an
> intermediate solution before the QEMU permission update system has
> overhauled. Then we are able to implement the API function
> bdrv_remove_node() on the block generic layer.
> 
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/copy-on-read.h | 32 +++++++++++++++++++++++++
>   block/copy-on-read.c | 56 ++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 88 insertions(+)
>   create mode 100644 block/copy-on-read.h

Reviewed-by: Max Reitz <mreitz@redhat.com>


