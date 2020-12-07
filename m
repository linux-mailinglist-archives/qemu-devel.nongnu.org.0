Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4FB2D1819
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 19:04:02 +0100 (CET)
Received: from localhost ([::1]:35054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKrg-0003Tv-OC
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 13:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kmKZL-00007A-E3
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:45:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kmKZD-0001cJ-PU
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607363095;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=53pI5uBlOBGoUFZAlcE90Nj7B5a8NUonUrqDZ+7Bh88=;
 b=U7nMrHsfy/v+LcAetoVt3+yBYK+hzMEwVbUJFQuFh49RYUykyeAH7tLNpZd4jmZKcMp57c
 HQoNC+fSbIbzePmuLmC7dRD84NLcORhSKPYQFd/22CchuX/pB9sJpzA7VRiNVNeei8C2T5
 FMjPoiXXmJ09mIt/U6XISyZjfj36iqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-0qtBc118Mim28kiwEhBN_A-1; Mon, 07 Dec 2020 12:44:38 -0500
X-MC-Unique: 0qtBc118Mim28kiwEhBN_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EABD2804004;
 Mon,  7 Dec 2020 17:44:36 +0000 (UTC)
Received: from redhat.com (ovpn-113-137.ams2.redhat.com [10.36.113.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E16B1002391;
 Mon,  7 Dec 2020 17:44:21 +0000 (UTC)
Date: Mon, 7 Dec 2020 17:44:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH for-6.0] accel: Wire accel to /machine
Message-ID: <20201207174419.GP3102898@redhat.com>
References: <20201207084621.23876-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
In-Reply-To: <20201207084621.23876-1-r.bolshakov@yadro.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 Richard@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 libvir-list@redhat.com, Claudio@redhat.com,
 Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 07, 2020 at 11:46:22AM +0300, Roman Bolshakov wrote:
> There's no generic way to query current accel and its properties via QOM
> because there's no link between an accel and current machine.
> 
> The change adds the link, i.e. if HVF is enabled the following will be
> available in QOM:
> 
>   (qemu) qom-get /machine/accel type
>   "hvf-accel"
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
> 
> Hi,
> 
> this is a follow up patch that deprecates earlier series [1].
> 
> An outstanding issue is whether management applications can rely on the
> value of /machine/accel/type and output of qom-list-types command [2][3]
> to get current and present accels?
> 
> i.e. would it be ok if libvirt assumes that everything up to the first
> dash in the accel type is the name of the accel (as specified via -M
> accel=ACCEL flag) when it performs QEMU probing?

Hmm, I think it is not nice - we shouldn't have to parse the
accel type names - IMHO typenames should be considered arbitrary
opaque strings, even if they'll not be expected to change.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


