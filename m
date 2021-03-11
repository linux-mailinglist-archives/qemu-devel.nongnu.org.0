Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9465E337CF8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:52:55 +0100 (CET)
Received: from localhost ([::1]:51458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQQY-00059w-Ae
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKQ91-00055B-UG
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:34:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKQ8v-0006tG-Kr
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615487679;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HRuF+g9lka1Xz3IemM/JU4heotJvcZ8tpuLGxKhvluI=;
 b=I4MMJKmqmjYc612I5/bcJV3tQlyPbieehGHnfFuTJRxykwDRz7k/LnIkDHTO3OCOY3yOVR
 13oDsAb3YWmcgn7Ual4AL8sfpNx/YX6SLIvyRT/sYth2LuWfUb+GZ2K1gckLrd5kqrMi1T
 i4bdGJBx4SP5t+UfFIvO15juWWvSVxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-S8LniW10MDGrzuL1mCleiA-1; Thu, 11 Mar 2021 13:34:24 -0500
X-MC-Unique: S8LniW10MDGrzuL1mCleiA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 547911923763;
 Thu, 11 Mar 2021 18:34:22 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63CCD100AE4E;
 Thu, 11 Mar 2021 18:34:00 +0000 (UTC)
Date: Thu, 11 Mar 2021 18:33:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 05/14] migrate: remove QMP/HMP commands for speed,
 downtime and cache size
Message-ID: <YEpilXGj9m4cCSY0@redhat.com>
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-6-berrange@redhat.com>
 <YEoE7NdH+LNzDlXW@work-vm>
 <1e211782-d0c6-6026-6a4e-b5eb626b8fb3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1e211782-d0c6-6026-6a4e-b5eb626b8fb3@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 07:18:54PM +0100, Paolo Bonzini wrote:
> On 11/03/21 12:54, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > The generic 'migrate_set_parameters' command handle all types of param.
> > > 
> > > Only the QMP commands were documented in the deprecations page, but the
> > > rationale for deprecating applies equally to HMP, and the replacements
> > > exist. Furthermore the HMP commands are just shims to the QMP commands,
> > > so removing the latter breaks the former unless they get re-implemented.
> > > 
> > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > 
> > Yes OK; ouch that's going to break my 7 years of instinctive
> > 'migrate_set_speed 10G' typing, but it's probably the right thing to do.
> 
> migrate_set_speed should remain if it is not changed to have a sane default.

Define sane ?   The default is 1 Gib/s since:

  commit 7590a2ae091fde8bb72d5df93977ab9707e23242
  Author: Laurent Vivier <lvivier@redhat.com>
  Date:   Mon Sep 21 16:49:57 2020 +0200

    migration: increase max-bandwidth to 128 MiB/s (1 Gib/s)

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


