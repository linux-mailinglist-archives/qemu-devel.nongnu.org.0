Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FFD6C4661
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 10:29:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peumL-0001ry-V8; Wed, 22 Mar 2023 05:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peumF-0001Wy-QV
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:29:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peumD-00040I-Vp
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679477340;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Yn3uOnpdAznvAymBsJBP4OJeoG7ZouW0pN0VA5i6Yeo=;
 b=Mp/YriAcDkdhLWchC6mSlPwMLsVa/AAlUdOUxzYLkwa6gFtc21ipwXLgFtxOVfYJnt4c5J
 IaDR8y8QzWvGLgN4svXUmXI6itsaiW8Y5VM0WYXv6kTHlZfqdbqbs4eKdCdUtiNtj7jm0O
 KYvZ4/ewDgGBSwK5QHa2k4TwkufxsMY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-0u_u0xkMOY-JXhYrRRieVA-1; Wed, 22 Mar 2023 05:28:57 -0400
X-MC-Unique: 0u_u0xkMOY-JXhYrRRieVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10A33801206;
 Wed, 22 Mar 2023 09:28:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A7601121314;
 Wed, 22 Mar 2023 09:28:55 +0000 (UTC)
Date: Wed, 22 Mar 2023 09:28:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 qemu-devel <qemu-devel@nongnu.org>, David Hildenbrand <david@redhat.com>,
 "Borntraeger, Christian" <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, fiuczy@linux.ibm.com,
 Halil Pasic <pasic@linux.ibm.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 1/1] util/async-teardown: wire up
 query-command-line-options
Message-ID: <ZBrKVGVHRtqyaKvL@redhat.com>
References: <20230320131648.61728-1-imbrenda@linux.ibm.com>
 <20230320131648.61728-2-imbrenda@linux.ibm.com>
 <87v8ivmocr.fsf@pond.sub.org>
 <6a9ef526-1b30-e9a6-37ee-59ca3dadea9d@redhat.com>
 <CABgObfaN3sLipc2UuoZc2yHP0YK3e59sK5wn8gpkJ8xgNHc7qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABgObfaN3sLipc2UuoZc2yHP0YK3e59sK5wn8gpkJ8xgNHc7qg@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 21, 2023 at 09:47:57PM +0100, Paolo Bonzini wrote:
> Il lun 20 mar 2023, 16:42 Thomas Huth <thuth@redhat.com> ha scritto:
> 
> > Would it make sense to add it e.g. to "-action" instead, i.e. something
> > like
> > "-action teardown=async" ?
> >
> 
> -action is just a wrapper for the action-set QMP command. I don't think it
> fits very well; its arguments are only guest actions while asynchronous
> tear down happens for example when you issue a quit command on the monitor.

Right, we discussed -action when this feature was first proposed and
that was the reason it was discounted.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


