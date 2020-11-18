Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882E62B734A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 01:44:15 +0100 (CET)
Received: from localhost ([::1]:55526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfBa2-000879-33
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 19:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kfBXm-0007XV-6d
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 19:41:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kfBXe-0005Iu-PN
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 19:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605660103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+asSHWOvOwb13ecH6kKyZwFmxJKRiVJK7ZsrZSJ0NxI=;
 b=No1/85+z1y2ZQ+YPtguxpaq/H9lSIg/zC3YPw4x9zTWJOyv3XmKg2K2tGrZK695LjQDvrU
 3G0ZLnTqq3nVAjnrUP99qIJ6WoDKRw23TGloOGVvaCgxCSTTPIwhErK/ZBhUpdJ4oqQ/8e
 nNxVldc4qRJMCDq0X6wUb87vLErdUu8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-QD4ixjE3NL-mGeUSnyZOiw-1; Tue, 17 Nov 2020 19:41:38 -0500
X-MC-Unique: QD4ixjE3NL-mGeUSnyZOiw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3CC1100749C;
 Wed, 18 Nov 2020 00:41:37 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B7645D9CD;
 Wed, 18 Nov 2020 00:41:37 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
References: <20201113011340.463563-1-eblake@redhat.com>
 <20201113011340.463563-6-eblake@redhat.com>
 <87blfw9mf1.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 5/7] qapi: Introduce QAPI_LIST_APPEND
Message-ID: <53efa18b-9fe2-fe38-a416-7a4f3ba6e07e@redhat.com>
Date: Tue, 17 Nov 2020 18:41:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87blfw9mf1.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/20 6:51 AM, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
> 
>> Similar to the existing QAPI_LIST_PREPEND, but designed for use where
>> we want to preserve insertion order.  Callers will be added in
>> upcoming patches.  Note the difference in signature: PREPEND takes
>> List*, APPEND takes List**.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>

>> +#define QAPI_LIST_APPEND(tail, element) do { \
>> +    *(tail) = g_malloc0(sizeof(**(tail))); \
>> +    (*(tail))->value = (element); \
>> +    (tail) = &(*tail)->next; \

Hmm; I'm inconsistent on whether to spell things '*tail' or '*(tail)'.
I don't think any of the callers converted in patches 6 or 7 care about
the difference, but for maximal copy-paste portability, the use of the
macro parameter should be surrounded by () anywhere that could otherwise
cause a mis-parse on some arbitrary expression with an operator at
higher precedence than unary * (hmm, the only such operators are all
suffix operators; so maybe the *(tail) is overkill...)

> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


