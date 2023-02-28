Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DF96A5802
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:25:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWy6O-00087B-RC; Tue, 28 Feb 2023 06:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWy6M-00086V-8B
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:24:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWy6K-0002Wz-Np
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:24:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677583495;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=fYeLTq7TyDXrBPvAIZIBsPBHxw8d/YvHEsH17sw7svw=;
 b=VrakJC+rKU9xoXI1hlW+YcDjugWL0stmIEVmEp+ZjU/QYJk+qBOTHuNNZ8I1e+SrkMvEA5
 tMNzzMvkB8VuW6Ijj8FyWV0mApZYeQLVv7hghjtywqYjl5kGcq6U/SLH6JPcjMjUt3wc9Y
 27C+4/ow+Zk2dl50ijyeoIWIuN3WHdQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-nByGmdtiNkie70oWzhHE1A-1; Tue, 28 Feb 2023 06:24:52 -0500
X-MC-Unique: nByGmdtiNkie70oWzhHE1A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3D2785CBE6;
 Tue, 28 Feb 2023 11:24:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E124B40C6EC4;
 Tue, 28 Feb 2023 11:24:50 +0000 (UTC)
Date: Tue, 28 Feb 2023 11:24:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: "John Berberian, Jr" <jeb.study@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2] Fix exec migration on Windows (w32+w64).
Message-ID: <Y/3kgLD1luTt4z4h@redhat.com>
References: <20230116013421.3149183-1-jeb.study@gmail.com>
 <CAJ+F1C+x3tSHAb6LbL+GK0m08UuKCS0RWygz41gMFycqL0JrrQ@mail.gmail.com>
 <Y8UXR6uqdv22auoE@redhat.com>
 <db09ab65-a6a7-0096-625a-c323a4b5aacf@gmail.com>
 <CAJ+F1CKkqcgCYfnGVK7LSD5gE1ueX2HrCGqP26_UJZYt3E-q4A@mail.gmail.com>
 <12107bdf-f631-e42a-5136-59bb67e301fc@gmail.com>
 <87pm9ukpti.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87pm9ukpti.fsf@secure.mitica>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

On Tue, Feb 28, 2023 at 12:11:05PM +0100, Juan Quintela wrote:
> "John Berberian, Jr" <jeb.study@gmail.com> wrote:
> > ping. Is there anything I can do to help this get merged?
> 
> Hi
> 
> I have to get back from Marc/Daniel before proceed.
> 
> You did an answer, but they didn't respond.
> 
> What should we do here?

I was hoping the patches that introduce the new migration QMP
syntax would get in first, but its looking like it won't be
so quick. So I'm OK introducing this patch in the meantime
as a stop gap.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


