Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63614DC3FE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 11:32:04 +0100 (CET)
Received: from localhost ([::1]:38632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUnQJ-0007B6-L0
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 06:32:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUnKG-0004oT-92
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:25:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUnJz-0006gi-DZ
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647512729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XGG8rvCrV+8/PCXSnG6WpmWatMvBbqv6cpcqUX6jBVs=;
 b=X5zSvyZJit+buDpioEyxCuRR+lblLTp5V3XSkTU1tFuREzKDKyGfh3FWzXAGCIiwx1L3Im
 7j7DiN4GOplrQJGaCeUNunSzX8PUtWGcPAY74AZ8DYCk+s2KM7Pv9O+yfK0Z8UZ03gdrA1
 87r6T6b3y6L2fqNbDxDOxSyjqkYCXEo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-bGtMVwpeMSmSH5PBIn3eCw-1; Thu, 17 Mar 2022 06:25:27 -0400
X-MC-Unique: bGtMVwpeMSmSH5PBIn3eCw-1
Received: by mail-ed1-f72.google.com with SMTP id
 w15-20020a50c44f000000b00418f00014f8so1731722edf.18
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 03:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XGG8rvCrV+8/PCXSnG6WpmWatMvBbqv6cpcqUX6jBVs=;
 b=CDE1xjz+YknC8K5ogzg+Yj04K9OHkWP9BGLXgrOxaOr+QW0h9x3hqIBmq2PxMJCis/
 v8aFYB9xMl4JYe9Szdgr1VuAngo7ogmsWtmkeh+ly13es+oHqjo8QBE2I3EFpSBPpT+I
 rNNklmFHijLIVc9OrI6QGW14+iBtIV5cHKHnF7L6H8KxBj9YYZBO+NNz/WbAXRqwtAiX
 k1IAa3GLpfsVyEeIYsLtjEDni+ZVlNCAnnKL5/e99tIIJf9M3DrBgtkMgYssDpIwN2Ci
 Bw/WTEYSRlQdi8MyX+i5bswvBSAWTvHXM3WJ27NOuikPvJQriCQQcsZEosLisC9ZB8gU
 gQrw==
X-Gm-Message-State: AOAM533ph65vlWTplSXP4i/gajLCa86zcayD7bB5AWCn7GMK/bxtGxyv
 mFJcLME1tJ81c345XISr3gDM9HqFiUnLVIKyjOFHfQ8sQtbtR76aRpI9PEULfBTQteXCv3rRK4Y
 Sn/fWY2WR10M0o2E=
X-Received: by 2002:a05:6402:5247:b0:416:cc5e:fc33 with SMTP id
 t7-20020a056402524700b00416cc5efc33mr3592368edd.398.1647512725795; 
 Thu, 17 Mar 2022 03:25:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQaZoBz+D87M/IHn9l2vkCu5Yqt9wi7llkvmYnDrO2wjyCIoIrGAT0XYVBI7NuKHhP/V2j+Q==
X-Received: by 2002:a05:6402:5247:b0:416:cc5e:fc33 with SMTP id
 t7-20020a056402524700b00416cc5efc33mr3592331edd.398.1647512725451; 
 Thu, 17 Mar 2022 03:25:25 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a170906738400b006df8b6787afsm1202702ejl.13.2022.03.17.03.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 03:25:25 -0700 (PDT)
Message-ID: <e9b98326-1d20-b9fa-0756-42d0ab7f8466@redhat.com>
Date: Thu, 17 Mar 2022 11:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/5] iotests: make qemu_img raise on non-zero rc by
 default
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220308015728.1269649-1-jsnow@redhat.com>
 <20220308015728.1269649-5-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220308015728.1269649-5-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.03.22 02:57, John Snow wrote:
> re-write qemu_img() as a function that will by default raise a
> VerboseProcessException (extended from CalledProcessException) on
> non-zero return codes. This will produce a stack trace that will show
> the command line arguments and return code from the failed process run.

Why not qemu_img_pipe_and_status() as the central function where all 
qemu-img calls go through?

It seems like this makes qemu_img() a second version of 
qemu_img_pipe_and_status(), which is a bit weird.

(Or perhaps it should actually be qemu_tool_pipe_and_status() that 
receives this treatment, with qemu-io functions just passing check=False 
by default.)

