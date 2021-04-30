Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E21F36FB62
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:23:05 +0200 (CEST)
Received: from localhost ([::1]:47002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcT6m-0007DZ-J5
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcT1q-0002bt-RU
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:17:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcT1l-0006l1-Fi
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619788671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=taMe/dBH6G/HpPFSorzm0k6Mm5ViMxBz7GHwBBLJR2Q=;
 b=VR4gtBVg6QbAbLJ29r/ChX4uUh5MkoUPvKRXT13/4oYIl6PjX5sAb2qPLDirG77WCjIuWR
 PbAsWHHATmH5a4C30beoi+RblDxPqp07rSdvjB8TE7knWmkhL1AE+avYSQQ/Js7g4qql4Z
 glrjBXUWHnStGtsBBB94avVYR7G6baY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-hLB8PA6QO1G14zzjtVmMMg-1; Fri, 30 Apr 2021 09:17:49 -0400
X-MC-Unique: hLB8PA6QO1G14zzjtVmMMg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C387D107ACE4;
 Fri, 30 Apr 2021 13:17:48 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-68.ams2.redhat.com
 [10.36.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DF8519CA8;
 Fri, 30 Apr 2021 13:17:46 +0000 (UTC)
Subject: Re: [PATCH v3 11/15] qemu_iotests: allow valgrind to read/delete the
 generated log file
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-12-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <7ace108d-1cda-93ee-5c3a-fcf503858cf9@redhat.com>
Date: Fri, 30 Apr 2021 15:17:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414170352.29927-12-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.04.21 19:03, Emanuele Giuseppe Esposito wrote:
> When using -valgrind on the script tests, it generates a log file
> in $TEST_DIR that is either read (if valgrind finds problems) or
> otherwise deleted. Provide the same exact behavior when using
> -valgrind on the python tests.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 94597433fa..aef67e3a86 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -600,6 +600,26 @@ def __init__(self, path_suffix=''):
>                            sock_dir=sock_dir)
>           self._num_drives = 0
>   
> +    def subprocess_check_valgrind(self, valgrind) -> None:

A type annotation would be nice.  (I.e. List[str], or we make it a bool 
and the caller uses bool(qemu_valgrind).)

> +

I’d drop this empty line.

> +        if not valgrind:
> +            return
> +
> +        valgrind_filename =  test_dir + "/" + str(self._popen.pid) + ".valgrind"

mypy (iotest 297) complains that _popen is Optional[], so .pid might not 
exist.  Perhaps this should be safeguarded in the "if not valgrind" 
condition (i.e. "if not valgrind or not self._popen").

Also, pylint complains about the line being too long (79 is the maximum 
length).  Can be fixed with an f-string:

valgrind_filename = f"{test_dir}/{self._popen.pid}.valgrind"

> +
> +        if self.exitcode() == 99:
> +            with open(valgrind_filename) as f:
> +                content = f.readlines()
> +            for line in content:
> +                print(line, end ="")

'end=""' would be better, I think.  (flake8 complains.)

Also, would this be better as:

with open(valgrind_filename) as f:
     for line in f.readlines():
         print(line, end="")

?

(Or just

with open(valgrind_filename) as f:
     print(f.read())

– wouldn’t that work, too?)

Max

> +            print("")
> +        else:
> +            os.remove(valgrind_filename)
> +
> +    def _post_shutdown(self) -> None:
> +        super()._post_shutdown()
> +        self.subprocess_check_valgrind(qemu_valgrind)
> +
>       def add_object(self, opts):
>           self._args.append('-object')
>           self._args.append(opts)
> 


