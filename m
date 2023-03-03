Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D176A9437
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:34:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1o0-0005Ru-KS; Fri, 03 Mar 2023 04:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY1nu-0005Pv-R4
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:34:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY1nt-0003ik-5q
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:34:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677836056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9uvOWgytthUc6J3Le4JabomcnqcvqKjmNwz+ldazYrk=;
 b=dONiN1PzxZyob0z3dmGYwbVca5sofC3fDgQZkqd17KI08TJrt6vop5hGD4k5c89UhvImM9
 es0fJp+P5MXwVUl87Npyl0bwCL8D1YUNpnM8MUg7LKu7F4H4SyCRr304N82S/mPABhnfSy
 Fnicv5p5OyhrUyYtsupDii5zShCIESc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-xyHtyTUzNgqnLzYPrjd-WA-1; Fri, 03 Mar 2023 04:34:14 -0500
X-MC-Unique: xyHtyTUzNgqnLzYPrjd-WA-1
Received: by mail-wm1-f69.google.com with SMTP id
 4-20020a05600c024400b003eb2e295c05so721986wmj.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 01:34:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9uvOWgytthUc6J3Le4JabomcnqcvqKjmNwz+ldazYrk=;
 b=nHr1l26DuUVmaZ3BQwdUe6JxcrbFziT+E1giwvM9oSGxuP3hlVywSOKmsBGiZiQjCC
 sYm4HfRFtQ4mMHURfd8Ff+nDk7mn7e3KTpcKBG5cxzzTY0QSSigNLhC2Uw/6X1u0400m
 b4//HBgQrNWQGjEQ3b5aHoz/vqtNluOXY5zq6nkbLdXQhUNgdtpAjVv6BAd+w5CJS/li
 vk6rOHCPCkvEhhMoFtE/qFRnpQqP+eU1e6uecRKaSvym9dALmW2PEpul2hKpGxBYdc4J
 JZiMpi1gUfFWvixdP1ZfCOC2uEMch+PzCCHD/E+M+/FYL28URd/yV2pxZ3Dz2oVlO/d8
 Ujyg==
X-Gm-Message-State: AO0yUKWAqmo1vXhicFjY7jMf1eqXuZhrwGS9TrT7PClm7nyh6dooL7sp
 ak82Mqh5sRHsqkSF3dLNBHgWpfihADt1GZ2tlYC8WjIN8toxrJ/LVJ3vCvqwbjw4s2x4EUzQE/l
 iFU38ay/ESv0IQNU=
X-Received: by 2002:a05:600c:4f15:b0:3eb:3998:36fa with SMTP id
 l21-20020a05600c4f1500b003eb399836famr950459wmq.29.1677836053660; 
 Fri, 03 Mar 2023 01:34:13 -0800 (PST)
X-Google-Smtp-Source: AK7set//36Qo0bQAeLZlQQTpsSK8i80eOXVkuyK00Q3R0z00xdTlav8WytXZ21dRBpFGzFvGPkiCcQ==
X-Received: by 2002:a05:600c:4f15:b0:3eb:3998:36fa with SMTP id
 l21-20020a05600c4f1500b003eb399836famr950436wmq.29.1677836053409; 
 Fri, 03 Mar 2023 01:34:13 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b003e7f1086660sm5795568wmo.15.2023.03.03.01.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:34:12 -0800 (PST)
Message-ID: <538abc5a-5873-4384-e6b0-8a04824daa4a@redhat.com>
Date: Fri, 3 Mar 2023 10:34:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20230302184606.418541-1-berrange@redhat.com>
 <20230302184606.418541-6-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 5/5] iotests: register each I/O test separately with meson
In-Reply-To: <20230302184606.418541-6-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 02/03/2023 19.46, Daniel P. Berrangé wrote:
> Currently meson registers a single test that invokes an entire group of
> I/O tests, hiding the test granularity from meson. There are various
> downsides of doing this
> 
>   * You cannot ask 'meson test' to invoke a single I/O test
>   * The meson test timeout can't be applied to the individual
>     tests
>   * Meson only gets a pass/fail for the overall I/O test group
>     not individual tests
>   * If a CI job gets killed by the GitLab timeout, we don't
>     get visibility into how far through the I/O tests
>     execution got.
> 
> This switches meson to perform test discovery by invoking 'check' in
> dry-run mode. It then registers one meson test case for each I/O
> test. Parallel execution remains disabled since the I/O tests do not
> use self contained execution environments and thus conflict with
> each other.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qemu-iotests/meson.build | 33 +++++++++++++++++++++++++++------
>   1 file changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
> index 323a4acb6a..48c82085af 100644
> --- a/tests/qemu-iotests/meson.build
> +++ b/tests/qemu-iotests/meson.build
> @@ -32,16 +32,37 @@ foreach k, v : emulators
>     endif
>   endforeach
>   
> +qemu_iotests_check_cmd = files('check')
> +
>   foreach format, speed: qemu_iotests_formats
>     if speed == 'quick'
>       suites = 'block'
>     else
>       suites = ['block-' + speed, speed]
>     endif
> -  test('qemu-iotests ' + format, sh, args: [files('../check-block.sh'), format],
> -       depends: qemu_iotests_binaries, env: qemu_iotests_env,
> -       protocol: 'tap',
> -       suite: suites,
> -       timeout: 0,
> -       is_parallel: false)
> +
> +  args = ['-tap', '-' + format]
> +  if speed == 'quick'
> +      args += ['-g', 'auto']
> +  endif
> +
> +  rc = run_command(
> +      [qemu_iotests_check_cmd] + args + ['-n'],
> +      check: true,
> +  )
> +
> +  foreach item: rc.stdout().strip().split()
> +      message('Adding test qemu-iotests-' + format + '-' + item)

This message spoils the output during "configure" quite a bit, please remove 
that line.

Apart from that, patch looks fine to me!

  Thomas


> +      args = ['-tap', '-' + format, item,
> +              '--source-dir', meson.current_source_dir(),
> +              '--build-dir', meson.current_build_dir()]
> +      test('qemu-iotests-' + format + '-' + item,
> +           qemu_iotests_check_cmd,
> +           args: args,
> +           is_parallel: false,
> +           depends: qemu_iotests_binaries,
> +           env: qemu_iotests_env,
> +           protocol: 'tap',
> +           suite: suites)
> +  endforeach
>   endforeach


