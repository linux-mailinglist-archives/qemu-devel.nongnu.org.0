Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221A224833F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 12:42:19 +0200 (CEST)
Received: from localhost ([::1]:36864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7z4M-0005yV-7l
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 06:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k7z3X-0005QP-8V
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 06:41:28 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:20225
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k7z3U-0003Et-6F
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 06:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597747283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Oql/GnPwWqBMjLJcJsyJ1rbeLGCY+i8S2aD0jMJTWiU=;
 b=BJpYUYWJnjgL1YqrsIvoWSzj52Pr1jdhUW3VfNOBlCbwUTn4bba752OM08AFU8HGZSCVql
 3dKjPJGbdabZG2bMXuXyK7YJNIOOLxVoSzv55LIGgN8eWe+Xl9vOccnqVS83q7m/5fJIPZ
 VCcKWSg+wBC7suvo/patrpmbVjg9mY0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-gGR0d2GmMfmV_JeScyvi5A-1; Tue, 18 Aug 2020 06:41:21 -0400
X-MC-Unique: gGR0d2GmMfmV_JeScyvi5A-1
Received: by mail-wr1-f71.google.com with SMTP id z12so8097980wrl.16
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 03:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Oql/GnPwWqBMjLJcJsyJ1rbeLGCY+i8S2aD0jMJTWiU=;
 b=bVbXR5dWquM/P1Jj7CSalZ+RvHw8PXCik8Spiltlsi8Unn9pvAS859sL8GNCPzcrj/
 05w/hNpluoNzA9KDYLKCG+7vaqXllZk5Yd6W2blV9DNeNTv9qE0RtW28TpJLqliAFAvs
 qxCzOpjXBVbqiOoPlupPzSBW71/gVJoWTYSHUJqzrPz4ezWpvZ8KoCJ4BYpbBtyx49nf
 WBcRBzvLb0Nfm5JZSpn6f7Qbc1IOHZzgfp88bt1YqP7aBGqVUzoPRs1/FBy3wCJjwPpG
 suUKFZuz+Pes4QRlzRQHpK5NgCU3nLByon6sH3c+Bz4UWGicS6qFvRKEPrUsD0eyM232
 OeNw==
X-Gm-Message-State: AOAM533p1UZi6DXZPClssoeeL3E8pzsOU9Lbr+ZdUs7qau0Y9oJ5GqxJ
 2nSXUnCp9aWkQpAi0k4fA0t3FVNkUfRoqNyFlAtdH/1QbPxyGpLiUbUkMS3LOYiC67Z7qwzXKVN
 MPBneNqcf95j3iQs=
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr19734907wma.79.1597747280298; 
 Tue, 18 Aug 2020 03:41:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZSmTVbZHY4/yRenEm+XnDrIfhpaywNQlrg4yIfRbODUAP5WlnJsYeToV/MqyvBvK9iKCOBA==
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr19734894wma.79.1597747280132; 
 Tue, 18 Aug 2020 03:41:20 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id s19sm39963557wrb.54.2020.08.18.03.41.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2020 03:41:19 -0700 (PDT)
Subject: Re: [PATCH 086/150] meson: convert hw/semihosting
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200817143723.343284-1-pbonzini@redhat.com>
 <20200817143723.343284-87-pbonzini@redhat.com>
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
Message-ID: <7e134560-f0d5-4317-78b1-94b3bc9f257f@redhat.com>
Date: Tue, 18 Aug 2020 12:41:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200817143723.343284-87-pbonzini@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 02:16:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

On 8/17/20 4:36 PM, Paolo Bonzini wrote:
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/Makefile.objs             | 1 -
>  hw/meson.build               | 1 +
>  hw/semihosting/Makefile.objs | 2 --
>  hw/semihosting/meson.build   | 4 ++++
>  4 files changed, 5 insertions(+), 3 deletions(-)
>  delete mode 100644 hw/semihosting/Makefile.objs
>  create mode 100644 hw/semihosting/meson.build

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


