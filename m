Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C5628CE68
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 14:33:45 +0200 (CEST)
Received: from localhost ([::1]:59312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSJUu-0001r7-QS
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 08:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kSJT6-0001Ku-UI
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 08:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kSJT4-0002OR-27
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 08:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602592308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAwx6Hx1lC3ejXxqnJmiirDmy380vvTgiWIJwb34BQc=;
 b=EMroXlzEeikFDcIFmqSSCpPsLnKyjh/Py6FIA/aM46vhct3f1Jra4UOGvvTzxuvQmFOxna
 tWFti55h7/btA2F45GbQHPZVDsGGTlkNN2bPunNw01CyyF1I/YKUwWoNnbn/6y7KLY6b89
 lOsbUY1iNLa8BlgWNBO+HXgzqrO/R68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-dzEzcTMJOqekVjDuqyTThw-1; Tue, 13 Oct 2020 08:31:46 -0400
X-MC-Unique: dzEzcTMJOqekVjDuqyTThw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05C925703D;
 Tue, 13 Oct 2020 12:31:45 +0000 (UTC)
Received: from starship (unknown [10.35.206.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AFA15C1C2;
 Tue, 13 Oct 2020 12:31:43 +0000 (UTC)
Message-ID: <96c95d7b4aef3dd0cb2e832c1f0c012f40a8da56.camel@redhat.com>
Subject: Re: [PATCH v2 1/2] crypto: luks: fix tiny memory leak
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
Date: Tue, 13 Oct 2020 15:31:42 +0300
In-Reply-To: <w51eem2z4zd.fsf@maestria.local.igalia.com>
References: <20201011102136.622361-1-mlevitsk@redhat.com>
 <20201011102136.622361-2-mlevitsk@redhat.com>
 <w51eem2z4zd.fsf@maestria.local.igalia.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 03:04:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-10-13 at 14:26 +0200, Alberto Garcia wrote:
> On Sun 11 Oct 2020 12:21:35 PM CEST, Maxim Levitsky wrote:
> > In the case when underlying block device doesn't support the
> > bdrv_co_delete_file interface, an 'Error' wasn't freed.
> > 
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  block/crypto.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/block/crypto.c b/block/crypto.c
> > index 0807557763..9b61fd4aa8 100644
> > --- a/block/crypto.c
> > +++ b/block/crypto.c
> > @@ -736,6 +736,7 @@ fail:
> >          if ((r_del < 0) && (r_del != -ENOTSUP)) {
> >              error_report_err(local_delete_err);
> >          }
> > +        error_free(local_delete_err);
> >      }
> 
> error_report_err() already calls error_free().

Thanks. I didn't knew this.
Will send V3 soon.

Best regards,
	Maxim Levitsky
> 
> Berto
> 



