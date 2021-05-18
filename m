Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A93A387C8C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:37:58 +0200 (CEST)
Received: from localhost ([::1]:35968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1nB-0003PK-HI
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj1Pr-00079X-NE
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:13:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj1Po-000359-G9
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621350826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eiYzh1kahLgy3++/SPy7PQrEOoh2f5gzcHjWO1+EkvY=;
 b=bA63EHvo2qOJdk3fiYteLhgk+g3KInNibQILndXJbYmubxidr2pMQUXVX6VjWjNRt27TUx
 skrDTzRaJRNa5V4AXO/U4rhGoNSPNhFKiId7ps09KXdoD20J1+CAl4P7ps0cpSLrJsYTQZ
 4wvCPH8KYdJQjnsg6Nn6dh2Wo8oBIog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-1SVYg0hBNka0quO4sa-NLg-1; Tue, 18 May 2021 11:13:44 -0400
X-MC-Unique: 1SVYg0hBNka0quO4sa-NLg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D73B2180FD7A;
 Tue, 18 May 2021 15:11:50 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41B765D9C0;
 Tue, 18 May 2021 15:11:50 +0000 (UTC)
Subject: Re: [PATCH v2 04/21] qapi/parser: factor parsing routine into method
To: Markus Armbruster <armbru@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
 <20210511220601.2110055-5-jsnow@redhat.com>
 <87sg2k5pq6.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <f2ce18af-72bf-5934-ab43-81d26f2cf7d8@redhat.com>
Date: Tue, 18 May 2021 11:11:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87sg2k5pq6.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 5:57 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> For the sake of keeping __init__ smaller (and treating it more like a
>> gallery of what state variables we can expect to see), put the actual
>> parsing action into a parse method. It remains invoked from the init
>> method to reduce churn.
> 
> I'm kind of *shrug* about this.  Well short of "no".
> 

Understood. Hopefully it's lateral movement at best to you; I don't want 
to make it distinctly worse in your eyes.

>>
>> To accomplish this, 'previously_included' becomes the private data
>> member '_included', and the filename is stashed as _fname.
> 
> Nitpick: you enclose most identifiers in quotes, but not all.
> 
> Comments and commit messages often profit from "marking up" identifiers.
> Especially when the identifiers are also common words.  I like to use
> function(), @variable, .attribute, and .method().
> 

Consistency in this regard is ... OK, not my strong suite. It can be 
hard to remember when to use which systems, and I'm caught between md, 
rst, kerneldoc, qapidoc, etc.

More or less, I am always happy if you just edit little things like this 
on pull as you see fit, I won't be mad.

I'll edit this in my local branch for now.

--js

>>
>> Add any missing declarations to the init method, and group them by
>> function so they can be understood quickly at a glance.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>


