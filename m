Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351E75EFB6D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:57:42 +0200 (CEST)
Received: from localhost ([::1]:55538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwqz-0001BD-1C
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odwMU-0005bz-Vi
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:26:11 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odwMQ-000230-Mj
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:26:07 -0400
Received: by mail-wr1-x42f.google.com with SMTP id f11so299168wrm.6
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=6gdZ1/nt5HD23rzWrKRftq80SG3su5D7ic+9k+Mhf7A=;
 b=ELTOzIwYWEC8yyu62osYqVfeFNCSnFzvnIu72guYLIi1SIOtS2dpUWEOueW8rMS/mR
 L2roNpaBWeaTp6HzaYg7KeJCQToD3KHPlsRPEImMIH9DD/5e/nVBF1fflfUPGa94VLL2
 gKFU7joIxIzCMv97QiKWrYLnFtzkG0EPRB3ue4zRSKqnwsrxkBHNY790vf4+lV65cKy+
 gybGrWRcLqHEn7OQgEmwloU6fh7dv7RrVdAW0x5eXH8FVcHkHZjwvrif3bMk4w6sLXZE
 cGC24CgVrVM5tZJo2Aeye5GGgtgdxI1bNCHhq8NtGIp66mWTCCL/VgD8HY4BS1axOV2Q
 Bvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=6gdZ1/nt5HD23rzWrKRftq80SG3su5D7ic+9k+Mhf7A=;
 b=E91CEtObbR5hdEBwCTe9ak8kxaCz5gjoH2j9TfSR7ONEW2WcW+R9E1LCEvSot6yomQ
 ENql0ADAq5OgQCzUdUuqOtqHPZdTk047NLh7XWW5E/MQ1RBBailmGx0E0jkWkljnoZHH
 +NJNEwq8V69EE+bZULNLC5mdcaQjMeF9GoX+QFa5wk0mM5IkJY5nAKSqUmjxiO3GbPa5
 0NalTnUsuLa0Yyb4AIP6ybZ1bkuq/Yyn8jbBZ+LlhghF6LWgCXS2FoL4KQDbK/iq8J/F
 CEnUPxrmGUdOP7uYO61rAUojzYgXVYDAWCBTI/59MsE6vSa7HgBiXOMD5vKyabnnpLbu
 36kw==
X-Gm-Message-State: ACrzQf0c1rT5TBQqf5IVB7Ry9SYHBIIcSMjMCP3egjIzkoCFOyWJWSmh
 0dOnQ7lZWqWUYj/fAxte8ys1xQ==
X-Google-Smtp-Source: AMsMyM7gqBMSGfgxnyRjnt+zDvwwkI7MBPdGJPykX4mhJznUOl7oi13nw7v4lPqhn6ua7n/QLMv95g==
X-Received: by 2002:a05:6000:1882:b0:22a:f402:c975 with SMTP id
 a2-20020a056000188200b0022af402c975mr3037065wri.532.1664468765118; 
 Thu, 29 Sep 2022 09:26:05 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q3-20020adfcd83000000b0022cdb687bf9sm1552589wrj.0.2022.09.29.09.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:26:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F1111FFB7;
 Thu, 29 Sep 2022 17:26:03 +0100 (BST)
References: <20220929114231.583801-1-alex.bennee@linaro.org>
 <20220929114231.583801-16-alex.bennee@linaro.org>
 <b2c5703-6015-a9bc-620-aa124c67b73@eik.bme.hu>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, minyihh@uci.edu,
 ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu, cota@braap.org,
 aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, Alexey
 Kardashevskiy <aik@ozlabs.ru>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Daniel
 Henrique Barboza <danielhb413@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, "open
 list:Virtual Open Firm..." <qemu-ppc@nongnu.org>
Subject: Re: [PATCH v1 15/51] vof: add distclean target
Date: Thu, 29 Sep 2022 17:25:27 +0100
In-reply-to: <b2c5703-6015-a9bc-620-aa124c67b73@eik.bme.hu>
Message-ID: <87fsgaywo4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Thu, 29 Sep 2022, Alex Benn=C3=A9e wrote:
>> From: Paolo Bonzini <pbonzini@redhat.com>
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>> pc-bios/vof/Makefile | 4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
>> index 8809c82768..990f26af31 100644
>> --- a/pc-bios/vof/Makefile
>> +++ b/pc-bios/vof/Makefile
>> @@ -19,4 +19,6 @@ vof.elf: entry.o main.o ci.o bootmem.o libc.o
>> clean:
>> 	rm -f *.o vof.bin vof.elf *~
>>
>> -.PHONY: all clean
>> +distclean:
>> +
>> +.PHONY: all clean distclean
>
> Shouldn't you also do something in this like at least depend on clean?

I can add that.

> By the way make distclean not in VOF but in QEMU build dir fails for
> me with:
>
> Cleaning... 1 files.
> rm -f config-host.mak qemu-bundle
> rm: cannot remove 'qemu-bundle': Is a directory
> make: *** [Makefile:219: distclean] Error 1

I get this with master so I suspect it has been broken awhile.

>
> Regards,
> BALATON Zoltan


--=20
Alex Benn=C3=A9e

