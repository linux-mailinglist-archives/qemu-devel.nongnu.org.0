Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA56227C0CF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 11:17:44 +0200 (CEST)
Received: from localhost ([::1]:53632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNBlX-0003NK-OB
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 05:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNBkF-0002pS-Kj
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 05:16:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNBkD-00030V-1a
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 05:16:23 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601370975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5zlZ6wlhJF0cEh8W9dJgoFYCqoURdGLcwVPriKU4CUQ=;
 b=JQPMBpzkZ5cybDkAfsvNt/Gshl5EzjHeIM5BEYziFeb9/2xjFsfqKHe2M802TKLoyDohWs
 v+PcvCDUK1CdRR0+KjVPbNSZlN4eHn0+BmMPLl8Aee+0c+ugStxk/MQ0UccMC/CyvqxWeb
 QzqWH1k2CKXJYYoJKW2acjPJEuveZQ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-njvYbyWhMFSOup1MSULF7Q-1; Tue, 29 Sep 2020 05:16:12 -0400
X-MC-Unique: njvYbyWhMFSOup1MSULF7Q-1
Received: by mail-wm1-f69.google.com with SMTP id l15so1569513wmh.9
 for <qemu-devel@nongnu.org>; Tue, 29 Sep 2020 02:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5zlZ6wlhJF0cEh8W9dJgoFYCqoURdGLcwVPriKU4CUQ=;
 b=m9rnnw6sQy9dRg8JvFAlE8npgRiZ1QMQRysr4p2q9yqynWh9eEylKhEEpoAYIkcuIE
 gwSeoZHA4sK1sTb55HH0PgMbTCi2+6/xqBW6RJPOMdT1d4DXl57T7pao1lodv3JvA3yu
 U9AXb8IkeUt7BlmmuCOq5qb8Uzfdd8VJAN9JzZ+vN5Cpl5sMZIWYUW/k1yvSPWDbmqVm
 tJTDJRht6toB5xIT3BXp40jyBoCIDnQJgLf0s+jhFcvXBQst1MGXstmsfik3W3rFRv75
 aLGnKLIXwdc+/6ElY2b2TEhgpzS92JlCEfG1KEwr8qSrErm1UZQbTVd6a1HRebFC81U5
 ZY/Q==
X-Gm-Message-State: AOAM533ORnvXVNx0Y8efY5TCCiHklEiDzp5cgB+Nb9x2PV2OvebPGXGj
 bCTnXUx6uV4UCgF8QeFfpp5Yq+7WID02TQIH3xw1WX9AmbCfAtoLiVxQxGKgEYNTNK8fGKdZ7ww
 c9PmxrNLMEkLYwOw=
X-Received: by 2002:a5d:660d:: with SMTP id n13mr3205520wru.308.1601370971584; 
 Tue, 29 Sep 2020 02:16:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcltpIuR3woc0LhPM3i7XfsxmggQXb10oduaCcof3zhR6pRQG/gaLBYKfWjrq77OU8H4GiUQ==
X-Received: by 2002:a5d:660d:: with SMTP id n13mr3205503wru.308.1601370971348; 
 Tue, 29 Sep 2020 02:16:11 -0700 (PDT)
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id t5sm5292403wrb.21.2020.09.29.02.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 02:16:10 -0700 (PDT)
Subject: Re: [PATCH 0/2] Update leftover comments that mention Texinfo
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200929075824.1517969-1-armbru@redhat.com>
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
Message-ID: <2cca4b8d-85a7-209a-af47-91a479416a8f@redhat.com>
Date: Tue, 29 Sep 2020 11:16:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200929075824.1517969-1-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 02:22:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/20 9:58 AM, Markus Armbruster wrote:
> Markus Armbruster (2):
>   qemu-img-cmds.hx: Update comment that mentions Texinfo
>   target/i386/cpu: Update comment that mentions Texinfo
> 
>  target/i386/cpu.c | 3 ++-
>  qemu-img-cmds.hx  | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



