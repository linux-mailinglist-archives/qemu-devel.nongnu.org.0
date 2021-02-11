Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103F3318D94
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:47:30 +0100 (CET)
Received: from localhost ([::1]:58010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lADFh-0005Cj-5d
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lAD9K-00015R-Lu
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:40:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lAD9I-0001P8-3a
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:40:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613054451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zrm+SLpIYa9gbf9XH+iYpy3l2eNSJwe99LqEgXi1slQ=;
 b=eobB5qCBlNMyl99XGuZ0C2JNxBop8mgmoMYVfLSEZieROSlGL26QM9vQ0XBznnYR3xHEsM
 bFrHqVxprDT89PtYBaBuCCXcEtpJ9EkTDm7ym5LNMnJ8/BkgibPcVU+iELK4tXOCESy7xh
 9xWv+qTuv908yScABEc+v9zftdFd7qc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-KSbKiWnyNoGXMOgFPQsf2Q-1; Thu, 11 Feb 2021 09:40:48 -0500
X-MC-Unique: KSbKiWnyNoGXMOgFPQsf2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2934F6D4E0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 14:40:47 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-229.rdu2.redhat.com [10.10.115.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9F9360BF1;
 Thu, 11 Feb 2021 14:40:31 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 48D51220BCF; Thu, 11 Feb 2021 09:40:31 -0500 (EST)
Date: Thu, 11 Feb 2021 09:40:31 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 23/24] vhost-user-fs: Implement drop CAP_FSETID
 functionality
Message-ID: <20210211144031.GB5014@redhat.com>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-24-dgilbert@redhat.com>
 <20210211143542.GT247031@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20210211143542.GT247031@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com,
 "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 02:35:42PM +0000, Stefan Hajnoczi wrote:
> On Tue, Feb 09, 2021 at 07:02:23PM +0000, Dr. David Alan Gilbert (git) wrote:
> > From: Vivek Goyal <vgoyal@redhat.com>
> > 
> > As part of slave_io message, slave can ask to do I/O on an fd. Additionally
> > slave can ask for dropping CAP_FSETID (if master has it) before doing I/O.
> > Implement functionality to drop CAP_FSETID and gain it back after the
> > operation.
> > 
> > This also creates a dependency on libcap-ng.
> 
> Is this patch only for the case where QEMU is running as root?
> 

Yes, it primarily is for the case where qemu is running as root, or
somebody managed to launch it non-root but with still having capability
CAP_FSETID.

Vivek

> I'm not sure it will have any effect on a regular QEMU (e.g. launched by
> libvirt).




