Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A53E6E96AC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 16:10:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUyY-0007N8-E7; Thu, 20 Apr 2023 10:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUyV-0007Mv-4D
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:09:27 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUyS-0001Ha-RM
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:09:26 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2efbaad9d76so613235f8f.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 07:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681999762; x=1684591762;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IbVMVQlOKin+hUHPftP1ekCjxt3ojU3DmHeRjQ9vSRI=;
 b=RZcFugyDdCmRPHb7MErt8LauMHhSuGZSl8wlsasOKyd/jodpgUND0NKidm6nPLBKvr
 j4MiJSnZeZbi3exbbSAgG3gm9rizHA/1iVJYukpkD33Bkp2K1FqzerFjwWAqeskw3keK
 Pe23NISpjVmXUemMvDHf0LWa8spcOI63WQ46CuZs4HJu0daiBaXNabAuK20e5a5PAHKg
 maVBV6ygXS84gDmh9+flPk6mhkP77VRHs5mlLWSCei4/EC/nl8mUAAV2R9IRbVT8+IB5
 0+XmR5O7T5abv3c///CPlqV4aa2Bd6dyMHZvTcjlUD8y6AEG2aE6JiWZkuMVlpq1MO2G
 6WrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681999762; x=1684591762;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IbVMVQlOKin+hUHPftP1ekCjxt3ojU3DmHeRjQ9vSRI=;
 b=AmoZ8Yy+nNbp+zgYXMCImfa+Ls7X66nXzsuqMQEL8DPwFA+QE7ZQ8ixltoHSrd65Um
 FFI36oGdLbo+FT7qX28FT+95BwC0nkysen4bRdOkBRVyOf9G3Ebc8b9ebGrbyJtkD9nK
 43U3EC1E/mfR2UMlRQELhWPqARstF0IgLxohmr1uIpUhqY3ntSFOPVoJSxcJrG5QQz/u
 /IJ+guZzqLJ7XoIsTbGqPI07oewrxJJILLgVf/emPl+JxgzVAAvD85vG1903wLXIDPwl
 Lb+dWlUVYBMCbFc+PnKgEFXi4JticGMNNPVx6KIlRL7oTB1QKxvXEQPSrZfCDS/75kvh
 Tupw==
X-Gm-Message-State: AAQBX9cpli4+BxPUPmCmyUejDl7IdwCsJ52E25eE7tSfAKTHCOY7sXlL
 RU7Q/koYWamnajto84bE2NlnPw==
X-Google-Smtp-Source: AKy350abw4seKVzcfdhE1Kff9I8Yqe+MSl3YngcgWf/P9s8YgSE/ce2+DB7WebbIED4IhhVuxcajkA==
X-Received: by 2002:a5d:5960:0:b0:2f9:9f6f:e4d with SMTP id
 e32-20020a5d5960000000b002f99f6f0e4dmr1224452wri.39.1681999762243; 
 Thu, 20 Apr 2023 07:09:22 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b5-20020a056000054500b002e5ff05765esm2047654wrf.73.2023.04.20.07.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 07:09:21 -0700 (PDT)
Message-ID: <e0f489fc-d6c9-68ae-1732-cb4e11988be0@linaro.org>
Date: Thu, 20 Apr 2023 16:09:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/2] tests/avocado/tuxrun_baselines.py: improve code
 coverage for ppc64
Content-Language: en-US
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230420125217.620928-1-kconsul@linux.vnet.ibm.com>
 <20230420125217.620928-3-kconsul@linux.vnet.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420125217.620928-3-kconsul@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 20/4/23 14:52, Kautuk Consul wrote:
> Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
> boot_linux.py test-case due to which the code coverage for ppc
> decreased by around 2%. As per the discussion on
> https://lore.kernel.org/qemu-devel/87sfdpqcy4.fsf@linaro.org/ it
> was mentioned that the baseline test for ppc64 could be modified
> to make up this 2% code coverage. This patch attempts to achieve
> this 2% code coverage by adding various device command line
> arguments (to ./qemu-system-ppc64) in the tuxrun_baselines.py
> test-case.
> 
> The code coverage report with boot_linux.py, without it and finally
> with these tuxrun_baselines.py changes is as follows:
> 
> With boot_linux.py
> ------------------
>    lines......: 13.8% (58006 of 420997 lines)
>    functions..: 20.7% (7675 of 36993 functions)
>    branches...: 9.2% (22146 of 240611 branches)
> Without boot_linux.py (without this patch changes)
> --------------------------------------------------
>    lines......: 11.9% (50174 of 420997 lines)
>    functions..: 18.8% (6947 of 36993 functions)
>    branches...: 7.4% (17580 of 239017 branches)
> Without boot_linux.py (with this patch changes)
> -----------------------------------------------
>    lines......: 13.8% (58287 of 420997 lines)
>    functions..: 20.7% (7640 of 36993 functions)
>    branches...: 8.4% (20223 of 240611 branches)
> 
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> Reported-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/tuxrun_baselines.py | 120 +++++++++++++++++++++++++++++-
>   1 file changed, 116 insertions(+), 4 deletions(-)


> +        # Create a temporary qcow2 and launch the test-case
> +        with tempfile.NamedTemporaryFile(prefix='tuxrun_ppc64le_',
> +                                         suffix='.qcow2') as qcow2:
> +            process.run(self.qemu_img + ' create -f qcow2 ' +
> +                        qcow2.name + ' 1G')
> +
> +            self.vm.add_args('-drive', 'file=' + qcow2.name +
> +                         ',format=qcow2,if=none,id='
> +                         'drive-virtio-disk1',
> +                         '-device', 'virtio-blk-pci,scsi=off,bus=pci.0,'
> +                         'addr=0xb,drive=drive-virtio-disk1,id=virtio-disk1'
> +                         ',bootindex=2')
> +            self.common_tuxrun(drive="scsi-hd")

Nicer, thanks!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


