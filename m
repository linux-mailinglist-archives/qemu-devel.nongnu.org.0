Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE2F1E78F4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 11:03:14 +0200 (CEST)
Received: from localhost ([::1]:42440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeav2-0002OG-Lz
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 05:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jeatr-0001Od-Qk
 for qemu-devel@nongnu.org; Fri, 29 May 2020 05:01:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34653
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jeatr-0006mB-4k
 for qemu-devel@nongnu.org; Fri, 29 May 2020 05:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590742918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1fL5wfeIwGE12GxlumPph1/jcS+wHqC7Tch9KeZY/8g=;
 b=cpZMNo5An9G8gbfacKd1mZkQs5UzVeVdrGDUROO19BVRpFn9w/aIsBW/tqW8Ui+TjuqAnO
 xH4lIaGWg4qDGU5Nx9gn9MXZw364mJvi/SuikcTsZDI3yWufSiX/8RnlIhFx8my2jsbCMh
 iBS0dx0IY/o8rk7vR5KOoueB6Nm6rH4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-sr9mH1nOM72SkziD65_zbg-1; Fri, 29 May 2020 05:01:54 -0400
X-MC-Unique: sr9mH1nOM72SkziD65_zbg-1
Received: by mail-wm1-f70.google.com with SMTP id f62so535018wme.3
 for <qemu-devel@nongnu.org>; Fri, 29 May 2020 02:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1fL5wfeIwGE12GxlumPph1/jcS+wHqC7Tch9KeZY/8g=;
 b=FnzFsNl0rbweX/ecmaSz+gied3miTHCfIaz/Awo0YUaOzQ1crsV0t8FTdakRBaPUzH
 HI/MqmF0oGjza2KcokOA9aFskAefMPx0yCBOmBxJzmVDPqt/J56Ko2mdva2N0nhkbGZG
 gKuJRklztI878r0NTFLcri22rtRg9mUNVy4BiBjFWzvT1FkXO66M70kXJFpnNhvz41QM
 PQMvbkPPO5Rc+tg7LQiTVt9AJDg/kmQzwsuK2uED3TH+Zns1OwKb3kycpHgEd1nEGAE1
 Nfqp1vy0LNl88qoh2JekrXcQPr0Pbh5Ul/XX2yIIxscrW9pDkepwcEmfWN0ZAxzdGXvo
 65Tw==
X-Gm-Message-State: AOAM531CsQlNxwOuO7FVk1b4ZF/dOPd/fQUJkgO190iZVzuPXh9BJKoM
 c0zfYP3z6RVUXsy1OpVcw1+bKc5h3MauGZOFAPJzpSOPFWLntuAl2bg424/aLcnLsqv/Sz0q6+Q
 JBIVFNHRsJ3OZJws=
X-Received: by 2002:a5d:42cd:: with SMTP id t13mr7504868wrr.355.1590742913062; 
 Fri, 29 May 2020 02:01:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlyySbxKCORRgSd+HqtInsBA/mHuUjU/XFB7HZ98TCEAZ5DkcMiHIamHigGb42Vcg46KCFjQ==
X-Received: by 2002:a5d:42cd:: with SMTP id t13mr7504851wrr.355.1590742912841; 
 Fri, 29 May 2020 02:01:52 -0700 (PDT)
Received: from [192.168.1.34] (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id i15sm9419176wml.47.2020.05.29.02.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 02:01:52 -0700 (PDT)
Subject: Re: [RFC v2 01/18] target/i386: sev: Remove unused QSevGuestInfoClass
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 brijesh.singh@amd.com, frankja@linux.ibm.com, dgilbert@redhat.com,
 pair@us.ibm.com
References: <20200521034304.340040-1-david@gibson.dropbear.id.au>
 <20200521034304.340040-2-david@gibson.dropbear.id.au>
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
Message-ID: <e351ef56-4cdf-bc8c-4fc8-9583df7ab836@redhat.com>
Date: Fri, 29 May 2020 11:01:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200521034304.340040-2-david@gibson.dropbear.id.au>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 01:34:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
 mdroth@linux.vnet.ibm.com, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/20 5:42 AM, David Gibson wrote:
> This structure is nothing but an empty wrapper around the parent class,
> which by QOM conventions means we don't need it at all.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  target/i386/sev.c      | 1 -
>  target/i386/sev_i386.h | 5 -----
>  2 files changed, 6 deletions(-)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 51cdbe5496..2312510cf2 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -287,7 +287,6 @@ static const TypeInfo qsev_guest_info = {
>      .name = TYPE_QSEV_GUEST_INFO,
>      .instance_size = sizeof(QSevGuestInfo),
>      .instance_finalize = qsev_guest_finalize,
> -    .class_size = sizeof(QSevGuestInfoClass),
>      .class_init = qsev_guest_class_init,
>      .instance_init = qsev_guest_init,
>      .interfaces = (InterfaceInfo[]) {
> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
> index 8ada9d385d..4f193642ac 100644
> --- a/target/i386/sev_i386.h
> +++ b/target/i386/sev_i386.h
> @@ -41,7 +41,6 @@ extern char *sev_get_launch_measurement(void);
>  extern SevCapability *sev_get_capabilities(void);
>  
>  typedef struct QSevGuestInfo QSevGuestInfo;
> -typedef struct QSevGuestInfoClass QSevGuestInfoClass;
>  
>  /**
>   * QSevGuestInfo:
> @@ -64,10 +63,6 @@ struct QSevGuestInfo {
>      uint32_t reduced_phys_bits;
>  };
>  
> -struct QSevGuestInfoClass {
> -    ObjectClass parent_class;
> -};
> -
>  struct SEVState {
>      QSevGuestInfo *sev_info;
>      uint8_t api_major;
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


