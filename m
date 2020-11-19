Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86E32B9C57
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 21:58:27 +0100 (CET)
Received: from localhost ([::1]:48562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfr0c-0001mE-Tf
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 15:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfqxY-0000KX-3a
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:55:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfqxR-0007rG-6U
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605819307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JFsSuA8euQNPZ+RLtnTF9EFCXgH5rbHtqDih7kzcQdQ=;
 b=VMydlUWrBTfZb42ykc0XxqrymTm//nVT5fSmKsVXCLWXT80aMVPM+5RnxCKi80oW6sWJvE
 /koiezI8u+lOn7Mfzi4vlv23Exy9mQZunIvm4zAafri/zz5RUiQj5qcTC7vxaFUQhYtIZm
 lZYH/h8Df5gGy5brfJOtMdIaVyP2pLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-F-1-saBmNA-uArh4RH-cEg-1; Thu, 19 Nov 2020 15:55:05 -0500
X-MC-Unique: F-1-saBmNA-uArh4RH-cEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 891EE801B13;
 Thu, 19 Nov 2020 20:55:04 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FB8E5C1D5;
 Thu, 19 Nov 2020 20:55:03 +0000 (UTC)
Date: Thu, 19 Nov 2020 15:55:02 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 3/8] qnum: QNumValue type for QNum value literals
Message-ID: <20201119205502.GC1509407@habkost.net>
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-4-ehabkost@redhat.com>
 <CAJ+F1C+YUZdP56MuLtZbO0fK6rPsDosgxXG4zaDq=mjwqsV74A@mail.gmail.com>
 <20201117144246.GD1235237@habkost.net>
 <CAJ+F1CLZg-hhuK2ffRzVaWiZKe2Aqvf0-mqxXGAzscSa8FmCNw@mail.gmail.com>
 <87mtzdd4p7.fsf@dusky.pond.sub.org>
 <20201119182158.GX1509407@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20201119182158.GX1509407@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 01:21:58PM -0500, Eduardo Habkost wrote:
> On Thu, Nov 19, 2020 at 11:24:52AM +0100, Markus Armbruster wrote:
[...]
> > >> > > +    return qnum_from_value((QNumValue) QNUM_VAL_INT(value));
> > 
> > No space between between (type) and its operand, please.
> > 
> > Could we lift the cast into the macro somehow?
> 
> I think we can.  I had thought the cast in the macro would break
> usage as static variable initializers.  I was wrong.

Actually, including the cast in the macro breaks QLIT_QDICT
initializers (which use (QLitDictEntry[]) compound literals), and
I don't know why.

Compound literals in initializers of static variables is a GCC
extension.  I don't understand why it doesn't work inside array
compound literals, though.

Any language lawyers around?

This works:

  typedef struct QLit {
      int x, y;
  } QLit;
  
  typedef struct Entry {
      int key;
      QLit value;
  } Entry;
  
  Entry e = { .key = 0, .value = (QLit) { 1,   2 } };

This works:

  Entry *es1 = (Entry[]) {
      { .key = 0, .value = { 1,   2 } },
  };

But this doesn't:

  Entry *es2 = (Entry[]) {
      { .key = 0, .value = (QLit) { 1,   2 } },
  };

dict.c:16:24: error: initializer element is not constant
   16 | Entry *es2 = (Entry[]) {
      |                        ^
dict.c:16:24: note: (near initialization for ‘es2’)

(gcc (GCC) 10.2.1 20201005 (Red Hat 10.2.1-5))

-- 
Eduardo


