Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A89E36C76F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 16:00:12 +0200 (CEST)
Received: from localhost ([::1]:52868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbOG3-0007Ox-7a
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 10:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbOEi-0006Pr-Fb
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 09:58:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbOEe-0002Na-Fg
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 09:58:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619531922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7dueg7G2oWpmMVvwa3Z5krA8qOrteVhUPjRUsIzNLks=;
 b=FE8O3M3e8PQNz/7GJ86/e2pkVRXjxyV7jvAuPqaF7qDBVxtXJ3B+SyejdbFfCvhp++MJVM
 5zRz82hGKt+eonznNyOkdhS6rOFLT45DXRjf0l7brijlI28XWQfuOZxH/SbV4hTV57XBKu
 WCpohnNRMJqVc+tb7acH2kgvzRFt1F4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-yZnNf8fQNXabh-DjvkDmRg-1; Tue, 27 Apr 2021 09:58:38 -0400
X-MC-Unique: yZnNf8fQNXabh-DjvkDmRg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1D0C1006C86;
 Tue, 27 Apr 2021 13:58:37 +0000 (UTC)
Received: from [10.10.112.236] (ovpn-112-236.rdu2.redhat.com [10.10.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25AE95C23E;
 Tue, 27 Apr 2021 13:58:37 +0000 (UTC)
Subject: Re: [PATCH 05/22] qapi/parser: Assert lexer value is a string
To: Markus Armbruster <armbru@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-6-jsnow@redhat.com>
 <87k0os9j4t.fsf@dusky.pond.sub.org>
 <d7f40069-3e64-9077-f2ac-48f003c83962@redhat.com>
 <874kfrykna.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <48c90a38-d00e-c894-04f0-c4c8acdf4a41@redhat.com>
Date: Tue, 27 Apr 2021 09:58:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <874kfrykna.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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

On 4/27/21 8:30 AM, Markus Armbruster wrote:
> I assume you need this assertion for mypy.  If yes, let's get the job
> done with minimal fuss.  If no, please drop the assertion entirely.

Yep, needed for mypy. You are right that these assertions are for 
clarifying postconditions of accept() that tie together the value of 
.tok with the type of .val.

I'll replace the message with a better comment, but we do still need either:

(1) A way to make the return from accept() statically type-safe, or
(2) The assertion.

As with most of the patches after part one of this series, I've opted 
for the quicker thing to speed us along to a clean mypy baseline.

(Though I have spent some time prototyping solutions for #1...)

--js


