Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D79B20EEBD
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 08:45:22 +0200 (CEST)
Received: from localhost ([::1]:56308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqA1A-0000Hq-J3
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 02:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jqA0O-0008CY-C7
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 02:44:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20343
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jqA0M-0006hF-RA
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 02:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593499469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v0QMW5vlFPte8IetrE7KV4h8RTh+Cnto64mWLbwBt4A=;
 b=DVC2y30uFOxooblOp6UyKAy1cYWRm/hIQjZkW6yZTaiE87VgyN7dUJbM5NBRPRmCBCNjC0
 6jRl8Aw/dfsN7oPQcN6ojgMnPRA1M2/7jUkDWOc8wrz6DF9PAYLYl3N9ZyZSN1JbnPk4pk
 HMxyQuvo0Y4AIYPH+gaKoHB19Tqr2AA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-QZ9pcVB3PLGKE_3_d9ibag-1; Tue, 30 Jun 2020 02:44:27 -0400
X-MC-Unique: QZ9pcVB3PLGKE_3_d9ibag-1
Received: by mail-ed1-f70.google.com with SMTP id 64so16141262edf.2
 for <qemu-devel@nongnu.org>; Mon, 29 Jun 2020 23:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v0QMW5vlFPte8IetrE7KV4h8RTh+Cnto64mWLbwBt4A=;
 b=WAB+JcI4BC1GaiMV0Fx9NYxHjTqb5bW6+dcdeumU0IWvQwy1WfIh4utPzpqYg/gzTO
 xsmzJgkdMlMTsTIuRk79J1RTj8WH4k9qtRQVAp1j1BVmAWXgKdRrDfEFYyQKTSrtuNUI
 5cjqvd/BDiomVdLHFluxTAy9YE9Ve0FAmTtuaiTxr2gOjyQWqH/ZqzmS7pDREgKw7OaR
 nVK/U5EFIJf4wBme6COwkMiXdWgZz+cOU4Tka0CPeIM35sf0nyv2/kDiI7+jOOw1mGp3
 VDzZ8hDRA45QwhwgbYaADtKRuWCsXCGYDoffJDIT92+jCP07xWZoLJwnuN31iALAK+gj
 XgjQ==
X-Gm-Message-State: AOAM531RUbOmPcE/8DaCMzPvDVyKXoh61MUVwydwwtgEv4FcjkMlN+lX
 4BUL8jg/Z02UN8TchMRnr6OelHBGQAtrFfKZSB8VDSihasQGqfiE3KL8fgn8k0i/Qje1WDw3+nC
 M7Q0aUqwmffcvCps=
X-Received: by 2002:a05:6402:cb3:: with SMTP id
 cn19mr17743057edb.368.1593499466492; 
 Mon, 29 Jun 2020 23:44:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznsiLqVif/vC+PpCBwf38ue1hkpuCKoZTIRUtnd/ZW7PFgm5FrUO8N2wjK5nrmsE6iz6srLA==
X-Received: by 2002:a05:6402:cb3:: with SMTP id
 cn19mr17743045edb.368.1593499466325; 
 Mon, 29 Jun 2020 23:44:26 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id kt4sm1256612ejb.48.2020.06.29.23.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 23:44:25 -0700 (PDT)
Subject: Re: [PATC 7/9] Skipping drm build, unsupported
To: David CARLIER <devnexen@gmail.com>, QEMU Trivial
 <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <CA+XhMqzjjrfxXeSENBQuHzTe4TRMWV5GOdqPkD3bo17T3ufR1A@mail.gmail.com>
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
Message-ID: <1058ccbd-b4bb-9413-abc5-ae89076a58e1@redhat.com>
Date: Tue, 30 Jun 2020 08:44:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CA+XhMqzjjrfxXeSENBQuHzTe4TRMWV5GOdqPkD3bo17T3ufR1A@mail.gmail.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 00:34:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Gerd

On 6/29/20 11:48 PM, David CARLIER wrote:
> From 157a0374093371719de42e99364352d64190f52a Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Mon, 29 Jun 2020 22:20:06 +0000
> Subject: [PATCH 7/9] Skipping drm build, unsupported.
> 
> Signed-off-by: David Carlier <devnexen@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  util/Makefile.objs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/Makefile.objs b/util/Makefile.objs
> index cc5e37177a..faebc13fac 100644
> --- a/util/Makefile.objs
> +++ b/util/Makefile.objs
> @@ -39,7 +39,7 @@ util-obj-y += qsp.o
>  util-obj-y += range.o
>  util-obj-y += stats64.o
>  util-obj-y += systemd.o
> -util-obj-$(CONFIG_POSIX) += drm.o
> +util-obj-$(CONFIG_LINUX) += drm.o
>  util-obj-y += guest-random.o
>  util-obj-$(CONFIG_GIO) += dbus.o
>  dbus.o-cflags = $(GIO_CFLAGS)
> --
> 2.26.0
> 


