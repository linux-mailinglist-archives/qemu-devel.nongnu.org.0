Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D45037FD01
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:56:49 +0200 (CEST)
Received: from localhost ([::1]:51172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhFZo-0005S1-Gu
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhFXc-0002NS-9F
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:54:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhFXZ-0001sK-Dd
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620928468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2GL9N99r7ckNA/g/yNnDk9vr4wdNDCA7CqBydDZOaq0=;
 b=bzxs+Hv2lja8s3EUjrlYn7XCsVVizuao6lGVD/3OE28kUSulj2faX51jRosrMihdL7sF6q
 5ZlcSTJnaTzRo4HvuKdTsO012nAobqt3YbkAOsHPJ147X3jjzWcDXOF20rL4LE9OygKqWU
 tHVN8s5JxfhfyHos3LRFqcqOXKRy2II=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-SO8PKDOrPAG1caUQGX8yyw-1; Thu, 13 May 2021 13:54:26 -0400
X-MC-Unique: SO8PKDOrPAG1caUQGX8yyw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EBE081841D;
 Thu, 13 May 2021 17:54:25 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 447B64D730;
 Thu, 13 May 2021 17:54:23 +0000 (UTC)
Subject: Re: [PATCH v3 01/15] python: qemu: add timer parameter for qmp.accept
 socket
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-2-eesposit@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <3a6bacd3-1d40-2fc5-9268-5f2d7fae4cf1@redhat.com>
Date: Thu, 13 May 2021 13:54:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414170352.29927-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 1:03 PM, Emanuele Giuseppe Esposito wrote:
> Add a new _qmp_timer field to the QEMUMachine class.
> The default timer is 15 sec, as per the default in the
> qmp accept() function.

Fine enough for now.

What's the exact need for this change, exactly? Is it just to prevent 
any unbounded blocking waits? I assume this came up in development or 
you'd not have added it.

Reviewed-by: John Snow <jsnow@redhat.com>

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   python/qemu/machine.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index 6e44bda337..12752142c9 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -110,6 +110,7 @@ def __init__(self,
>           self._binary = binary
>           self._args = list(args)
>           self._wrapper = wrapper
> +        self._qmp_timer = 15.0
>   
>           self._name = name or "qemu-%d" % os.getpid()
>           self._test_dir = test_dir
> @@ -323,7 +324,7 @@ def _pre_launch(self) -> None:
>   
>       def _post_launch(self) -> None:
>           if self._qmp_connection:
> -            self._qmp.accept()
> +            self._qmp.accept(self._qmp_timer)
>   
>       def _post_shutdown(self) -> None:
>           """
> 


