Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B242C623D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 10:50:41 +0100 (CET)
Received: from localhost ([::1]:57782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiaOn-0006it-0U
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 04:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kiaNZ-0005sF-Vu
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 04:49:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kiaNY-0004cY-7G
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 04:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606470563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NCDFW6hjB/edhzS9t/sS+3k+kzinSMyjGlv752gUVwc=;
 b=SmWPMwIS9FrwHhfZv4GAwalQexsxq30JJwf7pPEbGie40vPJgQAROIG21HG5A/AAVmHpQ/
 NPOAWBVUlRil/G6CQzheoMTnPwDQaNwDhYxQjm7dT0jrZ1slL6LdZyrT0lAhmEtasdHo44
 9Tc4nObVJuojSzg+zKXWG9jLoMaB2g4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-_VpigeeNOZCpjvabO7doFg-1; Fri, 27 Nov 2020 04:49:21 -0500
X-MC-Unique: _VpigeeNOZCpjvabO7doFg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C21B9107464D;
 Fri, 27 Nov 2020 09:49:20 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C6DA6085D;
 Fri, 27 Nov 2020 09:49:14 +0000 (UTC)
Date: Fri, 27 Nov 2020 10:49:11 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
Message-ID: <20201127094911.GI2366@angien.pipo.sk>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126154751.GH2366@angien.pipo.sk>
 <673bec91-31cb-5533-b223-8725948e2189@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <673bec91-31cb-5533-b223-8725948e2189@virtuozzo.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 11:21:39 +0300, Andrey Gruzdev wrote:
> On 26.11.2020 18:47, Peter Krempa wrote:
> > On Thu, Nov 26, 2020 at 18:17:28 +0300, Andrey Gruzdev via wrote:
> > > This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
> > > implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.
> > > 
> > > Currently the only way to make (external) live VM snapshot is using existing
> > > dirty page logging migration mechanism. The main problem is that it tends to
> > > produce a lot of page duplicates while running VM goes on updating already
> > > saved pages. That leads to the fact that vmstate image size is commonly several
> > > times bigger then non-zero part of virtual machine's RSS. Time required to
> > > converge RAM migration and the size of snapshot image severely depend on the
> > > guest memory write rate, sometimes resulting in unacceptably long snapshot
> > > creation time and huge image size.
> > > 
> > > This series propose a way to solve the aforementioned problems. This is done
> > > by using different RAM migration mechanism based on UFFD write protection
> > > management introduced in v5.7 kernel. The migration strategy is to 'freeze'
> > > guest RAM content using write-protection and iteratively release protection
> > > for memory ranges that have already been saved to the migration stream.
> > > At the same time we read in pending UFFD write fault events and save those
> > > pages out-of-order with higher priority.
> > 
> > This sounds amazing! Based on your description I assume that the final
> > memory image contains state image from the beginning of the migration.
> > 
> > This would make it desirable for the 'migrate' qmp command to be used as
> > part of a 'transaction' qmp command so that we can do an instant disk
> > and memory snapshot without any extraneous pausing of the VM.
> > 
> > I'll have a look at using this mechanism in libvirt natively.
> > 
> 
> Correct, the final image contains state at the beginning of migration.
> 
> So far, if I'm not missing something about libvirt, for external snapshot
> creation it performs a sequence like that:
> migrate(fd)->transaction(blockdev-snapshot-all)->cont.
> 
> So, in case 'background-snapshot' capability is enabled, the sequence would
> change to:
> stop->transaction(blockdev-snapshot-all)->migrate(fd).
> With background snapshot migration it will finish with VM running so there's
> not need to 'cont' here.

Yes, that's correct.

The reason I've suggested that 'migrate' being part of a 'transaction'
is that it would remove the need to stop it for the disk snapshot part. 


