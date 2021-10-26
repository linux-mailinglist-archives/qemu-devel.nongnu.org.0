Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C8243AF17
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 11:31:03 +0200 (CEST)
Received: from localhost ([::1]:39996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfInN-0001BX-N1
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 05:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfIld-0000S8-Tg
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfIlb-0008JI-Lb
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635240550;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZnS5XAyrzUF7dwHsXtTxEobLkp1GiLOifkI3t6wLRpE=;
 b=VGTBOJUmXcCajmS7PEpo2Nz5Gi0EID2L1YHOxaC63PYi77Tk0XBcm25F1CsuY0yLu8iQE1
 pHzr0POe5Yd03mKDr3EliZAtIn/lUUpRkRYDkf1G7+jmhyLj5LmQeLAYpG3xCVBF+LXPgr
 bSo37Ip2ZbPt4qIo3Wa93y6iuRnZrWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-jv4w8C8sP-eNFB5vdwvuNw-1; Tue, 26 Oct 2021 05:28:55 -0400
X-MC-Unique: jv4w8C8sP-eNFB5vdwvuNw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 958FA5074E;
 Tue, 26 Oct 2021 09:28:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C818C5C1A1;
 Tue, 26 Oct 2021 09:28:27 +0000 (UTC)
Date: Tue, 26 Oct 2021 10:28:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 1/9] qapi: New special feature flag "unstable"
Message-ID: <YXfKOV9AtAmHOu/M@redhat.com>
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-2-armbru@redhat.com>
 <YXewOaSDEXJDYV+1@redhat.com> <YXfIx171QE5ig/Pw@work-vm>
MIME-Version: 1.0
In-Reply-To: <YXfIx171QE5ig/Pw@work-vm>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 mdroth@linux.vnet.ibm.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 10:22:15AM +0100, Dr. David Alan Gilbert wrote:
> * Kevin Wolf (kwolf@redhat.com) wrote:
> > Am 25.10.2021 um 07:25 hat Markus Armbruster geschrieben:
> > > By convention, names starting with "x-" are experimental.  The parts
> > > of external interfaces so named may be withdrawn or changed
> > > incompatibly in future releases.
> > > 
> > > Drawback: promoting something from experimental to stable involves a
> > > name change.  Client code needs to be updated.
> > > 
> > > Moreover, the convention is not universally observed:
> > > 
> > > * QOM type "input-barrier" has properties "x-origin", "y-origin".
> > >   Looks accidental, but it's ABI since 4.2.
> > > 
> > > * QOM types "memory-backend-file", "memory-backend-memfd",
> > >   "memory-backend-ram", and "memory-backend-epc" have a property
> > >   "x-use-canonical-path-for-ramblock-id" that is documented to be
> > >   stable despite its name.
> > > 
> > > We could document these exceptions, but documentation helps only
> > > humans.  We want to recognize "unstable" in code, like "deprecated".
> > > 
> > > Replace the convention by a new special feature flag "unstable".  It
> > > will be recognized by the QAPI generator, like the existing feature
> > > flag "deprecated", and unlike regular feature flags.
> > > 
> > > This commit updates documentation and prepares tests.  The next commit
> > > updates the QAPI schema.  The remaining patches update the QAPI
> > > generator and wire up -compat policy checking.
> > > 
> > > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > 
> > Obviously, replacing the old convention gets rid of the old drawbacks,
> > but adds a new one: While using x- makes it very obvious for a human
> > user that this is an unstable feature, a feature flag in the schema will
> > almost certainly go unnoticed in manual use.
> 
> Agreed, I'd keep the x- as well.
> 
> Having said that, the x- represents a few different things (that we
> don't currently distinguish):
>   - experimental
>   - for internal use
>   - for debugging/human use

All of those usage scenarios have the same implication though:

   Command/data format is liable to change in incompatible ways,
   or be deleted, with no prior warning.

I don't think we need to distinguish the use cases - some commands
may belong to two or three of those use cases. All that matters is
that they're considered "unstable" from an API compat POV.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


