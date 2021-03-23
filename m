Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD653462D2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:28:50 +0100 (CET)
Received: from localhost ([::1]:37332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOixd-0004fZ-4P
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOitC-00083H-Ga
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:24:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOit1-00054g-Ab
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616513041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SYcrE9KNv+44NMepUtF65/wfyKgsDzvgvINQanc5U94=;
 b=KpeSh6VJNrEBBLQ/iOQ8TVWnrG08dcjh27OCRYYEQOanpKZkuzVszuIQhNg2SQLjYAaJAh
 JfeJNUZoEE4CNopPmiyCOzVvnohxw06qTENwzO04HLNhzZIjDgWQfWiGaPYv+vXAzuWRML
 LRj+vqhhfzek3wp+x4mM4V3CpAG04Eo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-LOG2fSu5PHeQ7H8fgNaIyg-1; Tue, 23 Mar 2021 11:23:59 -0400
X-MC-Unique: LOG2fSu5PHeQ7H8fgNaIyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 359DC81625;
 Tue, 23 Mar 2021 15:23:58 +0000 (UTC)
Received: from [10.3.112.201] (ovpn-112-201.phx2.redhat.com [10.3.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7DF959445;
 Tue, 23 Mar 2021 15:23:51 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-25-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 24/28] qapi: Enforce command naming rules
Message-ID: <a6336cfa-6efb-8612-6b6b-018daa64a11f@redhat.com>
Date: Tue, 23 Mar 2021 10:23:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-25-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: michael.roth@amd.com, jsnow@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 4:40 AM, Markus Armbruster wrote:
> Command names should be lower-case.  Enforce this.  Fix the fixable
> offenders (all in tests/), and add the remainder to pragma
> command-name-exceptions.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

> +++ b/qapi/pragma.json
> @@ -4,6 +4,24 @@
>  # add to them!
>  { 'pragma': {
>      # Commands allowed to return a non-dictionary:
> +    'command-name-exceptions': [
> +        'add_client',
> +        'block_passwd',
> +        'block_resize',
> +        'block_set_io_throttle',
> +        'client_migrate_info',
> +        'device_add',
> +        'device_del',
> +        'expire_password',
> +        'migrate_cancel',
> +        'netdev_add',
> +        'netdev_del',
> +        'qmp_capabilities',
> +        'set_link',
> +        'set_password',
> +        'system_powerdown',
> +        'system_reset',
> +        'system_wakeup' ],

Outside the scope of this patch, do we have any intentions on adding
alias commands or deprecating old spellings in favor of new ones?

None of these have a capital letter...

qmp_capabilities is probably the hardest one to get rid of, since you
can't send any other commands until that one is complete (that is, you
can't introspect if a replacement exists; if we add a new spelling, all
you can do is try both spellings until one works, but that is extra
traffic).  The rest can be suitably probed via introspection.


> +++ b/tests/unit/test-qmp-cmds.c
> @@ -13,7 +13,7 @@
>  
>  static QmpCommandList qmp_commands;
>  
> -UserDefThree *qmp_TestCmdReturnDefThree(Error **errp)
> +UserDefThree *qmp_test_cmd_return_def_three(Error **errp)

...oh, we had a test command with capitals....

> +++ b/scripts/qapi/expr.py
> @@ -70,8 +70,9 @@ def check_defn_name_str(name, info, meta):
>      if meta == 'event':
>          check_name_upper(name, info, meta)
>      elif meta == 'command':
> -        check_name_lower(name, info, meta,
> -                         permit_upper=True, permit_underscore=True)
> +        check_name_lower(
> +            name, info, meta,
> +            permit_underscore=name in info.pragma.command_name_exceptions)

...and earlier in the series, I had asked why you wanted
permit_upper=True here.  So it is now obvious that it was just for the
tests and that you deferred fixing the tests until now.  If you don't
want to refactor the series, then it's at least worth a tweak to that
commit message to call it out.  At any rate, I'm glad to see the
permit_upper=True gone!

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


