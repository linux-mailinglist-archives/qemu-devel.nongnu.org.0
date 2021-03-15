Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A237833C24F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:39:52 +0100 (CET)
Received: from localhost ([::1]:51128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqFz-0006rB-Mz
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lLq9s-0004Vj-G7
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:33:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lLq9o-0008Bk-2N
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615826007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n61mOzB6iRymBCjmx6ysBT9V67ujKIOr50cxGVZmOAU=;
 b=AEAMl55MYDYy7w4Qex9RFaa6ZsnhqQK6miXw5K6NcOWh88QTusctcApyvFAy27/E6r58O7
 iVGc/v7qII6WRow7Q8QdZHWCjVDlUM63Oge5wcuKGJm01myi/DJmAX0p/5Jow0JWmQiP5o
 zcFaAgWXWDwiCKl8fsg6ys7PgaX+xHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-fvkEorS2MrW9PFQsicetMQ-1; Mon, 15 Mar 2021 12:33:24 -0400
X-MC-Unique: fvkEorS2MrW9PFQsicetMQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A39B80006E;
 Mon, 15 Mar 2021 16:33:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5D76100239A;
 Mon, 15 Mar 2021 16:33:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 33E7F1132C12; Mon, 15 Mar 2021 17:33:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v6 02/10] qapi: Implement deprecated-output=hide for QMP
 command results
References: <20210312153210.2810514-1-armbru@redhat.com>
 <20210312153210.2810514-3-armbru@redhat.com>
 <e4c303de-532f-7617-7f45-f1e0bc16c6d9@redhat.com>
Date: Mon, 15 Mar 2021 17:33:21 +0100
In-Reply-To: <e4c303de-532f-7617-7f45-f1e0bc16c6d9@redhat.com> (Eric Blake's
 message of "Mon, 15 Mar 2021 10:45:49 -0500")
Message-ID: <874khccr72.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: marcandre.lureau@gmail.com,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 3/12/21 9:32 AM, Markus Armbruster wrote:
>> This policy suppresses deprecated bits in output, and thus permits
>> "testing the future".  Implement it for QMP command results.  Example:
>> when QEMU is run with -compat deprecated-output=hide, then
>> 
>>     {"execute": "query-cpus-fast"}
>> 
>> yields
>> 
>>     {"return": [{"thread-id": 9805, "props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "qom-path": "/machine/unattached/device[0]", "cpu-index": 0, "target": "x86_64"}]}
>> 
>> instead of
>> 
>>     {"return": [{"arch": "x86", "thread-id": 22436, "props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "qom-path": "/machine/unattached/device[0]", "cpu-index": 0, "target": "x86_64"}]}
>
> Example may not be relevant much longer, given Dan's patch [1] to make
> this permanent since we've already passed the deprecation wait.  Up to
> you if you want to choose a different example.
>
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg07564.html

I think I'll keep this one just to save me some time.  Even a slightly
outdated example should serve okay as illustration.

>
>> 
>> Note the suppression of deprecated member "arch".
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> ---
>
> R-b still stands.

Thanks!


