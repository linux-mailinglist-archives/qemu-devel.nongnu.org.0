Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC9E327FB8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:40:47 +0100 (CET)
Received: from localhost ([::1]:56948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGimz-0002bU-3B
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:40:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGiiU-0000Dh-Qa
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:36:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGiiO-0001TA-Fj
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614605759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9WwPFkMhJ+PCYKYriIwYhtfj1iqVS11R+yz3eF4uwok=;
 b=fpL+NMKkEHmQFWnwlk4xVo2UMxbEoxQGAyZvcGbRjn/vgR/Z/mZUDdckD/TUZenxhs4X2Z
 n5hdeEZezT65XsYAD2mzdwk3gbrRSD53dO1zF5rMXG83pfoyEx4tNhfXorxrzf/QO9F+7I
 OrYiLpoPf8xOGLY0ORi1f52QCB2lUF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-c5X8i-8SO3m4IiPmoao5LQ-1; Mon, 01 Mar 2021 08:35:57 -0500
X-MC-Unique: c5X8i-8SO3m4IiPmoao5LQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B14CB106BC90
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 13:35:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DADF10023B2;
 Mon,  1 Mar 2021 13:35:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0A910113860F; Mon,  1 Mar 2021 14:35:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 08/25] hmp: replace "O" parser with keyval
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-9-pbonzini@redhat.com>
 <87zh0xo0fw.fsf@dusky.pond.sub.org>
 <5473a3ec-8c9a-07f2-f822-87a0a0f25351@redhat.com>
 <87wnurji52.fsf@dusky.pond.sub.org>
 <c344a042-99de-ad78-813b-3463b4d42b18@redhat.com>
Date: Mon, 01 Mar 2021 14:35:54 +0100
In-Reply-To: <c344a042-99de-ad78-813b-3463b4d42b18@redhat.com> (Paolo
 Bonzini's message of "Mon, 1 Mar 2021 11:23:18 +0100")
Message-ID: <871rczhu85.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 01/03/21 11:14, Markus Armbruster wrote:
>> There is no reason to reject those IDs other than spoiling the fun we're
>> having with setting traps for our users.
>> 
>> Since QOM is treating '/' specially in paths, and uses IDs as path
>> components, it should reject '/' in IDs.  Same reasoning as for file
>> names.
>
> I agree; however I don't think it buys anything to do that in HMP rather 
> than further down the call chain, because in the end there are other 
> ways to get "anti-social" ids than HMP or the command line.  I commented 
> on Kevin's object-add series about this issue.

Further down is better provided further down actually does it :)

Anyway, please amend the commit message to describe user-visible
differences.  Doesn't have to be perfectly exhaustive; glossing over the
more eccentric corner cases should be okay.


