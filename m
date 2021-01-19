Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6443D2FB5BA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 12:39:49 +0100 (CET)
Received: from localhost ([::1]:38254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1pMN-0008Gh-2O
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 06:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l1pJ1-00077r-6H
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:36:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l1pIw-0000HM-54
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611056167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cbTQCddKRqZMeCaJfuJIl7tYjRKsLLMj4us5Z3SryV4=;
 b=gEhBeAKKEDCKQJPNA/fFoSmHxbvyStc6+sj1QvjjKXNu7mhg3KS8WRqRFAj0pUy9X/K9xI
 jzp4EkS8cB/IhN01CLoHNrhd6tZ/UiHKvLt6TU4totEMzUlOwz8kVqiIM5CUVXgPZLCT+t
 Xoh4V/wmcCzQ3ozy0NF/5dL5oHBB/Pc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-8PdUeptlNBC93GEHMOOyyw-1; Tue, 19 Jan 2021 06:36:06 -0500
X-MC-Unique: 8PdUeptlNBC93GEHMOOyyw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11B18800D62;
 Tue, 19 Jan 2021 11:36:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8D4C19C93;
 Tue, 19 Jan 2021 11:36:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4AC94113865F; Tue, 19 Jan 2021 12:36:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Realize methods realizing "sideways" in the composition tree
References: <87im7yi519.fsf@dusky.pond.sub.org>
 <CAFEAcA_MT6z4ey79o+WhX=og57HWR32rnzajFYLGvLnQtS1BRQ@mail.gmail.com>
Date: Tue, 19 Jan 2021 12:36:00 +0100
In-Reply-To: <CAFEAcA_MT6z4ey79o+WhX=og57HWR32rnzajFYLGvLnQtS1BRQ@mail.gmail.com>
 (Peter Maydell's message of "Fri, 15 Jan 2021 15:50:40 +0000")
Message-ID: <87czy1upjz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 15 Jan 2021 at 15:45, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> The .realize() method realizes the child at (1).  It should use
>> qdev_realize() like we do everywhere else, since commit ce189ab230
>> "qdev: Convert bus-less devices to qdev_realize() with Coccinelle".
>>
>> It sets a link property from the child back to the parent at (2).  Why
>> do we need a link?  Each QOM Object contains a pointer to its parent,
>> doesn't it?
>
> It does, but what should parent object pointers be used for?
> My assumption is that you'd only use those where you really
> wanted to traverse the QOM tree. Generally I would use a link
> property when I wanted one object to have a pointer to the
> other regardless of what the QOM-tree relationship happens to
> be. Today all the users of XHCIState happen to create it in a
> way that means they're parents of it, but that doesn't seem
> like it should be an inherent requirement that we bake into
> its API.

Makes sense.

I'll post a patch to use qdev_realize().

Thanks!


