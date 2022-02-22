Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D914A4BF52F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 10:54:32 +0100 (CET)
Received: from localhost ([::1]:48814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMRsN-0008G4-P2
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 04:54:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMRqX-0006yV-46
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:52:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMRqT-0000Uo-SZ
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:52:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645523552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DM8GvHNYOJ2i6mrLNHBzrcSuIvlwvlqkZrB+4BRkqQk=;
 b=fJlVbMfkv3Cyh9EfCrzt3HGEFCASSFBHAvcz92jwcWdHDxmdMUcb4mvi3Fp++Wrw66snGZ
 +dpUsn9X5HOynuDY1UmcJBqRNrlIiqYQOSuDE1pDcaHQYwR3eo+VwmY/v7e0x8x3xCoW2x
 Cl7LLPbD2ERKD9U5ZFcwoTDN4FUVdMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-8YIVP6QyOXGj-qZy9bLndQ-1; Tue, 22 Feb 2022 04:52:31 -0500
X-MC-Unique: 8YIVP6QyOXGj-qZy9bLndQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7790AFC84;
 Tue, 22 Feb 2022 09:52:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A80AF7820F;
 Tue, 22 Feb 2022 09:52:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 33E5421608C7; Tue, 22 Feb 2022 10:52:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH 0/5] qmp-shell modifications for non-interactive use
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
 <87bkyzzb1q.fsf@pond.sub.org>
 <3656609c-522d-a0e8-e6ef-465cdc9d6c88@greensocs.com>
Date: Tue, 22 Feb 2022 10:52:18 +0100
In-Reply-To: <3656609c-522d-a0e8-e6ef-465cdc9d6c88@greensocs.com> (Damien
 Hedde's message of "Tue, 22 Feb 2022 08:57:03 +0100")
Message-ID: <87pmnfw7n1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Damien Hedde <damien.hedde@greensocs.com> writes:

> On 2/22/22 07:10, Markus Armbruster wrote:
>> Damien Hedde <damien.hedde@greensocs.com> writes:
>> 
>>> Hi,
>>>
>>> The main idea of this series is to be a bit more user-friendly when
>>> using qmp-shell in a non-interactive way: with an input redirection
>>> from a file containing a list of commands.
>>>
>>> I'm working on dynamic qapi config of a qemu machine, this would
>>> be very useful to provide and reproduce small examples.
>> Why not use plain QMP for that?
>> [...]
>> 
> What do you mean by plain QMP ?

Talk straight to QEMU without a translator:

    $ cat script
    {"execute": "qmp_capabilities"}
    {"execute": "quit"}
    $ socat -t 3 STDIO UNIX-CONNECT:$HOME/work/images/test-qmp <script
    {"QMP": {"version": {"qemu": {"micro": 50, "minor": 2, "major": 6}, "package": "v6.2.0-1603-gc13b8e9973"}, "capabilities": ["oob"]}}
    {"error": {"class": "CommandNotFound", "desc": "Expecting capabilities negotiation with 'qmp_capabilities'"}}
    armbru@dusky:~/work/qemu$ echo -e '{"execute":"qmp_capabilities"}{"execute":"quit"}' >script
    armbru@dusky:~/work/qemu$ echo -e '{"execute":"qmp_capabilities"}\n{"execute":"quit"}' >script
    armbru@dusky:~/work/qemu$ socat -t 3 STDIO UNIX-CONNECT:$HOME/work/images/test-qmp <script
    {"QMP": {"version": {"qemu": {"micro": 50, "minor": 2, "major": 6}, "package": "v6.2.0-1603-gc13b8e9973"}, "capabilities": ["oob"]}}
    {"return": {}}
    {"return": {}}
    {"timestamp": {"seconds": 1645523438, "microseconds": 951702}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}

socat also supports interactive use nicely.  Try

    $ socat "READLINE,history=$HOME/.qmp_history,prompt=QMP>" UNIX-CONNECT:$HOME/path/to/socket

Helpfully blinks matching parenthesis for me.


