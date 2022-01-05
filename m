Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196A44855B4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:20:45 +0100 (CET)
Received: from localhost ([::1]:56476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n585j-0002pg-1f
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:20:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n583R-0000bx-AI
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 10:18:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n583L-0007Jq-5F
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 10:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641395894;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yvfv75l0XCF4ZHq2E/Kj1JEx0ejOmX6aX9UosCGgTLI=;
 b=FLSSwYtUAOUnH/41ieY5unUS9/jT2AZfpVbalgUDzYrKO0Sil/TvVX7i//HGONc4nLJL76
 30SrvxaE02U9dqKF/I0HauPLDAupHGtsgzAMo5HXJ5BuwgbKUsjDSUfKpYbkv8XrlT0/6t
 kvVoHtMPqZHc1ls0SZ0ZindEIjpjoGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-DTtQaoOyOQGOOU3L3TAETw-1; Wed, 05 Jan 2022 10:18:07 -0500
X-MC-Unique: DTtQaoOyOQGOOU3L3TAETw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE4E7100E326;
 Wed,  5 Jan 2022 15:18:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFBA87E8FB;
 Wed,  5 Jan 2022 15:18:04 +0000 (UTC)
Date: Wed, 5 Jan 2022 15:18:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 1/1] softmmu: fix device deletion events with -device
 JSON syntax
Message-ID: <YdW2qk19K5N7gr9W@redhat.com>
References: <20220105123847.4047954-1-berrange@redhat.com>
 <20220105123847.4047954-2-berrange@redhat.com>
 <a2a94c4c-190f-9be6-eadf-bd1404a2e272@redhat.com>
 <YdWxZ0DYZT0zDuWP@redhat.com>
 <ef04e0ee-4349-a9cb-a3e7-2abfcc7aaedc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ef04e0ee-4349-a9cb-a3e7-2abfcc7aaedc@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 04:00:54PM +0100, Laurent Vivier wrote:
> On 05/01/2022 15:55, Daniel P. Berrangé wrote:
> > On Wed, Jan 05, 2022 at 03:49:12PM +0100, Laurent Vivier wrote:
> > > On 05/01/2022 13:38, Daniel P. Berrangé wrote:
> > > > The -device JSON syntax impl leaks a reference on the created
> > > > DeviceState instance. As a result when you hot-unplug the
> > > > device, the device_finalize method won't be called and thus
> > > > it will fail to emit the required DEVICE_DELETED event.
> > > > 
> > > > A 'json-cli' feature was previously added against the
> > > > 'device_add' QMP command QAPI schema to indicated to mgmt
> > > > apps that -device supported JSON syntax. Given the hotplug
> > > > bug that feature flag is no unusable for its purpose, so
> > > 
> > > Not sure to understand: do you mean "now unusable"?
> > 
> > An application wants to known whether QEMU can support JSON
> > syntax with -device. If they look for the 'json-cli' feature
> > as a witness, they'll end up using JSON with QEMU 6.2 which
> > is giving them broken hotplug. This is unusable for any
> > non-trivial use cases. So we need a new witness to indicate
> > whether JSON is viable with -device, that only the newly
> > fixed QEMU will report.
> 
> I understand that, my problem was with your sentence:
> 
> "Given the hotplug bug that feature flag is no unusable for its purpose"

What's the problem with that ? It is reasonabled to say a -device impl
which is broken for hotplug is not usable for non-toy use cases.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


