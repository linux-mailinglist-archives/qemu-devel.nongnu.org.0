Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D372E2DCA8E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 02:33:17 +0100 (CET)
Received: from localhost ([::1]:39274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpiAO-00051h-V8
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 20:33:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpi7c-0003oR-G6
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:30:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpi7U-0003fe-RK
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608168615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5BZ5hvRQNWN9gc2BE4pmI7SPisE86aLD3tnG5rhHWXA=;
 b=eyT01iX27Lbb8I1eS7KzuKrHykpSD5ObakAZf90uEGUTnv6Ty+B51Emfxg/OQjfblCyCkJ
 4iG+mqfS9xPiCrAq04D0K4Sv0i2MknLtv96QkTFnj2IKsKGQTB1HGvNYIf8qcc2n0T/z2o
 HfND/sQt8VsdHbvQSjkZmoNygFGZyrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-QFM1cGBBO5qbTMSDbl24Xw-1; Wed, 16 Dec 2020 20:30:13 -0500
X-MC-Unique: QFM1cGBBO5qbTMSDbl24Xw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85AF618C89DF
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:30:12 +0000 (UTC)
Received: from [10.10.112.131] (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0245F1E5;
 Thu, 17 Dec 2020 01:30:11 +0000 (UTC)
Subject: Re: [PATCH v2 09/11] qapi/introspect.py: create a typed 'Annotated'
 data strutcure
To: Markus Armbruster <armbru@redhat.com>
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-10-jsnow@redhat.com>
 <87y2j1zk35.fsf@dusky.pond.sub.org>
 <b27f7930-d86b-8357-84e4-7daef00023d7@redhat.com>
 <87bleuw7lm.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <74a24551-98ed-c95b-4ac9-caf7bf773e4a@redhat.com>
Date: Wed, 16 Dec 2020 20:30:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87bleuw7lm.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 2:08 AM, Markus Armbruster wrote:
>> We all have our phobias. I find "isinstance(x,
>> extremely_common_stdlib_type)" to be extremely fragile and likely to
>> frustrate.
> You're applying programming-in-the-large reasoning to a
> programming-in-the-small case.
> 

"Surely, they won't use my proof of concept code in production!"

Ah, alas, ...

> Say you're writing a piece of code you expect to be used in contexts you
> prudently refuse to predict.  The code deals with a bunch of basic
> Python types.  Reserving another basic Python type for internal use may
> well be unwise then, because it can make your code break confusingly
> when this other type appears in input.  Which it shouldn't, but making
> your reusable code harder to misuse, and misuses easier to diagnose are
> laudable goals.
> 
> This is not such a piece of code.  All the users it will ever have are
> in the same file of 200-something LOC.
> 

I'm just saying that this type of code has bitten me in the ass before. 
You're right that it's not likely to bite someone explicitly here, but 
that's indeed why it came in the "Also, ..." section.

I've reworked the commit message a bit by now, but I suspect you'll 
still want to take the red marker to it a bit.

--js


