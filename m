Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07606A7DAE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:32:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfIK-0006f6-Gz; Thu, 02 Mar 2023 04:32:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXfI6-0006db-1N
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:31:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXfI4-00065v-6T
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:31:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677749514;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pget2bPmbbg6Wa3DBUVRUG45ZdlSe4j61fVglhw1ZE8=;
 b=CUQzN8ouW94QgdzZ9zI+LufBwSiMX2xj6vEFZdvxeHOc3UoturePPR7T2/2UDnZrf2YFkz
 j1wR5rdKNcDLdJuS5hDOIRk1X6EUwjfyjlJ9hc3SwEjV4cL96+F5fndS/2udWDiWYocYkQ
 y+JoM2UVrWrgqUef2dBXYLRZLqkFdVc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638--rJtMsTUMEi36HYNkN8T_A-1; Thu, 02 Mar 2023 04:31:51 -0500
X-MC-Unique: -rJtMsTUMEi36HYNkN8T_A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B077886461;
 Thu,  2 Mar 2023 09:31:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E897A492C14;
 Thu,  2 Mar 2023 09:31:48 +0000 (UTC)
Date: Thu, 2 Mar 2023 09:31:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 07/10] qapi: implement conditional command arguments
Message-ID: <ZABtAt78by0TIPf7@redhat.com>
References: <87fsb4k85h.fsf@pond.sub.org>
 <CAMxuvax6qPYQCzNX7vESJM9_f5k4C1Yat0sJcJjrHkh_1WGpQA@mail.gmail.com>
 <87a61821y3.fsf@pond.sub.org>
 <CAJ+F1CJNgmf+j36wutNMdPYBShoZUXJvzEBGEVwW-B-Z6Tc3ug@mail.gmail.com>
 <87356yq9rs.fsf@pond.sub.org>
 <20230228155801.s2imkaybh3a4d5x3@redhat.com>
 <Y/8Zy/Lk8i9RCOdc@redhat.com> <875ybkwr10.fsf@pond.sub.org>
 <CAJ+F1C+S+ChMdk0y5VHzFj94y5UV3iPjHweeLoUTHcBHW-pkYw@mail.gmail.com>
 <87wn3zskq3.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wn3zskq3.fsf@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

On Thu, Mar 02, 2023 at 07:58:28AM +0100, Markus Armbruster wrote:
> Marc-André Lureau <marcandre.lureau@gmail.com> writes:
> 
> > Hi
> >
> > On Wed, Mar 1, 2023 at 5:16 PM Markus Armbruster <armbru@redhat.com> wrote:
> >> What about 3. have an additional command conditional on CONFIG_WIN32?
> >> Existing getfd stays the same: always fails when QEMU runs on a Windows
> >> host.  The new command exists only when QEMU runs on a Windows host.
> 
> We could additionally deprecate getfd for Windows.
> 
> > This is what was suggested initially:
> > https://patchew.org/QEMU/20230103110814.3726795-1-marcandre.lureau@redhat.com/20230103110814.3726795-9-marcandre.lureau@redhat.com/
> >
> > I also like it better, as a specific command for windows sockets, less
> > ways to use it wrongly.
> 
> Daniel, what do you think?

I wasn't especially a fan of platform specific APIs, but perhaps in
retrospect it will be the lesser of two evils.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


