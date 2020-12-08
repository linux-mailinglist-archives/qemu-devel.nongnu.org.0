Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA61E2D2994
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 12:12:34 +0100 (CET)
Received: from localhost ([::1]:40728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmav4-0008LJ-1X
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 06:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmatj-0007vb-V5
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:11:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmati-0004ZO-2t
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607425869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8rtpuf3ahQAFEjgKm+X3ChB4IQrwyFfG2+2TRAgCGuY=;
 b=HIweCgnMXLKcrMsWCzhAQTEciqqJLRv+0t29hmOgb7Fkcu/fRtevCVDyVnoBZ0xLU4gMHa
 NlGsa3FiHSBcYWXZZXEbNlqLUeuCPwz6Nmp7da8G2Npr9SO2w25/8OScJJUddzmmC9PeLO
 lmCk09FKT/0eYOGynCbroAHorXJvNyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-aGywE1xhN3SfGrtvvaCPZA-1; Tue, 08 Dec 2020 06:11:07 -0500
X-MC-Unique: aGywE1xhN3SfGrtvvaCPZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CDE7802B45
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 11:11:05 +0000 (UTC)
Received: from localhost (unknown [10.40.208.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7610519D80;
 Tue,  8 Dec 2020 11:11:04 +0000 (UTC)
Date: Tue, 8 Dec 2020 12:11:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 11/15] qtest: add a QOM object for qtest
Message-ID: <20201208121102.349b46ca@redhat.com>
In-Reply-To: <CABgObfbdZdmWETOVr8=-19pSFc_b02zNKr4ZzbkHKT-qRTwNVg@mail.gmail.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-12-pbonzini@redhat.com>
 <20201207172447.77d22d17@redhat.com>
 <853e64f9-9a37-5214-0111-b489dc82af44@redhat.com>
 <20201207175739.2f51f87e@redhat.com>
 <CABgObfbdZdmWETOVr8=-19pSFc_b02zNKr4ZzbkHKT-qRTwNVg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Dec 2020 18:22:55 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Il lun 7 dic 2020, 17:57 Igor Mammedov <imammedo@redhat.com> ha scritto:
> 
> > On Mon, 7 Dec 2020 17:43:16 +0100
> > Paolo Bonzini <pbonzini@redhat.com> wrote:
> >  
> > > On 07/12/20 17:24, Igor Mammedov wrote:  
> > > >> +void qtest_server_init(const char *qtest_chrdev, const char  
> > *qtest_log, Error **errp)  
> > > >> +{
> > > >> +    Chardev *chr;
> > > >> +
> > > >> +    chr = qemu_chr_new("qtest", qtest_chrdev, NULL);
> > > >> +
> > > >> +    if (chr == NULL) {
> > > >> +        error_setg(errp, "Failed to initialize device for qtest:  
> > \"%s\"",  
> > > >> +                   qtest_chrdev);
> > > >> +        return;
> > > >> +    }
> > > >> +
> > > >> +    qtest_server_start(chr, qtest_log, errp);  
> > > > why not create qtest object here instead of trying to preserve old way,
> > > > or create it directly at the place that calls qtest_server_init()?  
> > >
> > > Because I wasn't sure of where to put it in the QOM object tree.  So I
> > > punted and left it for later.  
> >
> > but you implicitly decided where it should be (with -object qtest),
> > it goes to /objects.
> > So I'd wouldn't put anywhere else to be consistent.
> >  
> 
> No, /objects is for stuff created with -object exclusively. I suppose I
> could have the "well-known path" be /machine/qtest, and it would be either
> a child (for -qtest) or a link to /objects/some-id (for -object qtest).
> Should I implement that (as a separate patch on top of this one)?
yes

> 
> Paolo
> 
> 
> 
> > >
> > > Paolo
> > >  
> >
> >  


