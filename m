Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3590343B5C2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:38:22 +0200 (CEST)
Received: from localhost ([::1]:46408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOWq-0006jt-Dt
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfOHx-0003Df-35
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:22:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfOHu-0007EM-JJ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:22:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635261772;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vEafkYo5GS2bbKRwA9csOWQPLnc+axtDJd94lzNcqQw=;
 b=SgOXEb6Bf3TXATDa8zdKpEPMw/djD+aowGEx+xBSaN4JrpvIxcnqkPwEc2zmLuYLsdoADx
 7f6DdccJ1Ugc6BwO8Jr4sPj3CNl7uQDlF5tq9fM86IC8KNl6mgN5HmW6wTbpuWlzjnNoZX
 W0Hex7ZWfLfMYAe8KeJeXq6y3MjywYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-b_SiCkkTMsOMcoTiwowJjg-1; Tue, 26 Oct 2021 11:22:49 -0400
X-MC-Unique: b_SiCkkTMsOMcoTiwowJjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6497F1808302;
 Tue, 26 Oct 2021 15:22:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 914D85DEFB;
 Tue, 26 Oct 2021 15:22:45 +0000 (UTC)
Date: Tue, 26 Oct 2021 16:22:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/9] qapi: New special feature flag "unstable"
Message-ID: <YXgdQ/y4XVTzB5Ru@redhat.com>
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-2-armbru@redhat.com>
 <YXewOaSDEXJDYV+1@redhat.com> <87r1c83z5c.fsf@dusky.pond.sub.org>
 <YXgXGocQsFu/Cnzr@redhat.com> <87a6ivg6m9.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87a6ivg6m9.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, quintela@redhat.com, libvir-list@redhat.com,
 eblake@redhat.com, mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 05:15:10PM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Tue, Oct 26, 2021 at 11:37:19AM +0200, Markus Armbruster wrote:
> >> Kevin Wolf <kwolf@redhat.com> writes:
> >> 
> >> > Am 25.10.2021 um 07:25 hat Markus Armbruster geschrieben:
> >> >> By convention, names starting with "x-" are experimental.  The parts
> >> >> of external interfaces so named may be withdrawn or changed
> >> >> incompatibly in future releases.
> >> >> 
> >> >> Drawback: promoting something from experimental to stable involves a
> >> >> name change.  Client code needs to be updated.
> >> >> 
> >> >> Moreover, the convention is not universally observed:
> >> >> 
> >> >> * QOM type "input-barrier" has properties "x-origin", "y-origin".
> >> >>   Looks accidental, but it's ABI since 4.2.
> >> >> 
> >> >> * QOM types "memory-backend-file", "memory-backend-memfd",
> >> >>   "memory-backend-ram", and "memory-backend-epc" have a property
> >> >>   "x-use-canonical-path-for-ramblock-id" that is documented to be
> >> >>   stable despite its name.
> >> >> 
> >> >> We could document these exceptions, but documentation helps only
> >> >> humans.  We want to recognize "unstable" in code, like "deprecated".
> >> >> 
> >> >> Replace the convention by a new special feature flag "unstable".  It
> >> >> will be recognized by the QAPI generator, like the existing feature
> >> >> flag "deprecated", and unlike regular feature flags.
> >> >> 
> >> >> This commit updates documentation and prepares tests.  The next commit
> >> >> updates the QAPI schema.  The remaining patches update the QAPI
> >> >> generator and wire up -compat policy checking.
> >> >> 
> >> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> >
> >> > Obviously, replacing the old convention gets rid of the old drawbacks,
> >> > but adds a new one: While using x- makes it very obvious for a human
> >> > user that this is an unstable feature, a feature flag in the schema will
> >> > almost certainly go unnoticed in manual use.
> >> 
> >> I thought about this, but neglected to put it in writing.  My bad.
> >> 
> >> Manual use of unstable interfaces is mostly fine.  Human users can adapt
> >> to changing interfaces.  HMP works that way.
> >> 
> >> Management applications are better off with a feature flag than with a
> >> naming convention we sometimes ignore.
> >
> > We will sometimes ignore/forget the feature flag too though, so I'm
> > not convinced there's much difference there.
> 
> -compat unstable-input=reject,unstable-output=hide should help you stay
> on the straight & narrow :)

That's from the pov of the mgmt app. I meant from the POV of QEMU
maintainers forgetting to add "unstable" flag, just as they might
forget to add a "x-" prefix.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


