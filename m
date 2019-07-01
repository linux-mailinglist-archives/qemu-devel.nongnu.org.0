Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E354C3571F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 08:42:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYPd2-000667-N8
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 02:42:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hYPc3-0005oR-9R
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 02:41:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hYPc2-0007Vr-F4
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 02:41:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54148)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hYPc2-0007Dj-95
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 02:41:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D058FC0624A1;
	Wed,  5 Jun 2019 06:41:19 +0000 (UTC)
Received: from xz-x1 (dhcp-15-205.nay.redhat.com [10.66.15.205])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F00B2CFCA;
	Wed,  5 Jun 2019 06:41:11 +0000 (UTC)
Date: Wed, 5 Jun 2019 14:41:08 +0800
From: Peter Xu <peterx@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190605064108.GH15459@xz-x1>
References: <20190605010828.6969-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190605010828.6969-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 05 Jun 2019 06:41:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migratioin/ram.c: reset complete_round
 when we gets a queued page
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: quintela@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 05, 2019 at 09:08:28AM +0800, Wei Yang wrote:
> In case we gets a queued page, the order of block is interrupted. We may
> not rely on the complete_round flag to say we have already searched the
> whole blocks on the list.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  migration/ram.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index d881981876..e9b40d636d 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2290,6 +2290,12 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
>           */
>          pss->block = block;
>          pss->page = offset >> TARGET_PAGE_BITS;
> +
> +        /*
> +         * This unqueued page would break the "one round" check, even is
> +         * really rare.

Why this is needed?  Could you help explain the problem first?

Thanks,

-- 
Peter Xu

