Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939822C100
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 10:14:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58889 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVXFC-0003Ft-OH
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 04:14:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1hVXDw-0002gA-6z
	for qemu-devel@nongnu.org; Tue, 28 May 2019 04:12:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1hVXDv-0003ad-BP
	for qemu-devel@nongnu.org; Tue, 28 May 2019 04:12:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43536)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hVXDv-0003a3-6c
	for qemu-devel@nongnu.org; Tue, 28 May 2019 04:12:43 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85428C05D3F4;
	Tue, 28 May 2019 08:12:42 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBE2A7C0B8;
	Tue, 28 May 2019 08:12:41 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
In-Reply-To: <20190528014703.21030-3-richardw.yang@linux.intel.com> (Wei
	Yang's message of "Tue, 28 May 2019 09:47:01 +0800")
References: <20190528014703.21030-1-richardw.yang@linux.intel.com>
	<20190528014703.21030-3-richardw.yang@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Tue, 28 May 2019 10:12:39 +0200
Message-ID: <87imtv80aw.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 28 May 2019 08:12:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/4] migration/ram.c: use same type in
 MultiFDPages_t to define offsest
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wei Yang <richardw.yang@linux.intel.com> wrote:
> MultiFDPacket_t.offset is allocated to store MultiFDPages_t.offset.
>
> It would be better to use the same type.
>
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  migration/ram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/migration/ram.c b/migration/ram.c
> index 4c60869226..dcf4c54eb5 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -607,7 +607,7 @@ typedef struct {
>      uint64_t packet_num;
>      uint64_t unused[4];    /* Reserved for future use */
>      char ramblock[256];
> -    uint64_t offset[];
> +    ram_addr_t offset[];
>  } __attribute__((packed)) MultiFDPacket_t;
>  
>  typedef struct {

This needs a comment, but it is on purpose.  We want that the value on
the wire to be the same for any architecture.  (Migration stream is
supposed to be architecture independent).  ram_addr_t is architecture
dependent.

Later, Juan.

