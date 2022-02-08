Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A714ADAD3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:08:12 +0100 (CET)
Received: from localhost ([::1]:56046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRAB-00066t-8Q
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:08:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nHPjN-0007Qw-UQ; Tue, 08 Feb 2022 07:36:30 -0500
Received: from [2a00:1450:4864:20::634] (port=40468
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nHPjM-0003ne-6z; Tue, 08 Feb 2022 07:36:25 -0500
Received: by mail-ej1-x634.google.com with SMTP id p15so51846428ejc.7;
 Tue, 08 Feb 2022 04:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H97zLN67Qx7QJvV/ULSVx/YjV1YTkZrHmECWNsvV4Uo=;
 b=JeRxBQzXd0MN0YAcn3o1Vf/qjazSrHU0z1UyERPz17EWONNd3BirVWZvVaCpVhocDb
 cyJx1u03svZcS2pG50cnFcNsBQNR9kMrSv/rphoVudJ5ncExXcOYOaYEq/jQczDt5UkL
 9fHGWVi9TdmHiPZ/jAujTPAPHeiea7ImSTr4j6fLS3SCpd8vkKCq6CQfjwDBXbBIGunC
 r9UkLQ0fJF1AFTv8Xso9GAmkPiXIhViTK23qWI5RqaFrrZAaxKAMuqFsFlvH0LniyS4W
 N6hwfRtEEVITTaI1F+i5sGiYk8AJDiEdQA0l+Dxoc18DbsD3DBahEKedWknuXjYWQqV7
 3hIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H97zLN67Qx7QJvV/ULSVx/YjV1YTkZrHmECWNsvV4Uo=;
 b=D/JgAEW6hC5w02RGwSi+TFAgICTj7nRXLC84RH+l1I6IYebK0R5PAKnKoD0pnWtt8R
 V1U8FLO6OHZdTpUk6Gphv53c7cl0my9htjHiMiE1cKYbT8bTgLq+O4pedy9gim46DkVj
 6KkvsnkmP1VP6noFGh//a0pSePgywyrl0SZTxwGBL9WDiVz5jLedO1te5gyb1hT4MBE5
 xHQ5Ul61Udx1P3fzDFWYrEC5rfgBWG88jUUw+XMt2LAIIOaEu9cun9EkFI0sxVEaIhFV
 5OYQw2TnyOcg3u0l/AXAxa/P69hTxFk8vCK1q73nkZlvqGY+1q3Hrvyv3Xkbk8jHnBcD
 7+yQ==
X-Gm-Message-State: AOAM531L1YfZ/lozE5+oH0kdgHWtQz5Xx7nrjF4+othC+bv1iKrodw9m
 amk4ObfRB/RO7MF3ZJxiYxA=
X-Google-Smtp-Source: ABdhPJyzZ95XtxpWyknhF/StCP9z+kIcIeJVTHvzDtCNx6mxEdlkDR9LJZT2Of2U2KCySdFNwWyFIw==
X-Received: by 2002:a17:906:77c3:: with SMTP id
 m3mr960087ejn.698.1644323782089; 
 Tue, 08 Feb 2022 04:36:22 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id bo9sm2089849edb.29.2022.02.08.04.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 04:36:21 -0800 (PST)
Message-ID: <8718490e-97be-cf09-3e19-36fb46d84a50@redhat.com>
Date: Tue, 8 Feb 2022 13:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/6] tests/qemu-iotests/meson.build: Call the 'check'
 script directly
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-5-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220208101311.1511083-5-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/22 11:13, Thomas Huth wrote:
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

The main disadvantage here is that changes to the test directory will 
not rebuild meson.build.  So when one creates a new test, meson has to 
be rerun manually.

It is probably possible to do something like:

- run "check -g auto -n" with configure_file() and store the output in a 
file

- in the Makefile, always run "check -g auto -n", like

check-block-test-list: check-block-test-list.stamp
check-block-test-list.stamp:
	./check -g auto -n > check-block-test-list.stamp; \
	if cmp check-block-test-list.stamp check-block-test-list; then \
		cp check-block-test-list.stamp check-block-test-list; \
	fi
.PHONY: check-block-test-list.stamp

check check-block: check-block-test-list.stamp

before giving control to "meson test"; but I'm not sure if that will 
also cause a rebuild of Makefile.mtest and a meson rerun.

But I'm not sure it's worth it...

Regarding the issue that Peter pointed out, that's my fault for not 
being aware of the "diff" being in the output of failing tests.  There 
are three ways to fix it:

1) reverting my patches

2) Thomas's series, but only if the above issue is fixed

3) shipping the tests/qemu-iotests/*.bad files as artifacts

4) not using -tap (either reverting commit d316859f4e, "check-block: 
replace -makecheck with TAP output", or just removing -tap from 
tests/qemu-iotests/meson.build).

My preference is 4, then 1 or 2 (depending on the complexity), then 3.

Paolo

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
> +  endforeach
>   endforeach


