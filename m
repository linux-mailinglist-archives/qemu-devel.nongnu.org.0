Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76D63A012D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:04:42 +0200 (CEST)
Received: from localhost ([::1]:38620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqh1l-0007nu-8Q
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqh05-000780-DB
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:02:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqh01-00064u-KU
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623178969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wc+VFnRYrY28mxDeZF3MwHIej6ADTV8ZbdElBev3UGk=;
 b=TL9rYQYv6n5Yun4Ri614nXsGoY3BvuIvxUd+qAZDC7T5rv98zQNB/XFCiWixM5H5UH0O+B
 OEt+DZ7NdMBKVijY7yo7QVn7rW3mdFrdfJuat4ri9i01AW6M/cX+It4KtKHQyowqjmZObo
 1uJ3wZR3I0qg/+uT9ghxNKUtPmkmlgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-0ZedSUn5MG-DULTLcs8pxw-1; Tue, 08 Jun 2021 15:02:46 -0400
X-MC-Unique: 0ZedSUn5MG-DULTLcs8pxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1D1719253D6;
 Tue,  8 Jun 2021 19:02:44 +0000 (UTC)
Received: from work-vm (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2094819726;
 Tue,  8 Jun 2021 19:02:39 +0000 (UTC)
Date: Tue, 8 Jun 2021 20:02:37 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/7] migration/dirtyrate: make sample page count
 configurable
Message-ID: <YL++zfNFCtoSMLRc@work-vm>
References: <cover.1623027729.git.huangy81@chinatelecom.cn>
 <3103453a3b2796f929269c99a6ad81a9a7f1f405.1623027729.git.huangy81@chinatelecom.cn>
 <20210607181835.xf2qtqbrmekxqs6o@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210607181835.xf2qtqbrmekxqs6o@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 huangy81@chinatelecom.cn, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Eric Blake (eblake@redhat.com) wrote:
> On Mon, Jun 07, 2021 at 09:11:34AM +0800, huangy81@chinatelecom.cn wrote:
> > From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> > 
> > introduce optional sample-pages argument in calc-dirty-rate,
> > making sample page count per GB configurable so that more
> > accurate dirtyrate can be calculated.
> > 
> > Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> > ---
> 
> > +++ b/qapi/migration.json
> >  # Example:
> > -#   {"command": "calc-dirty-rate", "data": {"calc-time": 1} }
> > +#   {"command": "calc-dirty-rate", "data": {"calc-time": 1, 'sample-pages': 512} }
> >  #
> >  ##
> > -{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64'} }
> > +{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64', '*sample-pages': 'int'} }
> 
> Long line. Please wrap at 80 columns.

I can fix up that.

> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


