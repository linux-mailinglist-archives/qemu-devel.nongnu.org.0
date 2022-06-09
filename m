Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D40544E7B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:14:38 +0200 (CEST)
Received: from localhost ([::1]:43938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIvl-00013U-58
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzHnh-0008NT-Pt
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:02:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzHnf-0005km-A9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654779729;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sVrPWz88LTAPxSEOkiovlb1yeUuv6MjhrOYuUL2lcBM=;
 b=IFdcNaWCW5Z7iHPkSNxIKZNp3LiER0YmK5hByUTj8qmsqmefqWGsuPKzr5AwCrOw7SjvFj
 akmQA6lKOwZx8d5IxESVW5kkVG5dpi2lxL0g46Qg94tIIdj1lVrj8Ln4mQ+LkouiVVPlen
 1xrXuczkGkCyr5dNclRPwZVFtA2DjTM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-AENeQ4BKM2CoaZVTG87c9A-1; Thu, 09 Jun 2022 09:02:06 -0400
X-MC-Unique: AENeQ4BKM2CoaZVTG87c9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FEE9101E9B6;
 Thu,  9 Jun 2022 13:02:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BC901410DDB;
 Thu,  9 Jun 2022 13:02:04 +0000 (UTC)
Date: Thu, 9 Jun 2022 14:02:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 07/20] migration: rename qemu_update_position to
 qemu_file_credit_transfer
Message-ID: <YqHvSqJO94+LfxHE@redhat.com>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-8-berrange@redhat.com>
 <CAFEAcA-nv+chmz1ih7FQp-Ptyx9qLSy8AbxRitcafiWNbDZUNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-nv+chmz1ih7FQp-Ptyx9qLSy8AbxRitcafiWNbDZUNQ@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 09, 2022 at 01:56:00PM +0100, Peter Maydell wrote:
> On Tue, 24 May 2022 at 12:46, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > The qemu_update_position method name gives the misleading impression
> > that it is changing the current file offset. Most of the files are
> > just streams, however, so there's no concept of a file offset in the
> > general case.
> >
> > What this method is actually used for is to report on the number of
> > bytes that have been transferred out of band from the main I/O methods.
> > This new name better reflects this purpose.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> >  int qemu_peek_byte(QEMUFile *f, int offset);
> >  void qemu_file_skip(QEMUFile *f, int size);
> > -void qemu_update_position(QEMUFile *f, size_t size);
> > +/*
> > + * qemu_file_credit_transfer:
> > + *
> > + * Report on a number of bytes that have been transferred
> > + * out of band from the main file object I/O methods.
> > + */
> > +void qemu_file_credit_transfer(QEMUFile *f, size_t size);
> >  void qemu_file_reset_rate_limit(QEMUFile *f);
> >  void qemu_file_update_transfer(QEMUFile *f, int64_t len);
> >  void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
> 
> What's the difference between "credit transfer" and "update
> transfer" ? The latter also seems to just be adding a number
> to a count of bytes-transferred...

The other method is merely related to the rate limiting, and so
probably ought to have 'rate_limit' included in its name too.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


