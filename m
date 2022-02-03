Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C0C4A8920
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:54:49 +0100 (CET)
Received: from localhost ([::1]:54644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFfNf-00014G-H8
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:54:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFfKw-0006qV-69
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:51:59 -0500
Received: from [2a00:1450:4864:20::32b] (port=56168
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFfKu-0006l7-1C
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:51:57 -0500
Received: by mail-wm1-x32b.google.com with SMTP id r7so2521232wmq.5
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 08:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gbo//+VrPV1VSdkjqYHidaLn5P2qbnqdk88keFyG4CQ=;
 b=fpaGawh6ZSIO7aWStwsN81kKU1dK8uXCSEEDWXqMRWtRMbMYHCvZldJPDy2jYWYBGQ
 HDH+zv26BDNMGei2NtlZYSn4+1QdpfVs9t3NIYyhk6oFTWxfys6V2Z5Nzbft0alRLtik
 MTMfkLrNM2Mz7gqDZvYJvj4e27CMuSaMQOsbIdq2UGKNkVvgrOQVGH0o0GDd/ynJykgk
 vvNL1KdomwAGavrMMvI265ARzdMwmMpfSQKlQL9iUUM1WGhN0J5/6c5D5EyhA/DAeezE
 iATvq6Q0G7kn/q/kSx3oaI7h06NlSOPJFdTNIGaK9QKbn2Gauo1HZWa4o2u7OPtyKKVg
 rpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gbo//+VrPV1VSdkjqYHidaLn5P2qbnqdk88keFyG4CQ=;
 b=PKI8OFKHJRCOryJHHq9b3ObzCoJ2GqX1eu2VFyTTgZljTYx2nStk8PY7zXhApPfyLL
 lSVszGrN/PXP7lGzFohhYH70X+lks2WkCtD0GD8x5jl4jNilE3aKeqDxsMXgCepkA1o+
 ua6K1IirTWeFuSHTd6DSnqBVEhQ38gVmmLXu/+CJu1q0IhWZmGb6Y1MGaGJWiKQCbELC
 fH/fH9TaOqZcwYGy35ge6zb5zZ8cBDEzfg/D+byWdZwZajz9ARnO7Comadc3FPCuGCXX
 1c6sV0dsCgxxjEZPefUGxo4Qbz6TeKDDdnkrxRVyMWMG5A2AYOQQhkB8MFJdOsFdAqVw
 ckgg==
X-Gm-Message-State: AOAM532JBIlCANlgssdH0nJqi3X1ManyrZ1AaNbgQ3ygc+28jcRM8GYH
 70MDgRIG6rhPkB+1ZGQdQqdMnbp0Xei3k4ggsI5LZA==
X-Google-Smtp-Source: ABdhPJyx4CZnA+tRLrkHJ73cm0vhxNidTIPm4fIZjUTHLuLDzqaHd/ddZjEHYtTyZDui0a28+ajAWtirKtScOCGhga8=
X-Received: by 2002:a05:600c:1e0f:: with SMTP id
 ay15mr11159739wmb.133.1643907113979; 
 Thu, 03 Feb 2022 08:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20220203015946.1330386-1-jsnow@redhat.com>
 <CAFEAcA_OXJ6C1UTFXiy6x1gp4VRmaWQY7ntU8N-3-O+TGcsKQQ@mail.gmail.com>
 <CAFn=p-ZeG2XM_cP3hpKN-Cagk4T1Sr05YEDhtwmR4+_VOjVt7w@mail.gmail.com>
In-Reply-To: <CAFn=p-ZeG2XM_cP3hpKN-Cagk4T1Sr05YEDhtwmR4+_VOjVt7w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Feb 2022 16:51:43 +0000
Message-ID: <CAFEAcA9fJMQizPmd1rUh7wPgPoz4dAXQPP07DzDFQK1ieN72VA@mail.gmail.com>
Subject: Re: [PULL 0/4] Python patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Feb 2022 at 16:38, John Snow <jsnow@redhat.com> wrote:

> On Thu, Feb 3, 2022, 11:20 AM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>> Summary of Failures:
>>
>> 1/1 qemu:block / qemu-iotests qcow2 ERROR          243.14s   exit status=
 1
>>
>>
>> Ok:                 0
>> Expected Fail:      0
>> Fail:               1
>> Unexpected Pass:    0
>> Skipped:            0
>> Timeout:            0
>>
>> Full log written to /home/qemu/qemu-test.yiYr4m/build/meson-logs/iotests=
log.txt
>> =E2=96=B6 147/704 /bdrv-drain/deletion/drain
>>            OK
>> =E2=96=B6 178/704 /crypto/task/complete
>>            OK
>> =E2=96=B6 178/704 /crypto/task/datafree
>>            OK
>> [etc]

> Any chance of seeing that meson-logs/iotestslog.txt file?

Sorry, no. The VM runs, and it produces output to stdout, and
then it goes away again. The test cases and test harnesses
*must* output to standard output any information that might
be useful for diagnosing problems. The same scenario applies
for the gitlab CI jobs -- all we get is the job's output.

-- PMM

