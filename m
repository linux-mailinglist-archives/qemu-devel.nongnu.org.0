Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA73141EFDF
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 16:44:40 +0200 (CEST)
Received: from localhost ([::1]:49538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWJmB-0000wz-EQ
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 10:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mWJkG-0006zC-Tl
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 10:42:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mWJkC-0006An-T5
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 10:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633099355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C9pf8aolW+XlolbKscRbpuIIpleUgE8B9pyXl8y64NA=;
 b=BLDd2G9SGWZQ4quuyu8O65aqN1QW9E6f1nZnoyVxg19Q9Obk+ZjtodnTiDUvl6mujcQlPv
 RF82iXzxKHNTzlsi/x14ct2t9zXGYf2fPCUeK7YlrIlLLu5pC3UHEo0cOm4pJbDqQ1oW74
 tgITZGWciB4X0SAnF4vz8+fDX8gFpTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-6bx22-xAPpijxwN9-sa4Rw-1; Fri, 01 Oct 2021 10:42:34 -0400
X-MC-Unique: 6bx22-xAPpijxwN9-sa4Rw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44E52101F034;
 Fri,  1 Oct 2021 14:42:32 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16A225DF26;
 Fri,  1 Oct 2021 14:42:28 +0000 (UTC)
Date: Fri, 1 Oct 2021 16:42:25 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 09/11] qdev: Avoid QemuOpts in QMP device_add
Message-ID: <YVceUfvP2WU59l0L@angien.pipo.sk>
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-10-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210924090427.9218-10-kwolf@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pkrempa@redhat.com;
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
Cc: berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 11:04:25 +0200, Kevin Wolf wrote:
> Directly call qdev_device_add_from_qdict() for QMP device_add instead of
> first going through QemuOpts and converting back to QDict.
> 
> Note that this changes the behaviour of device_add, though in ways that
> should be considered bug fixes:
> 
> QemuOpts ignores differences between data types, so you could
> successfully pass a string "123" for an integer property, or a string
> "on" for a boolean property (and vice versa).  After this change, the
> correct data type for the property must be used in the JSON input.
> 
> qemu_opts_from_qdict() also silently ignores any options whose value is
> a QDict, QList or QNull.

Sorry for chiming in a bit late, but preferrably this commit should be
postponed to at least the next release so that we decrease the amount of
libvirt users broken by this.

Granted users are supposed to use new libvirt with new qemu but that's
not always the case.

Anyways, libvirt is currently mangling all the types to strings with
device_add. I'm currently working on fixing it and it will hopefully be
done until next-month's release, but preferrably we increase the window
of working combinations by postponing this until the next release.


