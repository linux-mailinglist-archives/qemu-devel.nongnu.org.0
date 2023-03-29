Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795606CD7E3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 12:49:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phTLb-00078q-Mc; Wed, 29 Mar 2023 06:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phTLW-00078L-6H
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 06:48:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phTLS-00067b-68
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 06:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680086877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=my9PZ5jCNiC+DEylRtF3XTwqL3+Kdgu7HytTmnIrdWw=;
 b=VjSy6/NGedObGpmmCOc/KesrG/Li2EVbZfSQlBQLbPQYwWLuX0evkk1uXFV4oBS9E9LpSD
 1F9/3E+FxmqeO6ykTcYP0FSqy/J6XEK/nWm9Czqkmc+vTAW207vVgM+P0F+fwS7TKdtdwi
 JM73Pls/SJsu4OCky3E9/By5trdXN2A=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-Gb108JdDPfGSzDvEPvIVKA-1; Wed, 29 Mar 2023 06:47:55 -0400
X-MC-Unique: Gb108JdDPfGSzDvEPvIVKA-1
Received: by mail-qv1-f70.google.com with SMTP id
 v8-20020a0ccd88000000b005c1927d1609so6362547qvm.12
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 03:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680086875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=my9PZ5jCNiC+DEylRtF3XTwqL3+Kdgu7HytTmnIrdWw=;
 b=vMquak5gS6Zs+U4C6BkDvagiGjQ0cNtAeqMkerekK80D6Qrwl4JJOjlrBaLuYiZsVN
 vVKyYzPrD9rVOeuhBnlhjjuue6mNulx6F3TE6HQPWO2t2xlN151CgaFofcWPdQ/gktUs
 LdbKkBG3nypdo/QyFQIqZ64q5OR+Xlvz3prLfzBS+7A/R74GCie2/qL7NOX9yohuyEsW
 Kih1+b6LskV99Pc2FWQyXxsQD6Fh6VkmT5TseWlTV6wSoE673WAbbxdXRPWpNQAx1Bxm
 goJs6X74OAEU2g0cIpyfgRUVN0VVD0TNcHpc3TATIW8z72CLYeClDK3pXxjVoXBoC/2E
 tE7Q==
X-Gm-Message-State: AAQBX9cF/mcnfQyxGPtPNritMzjvbaWG0j4RO+POqRwQd160vsppZDeT
 IFOyIWWTktbTysjiRzpKP3Cuxy4ZWa+ENP8RQ1JGPW05YSJjFpMYRyoy+sHg6Q6Sf5I8H4l4Qqq
 bE8O/ZlTOzMAfUJY=
X-Received: by 2002:a05:6214:f2a:b0:56f:6f5:502d with SMTP id
 iw10-20020a0562140f2a00b0056f06f5502dmr34794579qvb.17.1680086874897; 
 Wed, 29 Mar 2023 03:47:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350adWNUUW/5sdb/7W+6EWFQ/Gxs20Q9CHNgb869tda4KTcz46PgctnMLHr7O9yGfF/KiCDuOiA==
X-Received: by 2002:a05:6214:f2a:b0:56f:6f5:502d with SMTP id
 iw10-20020a0562140f2a00b0056f06f5502dmr34794563qvb.17.1680086874670; 
 Wed, 29 Mar 2023 03:47:54 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-100.web.vodafone.de.
 [109.43.177.100]) by smtp.gmail.com with ESMTPSA id
 s13-20020ad4524d000000b005dd8b9345c8sm4537668qvq.96.2023.03.29.03.47.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 03:47:54 -0700 (PDT)
Message-ID: <2dc0e2fe-bb41-f81a-893f-022d17c98a48@redhat.com>
Date: Wed, 29 Mar 2023 12:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 7/8] iotests: register each I/O test separately with
 meson
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230303160727.3977246-1-berrange@redhat.com>
 <20230303160727.3977246-8-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230303160727.3977246-8-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 03/03/2023 17.07, Daniel P. Berrangé wrote:
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
>   tests/qemu-iotests/meson.build | 35 ++++++++++++++++++++++++++++------
>   1 file changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
> index 323a4acb6a..a162f683ef 100644
> --- a/tests/qemu-iotests/meson.build
> +++ b/tests/qemu-iotests/meson.build
> @@ -32,16 +32,39 @@ foreach k, v : emulators
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
> +      args = ['-tap', '-' + format, item,
> +              '--source-dir', meson.current_source_dir(),
> +              '--build-dir', meson.current_build_dir()]
> +      # Some individual tests take as long as 45 seconds
> +      # Bump the timeout to 3 minutes for some headroom
> +      # on slow machines to minimize spurious failures
> +      test('io-' + format + '-' + item,
> +           qemu_iotests_check_cmd,
> +           args: args,
> +           depends: qemu_iotests_binaries,
> +           env: qemu_iotests_env,
> +           protocol: 'tap',
> +           timeout: 180,
> +           suite: suites)
> +  endforeach
>   endforeach

Seems like this somehow broke compilation on NetBSD:

https://gitlab.com/thuth/qemu/-/jobs/4021584713#L2980

?

  Thomas


