Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE4F26197D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 20:16:23 +0200 (CEST)
Received: from localhost ([::1]:40776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFiAI-0001fK-Ga
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 14:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFi94-00015z-BK
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 14:15:06 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35190
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFi92-0006ZO-LE
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 14:15:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599588903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LpBwQlaGJ0yi32XMiKcvljZXrphNAYF1H/BFO/6Oi5k=;
 b=RAWtqzI2tvuSypE0ErMVfYdYlVIGB8DmEhcRYkY6pAFlQXxKTMDKPVHyMzgIe49Plsoz5h
 5KoJUp4U9tEBdZUHAVU0shVwCXL3mrmnu4XmeHu+tJYEUdpCe3vbehCy1UMDeF82B7Dgo8
 jzjCUIwU/t4GdKQzN/u8LAYakaZNVFI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-E1ZuWaebOH66xLTtSh9z7w-1; Tue, 08 Sep 2020 14:15:00 -0400
X-MC-Unique: E1ZuWaebOH66xLTtSh9z7w-1
Received: by mail-wr1-f70.google.com with SMTP id r16so7222702wrm.18
 for <qemu-devel@nongnu.org>; Tue, 08 Sep 2020 11:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LpBwQlaGJ0yi32XMiKcvljZXrphNAYF1H/BFO/6Oi5k=;
 b=iroeJ6XnimQn2sLRRpSjMdWKeikrwWNgLEYinK9dgJ1SbXLp0goKHi8fhVOSwM6Mw3
 J4xu/g+qa7Z6+kQnyXUhlhU5J/AsUI3H1mXmC7iASZysqxd7mXzMQEqPDBfWnuxU/8Cw
 vzHecuNt+h8uemy8pehcuN/u1l27V4Hh0//2snusmm/eKFZ1vOYyv9ROEZCAzuV3q4xq
 usOBypaStG+oYMYeQuqCx4GabJezB56rymxevpYqp/8ZwGOjXiWPnLaJutExWsPlCqLD
 auNqC4NQZkWPedlIgpFb943bjBMVa4/YLsbLEBrRVpDhL+f4NbDaY0XRDq158MX2eJDz
 6H5g==
X-Gm-Message-State: AOAM531at1Lt2/1DgFVW4rTycSSje5lF00EwJK7OSY6xb0JJQz/MIuri
 YjZgqH8Mx9yjFB0yyZhsYYgRNgvfAx5jIjoHo1cA+Ur5WYUWYDjDpi9DkHSgxYjkT8L9fn/K8OC
 CCuPx9f48Nnpsmg0=
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr889903wrv.8.1599588898579;
 Tue, 08 Sep 2020 11:14:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMWeQxAsGO7/PSu11jxqBJhC8Q3Lc/yWwqJwf89w+wf+K/93sdTfWoplUexcte+Cqxytr/2Q==
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr889887wrv.8.1599588898399;
 Tue, 08 Sep 2020 11:14:58 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id n4sm314448wrp.61.2020.09.08.11.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 11:14:56 -0700 (PDT)
Subject: Re: [PATCH RESEND] manual: escape backslashes in "parsed-literal"
 blocks
To: Laszlo Ersek <lersek@redhat.com>, qemu devel list <qemu-devel@nongnu.org>
References: <20200908172111.19072-1-lersek@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <3c2d2a59-b556-180d-5a74-5fe74d46ccd2@redhat.com>
Date: Tue, 8 Sep 2020 20:14:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908172111.19072-1-lersek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 03:00:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.626, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/20 7:21 PM, Laszlo Ersek wrote:
> According to
> <https://docutils.sourceforge.io/docs/ref/rst/directives.html#parsed-literal>,
> "inline markup is recognized and there is no protection from parsing.
> Backslash-escapes may be necessary to prevent unintended parsing".
> 
> The qemu(1) manual page (formatted with Sphinx 2.2.2) has several overlong
> lines on my system. A stand-alone backslash at EOL serves as line
> continuation in a "parsed-literal" block. Therefore, escape the
> backslashes that we want to appear as such in the formatted documentation.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
> 
> Notes:
>     Resending with Peter's email address in the Cc: tag fixed. Sorry!
> 
>  docs/system/device-url-syntax.rst.inc |   8 +-
>  qemu-options.hx                       | 108 ++++++++++----------
>  2 files changed, 58 insertions(+), 58 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


