Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E686E25AB04
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 14:19:39 +0200 (CEST)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDRjn-00050z-0R
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 08:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDRin-0004Da-4N
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:18:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26995
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDRil-0001vH-GL
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599049114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7VZwPcA1zbTI/Kgm5MNdZWzDp0HeI8ub2b04rlE17Ms=;
 b=hBIqARslUK0IN8pm2ygkrATdF3p48pmNShCFmFuK/gzM779jJYSbAl/WPklWGGyf+xx5JT
 qXC3Z0NXDJaBcA8SGEhpCAYeM9lEAVU06LPd10M4XGdYOKbmXuLusPfiEcUVNvJl4WZlh7
 Q4pUKUHC/Fg4hgxGevaj5LaF9b/HtqA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-00QPvI0FNiaYjzYXNvVZEQ-1; Wed, 02 Sep 2020 08:18:33 -0400
X-MC-Unique: 00QPvI0FNiaYjzYXNvVZEQ-1
Received: by mail-wr1-f69.google.com with SMTP id 33so375849wrk.12
 for <qemu-devel@nongnu.org>; Wed, 02 Sep 2020 05:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7VZwPcA1zbTI/Kgm5MNdZWzDp0HeI8ub2b04rlE17Ms=;
 b=IQbJ1mn/CmJisFprrOEMa7Z5EcM2RUwPChc0rzViTZOTmN8Q9eBAEwvVF4dUy6IdJG
 vDttc50S4LqWu/jnqgLe0eSn3H/jFmSmg8NUgVzPA7n8O3PG6+XAiNjSrDwg1Q+pBsk5
 RGXOyf5ngPjxezV16cpcojxEWovB2y3QEP+3VJZNSzpJNNzgjXJ1P0f4I7A/P99dOKuL
 a+TwOZTjGNSBQt4XTZAUa2JVYBMJ0J3xCR31TIIONnKDjGuu/1vbahcv4nLuBK/1IpYp
 Da0rt9f/al8dtopxniIt/xcJi8azXF2YP0a6LXzEMj3mPayl06LoxjyRjmnBYLdU20V6
 /nSA==
X-Gm-Message-State: AOAM533RXOaLRsZ0csSRHu259k/1WxSCCheQwmYmqS0fXqjqRGTtgdKR
 TCDEy/QXiRpE509Er4+8+5EfR19Q1/nQLPk2uhV02y7/S8aFwPJEhdBoeMN8Q5dcyal9j9bIceo
 gJ8rCrytyniB2QK4=
X-Received: by 2002:a5d:48c8:: with SMTP id p8mr6798612wrs.299.1599049111990; 
 Wed, 02 Sep 2020 05:18:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRprJU2FJRpALsNwdJ55Cx6rRM5DEfhaMKqiv0hxL5FtmT+Pd+ro1Gq/XtKCmltVbqfQ/5gA==
X-Received: by 2002:a5d:48c8:: with SMTP id p8mr6798597wrs.299.1599049111764; 
 Wed, 02 Sep 2020 05:18:31 -0700 (PDT)
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id y207sm2552166wmc.17.2020.09.02.05.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 05:18:31 -0700 (PDT)
Subject: Re: [PATCH] libqtest: Rename qmp_assert_error_class() to
 qmp_expect_error_and_unref()
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
References: <20200902115733.1229537-1-armbru@redhat.com>
 <b7cdce86-ad58-d8fc-d081-ce5410dbcc57@redhat.com>
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
Message-ID: <16bf55f9-a223-9508-5f8e-ad83fd0478c9@redhat.com>
Date: Wed, 2 Sep 2020 14:18:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b7cdce86-ad58-d8fc-d081-ce5410dbcc57@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.324, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: lvivier@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/20 2:00 PM, Thomas Huth wrote:
> On 02/09/2020 13.57, Markus Armbruster wrote:
>> qmp_assert_error_class() does more than just assert: it also unrefs
>> the @rsp argument.  Rename to qmp_assert_error_class() to reduce
>> confusion.
> 
> s/to qmp_assert_error_class()/to qmp_expect_error_and_unref()/
> 
> With that nit fixed (I can do it when picking up the patch):
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> 
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


