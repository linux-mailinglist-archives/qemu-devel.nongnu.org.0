Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4B421F744
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 18:26:06 +0200 (CEST)
Received: from localhost ([::1]:51462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvNkr-0005nk-Vu
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 12:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jvNih-0001rV-6c
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 12:23:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32444
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jvNif-0002dk-IO
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 12:23:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594743828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=k5F/8Qp0O/rBEdrMGc9Q7dj9pBKOK3lqQIRexTAkmn8=;
 b=iILhLyQYtd0NVbkm4T0hDamQKwYP7ZSg7cItLQdjppqAHTHRrw7ivCIfRcKs1W6ZeWYLZJ
 s2WdKGjo53u1IMG+AGpWHR2kpEBsxECmMCMC+xnMTCp5lQxf+Si/383Hcat3NNw5C8sBx3
 cFCiq3pHEtxfj0R5AlrsdvuA7qw/dms=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-zpJkezsPP9uGL-1wnqQigA-1; Tue, 14 Jul 2020 12:23:46 -0400
X-MC-Unique: zpJkezsPP9uGL-1wnqQigA-1
Received: by mail-wm1-f72.google.com with SMTP id g187so4687200wme.0
 for <qemu-devel@nongnu.org>; Tue, 14 Jul 2020 09:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=k5F/8Qp0O/rBEdrMGc9Q7dj9pBKOK3lqQIRexTAkmn8=;
 b=smG4g5H/OWnPwQQN6qMVlnNqwfpLWohvJdkfGkhnSiE5qOfjA9C04deF2IkiwdfgbS
 rdaEzZBIvHymMRvLJ1RAz22DCVveOPDjEVVTzbbAgWkBexI0G56KxexrjGRiBht7Zk2o
 +bvwT9QNSkqoE7V/ZA8MuYaPkEtQdPYAorRV8NMQCaacYjwoC0Pckanj9hL/MqfAPznQ
 YjPNxFJVmphdQAJxwzBKlgOSURC4o/cREjClCu4pVnSApbiSbxaFBFGXhvpvPaZy1j4I
 uE4wqntRBC8uilbwht+I3Jc69EW6ml9/ELKDM5UYL+z+HC+95uyiRYht4ExcTtLyeFqv
 V9xg==
X-Gm-Message-State: AOAM531Qdlh5knC+UNSGB90APe0rtSyE+9XpuPNI/PWIODgBMRD6a/vV
 d8uNNyx/LCsRTEla5tZx6JqTWZ3yRxDtpdzea5FfsHBXRokRfuvkZjsCWRm489t8nilv6MzOR94
 gi41QkehdYGxAhKA=
X-Received: by 2002:a5d:6a90:: with SMTP id s16mr6708227wru.8.1594743825569;
 Tue, 14 Jul 2020 09:23:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAYS7V4ohQ5sXyKMDHDtKSS0nH5jsj7xKA8ikHOma+cL8yb6FUH+vZpoktZsvxyClqr4i+Vw==
X-Received: by 2002:a5d:6a90:: with SMTP id s16mr6708210wru.8.1594743825404;
 Tue, 14 Jul 2020 09:23:45 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id a84sm5004513wmh.47.2020.07.14.09.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 09:23:44 -0700 (PDT)
Subject: Re: [PATCH for-5.1 4/5] qom: Document object_get_canonical_path()
 returns malloced string
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200714160202.3121879-1-armbru@redhat.com>
 <20200714160202.3121879-5-armbru@redhat.com>
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
Message-ID: <eedb53db-d5b4-852f-5aee-215d282e06c8@redhat.com>
Date: Tue, 14 Jul 2020 18:23:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200714160202.3121879-5-armbru@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 21:44:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/20 6:02 PM, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qom/object.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 55d925d2c8..0f3a60617c 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -1467,8 +1467,9 @@ const char *object_get_canonical_path_component(const Object *obj);
>  /**
>   * object_get_canonical_path:
>   *
> - * Returns: The canonical path for a object.  This is the path within the
> - * composition tree starting from the root.
> + * Returns: The canonical path for a object, newly allocated.  This is
> + * the path within the composition tree starting from the root.  Use
> + * g_free() to free it.
>   */
>  char *object_get_canonical_path(const Object *obj);
>  

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