> Users that want something more flexible (there appears to be only one)
> can use check=False and manage the return themselves. However, when the
> return code is negative, the Exception will be raised no matter what.
> This is done under the belief that there's no legitimate reason, even in
> negative tests, to see a crash from qemu-img.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>   tests/qemu-iotests/257        |  8 +++--
>   tests/qemu-iotests/iotests.py | 56 ++++++++++++++++++++++++++++++-----
>   2 files changed, 54 insertions(+), 10 deletions(-)
>
> diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
> index fb5359c581..e7e7a2317e 100755
> --- a/tests/qemu-iotests/257
> +++ b/tests/qemu-iotests/257
> @@ -241,11 +241,13 @@ def compare_images(image, reference, baseimg=None, expected_match=True):
>       expected_ret = 0 if expected_match else 1
>       if baseimg:
>           qemu_img("rebase", "-u", "-b", baseimg, '-F', iotests.imgfmt, image)
> -    ret = qemu_img("compare", image, reference)
> +
> +    sub = qemu_img("compare", image, reference, check=False)
> +
>       log('qemu_img compare "{:s}" "{:s}" ==> {:s}, {:s}'.format(
>           image, reference,
> -        "Identical" if ret == 0 else "Mismatch",
> -        "OK!" if ret == expected_ret else "ERROR!"),
> +        "Identical" if sub.returncode == 0 else "Mismatch",
> +        "OK!" if sub.returncode == expected_ret else "ERROR!"),
>           filters=[iotests.filter_testfiles])
>   
>   def test_bitmap_sync(bsync_mode, msync_mode='bitmap', failure=None):
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 508adade9e..ec4568b24a 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -37,9 +37,10 @@
>   
>   from contextlib import contextmanager
>   
> +from qemu.aqmp.legacy import QEMUMonitorProtocol
>   from qemu.machine import qtest
>   from qemu.qmp import QMPMessage
> -from qemu.aqmp.legacy import QEMUMonitorProtocol
> +from qemu.utils import VerboseProcessError
>   
>   # Use this logger for logging messages directly from the iotests module
>   logger = logging.getLogger('qemu.iotests')
> @@ -215,9 +216,49 @@ def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
>       return qemu_tool_pipe_and_status('qemu-img', full_args,
>                                        drop_successful_output=is_create)
>   
> -def qemu_img(*args: str) -> int:
> -    '''Run qemu-img and return the exit code'''
> -    return qemu_img_pipe_and_status(*args)[1]
> +def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
> +             ) -> subprocess.CompletedProcess[str]:
> +    """
> +    Run qemu_img and return the status code and console output.
> +
> +    This function always prepends QEMU_IMG_OPTIONS and may further alter
> +    the args for 'create' commands.
> +
> +    :param args: command-line arguments to qemu-img.
> +    :param check: Enforce a return code of zero.
> +    :param combine_stdio: set to False to keep stdout/stderr separated.
> +
> +    :raise VerboseProcessError:
> +        When the return code is negative, or on any non-zero exit code
> +        when 'check=True' was provided (the default). This exception has
> +        'stdout', 'stderr', and 'returncode' properties that may be
> +        inspected to show greater detail. If this exception is not
> +        handled, the command-line, return code, and all console output
> +        will be included at the bottom of the stack trace.
> +
> +    :return: a CompletedProcess. This object has args, returncode, and
> +        stdout properties. If streams are not combined, it will also
> +        have a stderr property.
> +    """
> +    full_args = qemu_img_args + qemu_img_create_prepare_args(list(args))
> +
> +    subp = subprocess.run(
> +        full_args,
> +        stdout=subprocess.PIPE,
> +        stderr=subprocess.STDOUT if combine_stdio else subprocess.PIPE,
> +        universal_newlines=True,
> +        check=False
> +    )
> +
> +    if check and subp.returncode or (subp.returncode < 0):

I wouldn’t expect these parentheses here in any other language, are they 
required in Python?

> +        raise VerboseProcessError(
> +            subp.returncode, full_args,
> +            output=subp.stdout,
> +            stderr=subp.stderr,
> +        )

I trust these parameters are correct, because it really sometimes seems 
like Python doc doesn’t want to tell me about the arguments that 
constructors take.  (The only thing I found out is that `stdout` works 
as an alias for `output`, so passing `output` here and reading 
`self.stdout` in `VerboseProcesError` should(tm) be fine.)

Hanna

> +
> +    return subp
> +
>   
>   def ordered_qmp(qmsg, conv_keys=True):
>       # Dictionaries are not ordered prior to 3.6, therefore:
> @@ -232,7 +273,7 @@ def ordered_qmp(qmsg, conv_keys=True):
>           return od
>       return qmsg
>   
> -def qemu_img_create(*args):
> +def qemu_img_create(*args: str) -> subprocess.CompletedProcess[str]:
>       return qemu_img('create', *args)
>   
>   def qemu_img_measure(*args):
> @@ -467,8 +508,9 @@ def qemu_nbd_popen(*args):
>   
>   def compare_images(img1, img2, fmt1=imgfmt, fmt2=imgfmt):
>       '''Return True if two image files are identical'''
> -    return qemu_img('compare', '-f', fmt1,
> -                    '-F', fmt2, img1, img2) == 0
> +    res = qemu_img('compare', '-f', fmt1,
> +                   '-F', fmt2, img1, img2, check=False)
> +    return res.returncode == 0
>   
>   def create_image(name, size):
>       '''Create a fully-allocated raw image with sector markers'''


