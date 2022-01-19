Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6762493778
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:39:15 +0100 (CET)
Received: from localhost ([::1]:50310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7Qw-0005TB-IR
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:39:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nA70a-0002Jc-FF
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 04:12:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nA70X-0003UN-9C
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 04:11:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642583515;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Pc1FohHd266GrsAd5kBKlKnRT6pD/5dCMrMR6erWev4=;
 b=gnakgICCtALi5DLdg9Wyv0i3bARZGqi21tI6BtBOukjiCdf9qIpL7xf62DTXwHw2SruoS9
 wBrrQxP9NMTVxqtUlrkcG17gjc3KTfOPzDtAFnLHzqId7iehwGoGgJfzsTfy21AMHmBvDv
 7izd1PTauGJ8foOrCUR5QN4f+VHEjvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-cajw6qjlPjiWdSm6tQY5vQ-1; Wed, 19 Jan 2022 04:11:42 -0500
X-MC-Unique: cajw6qjlPjiWdSm6tQY5vQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB1242F26;
 Wed, 19 Jan 2022 09:11:41 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5531F7B9D2;
 Wed, 19 Jan 2022 09:11:40 +0000 (UTC)
Date: Wed, 19 Jan 2022 09:11:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/3] qmp: Support for querying stats
Message-ID: <YefVycBLB0oX+3eJ@redhat.com>
References: <20211119195153.11815-1-mark.kanda@oracle.com>
 <20211119195153.11815-2-mark.kanda@oracle.com>
 <Ya+rLex1djU/1Wc1@redhat.com>
 <ee0d6990-06f3-9a1b-f7d5-7c379f0e9773@redhat.com>
 <5b2f4acf-29fb-34fd-eee0-341eec163da7@oracle.com>
 <a39efdf3-82f3-9042-8b53-86394d7aa90d@redhat.com>
 <Yea3+t4qtk4iB9jr@redhat.com> <20220118154731.159e4b23@redhat.com>
 <b0222e34-4b85-c909-3d7d-27536dbd5bf8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b0222e34-4b85-c909-3d7d-27536dbd5bf8@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 09:43:23AM +0100, Paolo Bonzini wrote:
> On 1/18/22 15:47, Igor Mammedov wrote:
> > and what exactly this CPU ID is,
> > may QOM path pointing to VCPU instance would be better?
> 
> For x86 it would be the APIC ID but yes, having a QOM path is more future
> proof.  Thanks Igor for noting this.

Whatever format we use to describe a CPU in the results, should be the
same as the format uses in the input parameters. I had suggested using
a bitmap of CPU IDs, but if we're going to use QOM paths for results,
we must use QOM paths to select CPUs too.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


