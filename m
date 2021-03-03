Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BA732B862
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:52:35 +0100 (CET)
Received: from localhost ([::1]:36140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHRvW-0004cz-DB
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHRud-00049I-Kg
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:51:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHRuc-0001e8-7e
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:51:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614779497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CCV06K+DG4izRPvayX1OWjregjBy5R+MBdyh8OfkOwU=;
 b=OCU/ksCxFV/moNS5NqySjkOCT3pi5CkGdZ40pWeEAf0RonNQ4xixwUhefJRgpM+OhC330W
 clFCypxLWMhE3boxcTtwDE/4uAEIKsOHuLAxsH1JaoGL/Fz7sdBrAVl+5nROwm2T0rjBHh
 4VjM5Qhy7g2NqG5ye7p4QxfImLXLsBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-OmyC3za1NRGX_lb_dWnHuQ-1; Wed, 03 Mar 2021 08:51:35 -0500
X-MC-Unique: OmyC3za1NRGX_lb_dWnHuQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCD42100CCC3
 for <qemu-devel@nongnu.org>; Wed,  3 Mar 2021 13:51:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EEC25C238;
 Wed,  3 Mar 2021 13:51:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 36C21113860F; Wed,  3 Mar 2021 14:51:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] chardev: add nodelay option
References: <20210303123235.63171-1-pbonzini@redhat.com>
 <87mtvkjrpe.fsf@dusky.pond.sub.org>
 <f8514ec5-76e0-e602-4dee-8a28d29a0aa3@redhat.com>
Date: Wed, 03 Mar 2021 14:51:32 +0100
In-Reply-To: <f8514ec5-76e0-e602-4dee-8a28d29a0aa3@redhat.com> (Paolo
 Bonzini's message of "Wed, 3 Mar 2021 14:31:09 +0100")
Message-ID: <87v9a8ibvf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 03/03/21 14:24, Markus Armbruster wrote:
>> $ qemu-system-x86_64 -chardev socket,id=chr0,path=sock,nodelay=on
>> qemu-system-x86_64: -chardev socket,id=chr0,path=sock,nodelay=on: Invalid parameter 'nodelay'
>> 
>> You forgot to update qemu_chardev_opts:
>> 
>>     diff --git a/chardev/char.c b/chardev/char.c
>>     index 288efebd12..e6128c046f 100644
>>     --- a/chardev/char.c
>>     +++ b/chardev/char.c
>>     @@ -864,6 +864,9 @@ QemuOptsList qemu_chardev_opts = {
>>              },{
>>                  .name = "server",
>>                  .type = QEMU_OPT_BOOL,
>>     +        },{
>>     +            .name = "nodelay",
>>     +            .type = QEMU_OPT_BOOL,
>>              },{
>>                  .name = "delay",
>>                  .type = QEMU_OPT_BOOL,
>
> Well, I forgot to commit it.  But the outcome is the same.  Thanks. :(

Happens to the best of us :)

I'm glad I didn't accuse you of forgetting to test!


