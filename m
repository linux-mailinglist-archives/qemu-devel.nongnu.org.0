Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EBF4450D6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 10:02:37 +0100 (CET)
Received: from localhost ([::1]:57334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miYdo-0000Ac-3T
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 05:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miYbR-0006vZ-Up
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 05:00:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miYbL-0001Dn-M6
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 05:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636016402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FIPPDNKQ0qyLWILCbVGSCQjEl17eiu2tMV6ymZ+/N9g=;
 b=PTSvnb8GIBmtthB8emn3SG+oA9ObHLc0ImlFHitii0aPLNT0a8K2BYwkk98MnHbce6Tyh6
 BfGd418kZzRvxKvIFGbSiiWu5b0nfvgrITVUoIsqjyTfQv0vrLEt6a47Slfar54njMHRWL
 uNfaBooGUkwtfHVtPJYg/f0ki7nmy5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-RxWsZyI3PlmZsYuv7yLxfw-1; Thu, 04 Nov 2021 04:59:59 -0400
X-MC-Unique: RxWsZyI3PlmZsYuv7yLxfw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A27781006AA2;
 Thu,  4 Nov 2021 08:59:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C16091F41E;
 Thu,  4 Nov 2021 08:59:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6D17811380A7; Thu,  4 Nov 2021 09:59:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] monitor: Fix find_device_state() for IDs containing
 slashes
References: <20211019085711.86377-1-armbru@redhat.com>
 <367cc443-7e2a-36e0-b3fb-bf79b2d65b2d@redhat.com>
 <877ddx3dx9.fsf@dusky.pond.sub.org>
Date: Thu, 04 Nov 2021 09:59:54 +0100
In-Reply-To: <877ddx3dx9.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Thu, 28 Oct 2021 07:40:18 +0200")
Message-ID: <87y264e1o5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: damien.hedde@greensocs.com, borntraeger@de.ibm.com, berrange@redhat.com,
 qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Paolo Bonzini <pbonzini@redhat.com> writes:
>
>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>>
>> Thanks for the quick fix!
>
> Who's going to do the pull request?

Ping!


