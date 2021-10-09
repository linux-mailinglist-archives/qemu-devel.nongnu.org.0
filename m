Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09087427A55
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 14:52:56 +0200 (CEST)
Received: from localhost ([::1]:51178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZBqQ-0000rv-Iw
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 08:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZBpP-00006j-8v
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 08:51:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZBpM-0003ai-Ex
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 08:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633783906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ue0sQNf8VZDV0P0UpW3TLMz5U2u943KGiyCqAZ6kMtc=;
 b=JVeLFlMROQPfdze9N3vYycTUGlynv0fN+yVXAYCt2J9sBzZL4jcmZfkEYJigPlYAjdEwV0
 qYVQXkzRFJINTXqWMADKWVttj6Sy1r6UQp53pbrmI/gVSkoq62nUa7jdNSc3LxgNj4PZ+g
 SDCh+Cf9hA1KXymGurcU4UUwLbnqdoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-FFHvwHcHPXer6Fx2Nvmzyg-1; Sat, 09 Oct 2021 08:51:43 -0400
X-MC-Unique: FFHvwHcHPXer6Fx2Nvmzyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70BF710A8E00
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 12:51:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DC9A60C05;
 Sat,  9 Oct 2021 12:51:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9D253113865F; Sat,  9 Oct 2021 14:51:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qapi: Make some ObjectTypes depend on the build settings
References: <20210928160232.432980-1-thuth@redhat.com>
 <87ee8v7mjq.fsf@dusky.pond.sub.org>
 <dd45c9c4-02b8-dfab-b7b0-f6d2346d4e70@redhat.com>
Date: Sat, 09 Oct 2021 14:51:40 +0200
In-Reply-To: <dd45c9c4-02b8-dfab-b7b0-f6d2346d4e70@redhat.com> (Paolo
 Bonzini's message of "Fri, 8 Oct 2021 19:13:11 +0200")
Message-ID: <87bl3yz7hf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 08/10/21 14:01, Markus Armbruster wrote:
>> Paolo, do you have something for QOM queued up already?  If not, I'm
>> happy to take this through my tree.
>> 
>
> I don't but I have enough stuff that I'll be sending a pull request
> shortly.  So, queued, and while at it I also made memory-backend-epc 
> depend on CONFIG_LINUX (more strictly it depends on CONFIG_SGX, which
> depends on CONFIG_KVM, which depends on CONFIG_LINUX; but the other
> two are target-dependent so we have to do with CONFIG_LINUX).

Thanks!

Could you throw in this one?

    Subject: [PATCH] monitor: Tidy up find_device_state()
    Date: Thu, 16 Sep 2021 13:17:07 +0200
    Message-Id: <20210916111707.84999-1-armbru@redhat.com>


