Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BFA2A99E6
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 17:56:32 +0100 (CET)
Received: from localhost ([::1]:38950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kb52N-0005nF-VL
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 11:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kb51O-0004qJ-1T
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 11:55:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kb51H-0007UV-Ee
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 11:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604681722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YyGtICXKD3tTtwiZzEV3n54qhMCzhB+pRSrH8wSHdOA=;
 b=JqpGDGVaJOKA/9StG0lcMu1j6gQrImSLjeHbZ57eky0QCwvAeEVcV0vceQopdPXQSdDxG/
 iLz6SpTCVmOWlTFswGd0AKhdPGGwTZh7a6zcizYHAf/0+ws5uswYtj9EmdPl667u+KAFg2
 T6AAxXM9OrUySPcbKPo0fOkE16SWuoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-hiU_dsMAODeFZWs6TGQwYg-1; Fri, 06 Nov 2020 11:55:17 -0500
X-MC-Unique: hiU_dsMAODeFZWs6TGQwYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E85C4803640
 for <qemu-devel@nongnu.org>; Fri,  6 Nov 2020 16:55:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9EB055761;
 Fri,  6 Nov 2020 16:55:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4843E1132BD6; Fri,  6 Nov 2020 17:55:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/2] qemu-option: move help handling to get_opt_name_value
References: <20201105142731.623428-1-pbonzini@redhat.com>
 <20201105142731.623428-2-pbonzini@redhat.com>
 <87eel6ikrm.fsf@dusky.pond.sub.org>
Date: Fri, 06 Nov 2020 17:55:13 +0100
In-Reply-To: <87eel6ikrm.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Fri, 06 Nov 2020 16:10:21 +0100")
Message-ID: <878sbee87i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 07:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One more thought...

Markus Armbruster <armbru@redhat.com> writes:

> Paolo Bonzini <pbonzini@redhat.com> writes:
[...]
>> diff --git a/util/qemu-option.c b/util/qemu-option.c
[...]
>> @@ -767,16 +763,18 @@ void qemu_opts_print(QemuOpts *opts, const char *separator)
>>  
>>  static const char *get_opt_name_value(const char *params,
>>                                        const char *firstname,
>> +                                      bool *help_wanted,
>>                                        char **name, char **value)
>>  {
>> -    const char *p, *pe, *pc;
>> -
>> -    pe = strchr(params, '=');
>> -    pc = strchr(params, ',');
>> +    const char *p;
>> +    size_t len;
>>  
>> -    if (!pe || (pc && pc < pe)) {
>> +    len = strcspn(params, "=,");
>> +    if (params[len] != '=') {
>>          /* found "foo,more" */
>> -        if (firstname) {
>> +        if (help_wanted && starts_with_help_option(params) == len) {
>> +            *help_wanted = true;
>> +        } else if (firstname) {
>>              /* implicitly named first option */
>>              *name = g_strdup(firstname);
>>              p = get_opt_value(params, value);
>
> This function parses one parameter from @params into @name, @value, and
> returns a pointer to the next parameter, or else to the terminating
> '\0'.

Like opt_validate() before, this sets *help_wanted only to true.
Callers must pass a pointer to false.  Perhaps having it set
*help_wanted always could simplify things overall.  Up to you.

[...]


