Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F3524833B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 12:41:24 +0200 (CEST)
Received: from localhost ([::1]:34668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7z3T-00053f-HT
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 06:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k7z2i-0004cf-OL
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 06:40:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52416
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k7z2g-00036z-PL
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 06:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597747233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=m8kRHh50FsIAlOmFxm3RcnmQWBNSzv2LBr/eNypaokc=;
 b=c0qP4gVQBGKO7SPoxNN91/OHRWZpZVWmncrq4USeFl6BST2BRs7PZtMbN2CRyNiuZsDQIA
 zbFVOj1fBPNfgSUG+//4EiEjmYSzneO876BOsZ+ODbbL4iHP4E91ARoQulZfX/NDx95yyw
 TkvryHPcozjvTYAgjinphjgvbJyDitg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-9OZzrcD6PNWdJ-6ZRSgU0Q-1; Tue, 18 Aug 2020 06:40:31 -0400
X-MC-Unique: 9OZzrcD6PNWdJ-6ZRSgU0Q-1
Received: by mail-wm1-f69.google.com with SMTP id c186so5931146wmd.9
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 03:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=m8kRHh50FsIAlOmFxm3RcnmQWBNSzv2LBr/eNypaokc=;
 b=RpDl6ZvcGVIklwKUaipgmNa5qQPehUJBmGhKo7Dwn53vFTqGfCsLDw8cGzXpOk1PdY
 YIEVMr+fljBel0TGjedpEDsuhN3A6kJhi/oGM8ml338lgzuVJ1pgT+up46WwF+YZAvDV
 BYE6TwFtN6m5RdkT39sLbZB6EuvXUzB1sXL3x9tLdWb0ssI8/LuVsvO7qNQDdlor2KIq
 vmOHyrO5BFQz4NMIevzh893PvSpwhpyDG4rK5mf3x8TUwEGS54juMPBGCvz7Rsn+yETK
 OEhse6JtBZ6CWRrhit8Z2W+YlfQQMFqJZjP0LUrVIjILs3mon4EPGCtOCFvv32VYIboO
 h9UA==
X-Gm-Message-State: AOAM533TmO9vpRP0rNa4YmFaOXoBPaAwZsQdIBW7X88OTqzpw0BSERYP
 B+Lv5snxPqHlLmM4arDSnAsIQNtIcdFI37uL3ldxDw7s3DDbDXfxCTvuSMqil7T2n2alKLHg2/8
 ST4YgsWLWiH8L4F0=
X-Received: by 2002:a7b:ca5a:: with SMTP id m26mr18552087wml.27.1597747230865; 
 Tue, 18 Aug 2020 03:40:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoUBizqRRBiyHiBHtA13Qm+kopBi2jiKFSLBq8qHWciUHxKYuokETkNY1eSY7ds6go8OSp8w==
X-Received: by 2002:a7b:ca5a:: with SMTP id m26mr18552064wml.27.1597747230669; 
 Tue, 18 Aug 2020 03:40:30 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id o3sm34100670wru.64.2020.08.18.03.40.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2020 03:40:29 -0700 (PDT)
Subject: Re: [PATCH 100/150] meson: convert hw/pcmcia
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200817143723.343284-1-pbonzini@redhat.com>
 <20200817144053.345107-5-pbonzini@redhat.com>
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
Message-ID: <00727e9c-b2bc-53c7-4def-96e34737e807@redhat.com>
Date: Tue, 18 Aug 2020 12:40:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200817144053.345107-5-pbonzini@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 06:40:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/20 4:40 PM, Paolo Bonzini wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/Makefile.objs        | 1 -
>  hw/meson.build          | 1 +
>  hw/pcmcia/Makefile.objs | 2 --
>  hw/pcmcia/meson.build   | 2 ++
>  4 files changed, 3 insertions(+), 3 deletions(-)
>  delete mode 100644 hw/pcmcia/Makefile.objs
>  create mode 100644 hw/pcmcia/meson.build

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


