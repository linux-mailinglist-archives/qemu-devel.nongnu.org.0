Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F5836B311
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 14:28:53 +0200 (CEST)
Received: from localhost ([::1]:43686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb0M8-0004Ek-P2
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 08:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lb0Kk-0003o3-HQ
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:27:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lb0Kf-0004Xo-U5
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619440040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7UrV8EB+rn8jxPJcqRER7FxxmWsK1i+MVyI2oNnGTd8=;
 b=FUXoo6HW0YhTqoRVqRDpxxxwpk0DQQn8Qiurhb/6na7acE1Ml5dFZEG5OzpDhHddtEuh8E
 EN/IW0zvKOYelNN1wboXyK+007art/tadOwx9Ba0tgovlz8KkhxvpLLPGGOronfgkf1I78
 DQbk6a4JeB0ULYaknbnOJk1GEDzP4gM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-YdnuGn61NlusfgJ3afBlbw-1; Mon, 26 Apr 2021 08:27:15 -0400
X-MC-Unique: YdnuGn61NlusfgJ3afBlbw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA1B51922035
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 12:27:14 +0000 (UTC)
Received: from work-vm (ovpn-115-8.ams2.redhat.com [10.36.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2F7560C5F;
 Mon, 26 Apr 2021 12:27:00 +0000 (UTC)
Date: Mon, 26 Apr 2021 13:26:58 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 5/5] sockets: Support multipath TCP
Message-ID: <YIaxkimWQrMutkhG@work-vm>
References: <20210421112834.107651-1-dgilbert@redhat.com>
 <20210421112834.107651-6-dgilbert@redhat.com>
 <YIKteAmBPfVdRm7T@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YIKteAmBPfVdRm7T@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: quintela@redhat.com, armbru@redhat.com, peterx@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, pabeni@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Wed, Apr 21, 2021 at 12:28:34PM +0100, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Multipath TCP allows combining multiple interfaces/routes into a single
> > socket, with very little work for the user/admin.
> > 
> > It's enabled by 'mptcp' on most socket addresses:
> > 
> >    ./qemu-system-x86_64 -nographic -incoming tcp:0:4444,mptcp
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  io/dns-resolver.c   |  4 ++++
> >  qapi/sockets.json   |  5 ++++-
> >  util/qemu-sockets.c | 23 +++++++++++++++++++++++
> >  3 files changed, 31 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Thanks, given this is more socketary than migration code, do you want to
take this series via your tree?

Dave

> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


