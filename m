Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021003108BE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:12:53 +0100 (CET)
Received: from localhost ([::1]:33084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7y6e-0008M8-2C
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l7y0n-0003aU-IG
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:06:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l7y0j-0004I4-OZ
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:06:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612519604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/snqxGCxqzcq6iy5om+eJ7Jl0saTiRQzrRGJsaWdDEY=;
 b=H1whAFB6VDmaOQi0avWlezmYM2dHq00S4anqC/EBeDe2Y5bpqfvF/6K0iYlC2IrNVg0Ld1
 G93NRditjUSoJxsl/z6K02NXBJJ7cOLHxr3S5I790F5i5WcH3z0x0Hy4TKw1SgrP7O6cP1
 ZQg+eGFyfeNaidc7v3ItYBFUsw+FMss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-hidmsUGlOjmdVlljIxRZBg-1; Fri, 05 Feb 2021 05:06:40 -0500
X-MC-Unique: hidmsUGlOjmdVlljIxRZBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08A1B107ACE8;
 Fri,  5 Feb 2021 10:06:39 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-18.ams2.redhat.com
 [10.36.114.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBF2B10016F9;
 Fri,  5 Feb 2021 10:06:37 +0000 (UTC)
Subject: Re: [PATCH] qemu-img: add seek and -n option to dd command
From: Max Reitz <mreitz@redhat.com>
To: Peter Lieven <pl@kamp.de>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
References: <20210128140704.6547-1-pl@kamp.de>
 <99982043-ed89-5fbe-afe2-691a9c19280d@redhat.com>
 <567ab8bb-b452-d6c2-dec7-bc2cf1e34ec8@kamp.de>
 <be6e992c-fbb6-2f16-a066-0ef1e1ace9e5@redhat.com>
 <70e0dbc0-4770-a409-945e-c31e0d93081b@kamp.de>
 <50cb6864-b0a9-c1dc-2cba-9a35a2970ba2@redhat.com>
Message-ID: <cdfdd9e9-8a73-cdf6-b565-bb769f10e94a@redhat.com>
Date: Fri, 5 Feb 2021 11:06:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <50cb6864-b0a9-c1dc-2cba-9a35a2970ba2@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------F781D1628F9E471D6DCC934B"
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------F781D1628F9E471D6DCC934B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05.02.21 10:16, Max Reitz wrote:
> On 05.02.21 09:47, Peter Lieven wrote:
>> Am 05.02.21 um 09:18 schrieb Max Reitz:
>>> On 04.02.21 21:09, Peter Lieven wrote:
>>>> Am 02.02.21 um 16:51 schrieb Eric Blake:
>>>>> On 1/28/21 8:07 AM, Peter Lieven wrote:
>>>>>> Signed-off-by: Peter Lieven <pl@kamp.de>
>>>>> Your commit message says 'what', but not 'why'.  Generally, the 
>>>>> one-line
>>>>> 'what' works well as the subject line, but you want the commit body to
>>>>> give an argument why your patch should be applied, rather than blank.
>>>>>
>>>>> Here's the last time we tried to improve qemu-img dd:
>>>>> https://lists.gnu.org/archive/html/qemu-devel/2018-08/msg02618.html
>>>>
>>>>
>>>> I was not aware of that story. My use case is that I want to be
>>>>
>>>> able to "patch" an image that Qemu is able to handle by overwriting
>>>>
>>>> certain sectors. And I especially do not want to "mount" that image
>>>>
>>>> via qemu-nbd because I might not trust it. I totally want to avoid 
>>>> that the host
>>>>
>>>> system tries to analyse that image in terms of scanning the 
>>>> bootsector, partprobe,
>>>>
>>>> lvm etc. pp.
>>>
>>> qemu will have FUSE exporting as of 6.0 (didn’t quite make it into 
>>> 5.2), so you can do something like this:
>>>
>>> $ qemu-storage-daemon \
>>>      --blockdev node-name=export,driver=qcow2,\
>>> file.driver=file,file.filename=image.qcow2 \
>>>      --export fuse,id=fuse,node-name=export,mountpoint=image.qcow2
>>>
>>> This exports the image on image.qcow2 (i.e., on itself) and so by 
>>> accessing the image file you then get raw access to its contents (so 
>>> you can use system tools like dd).
>>>
>>> Doesn’t require root rights, and shouldn’t make the kernel scan 
>>> anything, because it’s exported as just a regular file.
>>
>>
>> Okay, but that is still more housekeeping than just invoking a single 
>> command.
> 
> Yes, but I personally see this as much better than copying all of dd’s 
> functionality into qemu-img.
> 
> My personal complaint is only that it’s a pain in the ass to invoke QSD 
> this way.  It would be nice to have a script that does the same via
> 
> $ qemu-blk-fuse-export image.qcow2
> 
> Would probably be trivial to write, but well, first we gotta do it, and 
> have justification to keep it as part of qemu...
> 
> And if that’s still too much housekeeping, we could even write a qemu-dd 
> script that scans all file arguments for non-raw images, launches a QSD 
> instance to present them as raw, and then invokes dd.

Since today’s Day of Learning at Red Hat, I decided to have some fun 
writing a qemu-dd.py script.

Max

--------------F781D1628F9E471D6DCC934B
Content-Type: text/x-python; charset=UTF-8;
 name="qemu-dd.py"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="qemu-dd.py"

#!/usr/bin/python

import json
import os
import subprocess
import sys
from typing import Optional

images = {}

for arg in sys.argv[1:]:
    if arg.startswith('if=') or arg.startswith('of='):
        filename = arg[3:]

        # Ignore non-existing files, the user probably wants to make
        # dd create them (as raw images)
        if not os.path.exists(filename):
            continue

        qemu_img = subprocess.Popen(('qemu-img', 'info', filename),
                                    stdout=subprocess.PIPE,
                                    universal_newlines=True)
        output: str = qemu_img.communicate()[0]
        if qemu_img.returncode != 0:
            sys.exit(os.EX_NOINPUT)

        fmt_line = next(line
                        for line in output.split('\n')
                        if line.startswith('file format: '))
        fmt = fmt_line.split(': ', 1)[1]

        if fmt != 'raw':
            images[filename] = fmt

qsd: Optional[subprocess.Popen] = None

if images:
    args = ['qemu-storage-daemon',
            '--chardev', 'stdio,id=monitor',
            '--monitor', 'monitor']

    for i, (image, fmt) in enumerate(images.items()):
        args += ['--blockdev',
                 f'{fmt},node-name=export{i},' +
                 f'file.driver=file,file.filename={image}',
                 '--export',
                 f'fuse,id=fuse{i},node-name=export{i},' +
                 f'mountpoint={image},writable=on']

    qsd = subprocess.Popen(args,
                           stdin=subprocess.PIPE,
                           stdout=subprocess.PIPE,
                           universal_newlines=True)

    assert qsd.stdin is not None
    assert qsd.stdout is not None

    # Do some QMP communication so we know for sure that the exports
    # are up

    qmp_line = json.loads(qsd.stdout.readline())
    if 'QMP' in qmp_line:
        qsd.terminate()
        qsd.wait()
        sys.stderr.write('The QEMU storage daemon did not provide ' +
                         'a QMP monitor\n')
        sys.exit(os.EX_SOFTWARE)

    qsd.stdin.write('{ "execute": "qmp_capabilities" }')
    qsd.stdin.flush()

    # qmp_capabilities response
    if json.loads(qsd.stdout.readline()) != {'return': {}}:
        qsd.terminate()
        qsd.wait()
        sys.stderr.write('Communication error with the QEMU storage daemon\n')
        sys.exit(os.EX_SOFTWARE)

    while True:
        qsd.stdin.write('{ "execute": "query-block-exports" }')
        qsd.stdin.flush()
        exports = json.loads(qsd.stdout.readline())['return']
        if exports is None or len(exports) > len(images):
            qsd.terminate()
            qsd.wait()
            sys.stderr.write('Communication error with the ' +
                             'QEMU storage daemon\n')
            sys.exit(os.EX_SOFTWARE)

        if len(exports) == len(images):
            break

subprocess.Popen(['dd'] + sys.argv[1:]).wait()

if qsd is not None:
    qsd.terminate()
    qsd.wait()

--------------F781D1628F9E471D6DCC934B--


