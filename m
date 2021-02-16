Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB0831CC6A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:51:58 +0100 (CET)
Received: from localhost ([::1]:38290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1hm-0006Az-1E
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:51:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lC1g7-0004k9-Li
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:50:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lC1g6-0004bU-8d
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:50:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613487012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWvrs3yQ9kZPxKF4Fz4oEyIhuqvOitjo0W/J7v7is+g=;
 b=OSDfBq14xWvbtglvoC1RoPgf+bfYtrlfWomqmVFv6fWeef9ijesJoVf2YITOvStlLxjzUK
 Hllp3Vdb7v7PgVkMMPM+a0MlrRa7ifXTq+AvfDwsgdTm9wD9CtcaUPpX03S4KhFkvyp86l
 PLdkq/E86aVYAwU3XmTq2toKoQgCDJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-8ePL1qwdOEGwUuAlsNpIzg-1; Tue, 16 Feb 2021 09:50:07 -0500
X-MC-Unique: 8ePL1qwdOEGwUuAlsNpIzg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDB6587124A;
 Tue, 16 Feb 2021 14:50:01 +0000 (UTC)
Received: from gondolin (ovpn-113-145.ams2.redhat.com [10.36.113.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A6D460C9B;
 Tue, 16 Feb 2021 14:50:00 +0000 (UTC)
Date: Tue, 16 Feb 2021 15:49:57 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] pc-bios/s390-ccw: Use memory barriers in virtio code
Message-ID: <20210216154957.1cc0afdf.cohuck@redhat.com>
In-Reply-To: <CAFEAcA8H=ixwj6PtGSDtEuiADY775o68gk8DZ5PrwOjftqtWtg@mail.gmail.com>
References: <20210216110056.1228582-1-thuth@redhat.com>
 <20210216124757.4eb664e9.cohuck@redhat.com>
 <a561530e-d800-67e0-ee2b-fea6efb4638c@redhat.com>
 <20210216153003.16b05725.cohuck@redhat.com>
 <CAFEAcA-B1pXNs8X+mha3x9Ynt83dkmC9sL_XGtextCD3qDXeAQ@mail.gmail.com>
 <5765bde0-f222-4b07-25d4-430b101ef8ff@redhat.com>
 <CAFEAcA8H=ixwj6PtGSDtEuiADY775o68gk8DZ5PrwOjftqtWtg@mail.gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 14:37:22 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 16 Feb 2021 at 14:35, Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 16/02/2021 15.32, Peter Maydell wrote:  
> > > On Tue, 16 Feb 2021 at 14:30, Cornelia Huck <cohuck@redhat.com> wrote:  
> > >> Step 4 in "2.7.13 Supplying Buffers to The Device":
> > >>
> > >> "The driver performs a suitable memory barrier to ensure the device
> > >> sees the updated descriptor table and available ring before the next
> > >> step."  
> > >
> > > I thought that my first time through the spec as well, but
> > > I think the whole of section 2.7 is dealing with "packed virtqueues",
> > > which have to be explicitly negotiated and which I don't think
> > > the s390-ccw code is doing.  

2.7 is split, 2.8 packed (at least in my built-from-git version; maybe
I should have mentioned that :)

> >
> > Right. I think the s390-ccw code is still based on virtio v1.0, that's why I
> > also only looked at that version of the spec.  

Yes, the bios code is using split.

> I think the ideal would be to find somebody who's really well
> acquainted with the virtio spec (MST?) and ask them to have
> a quick look-over the s390-ccw code to say where it needs
> changes... The fact that this patch doesn't completely fix
> the bug leaves me suspicious that we're missing something in
> our readings of the spec.

Unfortunately, the bios virtio code is not that easy to follow :/


