Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7F43A1E20
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 22:31:11 +0200 (CEST)
Received: from localhost ([::1]:47896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr4r0-0007Wk-Hj
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 16:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lr4pw-0006qj-QS
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 16:30:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lr4ps-0001ao-NQ
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 16:30:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623270599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJ+9CgVQ1o029LGqBVScb+lNOuhbYK52bXCf1wJtKjg=;
 b=BgbnjCDMqCkXj+CjDWwgewoCVPdGislTRs91GmbR6SUVQjdkEQB8C2g62pUJspPorEQrbL
 3telpR88/BD5LD9dWoxKHX89/YeuzLCkJdm33uSIXlcSrE3Upma6KjQQrE6JmE4cFgVqoe
 mr2KW2ODs2YV0jXVBzo11mhJUnhifvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-_J8MMLVvNpiKLM0P2Lavhw-1; Wed, 09 Jun 2021 16:29:55 -0400
X-MC-Unique: _J8MMLVvNpiKLM0P2Lavhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2B13100B381;
 Wed,  9 Jun 2021 20:29:54 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 522D260CC9;
 Wed,  9 Jun 2021 20:29:54 +0000 (UTC)
Date: Wed, 9 Jun 2021 15:29:52 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 1/2] qapi: Inline qmp_marshal_output() functions
Message-ID: <20210609202952.r4nb2smrptyckvk2@redhat.com>
References: <20210609184955.1193081-1-philmd@redhat.com>
 <20210609184955.1193081-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210609184955.1193081-2-philmd@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 08:49:54PM +0200, Philippe Mathieu-Daudé wrote:
> In case we need to use QAPI types but no QAPI command / QAPI event
> actually use them, the generated qmp_marshal_output() function will
> trigger the compiler 'unused-function' warnings.
> To prevent that, emit these functions inlined: the compiler will
> ignore such unused functions.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> RFC: No clue about QAPI...
> Tested with GCC. If the compiler is picky we could use the 'unused'
> function attribute.

And I have no clue if clang will warn about an unused inline function.
Going with the compiler attribute seems safer and just as easy to do
in the same two-line change (remember, the "unused" attribute merely
means "suppress warnings if I don't use this", and not "warn me if I
use it in spite of calling it unused").

> ---
>  scripts/qapi/commands.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index 0e13d510547..bbed776a909 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -91,8 +91,8 @@ def gen_call(name: str,
>  def gen_marshal_output(ret_type: QAPISchemaType) -> str:
>      return mcgen('''
>  
> -static void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in,
> -                                QObject **ret_out, Error **errp)
> +static inline void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in,
> +                                        QObject **ret_out, Error **errp)

On the other hand, the qapi generator is smart enough to only output
introspection data for qapi types that were actually used by a command
or event, so how is that working, and why is it not also being used to
elide the generation of unused qmp_marshal_output_FOO functions?  This
is where I'll have to defer to Markus.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


