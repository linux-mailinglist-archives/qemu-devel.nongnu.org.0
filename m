Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DA9346AFE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 22:24:42 +0100 (CET)
Received: from localhost ([::1]:47238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOoW0-0001EA-88
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 17:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOoRc-0005G1-Nc
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:20:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOoRZ-0003Ay-2l
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616534403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aKQD0AUSG08OSCDzTYrXSbQ14HZjHMXKE5GB6Xb4JPs=;
 b=SSDVuwcMJfHuNNx8I+C9eCPH0i/lZpaHzM3AD3/95/HjnZUIoLLGtJdM8BRkpHnE/PasLT
 2Xe+JFoQ/Odp/hjXfdXmPoZaPMd3aNHEuR/llsN1zWSmqgVgxfDcNg2chZoiz1gBnr+fE1
 SidL/tZPVv4djT7uDWfwjXEBfffNYUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-G2EX7FiUNiuPqBHvOYJAEg-1; Tue, 23 Mar 2021 17:20:02 -0400
X-MC-Unique: G2EX7FiUNiuPqBHvOYJAEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 314381084D68;
 Tue, 23 Mar 2021 21:20:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B41E75C1C5;
 Tue, 23 Mar 2021 21:19:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 46BFB11327E1; Tue, 23 Mar 2021 22:19:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 24/28] qapi: Enforce command naming rules
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-25-armbru@redhat.com>
 <a6336cfa-6efb-8612-6b6b-018daa64a11f@redhat.com>
Date: Tue, 23 Mar 2021 22:19:56 +0100
In-Reply-To: <a6336cfa-6efb-8612-6b6b-018daa64a11f@redhat.com> (Eric Blake's
 message of "Tue, 23 Mar 2021 10:23:51 -0500")
Message-ID: <87mtutlg8z.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: michael.roth@amd.com, jsnow@redhat.com,
 Markus Armbruster <armbru@redhat.com>, marcandre.lureau@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 3/23/21 4:40 AM, Markus Armbruster wrote:
>> Command names should be lower-case.  Enforce this.  Fix the fixable
>> offenders (all in tests/), and add the remainder to pragma
>> command-name-exceptions.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
>> +++ b/qapi/pragma.json
>> @@ -4,6 +4,24 @@
>>  # add to them!
>>  { 'pragma': {
>>      # Commands allowed to return a non-dictionary:
>> +    'command-name-exceptions': [
>> +        'add_client',
>> +        'block_passwd',
>> +        'block_resize',
>> +        'block_set_io_throttle',
>> +        'client_migrate_info',
>> +        'device_add',
>> +        'device_del',
>> +        'expire_password',
>> +        'migrate_cancel',
>> +        'netdev_add',
>> +        'netdev_del',
>> +        'qmp_capabilities',
>> +        'set_link',
>> +        'set_password',
>> +        'system_powerdown',
>> +        'system_reset',
>> +        'system_wakeup' ],
>
> Outside the scope of this patch, do we have any intentions on adding
> alias commands or deprecating old spellings in favor of new ones?
>
> None of these have a capital letter...
>
> qmp_capabilities is probably the hardest one to get rid of, since you
> can't send any other commands until that one is complete (that is, you
> can't introspect if a replacement exists; if we add a new spelling, all
> you can do is try both spellings until one works, but that is extra
> traffic).  The rest can be suitably probed via introspection.

Another option is to accept '-' instead of '_' in QMP command and
argument names.

The harder problem is QMP output.

>
>
>> +++ b/tests/unit/test-qmp-cmds.c
>> @@ -13,7 +13,7 @@
>>  
>>  static QmpCommandList qmp_commands;
>>  
>> -UserDefThree *qmp_TestCmdReturnDefThree(Error **errp)
>> +UserDefThree *qmp_test_cmd_return_def_three(Error **errp)
>
> ...oh, we had a test command with capitals....
>
>> +++ b/scripts/qapi/expr.py
>> @@ -70,8 +70,9 @@ def check_defn_name_str(name, info, meta):
>>      if meta == 'event':
>>          check_name_upper(name, info, meta)
>>      elif meta == 'command':
>> -        check_name_lower(name, info, meta,
>> -                         permit_upper=True, permit_underscore=True)
>> +        check_name_lower(
>> +            name, info, meta,
>> +            permit_underscore=name in info.pragma.command_name_exceptions)
>
> ...and earlier in the series, I had asked why you wanted
> permit_upper=True here.  So it is now obvious that it was just for the
> tests and that you deferred fixing the tests until now.  If you don't
> want to refactor the series, then it's at least worth a tweak to that
> commit message to call it out.  At any rate, I'm glad to see the
> permit_upper=True gone!
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


