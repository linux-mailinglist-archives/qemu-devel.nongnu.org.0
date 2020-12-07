Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C182D182D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 19:07:02 +0100 (CET)
Received: from localhost ([::1]:37772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKuc-0004jA-0G
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 13:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kmKeX-00046k-8J
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:50:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kmKeT-0002Vj-Or
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607363420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d6t0iwQTNxHoRe5k1be+7lkmqVTZEUhknTiWrLk++FQ=;
 b=EReiiLxuLNS1SM1H6RnY+QYnv1jUoiC+HkEcT5Jmp6CINAVVSWU+dIy3WAhyPU+jgzEaId
 /xNcad4g3ZECjQth8UeE7C5W696+b04tNEgkFzg3wrEnmIuCNJwKFhT/rpvIGO8eOV/k8K
 CYp5QllOoRRLp359RJFsJJBhow4+d1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-oNJalwIZP0OVrH1fiYdbIA-1; Mon, 07 Dec 2020 12:50:18 -0500
X-MC-Unique: oNJalwIZP0OVrH1fiYdbIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50228184214E;
 Mon,  7 Dec 2020 17:50:17 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E718819C59;
 Mon,  7 Dec 2020 17:50:10 +0000 (UTC)
Date: Mon, 7 Dec 2020 18:50:07 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH for-6.0] accel: Wire accel to /machine
Message-ID: <20201207175007.GO105758@angien.pipo.sk>
References: <20201207084621.23876-1-r.bolshakov@yadro.com>
 <20201207173849.GC1289986@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20201207173849.GC1289986@habkost.net>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, libvir-list@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 07, 2020 at 12:38:49 -0500, Eduardo Habkost wrote:
> On Mon, Dec 07, 2020 at 11:46:22AM +0300, Roman Bolshakov wrote:
> > There's no generic way to query current accel and its properties via QOM
> > because there's no link between an accel and current machine.
> > 
> > The change adds the link, i.e. if HVF is enabled the following will be
> > available in QOM:
> > 
> >   (qemu) qom-get /machine/accel type
> >   "hvf-accel"
> > 
> > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > ---
> > 
> > Hi,
> > 
> > this is a follow up patch that deprecates earlier series [1].
> > 
> 
> Is there a reference to the reasoning for dropping the earlier
> approach?  Your previous approach seems preferable.

The gist of the discussion before was that deprecating old commands in
the same release cycle as introducing the replacement might be
problematic if libvirt wants to adapt ASAP and that the new command
should be elevated to a intermediate tier of stability, where ACK from
libvirt is needed to change it during the same release cycle
incompatibly.

That was meant generally for any command, and was started because we had
a similar issue recently.

My intention definitely was not to change the patch itself, but more a
process change so that we can keep cooperating on new stuff rapidly, but
without actually breaking what we do.


