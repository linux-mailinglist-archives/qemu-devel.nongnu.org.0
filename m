Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FAC32AA81
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:41:44 +0100 (CET)
Received: from localhost ([::1]:55892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAtp-0000dQ-Vv
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHAsa-0008Tl-9S
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:40:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHAsV-00069P-I2
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614714017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uhWOBAbm21skkkPU3XA+xQkxAx3aJBwFg36XvHU/nrM=;
 b=B29OVxW8uKLyvNPoDgv4IN59WlyBi1lV4BstSDHqLPrRNxXN7FA7hU98aBx7BjRvjGb1nS
 MLWFmnFktdlkj6JRgxKJConAAQTO6l0R+o0g1/fY9X5vQYmDWb8U+5AaaFH2qJSlW+BS84
 SUqejnQbhbvMaQTNgiwkkImmsLCluMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-ObN4LAQ5Ol-_C4XQRuGMmw-1; Tue, 02 Mar 2021 14:40:16 -0500
X-MC-Unique: ObN4LAQ5Ol-_C4XQRuGMmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3675106BB43;
 Tue,  2 Mar 2021 19:40:14 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-197.ams2.redhat.com [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46E715F9A6;
 Tue,  2 Mar 2021 19:39:54 +0000 (UTC)
Date: Tue, 2 Mar 2021 20:39:52 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 27/31] qom: Add user_creatable_add_from_str()
Message-ID: <20210302193952.GL5527@merkur.fritz.box>
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-28-kwolf@redhat.com>
 <5091e3df-6ab4-e789-70fb-3d3017121edb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5091e3df-6ab4-e789-70fb-3d3017121edb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.02.2021 um 23:21 hat Eric Blake geschrieben:
> On 2/24/21 7:52 AM, Kevin Wolf wrote:
> > This is a version of user_creatable_process_cmdline() with an Error
> > parameter that never calls exit() and is therefore usable in HMP.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  include/qom/object_interfaces.h | 16 ++++++++++++++++
> >  qom/object_interfaces.c         | 29 ++++++++++++++++++++++++-----
> >  2 files changed, 40 insertions(+), 5 deletions(-)
> > 
> 
> > +/**
> > + * user_creatable_add_from_str:
> > + * @optarg: the object definition string as passed on the command line
> > + * @errp: if an error occurs, a pointer to an area to store the error
> > + *
> > + * Create an instance of the user creatable object by parsing optarg
> > + * with a keyval parser and implicit key 'qom-type', converting the
> > + * result to ObjectOptions and calling into qmp_object_add().
> > + *
> > + * If a help option is given, print help instead.
> > + *
> > + * Returns: true when an object was successfully created, false when an error
> > + * occurred (*errp is set then) or help was printed (*errp is not set).
> > + */
> > +bool user_creatable_add_from_str(const char *optarg, Error **errp);
> 
> This could be used to fix the exit status 2 issue in qemu-img convert,
> if you rearrange the series a bit.

Thanks for the suggestion, with this reordering the fix became quite
simple.

Kevin


