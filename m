Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C30123DF37
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 19:43:00 +0200 (CEST)
Received: from localhost ([::1]:40530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3jus-0000Li-Sb
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 13:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k3jtp-00086Y-W2
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 13:41:54 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58889
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k3jtn-0003e3-BQ
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 13:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596735709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IfZqQVb08zVDwERy79CxS6bWfvRty1789liDe8KoePU=;
 b=PgXtUSsebaBmVk8yZFyzgTF3zUiUg26v+zvv6KuNWAsV4lagjDpbxOPE8AJHfFci9RuNvc
 3t9nhvTAoYduGFshdWuIMQUscEj0jTY46lqc8NkKMMcFkIEkVgBBcdFswJL7QbKdfoTfsT
 TlbKATVA4bJ0BOUfbg8VYDW7PeNMnU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-sGa_kf-RPAOLvOHDMqk0Dw-1; Thu, 06 Aug 2020 13:41:37 -0400
X-MC-Unique: sGa_kf-RPAOLvOHDMqk0Dw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39CE08015FB;
 Thu,  6 Aug 2020 17:41:36 +0000 (UTC)
Received: from work-vm (ovpn-114-105.ams2.redhat.com [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BCCE19D7E;
 Thu,  6 Aug 2020 17:41:32 +0000 (UTC)
Date: Thu, 6 Aug 2020 18:41:29 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Disable remote posix locks by
 default
Message-ID: <20200806174129.GK2711@work-vm>
References: <20200727161841.GA54539@redhat.com>
 <OSBPR01MB4582AB9CD2DB32A48A8BB13FE5480@OSBPR01MB4582.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB4582AB9CD2DB32A48A8BB13FE5480@OSBPR01MB4582.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 05:03:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: virtio-fs-list <virtio-fs@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 'Vivek Goyal' <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* misono.tomohiro@fujitsu.com (misono.tomohiro@fujitsu.com) wrote:
> > Right now we enable remote posix locks by default. That means when guest does a posix lock it sends request to server
> > (virtiofsd). But currently we only support non-blocking posix lock and return -EOPNOTSUPP for blocking version.
> > 
> > This means that existing applications which are doing blocking posix locks get -EOPNOTSUPP and fail. To avoid this,
> > people have been running virtiosd with option "-o no_posix_lock". For new users it is still a surprise and trial and error
> > takes them to this option.
> > 
> > Given posix lock implementation is not complete in virtiofsd, disable it by default. This means that posix locks will work
> > with-in applications in a guest but not across guests. Anyway we don't support sharing filesystem among different guests
> > yet in virtiofs so this should not lead to any kind of surprise or regression and will make life little easier for virtiofs users.
> > 
> > Reported-by: Aa Aa <jimbothom@yandex.com>
> > Suggested-by: Miklos Szeredi <mszeredi@redhat.com>
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  tools/virtiofsd/passthrough_ll.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> We should update docs/tools/virtiofsd.rst as well. Given that:
>  Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>

Fixed up the doc.

Dave

> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://www.redhat.com/mailman/listinfo/virtio-fs
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


