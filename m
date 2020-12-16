Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61842DC706
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:24:51 +0100 (CET)
Received: from localhost ([::1]:34102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcPq-0006rX-MF
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpcDp-0006t4-Oy
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:12:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpcDn-0007vp-01
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608145942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zpUt7F5A9tia/glxv0LbPNobcaL1uvibDCG7Dh1RyEM=;
 b=dvKlTNH1PAwHoDLbiZcrY9y9YCV25L/VCRaIb1WY4K9EzqUYFGskUCNvWN5+XJj3TDomAQ
 hVMpsHPiuvGiUAuuMROBPbJbTpOiFnhrc9fk0C7nAY+ysMMIjLNN6l3+RebbOaKWt8Gv/+
 poj4Kbh82q9aATCEnF2W3AJD3tqPKgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-s5zyghaUOjSxnK7da9HikA-1; Wed, 16 Dec 2020 14:12:20 -0500
X-MC-Unique: s5zyghaUOjSxnK7da9HikA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 962408049EE
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 19:12:14 +0000 (UTC)
Received: from [10.10.120.103] (ovpn-120-103.rdu2.redhat.com [10.10.120.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B933310429F3;
 Wed, 16 Dec 2020 19:11:35 +0000 (UTC)
Subject: Re: [PATCH 06/12] qapi/source: Add builtin null-object sentinel
To: Markus Armbruster <armbru@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-7-jsnow@redhat.com>
 <87r1nqrtp7.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <9f25c91a-774d-fbe3-3780-5415e7a54524@redhat.com>
Date: Wed, 16 Dec 2020 14:11:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87r1nqrtp7.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 4:22 AM, Markus Armbruster wrote:
> 2. On error with "no source info", don't crash.
> 
>     I have my doubts on this one.
> 
>     Such an error means the QAPI code generator screwed up, at least in
>     theory.  Crashing is only proper.  It gets the screwup fixed.
> 

QAPISemError and friends will also halt the generator and don't produce 
output and will fail tests. They aren't less visible or more ignorable 
somehow.

>     In practice, errors due to interactions between built-in stuff and
>     user-defined stuff could conceivably escape testing.  I can't
>     remember such a case offhand.
> 
>     Will the "no source info" error be more useful than a crash?
>     Possibly.  Will it get the screwup fixed?  Maybe not.

I don't understand this; if it's an error -- there's no QAPI, there's no 
QEMU. It's definitely getting fixed.

If QAPISourceInfo is primarily used for printing error information, we 
are already in a situation where the generator is hosed and has wandered 
itself into a problem that can't be ignored.

There's no additional value in having python crash twice per every crash 
because we have bad types in our error reporting functions.

--js


