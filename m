Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D833E4DA1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 22:09:19 +0200 (CEST)
Received: from localhost ([::1]:58730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDBaH-0006DY-Jy
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 16:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDBYn-0004sr-6C
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:07:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDBYk-0008VH-3L
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:07:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628539660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKxQqqxy4qN6Zc1/b/V8brwc0wnaWGpYdj6g143KJJ0=;
 b=SIRfJQruU31tS05P/MIfswlM/7hudbubu2ONLoix5jUMjOefB43oFCiycBSgpGA9d2bvWP
 8e8JYKtS/uGfCKtiYMbsM3pqAdJY6hW/sIqghWLmUfPoiMUU78smwpm9NgJ+zSVT1Jyww4
 pKAE1SDctflVN+zU8S4tukvT+SOZNU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-z7BfcPExPBeXpc9FSiStvQ-1; Mon, 09 Aug 2021 16:07:39 -0400
X-MC-Unique: z7BfcPExPBeXpc9FSiStvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 433CE190D340
 for <qemu-devel@nongnu.org>; Mon,  9 Aug 2021 20:07:38 +0000 (UTC)
Received: from localhost (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED34C19D9D;
 Mon,  9 Aug 2021 20:07:37 +0000 (UTC)
Date: Mon, 9 Aug 2021 14:00:18 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH for-6.2 00/12] qom: Get rid of all manual usage of
 OBJECT_CHECK & friends
Message-ID: <20210809180018.ud6f44oebj6d2wpj@habkost.net>
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <434ed8d4-f52f-375b-99a0-dfd5cf656356@redhat.com>
MIME-Version: 1.0
In-Reply-To: <434ed8d4-f52f-375b-99a0-dfd5cf656356@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Aug 07, 2021 at 10:15:52AM +0200, Philippe Mathieu-Daudé wrote:
> On 8/6/21 11:11 PM, Eduardo Habkost wrote:
> > This series gets rid of all manual usage of OBJECT_CHECK,
> > OBJECT_CLASS_CHECK, and OBJECT_GET_CLASS.
> > 
> > All type check macros defined manually are replaced with
> > DEFINE_*CHECKER* or OBJECT_DECLARE* macros.
> > 
> > All manual usage of OBJECT_CHECK/OBJECT_CLASS_CHECK/OBJECT_GET_CLASS
> > is manually replaced with the corresponding type-specific wrappers.
> 
> Is INTERFACE_CHECK already converted / in good shape?

Not yet.  I need to refresh my memory by looking at mailing list
archives, but I have a work in progress branch that I haven't
touched in a while (except for rebasing it) at:

https://gitlab.com/ehabkost/qemu/-/commits/work/qom-declare-interface-type/

Basically it introduces a DECLARE_INTERFACE_CHECKER macro instead
of reusing OBJECT_CHECK/DECLARE_INSTANCE_CHECKER.

-- 
Eduardo


