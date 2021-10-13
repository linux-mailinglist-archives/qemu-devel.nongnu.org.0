Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6429A42C668
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 18:29:57 +0200 (CEST)
Received: from localhost ([::1]:38968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mah8e-0005oW-7A
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 12:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mah7I-0004gc-I0
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:28:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mah7E-0001Il-5D
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:28:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634142504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dM4QTHuO5KJQ+cQx5ahZdmU0wRDfkNrcfVN43cZW8Ic=;
 b=ReSn+JoGYnuuUhhWp+vTRwVL3CW84rQfKsSgs52TeeGjmGD5dpGIWAPLo0WK5Ot5yyU6pI
 xoRnhcaLUul0eNjgOgxrXBGsXKT+Er2/GzV/myx57UGaLXCjOvpWin+tMxXESmY+gzU/0f
 5JMVNsEQVpi0Rk8tJAWOPzhOVD7kyQs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-VVcjdfWPNsC8k5nsidUYxA-1; Wed, 13 Oct 2021 12:28:22 -0400
X-MC-Unique: VVcjdfWPNsC8k5nsidUYxA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso2447345wrc.2
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 09:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dM4QTHuO5KJQ+cQx5ahZdmU0wRDfkNrcfVN43cZW8Ic=;
 b=vNeAFiph/nv3bnkqMC5vz5kW8MKiuwdQ8YJW1YlrE30Wq+g9qBA7AGoUgzhmFsWd/E
 MpMom82xiKv8eNNWAffSjxBv8wL3ZZUQmjxdnsikPp9A9ugpK7/0Zo3YUzQLSF+Mge/0
 Q/ZE+1ol0y0IS+Gu+sCDijOQfQyAYu5xjRsqP8ygE5emqCTv8gSP1EGzdSxILb96UND8
 C/ogjGw/XqcZ3k6pIljr5Q6LOUmwQatWTOPIsxr2HHHfHlY2+7/SnCqyZE2ZJD2/R8zs
 jmcrts7LC4IdIOyJDVgTh/NaAmkec043z0kqcOjkXjba3cFe+hbeKrCyCftsym5euqAW
 8WJA==
X-Gm-Message-State: AOAM532p3+gST9Lu/p/daXpfvEzr6ZoiJRHHjVPGfzcrnPHWJV1RNxLe
 wGMWVJSSSKvHEp00IKBhKVcd4iszDDpw4X20fK2vjGpMZXXqnyrQ8+p2veGTjCdhklDFnZRRzTh
 Xc8sORaOPYXlz9FQ=
X-Received: by 2002:a1c:ac03:: with SMTP id v3mr225846wme.127.1634142500856;
 Wed, 13 Oct 2021 09:28:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgW7k8ktDPySbTM/nn+TUKW45iQ0H63b/mzTCSQBbTEoiMcM59IiEwMHt0yeZ1dqiAbng8tQ==
X-Received: by 2002:a1c:ac03:: with SMTP id v3mr225790wme.127.1634142500251;
 Wed, 13 Oct 2021 09:28:20 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id j206sm3093520wmj.23.2021.10.13.09.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 09:28:19 -0700 (PDT)
Message-ID: <933a0101-d214-384e-6a4f-f8da9e0de815@redhat.com>
Date: Wed, 13 Oct 2021 18:28:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 09/13] iotests: split linters.py out from 297
To: John Snow <jsnow@redhat.com>
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-10-jsnow@redhat.com>
 <bbaa0613-3b95-84d8-52ae-c53b1175d096@redhat.com>
 <CAFn=p-YkCYr=jmBcSSpPBhDskPgWa5ATFUd-X-thCbK3Z=DJmQ@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-YkCYr=jmBcSSpPBhDskPgWa5ATFUd-X-thCbK3Z=DJmQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.10.21 17:07, John Snow wrote:
>
>
> On Wed, Oct 13, 2021 at 7:50 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
>     On 04.10.21 23:04, John Snow wrote:
>     > Now, 297 is just the iotests-specific incantations and
>     linters.py is as
>     > minimal as I can think to make it. The only remaining element in
>     here
>     > that ought to be configuration and not code is the list of skip
>     files,
>
>     Yeah...
>
>     > but they're still numerous enough that repeating them for mypy and
>     > pylint configurations both would be ... a hassle.
>
>     I agree.
>
>     > Signed-off-by: John Snow <jsnow@redhat.com>
>     > ---
>     >   tests/qemu-iotests/297        | 72 +++---------------------------
>     >   tests/qemu-iotests/linters.py | 83
>     +++++++++++++++++++++++++++++++++++
>     >   2 files changed, 88 insertions(+), 67 deletions(-)
>     >   create mode 100644 tests/qemu-iotests/linters.py
>
>     I’d like to give an A-b because now the statuscode-returning
>     function is
>     in a library.  But I already gave an A-b on the last patch precisely
>     because of the interface, and I shouldn’t be so grumpy.
>
>     Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
>
> I'm not entirely sure I understand your dislike(?) of status codes. 
> I'm not trying to ignore the feedback, but I don't think I understand 
> it fully.

It’s the fact that we only use status codes because they are part of the 
interface of shell commands.  A python function isn’t a shell command, 
so I find it weird to use that interface there.  Returning True/False 
would make more sense, for example.

I understand we have the same thing with qemu* commands in iotests.py, 
so I shouldn’t be so stuck on it...

> Would it be better if I removed check=False and allowed the functions 
> to raise an Exception on non-zero subprocess return? (Possibly having 
> the function itself print the stdout on the error case before re-raising.)

Yes, I would like that better! :)

Hanna


