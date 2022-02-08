Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3594ADB74
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:44:36 +0100 (CET)
Received: from localhost ([::1]:48826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRjP-0000Vi-RB
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:44:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nHQIU-0007o3-2R
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:12:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nHQIP-0001GQ-L0
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:12:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644325955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N7lgIEnCeouLebgpq3+Baj0uFzr+P7nFB7YFgaui8oE=;
 b=eE1FEWhRhrftps5PF5OijH+10P4TkEhWpViFl3dLQQ4Z4Yqph8PQx8aXYfejtWQJ6YmQ/5
 GvSrzhKYZJ6edv10Ihjkf+eymKUOHpGgk4enO7WUHVFXRAtoUpo4JO5WCt11cX/4d5UGPr
 B32LgGXBXT/4xz+O/nJEN5XIoBfWWxM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-QnmQqXbBPY6DWEDaEw5Yug-1; Tue, 08 Feb 2022 08:12:34 -0500
X-MC-Unique: QnmQqXbBPY6DWEDaEw5Yug-1
Received: by mail-ej1-f71.google.com with SMTP id
 z26-20020a1709067e5a00b006cbe0628826so2048665ejr.10
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 05:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N7lgIEnCeouLebgpq3+Baj0uFzr+P7nFB7YFgaui8oE=;
 b=rEJlqfnnASvIL8KQd8io/xQhs8V5pM6n/yLdzKGLWXv+mWFkChX+7l6Z0L28cP3Ajg
 aDP89FnDoHo7hDaT7F0qX/hzP6YYRag4UIQHPdLMXJbFMofm9oACRSc22+a+JuvTPDPU
 UBvq48lyui+GQT4dMgI3gAd05PFPKU2NMcD+cebUaPTQ2UlVLCf3eJag0EYmaSZ1VGji
 HDRYM37L9NVdP9JdFnYaMLZY5L3ZA+QOOn5sQFsevCzzbEagss+PoAJxuJ9ocy7Gnmtv
 H3INf6rbmgxXc50tH29aI2dO/DFkXwhJl6dqyYiufFrOcu5QPXpM13zYOANffxuqfCG5
 3eDg==
X-Gm-Message-State: AOAM531xNzsUyQVpsTFKfOm4BA/npcTFr3GR+NgLR5OVWTsKuZA1SBzw
 0bs8S38YvuLW8w17MekmeBDGw3gFTe3M+bryw0wQMrnuFd5Z6IeyR08M1mwrsuhI63fQwupZud7
 npuqqpSGZvWZUmGc=
X-Received: by 2002:a17:906:6481:: with SMTP id
 e1mr3658316ejm.352.1644325947057; 
 Tue, 08 Feb 2022 05:12:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqParCBcZ0yiFcfJEc/izjOgtRzhGxqTLzbk0PISOkLsnjMUuJgyorZo1ofvnlKIZh3+z/dQ==
X-Received: by 2002:a17:906:6481:: with SMTP id
 e1mr3658283ejm.352.1644325946688; 
 Tue, 08 Feb 2022 05:12:26 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id v5sm1803950ejr.107.2022.02.08.05.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 05:12:26 -0800 (PST)
Message-ID: <3d595111-f976-97ab-e198-a76f38052dc0@redhat.com>
Date: Tue, 8 Feb 2022 14:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/6] tests/qemu-iotests/meson.build: Call the 'check'
 script directly
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-5-thuth@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220208101311.1511083-5-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.02.22 11:13, Thomas Huth wrote:
> We can get a nicer progress indication if we add the iotests
> individually via the 'check' script instead of going through
> the check-block.sh wrapper.
>
> For this, we have to add some of the sanity checks that have
> originally been done in the tests/check-block.sh script (whether
> "bash" is available or whether CFLAGS contain -fsanitize switches)
> to the meson.build file now, and add the environment variables
> that have been set up by the tests/check-block.sh script before.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qemu-iotests/meson.build | 45 ++++++++++++++++++++++++++++------
>   1 file changed, 37 insertions(+), 8 deletions(-)
>
> diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
> index e1832c90e0..5a6ccd35d8 100644
> --- a/tests/qemu-iotests/meson.build
> +++ b/tests/qemu-iotests/meson.build
> @@ -1,9 +1,29 @@
> -if not have_tools or targetos == 'windows'
> +if not have_tools or targetos == 'windows' or \
> +   config_host.has_key('CONFIG_GPROF')
>     subdir_done()
>   endif
>   
> +bash = find_program('bash', required: false)
> +if not bash.found() or \
> +   run_command(bash, ['--version']).stdout().contains('GNU bash, version 3')

Instead of me asking about where the LANG=C is, or me lamenting that we 
could test very simply for [123] before and can no longer now... Can we 
not just do `find_program('bash', required: false, version: '>= 4.0')`?

> +  message('bash >= v4.0 not available ==> Disabled the qemu-iotests.')
> +  subdir_done()
> +endif
> +
> +foreach cflag: config_host['QEMU_CFLAGS'].split()
> +  if cflag.startswith('-fsanitize') and \
> +     not cflag.contains('safe-stack') and not cflag.contains('cfi-icall')
> +    message('Sanitizers are enabled ==> Disabled the qemu-iotests.')
> +    subdir_done()
> +  endif
> +endforeach
> +
>   qemu_iotests_binaries = [qemu_img, qemu_io, qemu_nbd, qsd]
> -qemu_iotests_env = {'PYTHON': python.full_path()}
> +qemu_iotests_env = {
> +  'PYTHON': python.full_path(),
> +  'PYTHONUTF8': '1',
> +  'QEMU_CHECK_BLOCK_AUTO': '1'
> +}
>   qemu_iotests_formats = {
>     'qcow2': 'quick',
>     'raw': 'slow',
> @@ -18,16 +38,25 @@ foreach k, v : emulators
>     endif
>   endforeach
>   
> +check_script = find_program(meson.current_build_dir() / 'check')
> +iotests = run_command(python, [check_script.full_path(), '-g', 'auto', '-n'],
> +                      check: true).stdout().strip().replace('tests/', '').split('\n')
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
> +  foreach tst: iotests
> +    test('iotest-' + format + '-' + tst,
> +         python, args: [check_script.full_path(), '-tap', '-' + format, tst],
> +         depends: qemu_iotests_binaries,
> +         env: qemu_iotests_env + \
> +              { 'TEST_DIR':
> +                meson.current_build_dir() / 'scratch' / format + '-' + tst },
> +         protocol: 'tap',
> +         suite: suites,
> +         timeout: 0)

So as far I understand you’d like to have meson run the iotests in 
parallel this way.  I don’t actually think that’s safely possible for 
multiple formats at once, because a test’s output is always written into 
`${build_dir}/tests/qemu-iotests/${seq}.out.bad`; so if you run e.g. 
test 001 both with raw and qcow2 simultaneously, then they can get in 
each other’s way.

(In my test branch, I have 
https://gitlab.com/hreitz/qemu/-/commit/f3110b1eeb93d02aeadc5c8b807594cfa10a6aad 
for this – maybe I should send something like this in a more refined 
form to the list some time...)

As a minor note, the `check` script has recently received a `-j` 
argument for parallel execution.  Kind of a shame that we wouldn’t be 
able to use it here, but that’s how it is, I suppose.

Hanna


