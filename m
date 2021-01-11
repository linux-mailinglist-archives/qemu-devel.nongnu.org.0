Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7246E2F135D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:08:31 +0100 (CET)
Received: from localhost ([::1]:35300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kywvu-00089A-Ae
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kywtI-00078M-OS
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:05:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kywtF-00031l-OH
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:05:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610370343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AvLEURk5qT3RQCZrwcDkIdE4y79Kt1wcCQbxBtdW6gM=;
 b=T5chBlFjczOXLf6cF5Y+asb1xT48mYrigkSrNhYBN3gOaolskuwerl/rFwanJRYjiIB/ZI
 SIHLEwAaiVZWF8FJUvMKk1fdoVJ08vBQBZoD9nahypbNIcq/ZOhXW8MHm1BDe3RigC/vXE
 up6hhMW7CKtAGU+qLXFaPlQ23p2UH2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-I4th_mpYMpKk1P2muWE4Pw-1; Mon, 11 Jan 2021 08:05:41 -0500
X-MC-Unique: I4th_mpYMpKk1P2muWE4Pw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E06DCA0C06;
 Mon, 11 Jan 2021 13:05:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 954146EF53;
 Mon, 11 Jan 2021 13:05:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 26DE911386A7; Mon, 11 Jan 2021 14:05:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 18/20] keyval: Use GString to accumulate value strings
References: <20201211171152.146877-1-armbru@redhat.com>
 <20201211171152.146877-19-armbru@redhat.com>
 <ee46bd65-e6bd-929b-74d1-1fb8110879c1@redhat.com>
Date: Mon, 11 Jan 2021 14:05:39 +0100
In-Reply-To: <ee46bd65-e6bd-929b-74d1-1fb8110879c1@redhat.com> (Paolo
 Bonzini's message of "Tue, 22 Dec 2020 10:56:29 +0100")
Message-ID: <87lfczk4ik.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 11/12/20 18:11, Markus Armbruster wrote:
>> QString supports modifying its string, but it's quite limited: you can
>> only append.  The remaining callers use it for building an initial
>> string, never for modifying it later.
>> Change keyval_parse_one() to do build the initial string with
>> GString.
>> This is another step towards making QString immutable.
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> It's a bit unfortunate that the infamous "keyval: accept escaped
> commas in implied option" patch was already getting rid of mutable
> QString.
>
> It used a completely different mechanism, namely unescaping the string
> in place.  This means that my patch was doing n+1 allocations, versus
> a best case of n and a generic case of O(n) for this patch.  The 
> difference does not really matter, though I still like my code better.

My patch is not intended as a replacement of yours.  Mine does much
less.

I had to choose between creating a conflict and holding back my series
while we figure out what to do with your patch.  The dilemma is my own
doing; your patch is waiting just for me.  I picked the conflict.

I can look into rebasing your patch on top of mine.


