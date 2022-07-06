Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AA256859F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:32:01 +0200 (CEST)
Received: from localhost ([::1]:35088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o92K6-0007A6-HD
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o92Ei-00050Q-NW
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 06:26:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o92Ef-0000mN-Sq
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 06:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657103180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MN29x9dYDfOBVQLAhi3Yy6vh/fJu2wQ7+HjCKJDlpfU=;
 b=LSkeXoXc0AH3uJEYO+/k0hscgE/pga43Xt2+eF/At2xIniCZE898cqU/ObPPaGjeeZE1DJ
 GaRCHwg4KpGSh/bfI/a/c4Od1lL+jlFi5Bj0NhB77eFfWIAzxtnJXqZI326tAQjSkWAnd3
 bxYqacKlG29v+sScAv0IFWvZTh8WY54=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-1VWz4ZOpOA-YasDlq5HVjw-1; Wed, 06 Jul 2022 06:26:19 -0400
X-MC-Unique: 1VWz4ZOpOA-YasDlq5HVjw-1
Received: by mail-ed1-f70.google.com with SMTP id
 x21-20020a05640226d500b00435bd7f9367so11298981edd.8
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 03:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MN29x9dYDfOBVQLAhi3Yy6vh/fJu2wQ7+HjCKJDlpfU=;
 b=V/cwMcTL3dyBIVzxm3erccfqp8r0lxnrT95Ts1UZ5e3R6mOnsUt/EbRGKltIeGdLxd
 kb2gc/OnM7G1/U8Qiv1Sro1bMWBGTH5iwp+A3f/WQhHMJJlrw9St7FV2RDTns2/l0+1z
 thc9fOz/fMHpIPrYUSVc4uiu2EzKgGLsfeZ/RnctCbeeZJILjSnHsf5nNkQam6VRS3bs
 o7fyivw0ckkB2j9nZm5r9dCSaMW8ZtLKIXQ10TkX5F7YV1xBE/XiPnrQEzGfPrBeUv0x
 WSod8HdQIAkyj97yRx5hs9ZdShI2o5nfoEca/PzihuByeElBXiesV/PvQul+jIwap4KW
 T+Rg==
X-Gm-Message-State: AJIora9cr9U1Bg8SNOolV4pkFoij7GtuVT+RyjnRNxAMRlTWn02dqLcN
 31VEBKIIEPdLh8EGVhtBlXuYTa0Fsas05I+XeNy4foa/v+Ch8R6ws9K5drY4NZW+AMMUZMS0v+j
 pntmF+dIAFxo1bEU=
X-Received: by 2002:a17:907:86a7:b0:726:317f:aee0 with SMTP id
 qa39-20020a17090786a700b00726317faee0mr38771535ejc.229.1657103178427; 
 Wed, 06 Jul 2022 03:26:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1thdOA1EMTqFNMDETyfYiXGf4luCw1/nnLxGyLm26bnRN97cAvUhm6eTzF8saSG7YTIqNwmcw==
X-Received: by 2002:a17:907:86a7:b0:726:317f:aee0 with SMTP id
 qa39-20020a17090786a700b00726317faee0mr38771507ejc.229.1657103178217; 
 Wed, 06 Jul 2022 03:26:18 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a1709063cb100b0072afb6d4d6fsm546612ejh.171.2022.07.06.03.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 03:26:17 -0700 (PDT)
Message-ID: <a5b27e74-a6a3-01b0-35bf-b8c58802d99a@redhat.com>
Date: Wed, 6 Jul 2022 12:26:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] iotests: fix copy-before-write for macOS and FreeBSD
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, thuth@redhat.com,
 jsnow@redhat.com, richard.henderson@linaro.org
References: <20220705153708.186418-1-vsementsov@yandex-team.ru>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220705153708.186418-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 05.07.22 17:37, Vladimir Sementsov-Ogievskiy wrote:
> strerror() represents ETIMEDOUT a bit different in Linux and macOS /
> FreeBSD. Let's support the latter too.
>
> Fixes: 9d05a87b77 ("iotests: copy-before-write: add cases for cbw-timeout option")
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>
> As John and Thomas noted, the new iotests fails for FreeBSD and maxOS.
> Here is a fix. Would be great if someone can test it.
>
> I tried to push it by
>
>    git push --force  -o ci.variable="QEMU_CI=1"
>
> to my block branch, I get a blocked pipeline
>    https://gitlab.com/vsementsov/qemu/-/pipelines/580573238
> but it doesn't have neither freebsd nor macos jobs.. How to get them?
>
>   tests/qemu-iotests/tests/copy-before-write | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
> index 16efebbf8f..56937b9dff 100755
> --- a/tests/qemu-iotests/tests/copy-before-write
> +++ b/tests/qemu-iotests/tests/copy-before-write
> @@ -192,6 +192,11 @@ read 1048576/1048576 bytes at offset 0
>   
>       def test_timeout_break_guest(self):
>           log = self.do_cbw_timeout('break-guest-write')
> +        # macOS and FreeBSD tend to represent ETIMEDOUT as
> +        # "Operation timed out", when Linux prefer
> +        # "Connection timed out"
> +        log = log.replace('Operation timed out',
> +                          'Connection timed out')

If we know for sure that it’s ETIMEDOUT, how about 
os.strerror(errno.ETIMEDOUT)?

Hanna

>           self.assertEqual(log, """\
>   wrote 524288/524288 bytes at offset 0
>   512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)


