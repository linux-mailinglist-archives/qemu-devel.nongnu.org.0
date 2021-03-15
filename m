Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0508733C034
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:44:11 +0100 (CET)
Received: from localhost ([::1]:57690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpO6-00079X-0Z
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLpLY-00063p-0P
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:41:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLpLV-0006qy-O1
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615822888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LF6oeAKJorYb40Y063PPQ+CnuJlp5vY4Z4YucCP2L0Q=;
 b=PlBxmvI/KsCsN3kb2fJk2jTZFSjA97ifE8tdUgKXy0Tu/nnorVtVEfojlLNKAVCRnTTt7L
 xodhMFf7Nqj7duO61/sHYjyateT2rEbS+6V55nzK1t4xkXnxaV+QnZPuQq5yME7dQtxk/P
 JsQ7ruEG97lOMyCQCB7bmE0+9xqqe2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-NsCNfycmOpC2QQPRShXx5w-1; Mon, 15 Mar 2021 11:41:22 -0400
X-MC-Unique: NsCNfycmOpC2QQPRShXx5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B54CF83DE6B;
 Mon, 15 Mar 2021 15:41:20 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B1275C8B3;
 Mon, 15 Mar 2021 15:41:20 +0000 (UTC)
Subject: Re: [PATCH v6 01/10] qemu-options: New -compat to set policy for
 deprecated interfaces
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210312153210.2810514-1-armbru@redhat.com>
 <20210312153210.2810514-2-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f9740848-f374-c242-90f9-475f38cacf0a@redhat.com>
Date: Mon, 15 Mar 2021 10:41:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312153210.2810514-2-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: marcandre.lureau@gmail.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 9:32 AM, Markus Armbruster wrote:
> New option -compat lets you configure what to do when deprecated
> interfaces get used.  This is intended for testing users of the
> management interfaces.  It is experimental.
> 
> -compat deprecated-input=<input-policy> configures what to do when
> deprecated input is received.  Input policy can be "accept" (accept
> silently), or "reject" (reject the request with an error).
> 
> -compat deprecated-output=<out-policy> configures what to do when
> deprecated output is sent.  Output policy can be "accept" (pass on
> unchanged), or "hide" (filter out the deprecated parts).
> 
> Default is "accept".  Policies other than "accept" are implemented
> later in this series.
> 
> For now, -compat covers only syntactic aspects of QMP, i.e. stuff
> tagged with feature 'deprecated'.  We may want to extend it to cover
> semantic aspects, CLI, and experimental features.
> 
> Note that there is no good way for management application to detect
> presence of -compat: it's not visible output of query-qmp-schema or
> query-command-line-options.  Tolerable, because it's meant for
> testing.  If running with -compat fails, skip the test.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---

> +++ b/qapi/compat.json
> @@ -0,0 +1,51 @@
> +# -*- Mode: Python -*-
> +
> +##
> +# = Compatibility policy
> +##
> +
> +##
> +# @CompatPolicyInput:
> +#
> +# Policy for handling "funny" input.
> +#
> +# @accept: Accept silently
> +# @reject: Reject with an error
> +#
> +# Since: 5.2

6.0

> +##
> +{ 'enum': 'CompatPolicyInput',
> +  'data': [ 'accept', 'reject' ] }
> +
> +##
> +# @CompatPolicyOutput:
> +#
> +# Policy for handling "funny" output.
> +#
> +# @accept: Pass on unchanged
> +# @hide: Filter out
> +#
> +# Since: 5.2

and here

> +##
> +{ 'enum': 'CompatPolicyOutput',
> +  'data': [ 'accept', 'hide' ] }
> +
> +##
> +# @CompatPolicy:
> +#
> +# Policy for handling deprecated management interfaces.
> +#
> +# This is intended for testing users of the management interfaces.
> +#
> +# Limitation: covers only syntactic aspects of QMP, i.e. stuff tagged
> +# with feature 'deprecated'.  We may want to extend it to cover
> +# semantic aspects, CLI, and experimental features.
> +#
> +# @deprecated-input: how to handle deprecated input (default 'accept')
> +# @deprecated-output: how to handle deprecated output (default 'accept')
> +#
> +# Since: 5.2

and here

> +##
> +{ 'struct': 'CompatPolicy',
> +  'data': { '*deprecated-input': 'CompatPolicyInput',
> +            '*deprecated-output': 'CompatPolicyOutput' } }
> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index 3441c9a9ae..4912b9744e 100644

R-b still stands once you make the necessary tweaks.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


