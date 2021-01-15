Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740762F7072
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 03:17:50 +0100 (CET)
Received: from localhost ([::1]:60566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0EgP-0004Py-Hb
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 21:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l0Eee-0003wb-In
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 21:16:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l0Eec-0001Ah-Nb
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 21:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610676956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZY/gg5hrujdc5iAOAzNUq8jZk44ZJc7b6ZV1OrqoqrA=;
 b=J55Xr3o75DAaXxMjFsMaqhYYI+1tRyjPR0t0FjqEtU+3i+SqcA7mA6vuK25sB1xuCYY3jd
 ScNjtWa07xknmfTTvQ5Gh+AoCXL39Kj/fY1l0T/qh0L35KFhuRvUewTqUemaj59xGpQ7Nt
 V3nAJlPVxrXUTnwvEKOVFz/5niV+zyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-Jzdk1UleOP63RJQwu_qeQg-1; Thu, 14 Jan 2021 21:15:55 -0500
X-MC-Unique: Jzdk1UleOP63RJQwu_qeQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28B27802B51
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 02:15:54 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3B5561D2D;
 Fri, 15 Jan 2021 02:15:50 +0000 (UTC)
Subject: Re: [PATCH 10/11] qapi/commands: Simplify command registry generation
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201218205407.1326907-1-armbru@redhat.com>
 <20201218205407.1326907-11-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <608f3779-6266-00fc-328f-6eac272a84c0@redhat.com>
Date: Thu, 14 Jan 2021 21:15:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201218205407.1326907-11-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: marcandre.lureau@redhat.com, ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 3:54 PM, Markus Armbruster wrote:
> QAPISchemaGenCommandVisitor.visit_command() needs to generate the
> marshalling function into the current module, and also generate its
> registration into the ./init system module.  The latter is done
> somewhat awkwardly: .__init__() creates a QAPIGenCCode that will not
> be written out, each .visit_command() adds its registration to it, and
> .visit_end() copies its contents into the ./init module it creates.
> 
> Instead provide the means to temporarily switch to another module.
> Create the ./init module in .visit_begin(), and generate its initial
> part.  Add registrations to it in .visit_command().  Finish it in
> .visit_end().
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   scripts/qapi/commands.py | 49 ++++++++++++++++++----------------------
>   1 file changed, 22 insertions(+), 27 deletions(-)
> 
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index 4911166339..396485cc1a 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -23,7 +23,6 @@ from typing import (
>   from .common import c_name, mcgen
>   from .gen import (
>       QAPIGenC,
> -    QAPIGenCCode,
>       QAPISchemaModularCVisitor,
>       build_params,
>       ifcontext,
> @@ -237,28 +236,11 @@ def gen_register_command(name: str,
>       return ret
>   
>   
> -def gen_registry(registry: str, prefix: str) -> str:
> -    ret = mcgen('''
> -
> -void %(c_prefix)sqmp_init_marshal(QmpCommandList *cmds)
> -{
> -    QTAILQ_INIT(cmds);
> -
> -''',
> -                c_prefix=c_name(prefix, protect=False))
> -    ret += registry
> -    ret += mcgen('''
> -}
> -''')
> -    return ret
> -
> -
>   class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
>       def __init__(self, prefix: str):
>           super().__init__(
>               prefix, 'qapi-commands',
>               ' * Schema-defined QAPI/QMP commands', None, __doc__)
> -        self._regy = QAPIGenCCode(None)
>           self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
>   
>       def _begin_user_module(self, name: str) -> None:
> @@ -285,7 +267,7 @@ class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
>   ''',
>                                types=types))
>   
> -    def visit_end(self) -> None:
> +    def visit_begin(self, schema) -> None:

visit_begin(self, schema: QAPISchema) -> None: ...

:~)


