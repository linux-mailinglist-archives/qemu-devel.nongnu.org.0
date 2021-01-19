Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF42FBCDF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:51:12 +0100 (CET)
Received: from localhost ([::1]:39514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uDn-0003uR-8V
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1u4r-0004RM-Qw
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:41:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1u4q-0000LG-04
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611074514;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRvpZrOg3xwjF94S9k9j2oBqFip7U3XhhBg7vslvVx0=;
 b=MbQlw/RX26kV2G+VFVgyAwUgYe9qM1t2bpsulQPhDALxRXwMdcIt3gn29zR7UmpOwyZnRQ
 lk3m12YbDasXjRTgEBOJYlpmBuNAKtmnfnsmVWTkTl0TknCJWYdM8v2okhwmR3Bl8/ekP4
 Wt7ghHFaA9JqtIBs/BzIl1/gQCRaJMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-WF2ARd52NvW8pKaCjIH8zg-1; Tue, 19 Jan 2021 11:41:52 -0500
X-MC-Unique: WF2ARd52NvW8pKaCjIH8zg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B40A107ACE3;
 Tue, 19 Jan 2021 16:41:51 +0000 (UTC)
Received: from redhat.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4B045D9F8;
 Tue, 19 Jan 2021 16:41:45 +0000 (UTC)
Date: Tue, 19 Jan 2021 16:41:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [RFC PATCH 0/2] x86 CPU feature +/- fiddling and +kvm-no-defaults
Message-ID: <20210119164142.GO2335568@redhat.com>
References: <20210119142207.3443123-1-david.edmondson@oracle.com>
 <20210119162826.GL2335568@redhat.com>
 <20210119163518.GH1227584@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210119163518.GH1227584@habkost.net>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 11:35:18AM -0500, Eduardo Habkost wrote:
> On Tue, Jan 19, 2021 at 04:28:26PM +0000, Daniel P. Berrangé wrote:
> > On Tue, Jan 19, 2021 at 02:22:05PM +0000, David Edmondson wrote:
> > > Currently "-cpu -feature,+feature" will disable -feature, which seems
> > > contrary to the intention of the user. Fix this such that the later
> > > flag wins. There are no changes to the interaction of +/- and =on/=off.
> > 
> > The -feature/+feature syntax is the legacy  way of configuring
> > features, with feature=on|off being the preferred, since that matches
> > the general QEMU standard for boolean properties.
> > 
> > Your proposed change in ordering of + vs - makes conceptual sense, but
> > it is none the less a semantic change in behaviour that may well cause
> > breakage for existing deployed VMs. This impacts guest ABI so could
> > particularly cause live migration problems.
> > 
> > IOW, we should have implemented it the way you propose in the first
> > place, but I don't think it is safe to change it now, unless you can
> > tie that new semantic to a machine type version.
> > 
> > Before we consider that though, Paolo has just deprecated many of the
> > legacy approaches for boolean properties in this:
> > 
> >   https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg04341.html
> > 
> > I'm inclined to say that we just follow on from that and finally
> > deprecate the +feature/-feature CPU syntax which we're already considering
> > legacy. This would remove the need to care about changing its behaviour
> 
> I believe we had multiple proposal in the past do deprecate
> +feature/-feature, but there were objections.  I couldn't find
> the original threads, though.

Historically libvirt was using +/- syntax, but we finally removed the last
usage of it in June 2019 / libvirt v5.4.0. So for modern QEMU libvirt will
always use =on|off.

> In either case, I thought we had already deprecated the weird
> ordering rules of "-feature,+feature".

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


