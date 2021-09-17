Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A664640F66F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 13:03:23 +0200 (CEST)
Received: from localhost ([::1]:59958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRBeM-00006M-9Y
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 07:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRBc4-0007WZ-Bp
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:01:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRBby-0008L3-9f
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631876450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynI5B5D4xSmBd3oQehf/GPHFluNrH5Z55YaE+6cln2w=;
 b=YMt0AIp0B71AJHDN2xnUehiUrrxdalgmKBhXVuG4A8k2pedmSM//6keIQaEF8i/cOy3Crn
 zF8teBHmb+hy++qTBXmVW+hVIafKiFIEZFPC3vAEAztqEoBBME8l/mginDChBZrufmtEVs
 kMxBT10trVwzuDbuG7T8RmoyeLUSnro=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-2kzmTHyrP1mEsxpAXK-hzA-1; Fri, 17 Sep 2021 07:00:48 -0400
X-MC-Unique: 2kzmTHyrP1mEsxpAXK-hzA-1
Received: by mail-wr1-f70.google.com with SMTP id
 h5-20020a5d6885000000b0015e21e37523so3582317wru.10
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 04:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ynI5B5D4xSmBd3oQehf/GPHFluNrH5Z55YaE+6cln2w=;
 b=cpw8elKIybkOcmYtT8wg2tO+BFGsD3FuwJw8HKEon9nKo+3YUgR/JCxwPqbfKutglI
 Q4r6ui2NeDWdonRSwfT5NR/u8nxBMKPKavqC0mUAamu8DMjRhyMoVVw0af+MvHhavxSP
 w9By5VHGBKU0yAASHORfcTQGfhDKN/MDHnoY19gYlxpdsnA5SERsxCFDcofnpRkf9v0g
 P62mZABoUCwao8k5lhPJim5NvlVNQd/FFHr2wc9QiRAUOFbHeJ45LyNQmTFgw51vq4ym
 rvGD01dSwyeJWx+8OPAS1UKEODxDbInBJWuGdhGaN2s9Km+wucp8SpP7oNBlaunaeDEy
 R/ZQ==
X-Gm-Message-State: AOAM533BL6am+gaqW3EiXtcVF4tK9UYCh7UeQSDU2bXFQmkwO2eQE6L5
 srKdQ1Zo4IB9YiWx5A1B2fSeltdyLqc1om40m9NFJqGkTBth9AgjbbH8YZ3HD/8Pr/jpsDB2/Q8
 R4WON1YsIFl+2DuE=
X-Received: by 2002:a05:600c:1d05:: with SMTP id
 l5mr9689992wms.119.1631876446888; 
 Fri, 17 Sep 2021 04:00:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/YcwpCggKFaxGN7ACvEVm0DtIPiI/1C0Aox4GV9qJxIhIs6xSANNv0AabpXXCezdYKHgmbQ==
X-Received: by 2002:a05:600c:1d05:: with SMTP id
 l5mr9689950wms.119.1631876446434; 
 Fri, 17 Sep 2021 04:00:46 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id o26sm10235317wmc.17.2021.09.17.04.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 04:00:46 -0700 (PDT)
Subject: Re: [PATCH v3 11/16] iotests/297: return error code from run_linters()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-12-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <f3d43e69-4719-d0b9-79c1-03a7732839ed@redhat.com>
Date: Fri, 17 Sep 2021 13:00:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916040955.628560-12-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.09.21 06:09, John Snow wrote:
> This turns run_linters() into a bit of a hybrid test; returning non-zero
> on failed execution while also printing diffable information. This is
> done for the benefit of the avocado simple test runner, which will soon
> be attempting to execute this test from a different environment.
>
> (Note: universal_newlines is added to the pylint invocation for type
> consistency with the mypy run -- it's not strictly necessary, but it
> avoids some typing errors caused by our re-use of the 'p' variable.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/297 | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)

I don’t think I like this very much.  Returning an integer error code 
seems archaic.

(You can perhaps already see that this is going to be one of these 
reviews of mine where I won’t say anything is really wrong, but where I 
will just lament subjectively missing beauty.)


As you say, run_linters() to me seems very iotests-specific still: It 
emits a specific output that is compared against a reference output.  
Fine for 297, but not fine for a function provided by a linters.py, I’d say.

I’d prefer run_linters() to return something like a Map[str, 
Optional[str]], that would map a tool to its output in case of error, 
i.e. ideally:

`{'pylint': None, 'mypy': None}`

297 could format it something like

```
for tool, output in run_linters().items():
     print(f'=== {tool} ===')
     if output is not None:
         print(output)
```

Or something.

To check for error, you could put a Python script in python/tests that 
checks `any(output is not None for output in run_linters().values())` or 
something (and on error print the output).


Pulling out run_linters() into an external file and having it print 
something to stdout just seems too iotests-centric to me.  I suppose as 
long as the return code is right (which this patch is for) it should 
work for Avocado’s simple tests, too (which I don’t like very much 
either, by the way, because they too seem archaic to me), but, well.  It 
almost seems like the Avocado test should just run ./check then.

Come to think of it, to be absolutely blasphemous, why not.  I could say 
all of this seems like quite some work that could be done by a 
python/tests script that does this:

```
#!/bin/sh
set -e

cat >/tmp/qemu-parrot.sh <<EOF
#!/bin/sh
echo ': qcow2'
echo ': qcow2'
echo 'virtio-blk'
EOF

cd $QEMU_DIR/tests/qemu-iotests

QEMU_PROG="/tmp/qemu-parrot.sh" \
QEMU_IMG_PROG=$(which false) \
QEMU_IO_PROG=$(which false) \
QEMU_NBD_PROG=$(which false) \
QSD_PROG=$(which false) \
./check 297
```

And, no, I don’t want that!  But the point of this series seems to just 
be to rip the core of 297 out so it can run without ./check, because 
./check requires some environment variables to be set. Doing that seems 
just seems wrong to me.

Like, can’t we have a Python script in python/tests that imports 
linters.py, invokes run_linters() and sensibly checks the output? Or, 
you know, at the very least not have run_linters() print anything to 
stdout and not have it return an integer code. linters.py:main() can do 
that conversion.


Or, something completely different, perhaps my problem is that you put 
linters.py as a fully standalone test into the iotests directory, 
without it being an iotest.  So, I think I could also agree on putting 
linters.py into python/tests, and then having 297 execute that.  Or you 
know, we just drop 297 altogether, as you suggest in patch 13 – if 
that’s what it takes, then so be it.

Hanna


PS: Also, summing up processes’ return codes makes me feel not good.

> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index e05c99972e..f9ddfb53a0 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -68,19 +68,22 @@ def run_linters(
>       files: List[str],
>       directory: str = '.',
>       env: Optional[Mapping[str, str]] = None,
> -) -> None:
> +) -> int:
> +    ret = 0
>   
>       print('=== pylint ===')
>       sys.stdout.flush()
>   
>       # Todo notes are fine, but fixme's or xxx's should probably just be
>       # fixed (in tests, at least)
> -    subprocess.run(
> +    p = subprocess.run(
>           ('python3', '-m', 'pylint', '--score=n', '--notes=FIXME,XXX', *files),
>           cwd=directory,
>           env=env,
>           check=False,
> +        universal_newlines=True,
>       )
> +    ret += p.returncode
>   
>       print('=== mypy ===')
>       sys.stdout.flush()
> @@ -113,9 +116,12 @@ def run_linters(
>               universal_newlines=True
>           )
>   
> +        ret += p.returncode
>           if p.returncode != 0:
>               print(p.stdout)
>   
> +    return ret
> +
>   
>   def main() -> None:
>       for linter in ('pylint-3', 'mypy'):


