Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AACC56CD9B7
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 14:56:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVLV-0001wo-Hy; Wed, 29 Mar 2023 08:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phVLS-0001vy-Q1
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 08:56:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phVLR-0004DC-2S
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 08:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680094564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YgZl2RnTo/DojDMRuoIKQmpbgBIbRyeoZntV2xvweWM=;
 b=d+QZh8RiW8uF1aL7c2GyZXp+jh1EGFHRop25Tf7aC0BVp8JdFtNZvPn1EWUlx4FJ1UJWY0
 bvR62M75tz4m/oQaV9F9nueNYl9ejPTWe8iaVWYcpCKFqzlcq4oVET5oW0THcsPYjbV/9O
 DfugTIyD1oMFYdYrRymGQvJSBfsNtzg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-R63myzjjPXGCUw9NA740_g-1; Wed, 29 Mar 2023 08:56:03 -0400
X-MC-Unique: R63myzjjPXGCUw9NA740_g-1
Received: by mail-ed1-f70.google.com with SMTP id
 t14-20020a056402240e00b004fb36e6d670so22116900eda.5
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 05:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680094561; x=1682686561;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YgZl2RnTo/DojDMRuoIKQmpbgBIbRyeoZntV2xvweWM=;
 b=cvQHSQtb0h4L+vAiuhGiMQFz97WBamwCYnfKR0/xZlNaf7Bbc+vkSBq5GkgCMwC89M
 ppYVzhOtyYYuZP+mXvnIDiZymoppj1T1VF7qgvoj4n+B8C5A4Ihrd9FjyzYRY+Fp0kSA
 9wi6SAco0A9/vXyUz8iwnEcvegLe3eKp8x2hd0gAPJF1NgFS+GqpenObDSppNHneRgqO
 kUh+iv8+l9hPtHrFnHFGoFT/Vupj41+0tuzp37WtTJM45Dx/mqxBDpLrjjQ4D8SD8Pws
 Dp31kCUeGdGb0TJc8OpSRAg/28WRKZmTQikicZxn8EO/ZAOya+hlBZHgVtgUhomUid2o
 hUZg==
X-Gm-Message-State: AAQBX9dLVFRx1DnDPdp090TQauotKBfX28mitSSjj9jV89ENXBD2eEhN
 BpTK5sXhqn3HhVmV/cBCNkLNPXuyUJGSEjmELa07gfdM1A6lQiQ2VM1391CH7fMIRai4NZvG922
 BHOFiYSSlYKiFR8o=
X-Received: by 2002:a17:906:49d9:b0:932:217c:b85d with SMTP id
 w25-20020a17090649d900b00932217cb85dmr18091253ejv.37.1680094561693; 
 Wed, 29 Mar 2023 05:56:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350YG60NqJr+aVaVxzqn363rRfTBiSpkoy6Gc8npn+br3rYnkZ7LxBR6i52A3UiuLyROu2xyzqw==
X-Received: by 2002:a17:906:49d9:b0:932:217c:b85d with SMTP id
 w25-20020a17090649d900b00932217cb85dmr18091238ejv.37.1680094561416; 
 Wed, 29 Mar 2023 05:56:01 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 g22-20020a170906199600b008b1797b77b2sm16358744ejd.221.2023.03.29.05.56.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 05:56:00 -0700 (PDT)
Message-ID: <d49d0152-ff58-a317-7eca-a243ed080ca0@redhat.com>
Date: Wed, 29 Mar 2023 14:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 1/3] python: add mkvenv.py
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
References: <20230328211119.2748442-1-jsnow@redhat.com>
 <20230328211119.2748442-2-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230328211119.2748442-2-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/28/23 23:11, John Snow wrote:
> +        # venv class is cute and toggles this off before post_setup,
> +        # but we need it to decide if we want to generate shims or not.

Ha, yeah that's a bug in the venv package.  post_setup() can already run 
with system_site_packages reverted to True.

> +            for entry_point in entry_points:
> +                # Python 3.8 doesn't have 'module' or 'attr' attributes
> +                if not (hasattr(entry_point, 'module') and
> +                        hasattr(entry_point, 'attr')):
> +                    match = pattern.match(entry_point.value)
> +                    assert match is not None
> +                    module = match.group('module')
> +                    attr = match.group('attr')
> +                else:
> +                    module = entry_point.module
> +                    attr = entry_point.attr
> +                yield {
> +                    'name': entry_point.name,
> +                    'module': module,
> +                    'import_name': attr,
> +                    'func': attr,

What about using a dataclass or namedtuple instead of a dictionary?

> 
> +
> +    try:
> +        entry_points = _get_entry_points()
> +    except ImportError as exc:
> +        logger.debug("%s", str(exc))
> +        raise Ouch(
> +            "Neither importlib.metadata nor pkg_resources found, "
> +            "can't generate console script shims.\n"
> +            "Use Python 3.8+, or install importlib-metadata, or setuptools."
> +        ) from exc

Why not put this extra try/except inside _get_entry_points()?

> +
> +    # Test for ensurepip:
> +    try:
> +        import ensurepip

Use find_spec()?

BTW, another way to repair Debian 10's pip is to create a symbolic link 
to sys.base_prefix + '/share/python-wheels' in sys.prefix + 
'/share/python-wheels'.  Since this is much faster, perhaps it can be 
done unconditionally and checkpip mode can go away together with 
self._context?

Paolo


