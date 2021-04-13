Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E348635D692
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 06:43:08 +0200 (CEST)
Received: from localhost ([::1]:49090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWAtH-0004Nz-Vj
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 00:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWArq-0003wZ-Ls
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 00:41:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWArm-0004ZK-Ts
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 00:41:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618288889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oA3mZsu0Ul0vWZCr4WQR2SfWApdc5Gs6fGv0dzMvPDU=;
 b=Eg3uw2Oiobvj7W3LvVzVCFwgPvF4BrCMZ/FITh2BJyiCghEEoS7cX/l+iIRX7t8R4y0aUY
 AbxA3gpHq0sxRYPD9fbJmZiAnbKvn2ISsSU9LJRW38WFxD7e3hPWFuRDSNRgGvEn1nhcDp
 DfJdyxRdb+FAhjys8NUjwVVtmbSA/cY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-hdZS_6qrOc2HicoUwCCv0w-1; Tue, 13 Apr 2021 00:41:28 -0400
X-MC-Unique: hdZS_6qrOc2HicoUwCCv0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36E3964149
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 04:41:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C8B55D9DE;
 Tue, 13 Apr 2021 04:41:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7341D113525D; Tue, 13 Apr 2021 06:41:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 2/3] qom: move user_creatable_add_opts logic to vl.c
 and QAPIfy it
References: <20210312173547.1283477-1-pbonzini@redhat.com>
 <20210312173547.1283477-3-pbonzini@redhat.com>
 <f0ea67d8-9641-104d-f8ec-5fc343256cc9@redhat.com>
Date: Tue, 13 Apr 2021 06:41:21 +0200
In-Reply-To: <f0ea67d8-9641-104d-f8ec-5fc343256cc9@redhat.com> (David
 Hildenbrand's message of "Mon, 12 Apr 2021 18:53:58 +0200")
Message-ID: <87im4q23v2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> writes:

> On 12.03.21 18:35, Paolo Bonzini wrote:
>> Emulators are currently using OptsVisitor (via user_creatable_add_opts)
>> to parse the -object command line option.  This has one extra feature,
>> compared to keyval, which is automatic conversion of integers to lists
>> as well as support for lists as repeated options:
>>    -object
>> memory-backend-ram,id=pc.ram,size=1048576000,host-nodes=0,policy=bind
>> So we cannot replace OptsVisitor with keyval right now.  Still, this
>> patch moves the user_creatable_add_opts logic to vl.c since it is
>> not needed anywhere else, and makes it go through user_creatable_add_qapi.
>> In order to minimize code changes, the predicate still takes a
>> string.
>> This can be changed later to use the ObjectType QAPI enum directly.
>> 
>
> Rebasing my "noreserve"[1] series on this, I get weird errors from
> QEMU when specifying the new "reserve=off" option for a
> memory-backend-ram:
>
> "Invalid parameter 'reserve'"
>
> And it looks like this is the case for any new properties. Poking
> around, I fail to find what's causing this -- or how to unlock new 
> properties. What is the magic toggle to make it work?
>
> Thanks!
>
> [1] https://lkml.kernel.org/r/20210319101230.21531-1-david@redhat.com

Wild guess: you didn't add your new properties in the QAPI schema.

For a not-so-wild-guess, send us a git-fetch argument for your rebased
series.


