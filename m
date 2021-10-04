Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F264F421145
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 16:24:57 +0200 (CEST)
Received: from localhost ([::1]:50776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXOtk-0002rp-IU
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 10:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mXOrX-0008D5-PP
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:22:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mXOrT-00035p-35
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633357353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MGDDz0ncXtyZX+/29Br4T/8/DOey5CzK//CduoCVJfQ=;
 b=jOrLAUjrAgPWQM6DrfVJ4VKa7c2rJA8XxhNexJ52gec0ClDcULHFHHhE0Py5xfjc8egoQS
 6gNHUm5YhnqfxbUFNRLId9rOU+FB+00WxXkXez7Ait0GoxHQTQbNJp6cSJQXw+Xlfu+p5t
 FoldsdJjnu59Tmgih8sqKbX65fp0FdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-J6Yxm89rNrqqYzylkBS6hA-1; Mon, 04 Oct 2021 10:22:31 -0400
X-MC-Unique: J6Yxm89rNrqqYzylkBS6hA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5565D1926DB9;
 Mon,  4 Oct 2021 14:22:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ABBD5D740;
 Mon,  4 Oct 2021 14:22:23 +0000 (UTC)
Date: Mon, 4 Oct 2021 16:22:22 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH 09/11] qdev: Avoid QemuOpts in QMP device_add
Message-ID: <YVsOHo/Vgp6giImy@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-10-kwolf@redhat.com>
 <YVceUfvP2WU59l0L@angien.pipo.sk>
 <4d932317-a6aa-40d7-e8b4-86d23638a8bb@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <4d932317-a6aa-40d7-e8b4-86d23638a8bb@greensocs.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Krempa <pkrempa@redhat.com>, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.10.2021 um 14:18 hat Damien Hedde geschrieben:
> 
> 
> On 10/1/21 16:42, Peter Krempa wrote:
> > On Fri, Sep 24, 2021 at 11:04:25 +0200, Kevin Wolf wrote:
> > > Directly call qdev_device_add_from_qdict() for QMP device_add instead of
> > > first going through QemuOpts and converting back to QDict.
> > > 
> > > Note that this changes the behaviour of device_add, though in ways that
> > > should be considered bug fixes:
> > > 
> > > QemuOpts ignores differences between data types, so you could
> > > successfully pass a string "123" for an integer property, or a string
> > > "on" for a boolean property (and vice versa).  After this change, the
> > > correct data type for the property must be used in the JSON input.
> > > 
> > > qemu_opts_from_qdict() also silently ignores any options whose value is
> > > a QDict, QList or QNull.
> > 
> > Sorry for chiming in a bit late, but preferrably this commit should be
> > postponed to at least the next release so that we decrease the amount of
> > libvirt users broken by this.
> > 
> > Granted users are supposed to use new libvirt with new qemu but that's
> > not always the case.
> > 
> > Anyways, libvirt is currently mangling all the types to strings with
> > device_add. I'm currently working on fixing it and it will hopefully be
> > done until next-month's release, but preferrably we increase the window
> > of working combinations by postponing this until the next release.
> 
> Switching to qdict is really an improvement I think.
> 
> If we choose to keep legacy behavior working for now, I think we
> should find a way to still do this switch. Maybe we can temporarily
> keep the str_to_int and str_to_bool conversion when converting the
> qdict to the qdev properties afterward?

I guess we can keep the detour through QemuOpts for QMP for now, and
make sure that the command line code bypasses this bit and still
requires correct types for JSON input. It's only this patch that breaks
compatibility with libvirt, patch 8 should still be okay.

Kevin


