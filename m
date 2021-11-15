Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB0C45078F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:50:48 +0100 (CET)
Received: from localhost ([::1]:38682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdJn-00064S-Ht
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:50:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdIC-0004Xb-D8
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:49:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdI8-00070x-J3
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636987743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TAHFpayS7fmXlViseXLjatkYnLUxmXejQBr+uGQVaqI=;
 b=cScuGs+cFFNeJVKz83+7DJ+0i576g/g5jvlXMUjysi7SH0v0yJnFofbygTPKiNrGv6/kQ4
 uDphh7ndWV+tQuAn4FIWKoy7lBIBt0sQRgcZKEJYmxCyK/a2/XCZLDsIkS2y+EgguPt0RF
 mvSnIH67/Jvq3Piz8lTqpuTtK3zbU5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-jeFBs7ZJPL60B5z8gkqX-Q-1; Mon, 15 Nov 2021 09:49:02 -0500
X-MC-Unique: jeFBs7ZJPL60B5z8gkqX-Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D67C38030AF;
 Mon, 15 Nov 2021 14:48:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6F9B5C1BB;
 Mon, 15 Nov 2021 14:48:31 +0000 (UTC)
Date: Mon, 15 Nov 2021 15:48:30 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] softmmu/qdev-monitor: fix use-after-free in qdev_set_id()
Message-ID: <YZJzPpcsUTo7AsFx@redhat.com>
References: <20211102163342.31162-1-stefanha@redhat.com>
 <a3004034-0221-bb40-3b22-2c57824cac83@redhat.com>
 <8735odk16h.fsf@dusky.pond.sub.org>
 <87o86oqxor.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87o86oqxor.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.11.2021 um 09:14 hat Markus Armbruster geschrieben:
> Nominating for qemu-trivial.

I'm sending a pull request anyway, so I'm merging it.

Kevin

> Markus Armbruster <armbru@redhat.com> writes:
> 
> > Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> >
> >> Cc'ing Markus
> >>
> >> On 11/2/21 17:33, Stefan Hajnoczi wrote:
> >>> Reported by Coverity (CID 1465222).
> >>> 
> >>> Fixes: 4a1d937796de0fecd8b22d7dbebf87f38e8282fd ("softmmu/qdev-monitor: add error handling in qdev_set_id")
> >>> Cc: Damien Hedde <damien.hedde@greensocs.com>
> >>> Cc: Kevin Wolf <kwolf@redhat.com>
> >>> Cc: Michael S. Tsirkin <mst@redhat.com>
> >>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> >>> ---
> >>>  softmmu/qdev-monitor.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>> 
> >>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> >>> index 4851de51a5..06f86a1a96 100644
> >>> --- a/softmmu/qdev-monitor.c
> >>> +++ b/softmmu/qdev-monitor.c
> >>> @@ -581,8 +581,8 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
> >>>          if (prop) {
> >>>              dev->id = id;
> >>>          } else {
> >>> -            g_free(id);
> >>>              error_setg(errp, "Duplicate device ID '%s'", id);
> >>> +            g_free(id);
> >>>              return NULL;
> >>>          }
> >>>      } else {
> >>> 
> >>
> >> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> >> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> >
> > Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 


