Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC674C6C1B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 13:22:25 +0100 (CET)
Received: from localhost ([::1]:47916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOf2m-0003ry-SX
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 07:22:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOevQ-00061I-Kq
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 07:14:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOevM-0007Bo-WC
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 07:14:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646050484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HlrdONhRTLurLKVwR3T1jmK87zvMpD2wIIxKDX1GFA0=;
 b=I/ixrc0nK13mC8QIsxYfLveZHUt1IiTBNWCTbCfrfuLCXt87qYgihpA8URB4tk8EdBl2io
 j9LkrTP+XOuvhHFkCp0geBgduYXpiasvbnVxoywyrtNa8hVOwInccn3I1mNbgBEF/5Gjzc
 RnbKecteesNmfmRtqJ1lYFDsfAdKaC8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-IKV4Z534MYuwBFg7_8Hvcg-1; Mon, 28 Feb 2022 07:14:43 -0500
X-MC-Unique: IKV4Z534MYuwBFg7_8Hvcg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r206-20020a1c44d7000000b00380e36c6d34so6337969wma.4
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 04:14:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HlrdONhRTLurLKVwR3T1jmK87zvMpD2wIIxKDX1GFA0=;
 b=i12tQXviEOBi/h/DQ75IABgOd3gdfpHXu146mY8Yqv6zmJTDsRcpt8iFAqlJ0DIg0p
 ctkcaQ+uDZUZveKKCoxXUA8ln1gyfSsXcJ12oJ++mVZLalJ3c/Xg9bVU7F9eRuuW2qaP
 A4usxCHawNSXL9cK4HRyNQgMsb2rr7teIA2cto9RDrjtiTg6VwcgwnHUHxOtfN/oqorl
 dCBJUfXyyBObnWWP/ll7/OtNvbJT8FCBf23lZwRxjFKQkHfK0PCNmaWv9t/THqSsRpLF
 S+2aEbsWuiAQYgfVacBmfNoHvXd8I+31jTZjkoaTcXlHJyyEQKCCXoKlyEhLQxkvR6hU
 Rwiw==
X-Gm-Message-State: AOAM5311UqemH49pG4bBS8zwwkNXq4u/Lfylwy0KLN+C3+yuyfoU9aXy
 BBqLHzWkxbKr2yfrDU5Z84ThBlctZ0csFV3/ocsZpJ+jfNkMn1L6yIqK735yWUzooph2vJ5EK3h
 zmvpOQBx7qICq78o=
X-Received: by 2002:a05:600c:1e03:b0:381:4134:35ca with SMTP id
 ay3-20020a05600c1e0300b00381413435camr10394441wmb.145.1646050482009; 
 Mon, 28 Feb 2022 04:14:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUe8lXfOo1fmxfVVngbfk2rU55i13RcJcUhIlnVD/yUpxPL6eJ5T28VuT3hCIqnALcppDTUA==
X-Received: by 2002:a05:600c:1e03:b0:381:4134:35ca with SMTP id
 ay3-20020a05600c1e0300b00381413435camr10394376wmb.145.1646050481601; 
 Mon, 28 Feb 2022 04:14:41 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 m11-20020adff38b000000b001ef879a5930sm6939538wro.61.2022.02.28.04.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 04:14:41 -0800 (PST)
Message-ID: <4e007cd7-1952-42fd-cd60-b29a745ede6a@redhat.com>
Date: Mon, 28 Feb 2022 13:14:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 7/9] Avocado tests: improve documentation on tag filtering
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-8-crosa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220225210156.2032055-8-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/02/2022 22.01, Cleber Rosa wrote:
> It's possible to filter based on a combination of criteria.  This adds
> examples to the documentation.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   docs/devel/testing.rst | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 92d40cdd19..f5b6e07b5c 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -936,6 +936,28 @@ in the current directory, tagged as "quick", run:
>   
>     avocado run -t quick .
>   
> +To run tests with a given value for a given tag, such as having the
> +``accel`` tag set to ``kvm``, run:
> +
> +.. code::
> +
> +  avocado run -t accel:kvm .
> +
> +Multiple mandatory conditions can also be given.  To run only tests
> +with ``arch`` set to ``x86_64`` and ``accell`` set to ``kvm``, run:

s/accell/accel/

> +
> +.. code::
> +
> +  avocado run -t arch:x86_64,accel:kvm .
> +
> +It's also possible to exclude tests that contain a given value for a

Just a matter of taste, I guess, but I'd prefer "It is" instead of "It's" in 
the documentation.

> +tag.  To list all tests that do *not* have ``arch`` set to ``x86_64``,
> +run:
> +
> +.. code::
> +
> +  avocado run -t arch:-x86_64 .
> +
>   The ``avocado_qemu.Test`` base test class
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

With at least "accell" fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>


