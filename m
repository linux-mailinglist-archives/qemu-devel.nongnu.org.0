Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9C342BF93
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 14:14:00 +0200 (CEST)
Received: from localhost ([::1]:41698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mad8x-0002mF-P9
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 08:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mad78-0000VO-O7
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:12:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mad6v-0006PD-Ie
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:12:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634127112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ftob7pc5ipls5GFjsmqODT1xpP0Tgjyktr/E0CYP6vg=;
 b=ZXGS4DzdQAMo8BiHtkfZxNOsCwMVkDro7il45omhCupJJtoPRcxoYjZ35jKSRiesH27l5m
 PpKW5f1MxzxCdonmgmX7Eq+A/kp9JXueWZXvYPewh7QMyYOuoBbCgRy+hnzSXcoHMpAJi9
 Mrf6C6sohFqzDaiAFr0yx3lhcGb2Fx4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-p9NQmnS2MlyAHqjBAvh0EA-1; Wed, 13 Oct 2021 08:11:49 -0400
X-MC-Unique: p9NQmnS2MlyAHqjBAvh0EA-1
Received: by mail-wr1-f70.google.com with SMTP id
 41-20020adf812c000000b00160dfbfe1a2so1833650wrm.3
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 05:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ftob7pc5ipls5GFjsmqODT1xpP0Tgjyktr/E0CYP6vg=;
 b=pMeRWyPnLuD/rWCHTrN5uXI4vxuoYgmdpVYeydzfmKqkrvXvJo259bUV96seNJUgj9
 QTtdqRDnHj2kNtVAtyAis0BVT03PhaQRPei6QP2u9LBP46te/bVOcGuKrYOn+sAB79dU
 APl8oiTCjPaA5AGbsBRYO72ZPHVjGS+hccJ62P6Jgz2XX0Ck8SP4mXRlmYfYAeQn1968
 jO1Oxe4Z5kXR/ZHsmn1dFbdbAYgeHySgvL9m/vqNdsnqaYYfvatrprnrG50CYMfuB444
 TTzgaYUQOXmWVaiiNuG1u8urAee7iYf522dzIqO0KupgfRts49KQKy2hZsy8Y34QXNgV
 MPSg==
X-Gm-Message-State: AOAM533xrCgjhOXBWvT2NfnScuf9rsTcTprQ3A1M340rz3vnMaa026d8
 iO/XonIk8wxl4ydX5xb4MgU88XRiw2O1FqMJwOmteiY88gLV3elbxycvyBcUwKoahHGDX7m6vA+
 oah5eXBvDd2zOaCI=
X-Received: by 2002:a1c:ac86:: with SMTP id v128mr12289864wme.3.1634127108321; 
 Wed, 13 Oct 2021 05:11:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsFwoEXEYZ8n+sJ45km5O0xAIm2idGsc+sGCNjDLtk1CuwZWsadqU40PKScvB2EvVQ+btd4g==
X-Received: by 2002:a1c:ac86:: with SMTP id v128mr12289832wme.3.1634127108019; 
 Wed, 13 Oct 2021 05:11:48 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id e5sm13210076wrd.1.2021.10.13.05.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 05:11:47 -0700 (PDT)
Message-ID: <19f3d6b1-f3bc-55e8-0fe0-79daf081a778@redhat.com>
Date: Wed, 13 Oct 2021 14:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 10/13] iotests/linters: Add entry point for linting via
 Python CI
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-11-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211004210503.1455391-11-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.452,
 DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.10.21 23:05, John Snow wrote:
> We need at least a tiny little shim here to join test file discovery
> with test invocation. This logic could conceivably be hosted somewhere
> in python/, but I felt it was strictly the least-rude thing to keep the
> test logic here in iotests/, even if this small function isn't itself an
> iotest.
>
> Note that we don't actually even need the executable bit here, we'll be
> relying on the ability to run this module as a script using Python CLI
> arguments. No chance it gets misunderstood as an actual iotest that way.
>
> (It's named, not in tests/, doesn't have the execute bit, and doesn't
> have an execution shebang.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> (1) I think that the test file discovery logic and skip list belong together,
>      and that those items belong in iotests/. I think they also belong in
>      whichever directory pylintrc and mypy.ini are in, also in iotests/.

Agreed.

> (2) Moving this logic into python/tests/ is challenging because I'd have
>      to import iotests code from elsewhere in the source tree, which just
>      inverts an existing problem I have been trying to rid us of --
>      needing to muck around with PYTHONPATH or sys.path hacking in python
>      scripts. I'm keen to avoid this.

OK.

> (3) If we moved all python tests into tests/ and gave them *.py
>      extensions, we wouldn't even need the test discovery functions
>      anymore, and all of linters.py could be removed entirely, including
>      this execution shim. We could rely on mypy/pylint's own file
>      discovery mechanisms at that point. More work than I'm up for with
>      just this series, but I could be coaxed into doing it if there was
>      some promise of not rejecting all that busywork ;)

I believe the only real value this would gain is that the tests would 
have nicer names and we would have to delint them.  If we find those 
goals to justify the effort, then we can put in the effort; and we can 
do that slowly, test by test.  I don’t think we must do it now in one 
big lump just to get rid of the file discovery functions.

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/linters.py | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linters.py
> index f6a2dc139fd..191df173064 100644
> --- a/tests/qemu-iotests/linters.py
> +++ b/tests/qemu-iotests/linters.py
> @@ -16,6 +16,7 @@
>   import os
>   import re
>   import subprocess
> +import sys
>   from typing import List, Mapping, Optional
>   
>   
> @@ -81,3 +82,20 @@ def run_linter(
>   
>       return p.returncode
>   
> +
> +def main() -> int:
> +    """
> +    Used by the Python CI system as an entry point to run these linters.
> +    """
> +    files = get_test_files()
> +
> +    if sys.argv[1] == '--pylint':
> +        return run_linter('pylint', files)
> +    elif sys.argv[1] == '--mypy':
> +        return run_linter('mypy', files)

So I can run it as `python linters.py --pylint foo bar` and it won’t 
complain? :)

I don’t feel like it’s important, but, well, it isn’t right either.

Hanna

> +
> +    raise ValueError(f"Unrecognized argument(s): '{sys.argv[1:]}'")
> +
> +
> +if __name__ == '__main__':
> +    sys.exit(main())


