Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E9E4D622A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 14:13:30 +0100 (CET)
Received: from localhost ([::1]:39608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSf5F-0005PG-8X
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 08:13:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSf40-00043R-CA
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 08:12:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSf3y-0006lM-LG
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 08:12:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647004329;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=kPQx9xX7lfhd1mSIkbhEuy8T9CXCQPosZXEeOPCsQqM=;
 b=HeuaRxNgi5CJgWoyrPxjO+fRgg9lIwfIWavPokXYs6Ps6uMWYKX3AL0xuh92hAcR48/3iM
 pxeImb9xpst4Ak5X6GhtiGJE1LDaJbtMX+NK1vb4bPIIc+G0XEAcO+dzrET1l9xWz1mu2s
 L3QK4EI7yXiRXwG+cX6LMJGkq4LVV+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-jU9DRjdAOOKENs1O3RTUGA-1; Fri, 11 Mar 2022 08:12:08 -0500
X-MC-Unique: jU9DRjdAOOKENs1O3RTUGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35B31801DDB;
 Fri, 11 Mar 2022 13:12:07 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7AD483BE6;
 Fri, 11 Mar 2022 13:12:05 +0000 (UTC)
Date: Fri, 11 Mar 2022 13:12:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 1/3] qmp: Support for querying stats
Message-ID: <YitKou/lAlsbudNy@redhat.com>
References: <20220215150433.2310711-1-mark.kanda@oracle.com>
 <20220215150433.2310711-2-mark.kanda@oracle.com>
 <87a6dw7i55.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87a6dw7i55.fsf@pond.sub.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 11, 2022 at 02:06:46PM +0100, Markus Armbruster wrote:
> Mark Kanda <mark.kanda@oracle.com> writes:
> 
> > Introduce QMP support for querying stats. Provide a framework for adding new
> > stats and support for the following commands:
> >
> > - query-stats
> > Returns a list of all stats per target type (only VM and vCPU to start), with
> > additional options for specifying stat names, vCPU qom paths, and providers.
> >
> > - query-stats-schemas
> > Returns a list of stats included in each target type, with an option for
> > specifying the provider.
> >
> > The framework provides a method to register callbacks for these QMP commands.
> >
> > The first use-case will be for fd-based KVM stats (in an upcoming patch).
> >
> > Examples (with fd-based KVM stats):
> >
> > - Query all VM stats:
> >
> > { "execute": "query-stats", "arguments" : { "target": "vm" } }
> >
> > { "return": {
> >   "vm": [
> >      { "provider": "kvm",
> >        "stats": [
> >           { "name": "max_mmu_page_hash_collisions", "value": 0 },
> >           { "name": "max_mmu_rmap_size", "value": 0 },
> >           { "name": "nx_lpage_splits", "value": 148 },
> >           ...
> >      { "provider": "xyz",
> >        "stats": [ ...
> >      ...
> > ] } }
> >
> > - Query all vCPU stats:
> >
> > { "execute": "query-stats", "arguments" : { "target": "vcpu" } }
> >
> > { "return": {
> >     "vcpus": [
> >       { "path": "/machine/unattached/device[0]"
> >         "providers": [
> >           { "provider": "kvm",
> >             "stats": [
> >               { "name": "guest_mode", "value": 0 },
> >               { "name": "directed_yield_successful", "value": 0 },
> >               { "name": "directed_yield_attempted", "value": 106 },
> >               ...
> >           { "provider": "xyz",
> >             "stats": [ ...
> >            ...
> >       { "path": "/machine/unattached/device[1]"
> >         "providers": [
> >           { "provider": "kvm",
> >             "stats": [...
> >           ...
> > } ] } }
> >
> > - Query 'exits' and 'l1d_flush' KVM stats, and 'somestat' from provider 'xyz'
> > for vCPUs '/machine/unattached/device[2]' and '/machine/unattached/device[4]':
> >
> > { "execute": "query-stats",
> >   "arguments": {
> >     "target": "vcpu",
> >     "vcpus": [ "/machine/unattached/device[2]",
> >                "/machine/unattached/device[4]" ],
> >     "filters": [
> >       { "provider": "kvm",
> >         "fields": [ "l1d_flush", "exits" ] },
> >       { "provider": "xyz",
> >         "fields": [ "somestat" ] } ] } }
> 
> Are the stats bulky enough to justfify the extra complexity of
> filtering?

I viewed it more as a mechanism to cope with a scenario where
some stats are expensive to query. If the mgmt app only want
to get one specific cheap stat, we don't want to trigger code
that does expensive queries of other stats as a side effect.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


