Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB235649C5D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 11:41:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4gCl-0008Cl-AM; Mon, 12 Dec 2022 05:38:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1p4gCi-0008C9-Hy
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:38:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1p4gCW-00018B-01
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:38:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670841503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zd14Erq2HbgV4vcchZDR/+vRlb2XP4Tf7aPVSCN3Es=;
 b=BWxEmrglDQOHYjcZPVLtJbmKr0iJik3tUHZKMag5+OAcGzb2zKz1ciR3M/XeVndE6/22Xi
 ZAFAhhSkFx6JsHXb4dTOeOCFd05kpHDYr4Oj86xxBTVXVmhIfqyfeZLDA7a0lJad46ndam
 8mWpiHnp67EbZpxa8aPex6B3hozTWUs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-gRpxnJPnM8CcGJM81HSqSg-1; Mon, 12 Dec 2022 05:38:22 -0500
X-MC-Unique: gRpxnJPnM8CcGJM81HSqSg-1
Received: by mail-ed1-f71.google.com with SMTP id
 b13-20020a056402350d00b00464175c3f1eso4809809edd.11
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 02:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4zd14Erq2HbgV4vcchZDR/+vRlb2XP4Tf7aPVSCN3Es=;
 b=W/64d0OX2MpH7LSmckd5bif+7LuCG7Zcqdn69EWbd9kZKzRf/NzOPa7KCbEUBzLR6t
 W2G/hqj/gzkmFqTk5ZiusLw1HxkMk3KluZsnXh+z5BtB5QMbtJkD4sM+44yzp+mRWYRE
 wFmTWoBxwX02On4NzFw04aGlLudeF0sdMDheTg6qfUsy+o6pPt352VrPF33INluhpJcp
 0dKgufmGvy5kuz6dVoVHBdfPGIaTHasMVb3bR/JQVdpa41u8efYKadJeEI854Os6Yoie
 jXqLo3/4rDGG/Ix2PGJ5MdePQzEsL2Q1naF8fAqDFXpLXMGUX87auSqB3tdYJVyanz1b
 ih3g==
X-Gm-Message-State: ANoB5pl/DbeARoMfKYIo99oMYlBoceNRQpbX+bJ+uRvgn6R4EIWmrCt1
 +tWVdYbnzmJ0CJ8ovWP0St8wZvBZfFh0InXDcwnMxu5Z3txfrZ7AtB4vQzOFEgpimOMY2Dt2AyI
 I11/VG7K2XOLsAYU=
X-Received: by 2002:a17:906:a157:b0:7ae:83f4:3bf5 with SMTP id
 bu23-20020a170906a15700b007ae83f43bf5mr13128055ejb.68.1670841500940; 
 Mon, 12 Dec 2022 02:38:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4uFAC1RNkO1aQkZySBc4H5VHuYKw011TDCelUmME0VXXmoJRfDpyEF1YkcaJuRZrjjcSALNw==
X-Received: by 2002:a17:906:a157:b0:7ae:83f4:3bf5 with SMTP id
 bu23-20020a170906a15700b007ae83f43bf5mr13128038ejb.68.1670841500787; 
 Mon, 12 Dec 2022 02:38:20 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 gg9-20020a170906e28900b0078db5bddd9csm3120688ejb.22.2022.12.12.02.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 02:38:20 -0800 (PST)
Message-ID: <a5923263-befe-30a4-afa2-a80ecb6b1ad2@redhat.com>
Date: Mon, 12 Dec 2022 11:38:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/5] Support format or cache specific out file
Content-Language: en-US
To: Nir Soffer <nsoffer@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221128141514.388724-1-nsoffer@redhat.com>
 <20221128141514.388724-3-nsoffer@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221128141514.388724-3-nsoffer@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28.11.22 15:15, Nir Soffer wrote:
> Extend the test finder to find tests with format (*.out.qcow2) or cache
> specific (*.out.nocache) out file. This worked before only for the
> numbered tests.
> ---
>   tests/qemu-iotests/findtests.py | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)

This patch lacks an S-o-b, too.

> diff --git a/tests/qemu-iotests/findtests.py b/tests/qemu-iotests/findtests.py
> index dd77b453b8..f4344ce78c 100644
> --- a/tests/qemu-iotests/findtests.py
> +++ b/tests/qemu-iotests/findtests.py
> @@ -38,31 +38,37 @@ def chdir(path: Optional[str] = None) -> Iterator[None]:
>           os.chdir(saved_dir)
>   
>   
>   class TestFinder:
>       def __init__(self, test_dir: Optional[str] = None) -> None:
>           self.groups = defaultdict(set)
>   
>           with chdir(test_dir):
>               self.all_tests = glob.glob('[0-9][0-9][0-9]')
>               self.all_tests += [f for f in glob.iglob('tests/*')
> -                               if not f.endswith('.out') and
> -                               os.path.isfile(f + '.out')]
> +                               if self.is_test(f)]

So previously a file was only considered a test file if there was a 
corresponding reference output file (`f + '.out'`), so files without 
such a reference output aren’t considered test files...

>               for t in self.all_tests:
>                   with open(t, encoding="utf-8") as f:
>                       for line in f:
>                           if line.startswith('# group: '):
>                               for g in line.split()[2:]:
>                                   self.groups[g].add(t)
>                               break
>   
> +    def is_test(self, fname: str) -> bool:
> +        """
> +        The tests directory contains tests (no extension) and out files
> +        (*.out, *.out.{format}, *.out.{option}).
> +        """
> +        return re.search(r'.+\.out(\.\w+)?$', fname) is None

...but this new function doesn’t check that.  I think we should check it 
(just whether there’s any variant of `/{fname}\.out(\.\w+)?/` to go with 
`fname`) so that behavior isn’t changed.

Hanna


