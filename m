Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D780147F18
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 11:58:53 +0100 (CET)
Received: from localhost ([::1]:40608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuwfs-0003g1-Dp
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 05:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57076)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iuwel-0002j7-7A
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 05:57:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iuwek-0008B5-7v
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 05:57:43 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43996
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iuwek-0008AJ-3F
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 05:57:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579863461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W0iYBT2k9hlkQUuBkixmsUP9fb327xGSFpZ78wraqmg=;
 b=Ttz/GM9drdYSpvHobDtk28Mx8K/zQTskZyTffuc3Tr0AHOD2TAqYWLcJtJuzJG2t/U/sNJ
 HlLtHxsSYJVoCT+8bxiefXpBSa11E8D1DfPoTURSvoWln3/IGD31voRBM0XA5+kwNnzfi/
 ss42EH4AYCAKrOVvG2ObkHkdQztiZPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-FwFo6_nwODudPRvfazgL7g-1; Fri, 24 Jan 2020 05:57:39 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08731DB60
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 10:57:39 +0000 (UTC)
Received: from work-vm (ovpn-117-253.ams2.redhat.com [10.36.117.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AE58845A0;
 Fri, 24 Jan 2020 10:57:36 +0000 (UTC)
Date: Fri, 24 Jan 2020 10:57:33 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 11/21] multifd: multifd_send_pages only needs the
 qemufile
Message-ID: <20200124105733.GI2970@work-vm>
References: <20200123115831.36842-1-quintela@redhat.com>
 <20200123115831.36842-12-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200123115831.36842-12-quintela@redhat.com>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: FwFo6_nwODudPRvfazgL7g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>

OK, although this is a side effect of multifd_send_state being a global
rather than part of RAMState which might have been cleaner.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/migration/ram.c b/migration/ram.c
> index 125c6d0f60..19caf5ed4d 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -929,7 +929,7 @@ struct {
>   * false.
>   */
> =20
> -static int multifd_send_pages(RAMState *rs)
> +static int multifd_send_pages(QEMUFile *f)
>  {
>      int i;
>      static int next_channel;
> @@ -965,7 +965,7 @@ static int multifd_send_pages(RAMState *rs)
>      multifd_send_state->pages =3D p->pages;
>      p->pages =3D pages;
>      transferred =3D ((uint64_t) pages->used) * TARGET_PAGE_SIZE + p->pac=
ket_len;
> -    qemu_file_update_transfer(rs->f, transferred);
> +    qemu_file_update_transfer(f, transferred);
>      ram_counters.multifd_bytes +=3D transferred;
>      ram_counters.transferred +=3D transferred;;
>      qemu_mutex_unlock(&p->mutex);
> @@ -993,7 +993,7 @@ static int multifd_queue_page(RAMState *rs, RAMBlock =
*block, ram_addr_t offset)
>          }
>      }
> =20
> -    if (multifd_send_pages(rs) < 0) {
> +    if (multifd_send_pages(rs->f) < 0) {
>          return -1;
>      }
> =20
> @@ -1090,7 +1090,7 @@ static void multifd_send_sync_main(RAMState *rs)
>          return;
>      }
>      if (multifd_send_state->pages->used) {
> -        if (multifd_send_pages(rs) < 0) {
> +        if (multifd_send_pages(rs->f) < 0) {
>              error_report("%s: multifd_send_pages fail", __func__);
>              return;
>          }
> --=20
> 2.24.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


