Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4AA6EEFD7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 10:06:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1praAJ-0002NU-1W; Wed, 26 Apr 2023 04:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1praAH-0002NK-08
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:06:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1praA5-0008SP-VX
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:06:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682496360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJ3jPJtJofk+4NdmP2ZLhoTnwPIi9cCzJ2lpsVM/l7s=;
 b=hwcOpJm55Iq/mc9paioEHu4TN3z7pMYLTSTGNTtmmBlluwD6OL3ozsLMdf7/KFLp9KSUW8
 oRepZa9Etf4XsudbgigpxEjbwEeJdpwUVsDITESgz7W2nrSIVhEoJvaJkrT25fo3XskuGY
 0OUKihSpclg0XfIAih7UsYL/jB9PBAo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-I4Ihtz2LM_iKvM_IgAsdlQ-1; Wed, 26 Apr 2023 04:05:58 -0400
X-MC-Unique: I4Ihtz2LM_iKvM_IgAsdlQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94a355c9028so735529566b.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 01:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682496357; x=1685088357;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jJ3jPJtJofk+4NdmP2ZLhoTnwPIi9cCzJ2lpsVM/l7s=;
 b=OHjwcjL4RY09EsNbHdoCaIBCqcshxTlLa30xXUODF0USy6b/0GZGle6sz6qVRSlhlt
 kKGRCzXWYWeRYQ71lIhsTLw4E+5m9zW5iitxZsB+Aj5wb2tnmdprtTNaFTS4jZaY0Wg6
 bM5pOar9IQmhefSxfosNAlyiWD+v8SVyHxxYPlhhae5x+Ka+sRudYua2E7TXFV/RdCf1
 OHVByC06BvKcqTVnaQP+6koQJjpv0UUOV3nog2Ui4jlNwmuN130oQ2Fs3l/T22suIE1f
 SjD3pLxr3qrNNGgs4PLYtpNoDjwNa2tvQl8YKTaOq1nuHnsz8O+Sv0ondr+EkQMDs/8Z
 oEmg==
X-Gm-Message-State: AAQBX9ejqDqLEOkOhS59lEc2cjRn2OL0p8GaSJjMqtG/EH96CMKovcKg
 c39dlZCsWT8RN0Nz4IHQgrcbfDAzt/SQfFYA4Q+CMUuzTIuGqHoQlXtp+508IovOPGhwP2gfQSp
 Lf+y2k3LilfVly6oa+nP65Ys=
X-Received: by 2002:a17:907:94d0:b0:94f:ca5:1a66 with SMTP id
 dn16-20020a17090794d000b0094f0ca51a66mr18840602ejc.59.1682496357219; 
 Wed, 26 Apr 2023 01:05:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350bhsTE4zocJ20l2CEvhDPrAQnaNezuPp9ox9tQg864Lmi7CqA9pzRFD8UWa3s8i59ZFjg7Jfg==
X-Received: by 2002:a17:907:94d0:b0:94f:ca5:1a66 with SMTP id
 dn16-20020a17090794d000b0094f0ca51a66mr18840573ejc.59.1682496356834; 
 Wed, 26 Apr 2023 01:05:56 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 f10-20020a170906048a00b0094eeea5c649sm7847812eja.114.2023.04.26.01.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 01:05:56 -0700 (PDT)
Message-ID: <87ab99cd-b3a6-22a5-ce2a-f569b2ef1213@redhat.com>
Date: Wed, 26 Apr 2023 10:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH v3 00/20] configure: create a python venv and ensure
 meson, sphinx
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Beraldo Leal <bleal@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230424200248.1183394-1-jsnow@redhat.com>
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230424200248.1183394-1-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/24/23 22:02, John Snow wrote:
> Some important points as a pre-emptive "FAQ":
> 
> - This venv is unconditionally created and lives at {build_dir}/pyvenv.
> 
> - The python interpreter used by this venv is always the one identified
>    by configure. (Which in turn is always the one specified by --python
>    or $PYTHON)
> 
> -*almost*  all python scripts in qemu.git executed as part of the build
>    system, meson, sphinx, avocado tests, vm tests or CI are always
>    executed within this venv.
> 
>    (iotests are not yet integrated; I plan to tackle this separately as a
>    follow-up in order to have a more tightly focused scope on that
>    series.)
> 
> - It remains possible to build and test fully offline.
>    (In most cases, you just need meson and sphinx from your distro's repo.)
> 
> - Distribution packaged 'meson' and 'sphinx' are still utilized whenever
>    possible as the highest preference.
> 
> - Vendored versions of e.g. 'meson' are always preferred to PyPI
>    versions for speed, repeatability and ensuring tarball builds work
>    as-is offline.
> 
>    (Sphinx will not be vendored, just like it already isn't.)
> 
> - Missing dependencies, when possible, are fetched and installed
>    on-demand automatically to make developer environments "just work".
> 
> - Works for Python 3.7 and up, on Fedora, OpenSuSE, Red Hat, CentOS,
>    Alpine, Debian, Ubuntu, NetBSD, OpenBSD, and hopefully everywhere
> 
> - No new dependencies (...for most platforms. Debian and NetBSD get an
>    asterisk.)
> 
> - The meson git submodule is unused after this series and can be removed.

Thanks, this looks pretty good.  Some changes I'd make for the non-RFC 
version:

- I think we should just check in the meson wheel (which also removes 
the need for patch 12, so it can be done in its stead) and remove the 
submodule

- The verbosity of mkvenv.py can be tuned down and most prints replaced 
with logger.info() or logger.debug()

- While I agree with keeping patch 18 separate, I would move it earlier 
so that patch 19 can be squashed into patch 14

- I am ambivalent about keeping --enable/--disable-pypi in the first 
committed patchset, but in any case I would move patches 16 and 20 
before patch 15

Paolo


