Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057F630257E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 14:30:48 +0100 (CET)
Received: from localhost ([::1]:39384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l41xA-0005JD-1Y
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 08:30:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l41uO-0003zm-OH
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:27:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l41uL-0001l7-Hx
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611581271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X/fCDgtr0W2A9URUB5wSmTD+8jBEKvJiEZFkfyCwJrU=;
 b=ZRfcXfmfI2Lxz9/IKbqTiautVSxe+54bgJazGT6QoJED0GtE5Fj7flV0wfHXVGMFC/uEmp
 qIMLO5B+6C9UKhUDyrzTroFkrcjCG+tzzEKJqkvf3f7YweS1TNhfvKVP2jwJjfmDcTIKDe
 Gddo4h078pI0akDCrkTUsH5spk//VjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-tP2rfWyIOlG5Yrw1F9Y5rg-1; Mon, 25 Jan 2021 08:27:46 -0500
X-MC-Unique: tP2rfWyIOlG5Yrw1F9Y5rg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9CE7107ACE6
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 13:27:45 +0000 (UTC)
Received: from work-vm (ovpn-114-3.ams2.redhat.com [10.36.114.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AD915D6AB;
 Mon, 25 Jan 2021 13:27:32 +0000 (UTC)
Date: Mon, 25 Jan 2021 13:27:29 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] migration: Provide a test for migratability
Message-ID: <20210125132729.GG2925@work-vm>
References: <20210121185113.66277-1-dgilbert@redhat.com>
 <7f789817-6a2d-124f-57dc-a468f7f596ba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7f789817-6a2d-124f-57dc-a468f7f596ba@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: alex.williamson@redhat.com, peterx@redhat.com, qemu-devel@nongnu.org,
 laine@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Eric Blake (eblake@redhat.com) wrote:
> On 1/21/21 12:51 PM, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Provide a simple way to see if there's currently a migration blocker in
> > operation:
> > 
> > $ ./x86_64-softmmu/qemu-system-x86_64 -nographic -M pc,usb=on -chardev null,id=n -device usb-serial,chardev=n
> > 
> > (qemu) info migratable
> > Error: State blocked by non-migratable device '0000:00:01.2/1/usb-serial'
> > 
> > $ ./x86_64-softmmu/qemu-system-x86_64 -nographic
> > 
> > (qemu) info migratable
> > Migratable
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> 
> 
> > +++ b/qapi/migration.json
> > @@ -366,6 +366,20 @@
> >  ##
> >  { 'command': 'query-migrate', 'returns': 'MigrationInfo' }
> >  
> > +##
> > +# @query-migratable:
> > +# Tests whether it will be possible to migrate the VM in the current state.
> > +#
> > +# Returns: nothing on success (i.e. if the VM is migratable)
> 
> Do we really need a new command?  Or can we get away with enhancing the
> existing 'query-migrate' to add another bool field to 'MigrationInfo'?

In the case where the VM is not migratable this command errors with the
message set in a migration-blocker (Our migration blocker mechanism
always takes an Error* as the reason).

It didn't seem right to make that change for the existing commands;
so how would you like the existing MigrationInfo to change; a boolean to
say yes/no, and an error/list of errors for the reason?

Dave

> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


