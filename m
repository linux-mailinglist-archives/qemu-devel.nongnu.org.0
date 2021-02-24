Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DE23246ED
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 23:36:47 +0100 (CET)
Received: from localhost ([::1]:44100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF2ly-0007yb-9w
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 17:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lF2kg-0007N5-Lj
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:35:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lF2kb-0000i9-PK
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614206119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4GqJc0oCbpQ6yrgoFCy3C+sKVadByO4ZnHwUG870v6Y=;
 b=Yhd4WkfOQTgItmZ13k3J0EWE9oo03Vbo9BLQgFnae/NUgZLBoLxZ2XBdsIVVQfGXieQMjl
 OEngo393wDuaGtuAGdbvar7LciNr/CjulGjm2MBhLuy32l7EVmXuZXjqVaraWBvyxaKUri
 zvH00dmQUBllVVQv0kIVGT8SnGPRgDU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-d6hhvcW9NQqJpJrf0z2jqw-1; Wed, 24 Feb 2021 17:35:15 -0500
X-MC-Unique: d6hhvcW9NQqJpJrf0z2jqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FCD61936B60;
 Wed, 24 Feb 2021 22:35:14 +0000 (UTC)
Received: from [10.3.113.71] (ovpn-113-71.phx2.redhat.com [10.3.113.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E90610023BA;
 Wed, 24 Feb 2021 22:35:13 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-7-cfontana@suse.de>
 <ab323577-c68e-c215-655f-1b45d2e9b112@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v22 06/17] meson: add target_user_arch
Message-ID: <37da6126-a6eb-a12e-2944-9ac4a232390c@redhat.com>
Date: Wed, 24 Feb 2021 16:35:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ab323577-c68e-c215-655f-1b45d2e9b112@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 3:21 PM, Philippe Mathieu-Daudé wrote:
> On 2/24/21 2:34 PM, Claudio Fontana wrote:
>> the lack of target_user_arch makes it hard to fully leverage the
>> build system in order to separate user code from sysemu code.
>>
>> Provide it, so that we can avoid the proliferation of #ifdef
>> in target code.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>
>> [claudio: added changes for new target hexagon]
> 
> Again, this line goes ...
> 
>> ---
> 
> ... here. Else it is not stripped by git-am and ends
> burried in the repository (see commit 940e43aa30e).

If you are modifying a patch originally written by someone else (that
is, their S-o-b appears first, but your edits mean you also add S-o-b),
it is courteous to include your modifications in the commit log in this
manner.  (For an example, see commit 2c4c556e06)

You're right that it can look fishy if your changlog appears on your own
commit (if you rebased things with no one else touching the patch in
between, just update the commit message as part of that rebase; the
changelog goes after the --- for review in that case).  But it's not
completely wrong: you'll see me doing it when wearing my maintainer hat
and preparing a pull request, and modifying my own patch different from
how it was posted on the mailing list while wearing my developr hat
prior to the pull request (see commit c930831446 for an example)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


