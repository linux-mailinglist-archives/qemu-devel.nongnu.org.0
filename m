Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E6472379
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 10:06:44 +0100 (CET)
Received: from localhost ([::1]:57796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwhI9-0002ET-0Y
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 04:06:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mwhFb-00015g-S5
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:04:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mwhFX-0004gf-N1
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:04:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639386237;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Cq/FI3weVqv74Al9dLp3kMaQGrS+z4h9pdHWW3VDIys=;
 b=PjlZ8ryph0Sja+amQ8pLkA41jU/AgKOclwuP2K9y2og2SfDFB0+0XGG7eV2aaccGeZtqsM
 LOE1cFru+QYkOLFg+S6cZoWmDwc0TMBQoCFynggx/urTFRJKHwwAXq5Jxd7H2Y+9RLA3O+
 g1DvETXUhkp7oFg/tuW1TyrVVlMRr7k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-TaC_ReikMiWU5NusmA4Nhw-1; Mon, 13 Dec 2021 04:03:56 -0500
X-MC-Unique: TaC_ReikMiWU5NusmA4Nhw-1
Received: by mail-wr1-f69.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so3651570wrc.17
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 01:03:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Cq/FI3weVqv74Al9dLp3kMaQGrS+z4h9pdHWW3VDIys=;
 b=jjLnBD2yMhUEQ29jCzQvZBD7tUvt5WKIMl0v/Kbp6JNv4DOVK6ybvd0hXtktIAXfxk
 QZTjG66AmPFNboZcwN2kzjSMIwVD/7QkSXJv4WaGu4kHz3z9YVZ51jc5KsB30HIuRB/A
 WptIG4OAI99vgJjSE5DfHuwTJ0m+XxbeaHf0YkDZJDafWACsDY1MnEmcln8gAgA8SAF5
 BROyU15zkELN7VsKh60D2Dyqof57tP0AuMGKI3lj9SCrye7P/dFP2/ZYCFCphHOHtHdH
 kupjw6Tyjkx6iBC+OHtIGL0Mr1gRsVCngqHtdwFk4HjLnWoGwsyaz8ZvsPKZUhEqkZtT
 FvkQ==
X-Gm-Message-State: AOAM532jYN94PEaT/+vSdFAJ3Gz0fsVd18UMsiAr/nc43XJ8w9soDiCd
 9iZu8x51C0vYR/7SfDK0drl5+ey6gPNObFE/akBuIhF53KSkMp1gyHXEcIWDk5eT0wXlofx8dvO
 i5f+dT7ZBJ6PSfvk=
X-Received: by 2002:a05:600c:104b:: with SMTP id
 11mr37163843wmx.54.1639386234907; 
 Mon, 13 Dec 2021 01:03:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxT46ziaiaAqQM+5g18/6nWgAYIRNjtXd9eKffGmhBFZ8pN4EskDqFWvkaIFJv7s7QCuwT9g==
X-Received: by 2002:a05:600c:104b:: with SMTP id
 11mr37163809wmx.54.1639386234648; 
 Mon, 13 Dec 2021 01:03:54 -0800 (PST)
Received: from localhost (static-174-144-85-188.ipcom.comunitel.net.
 [188.85.144.174])
 by smtp.gmail.com with ESMTPSA id ay21sm6309621wmb.7.2021.12.13.01.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 01:03:54 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 23/23] migration: Use multifd before we check for the
 zero page
In-Reply-To: <Ya8NoTyiXOCQ/MLL@xz-m1.local> (Peter Xu's message of "Tue, 7 Dec
 2021 15:30:41 +0800")
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-24-quintela@redhat.com>
 <Yaj+V6LstcnNERaZ@work-vm> <87fsragb58.fsf@secure.mitica>
 <Ya8NoTyiXOCQ/MLL@xz-m1.local>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 13 Dec 2021 10:03:53 +0100
Message-ID: <87o85k7u6e.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> On Thu, Dec 02, 2021 at 06:38:27PM +0100, Juan Quintela wrote:
>> This needs to be improved to be compatible with old versions.
>
> Any plan to let new binary work with old binary?

Yes, but I was waiting for 7.0 to get out.  Basically I need to do:

if (old)
    run the old code
else
    new code

this needs to be done only in a couple of places, but I need the
machine_type 7.0 created to put the property there.

> Maybe boost the version field for multifd packet (along with a
> multifd_version=2 parameter and only set on new machine types)?

For now, we only need to add a flag for the ZERO_PAGE functionality.  if
we are on older qemu, just don't test for zero pages.  On reception, we
can just accept everything, i.e. if there are no zero pages, everything
is ok.

> PS: We should really have some handshake mechanism between src/dst, I dreamt it
> for a long time..  So that we only need to specify the capability/parameters on
> src someday and we'll never see incompatible migration failing randomly because
> the handshake should guarantee no stupid mistake..  Sad.

That has been on my ToDo list for too long, just need the time to do
it.  It would make everything much, much easier.

>> But .... if we don't care about RDMA, why do we care about
>> control_save_page()?
>
> Could anyone help to explain why we don't care?  I still see bugfixes coming..

Sentence was inside a context.  We don't care for RDMA while we are on
multifd.  If multifd ever supports RDMA, it would be a new
implementation that don't use such hooks.

IMVHO, RDMA implementation in qemu is quite bad.  For historic reasons,
they needed to use qemu_file abstraction for comunication, so they are
dropping directly the ability of doing direct copies of pages.
So, if one is requiring to mlock all the guest memory on both sides to
use RDMA, the *right* thing to do from my point of view is just
"remotely" read the page without any overhead.

Yes, that requires quite a bit of changes, I was not suggesting that it
was a trivial task.

Later, Juan.


