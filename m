Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613753A8967
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 21:16:36 +0200 (CEST)
Received: from localhost ([::1]:50416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltEY6-0006kR-UU
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 15:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ltEWg-00062G-3M
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 15:15:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ltEWb-0002ty-R0
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 15:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623784500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fVod3hNbnwQ0u7M4xkk93qAIkryE13iTOV7eNKs+aQM=;
 b=T4IZEwyfZ2dhwUsr+sYRu8+E+9NWzy4+ilohOsD3u1ZJARXWzpQARjPkrwdsr6VTWDvhPA
 YBolDnBgsfsaQZJ+efMGgwHdDm7ynyHLFIbn6H8ERfF2tJmHQVz2DCJUEoREbTRtJ3hHRx
 2/h0VAET+U5yPDBcDcnUW7WvCwfm3n0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-Lz1xq3_GMTeKH5836bBqLA-1; Tue, 15 Jun 2021 15:14:51 -0400
X-MC-Unique: Lz1xq3_GMTeKH5836bBqLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20DA9800D62;
 Tue, 15 Jun 2021 19:14:50 +0000 (UTC)
Received: from work-vm (ovpn-112-179.ams2.redhat.com [10.36.112.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3414519D61;
 Tue, 15 Jun 2021 19:14:32 +0000 (UTC)
Date: Tue, 15 Jun 2021 20:14:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 00/22] Live Update [reboot]
Message-ID: <YMj8Fh2FAYJ5Pb/c@work-vm>
References: <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
 <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
 <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com>
 <YKOPnkefxgRZ8PoQ@work-vm>
 <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com>
 <YKQULUn5F+x1wrYI@work-vm>
 <38dc91ab-b96b-1cc3-bf8b-84ff77b334fd@oracle.com>
 <YKZdcSt0ltCBqVsz@work-vm>
 <5dc94efc-cb95-d7ff-cad3-391c90b3264f@oracle.com>
MIME-Version: 1.0
In-Reply-To: <5dc94efc-cb95-d7ff-cad3-391c90b3264f@oracle.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Steven Sistare (steven.sistare@oracle.com) wrote:
> On 5/20/2021 9:00 AM, Dr. David Alan Gilbert wrote:
> > Hi Steven,
> >   I'd like to split the discussion into reboot and restart,
> > so I can make sure I understand them individually.
> > 
> > So reboot mode;
> > Can you explain which parts of this series are needed for reboot mode;
> > I've managed to do a kexec based reboot on qemu with the current qemu -
> > albeit with no vfio devices, my current understanding is that for doing
> > reboot with vfio we just need some way of getting migrate to send the
> > metadata associated with vfio devices if the guest is in S3.
> > 
> > Is there something I'm missing and which you have in this series?
> 
> You are correct, this series has little special code for reboot mode, but it does allow
> reboot and restart to be handled similarly, which simplifies the management layer because 
> the same calls are performed for each mode. 
> 
> For vfio in reboot mode, prior to sending cprload, the manager sends the guest-suspend-ram
> command to the qemu guest agent. This flushes requests and brings the guest device to a 
> reset state, so there is no vfio metadata to save.  Reboot mode does not call vfio_cprsave.
> 
> There are a few unique patches to support reboot mode.  One is qemu_ram_volatile, which
> is a sanity check that the writable ram blocks are backed by some form of shared memory.
> Plus there are a few fragments in the "cpr" patch that handle the suspended state that
> is induced by guest-suspend-ram.  See qemu_system_start_on_wake_request() and instances
> of RUN_STATE_SUSPENDED in migration/cpr.c

Could you split the 'reboot' part of separately, then we can review
that and perhaps get it in first? It should be a relatively small patch
set - it'll get things moving in the right direction.

The guest-suspend-ram stuff seems reasonable as an idea; lets just try
and avoid doing it all via environment variables though; make it proper
command line options.

Dave

> - Steve
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


