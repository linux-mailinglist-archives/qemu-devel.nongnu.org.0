Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193D840D2B7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:54:17 +0200 (CEST)
Received: from localhost ([::1]:48914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQjPc-0001mZ-5H
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQjOU-0000yN-HX
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:53:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQjOQ-0003Bl-TT
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631767979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OaI1LS0qg6Oof0oDE8IFuQKRgBRMjumFC0Vbbwz8ITQ=;
 b=VAeDOT1gn3tjwECRp4NyI0anc9Ck7KdfoZt3TVh8l0kJketcNmy3JQvIWcvnUZGNpcMYwV
 Hfvvg9Uk6My9nHQsWtMWiTpw1eALy1Mt6VbBylC6lSqOYOO/LACiFxjfO0ZofjBmoQLy8n
 /koK6NHubDCXCrU6nqHy7fIHLz3tSfQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-Kq1QDEv9OiGn9_gaUZOIGg-1; Thu, 16 Sep 2021 00:52:58 -0400
X-MC-Unique: Kq1QDEv9OiGn9_gaUZOIGg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r7-20020a5d6947000000b0015e0f68a63bso1920600wrw.22
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 21:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OaI1LS0qg6Oof0oDE8IFuQKRgBRMjumFC0Vbbwz8ITQ=;
 b=QYEKpy/HvN/hASLHodJ8kPgH6piISpVE/0Ub1vqvZbEJPA6TxrnGcHPj039zot7aJh
 uAcp3msl8hFuvVNsIxUCK1OSxa+ol5OsX1OMbBTOmzPbAKTsHU9rPFErmBzHRKZLYVlN
 B2+1SX+Y368iZwjxwR/iDIohmQBX7R3gvq+r18Yw7lFxeBMqMZKASC9zYACVEL0yJ6SS
 pMfThrUjkI4QZRALH5koPuQ/+ILY4USKsQo8cPj4aB0BlbxCk0tSNXZuvTFFgzFvd4sG
 528SyIqbQuT2S7iUv3qR0Sv9X7v9PNcAVJVOuCEjhcvHAHQzcLW/oH2On7TnhTBlbm4E
 F6Bg==
X-Gm-Message-State: AOAM530lQ1DDJ4m+OCCabOCVzQgMUcYZnLiAsyU7fiSVtCzjaLX8PCv0
 tYcLPPluVKQucyNaZJTfWonm0ehEFhPAo6LqCsUFAeOWQK4/Pc2cS4oflXAcbED/zCsfq9B7Wmf
 y2Koq6j+e/t4s04k=
X-Received: by 2002:a7b:c947:: with SMTP id i7mr7753732wml.136.1631767977127; 
 Wed, 15 Sep 2021 21:52:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb5mJSwjqBTkT7SSxQE5s/Ro3B6J0LAZG214A9M9CTG5LkcBjanZISv2tpZbHRKoMeXNWbyw==
X-Received: by 2002:a7b:c947:: with SMTP id i7mr7753718wml.136.1631767976981; 
 Wed, 15 Sep 2021 21:52:56 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id b6sm243358wrh.4.2021.09.15.21.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 21:52:56 -0700 (PDT)
Subject: Re: [PATCH v3 13/16] iotests/linters: Add entry point for Python CI
 linters
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-14-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <05a75b56-8f5d-fad3-1c80-413217f05751@redhat.com>
Date: Thu, 16 Sep 2021 06:52:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916040955.628560-14-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 6:09 AM, John Snow wrote:
> Add a main() function to linters.py so that the Python CI infrastructure
> has something it can run.
> 
> Now, linters.py represents an invocation of the linting scripts that
> more resembles a "normal" execution of pylint/mypy, like you'd expect to
> use if 'qemu' was a bona-fide package you obtained from PyPI.
> 
> 297, by contrast, now represents the iotests-specific configuration bits
> you need to get it to function correctly as a part of iotests, and with
> 'qemu' as a namespace package that isn't "installed" to the current
> environment, but just lives elsewhere in our source tree.
> 
> By doing this, we will able to run the same linting configuration from
> the Python CI tests without calling iotest logging functions or messing
> around with PYTHONPATH / MYPYPATH.
> 
> iotest 297 continues to operate in a standalone fashion for now --
> presumably, it's convenient for block maintainers and contributors to
> run in this manner. We can either remove this functionality at a later
> date if everyone is happy with the Python CI, or we can opt to continue
> to maintain it. Please let me know how you feel.
> 
> See the following commit for how this is used from the Python packaging side.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/linters.py | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


