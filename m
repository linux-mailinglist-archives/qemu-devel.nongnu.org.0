Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6D76F20BD
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 00:15:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psWM4-0003nd-24; Fri, 28 Apr 2023 18:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psWM1-0003nL-FS
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:14:13 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psWLz-0002XK-0N
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:14:12 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so1269235e9.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 15:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682720049; x=1685312049;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ssu/Xqwkgvfc2RlF96qpBMck4O2RQ2hjQR94kNoQ2wQ=;
 b=C+uvqwAnMjlnJ5BVoNa326ayNoT2XruWq1IDH9o8O72gnXGQglqrh5wZI9GuZ8SMo0
 3kFBxK+KfOtvTMgyInFqnIJzBmEDJCdU2j1RyWrhiUW/CJj4yT0bEvIHe90fMajQz2et
 6lmfpvSDLdYdcpFDgdj6T4DM3iun9owwucXtbcAddrP3iltLQA/OxVYn18Pbp5RT5hdb
 MnkdyzWsEmp3+LI6U4b06N5Bzf91G1N1Ide5YGJXbEL8XdU92FF8uscgHlLkAt/KbyQ9
 5sa3oxAAz2YvTcnZZ4ega/soCmdukZry5BxTQzFrOvO66qPsz6THwtBRdvez44yfAt6+
 +DTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682720049; x=1685312049;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ssu/Xqwkgvfc2RlF96qpBMck4O2RQ2hjQR94kNoQ2wQ=;
 b=XabsBXlnWOEI6jekKO3MEBeISeeGsv2wktjiKJNyW/h5k2INDTVZDQLDIHhj5HXKLi
 B3TfpXWHDoRFTXpklDfGjQ0odgaZpD2KLEjfbtv0CjsUI3MqcLSX38VnXhmZV/TsVrMG
 jusR5uzgp5zmCCYHfuFpHpPPIUFKzNx+D/xDy3KRhgnlAifmnDsuZv8WflSap4e4pEsI
 qiQTKzcmra4sdmErk1CSUFQbXrhk0cqinDvM/af9lNOD0AmTVgBsq9RHQhM/DOwPgEtH
 EVB202wIOAY619ijreg/AwGLaWvSRgBHPAPb2yX8qll+zhACfZqoewOqZIWbqEIDNCpl
 ZQVQ==
X-Gm-Message-State: AC+VfDzIt4ptoDvNngNGPs+IXwHwX/jRkio/B0JiqRNB21JmNPyVG4v+
 pSlLnlp7oTOyH0A0MsPvka3LHA==
X-Google-Smtp-Source: ACHHUZ4Ggto5J7JYL6UbWIU21fleZ/I5p0nPNo49OH/ueKzzpSxSYcZbL1QC+lGhFXjb4ZAnLN8Afw==
X-Received: by 2002:a1c:f717:0:b0:3f1:9acf:8670 with SMTP id
 v23-20020a1cf717000000b003f19acf8670mr5325105wmh.22.1682720049506; 
 Fri, 28 Apr 2023 15:14:09 -0700 (PDT)
Received: from [192.168.1.17] (78-141-23-110.xdsl.murphx.net. [78.141.23.110])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a0560001b0400b002ffbf2213d4sm22170378wrz.75.2023.04.28.15.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 15:14:09 -0700 (PDT)
Message-ID: <0ed8aacf-9fbc-5f67-153c-f052eabc7fa6@linaro.org>
Date: Fri, 28 Apr 2023 23:14:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH] plugins: force slow path when plugins instrument
 memory ops
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Robert Henry <robhenry@microsoft.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230419161226.1012884-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230419161226.1012884-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/19/23 17:12, Alex Bennée wrote:
> The lack of SVE memory instrumentation has been an omission in plugin
> handling since it was introduced. Fortunately we can utilise the
> probe_* functions to force all all memory access to follow the slow
> path. We do this by checking the access type and presence of plugin
> memory callbacks and if set return the TLB_MMIO flag.
> 
> We have to jump through a few hoops in user mode to re-use the flag
> but it was the desired effect:
> 
>   ./qemu-system-aarch64 -display none -serial mon:stdio \
>     -M virt -cpu max -semihosting-config enable=on \
>     -kernel ./tests/tcg/aarch64-softmmu/memory-sve \
>     -plugin ./contrib/plugins/libexeclog.so,ifilter=st1w,afilter=0x40001808 -d plugin
> 
> gives (disas doesn't currently understand st1w):
> 
>    0, 0x40001808, 0xe54342a0, ".byte 0xa0, 0x42, 0x43, 0xe5", store, 0x40213010, RAM, store, 0x40213014, RAM, store, 0x40213018, RAM
> 
> And for user-mode:
> 
>    ./qemu-aarch64 \
>      -plugin contrib/plugins/libexeclog.so,afilter=0x4007c0 \
>      -d plugin \
>      ./tests/tcg/aarch64-linux-user/sha512-sve
> 
> gives:
> 
>    1..10
>    ok 1 - do_test(&tests[i])
>    0, 0x4007c0, 0xa4004b80, ".byte 0x80, 0x4b, 0x00, 0xa4", load, 0x5500800370, load, 0x5500800371, load, 0x5500800372, load, 0x5500800373, load, 0x5500800374, load, 0x5500800375, load, 0x5500800376, load, 0x5500800377, load, 0x5500800378, load, 0x5500800379, load, 0x550080037a, load, 0x550080037b, load, 0x550080037c, load, 0x550080037d, load, 0x550080037e, load, 0x550080037f, load, 0x5500800380, load, 0x5500800381, load, 0x5500800382, load, 0x5500800383, load, 0x5500800384, load, 0x5500800385, load, 0x5500800386, lo
>    ad, 0x5500800387, load, 0x5500800388, load, 0x5500800389, load, 0x550080038a, load, 0x550080038b, load, 0x550080038c, load, 0x550080038d, load, 0x550080038e, load, 0x550080038f, load, 0x5500800390, load, 0x5500800391, load, 0x5500800392, load, 0x5500800393, load, 0x5500800394, load, 0x5500800395, load, 0x5500800396, load, 0x5500800397, load, 0x5500800398, load, 0x5500800399, load, 0x550080039a, load, 0x550080039b, load, 0x550080039c, load, 0x550080039d, load, 0x550080039e, load, 0x550080039f, load, 0x55008003a0, load, 0x55008003a1, load, 0x55008003a2, load, 0x55008003a3, load, 0x55008003a4, load, 0x55008003a5, load, 0x55008003a6, load, 0x55008003a7, load, 0x55008003a8, load, 0x55008003a9, load, 0x55008003aa, load, 0x55008003ab, load, 0x55008003ac, load, 0x55008003ad, load, 0x55008003ae, load, 0x55008003af
> 
> (4007c0 is the ld1b in the sha512-sve)
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Robert Henry <robhenry@microsoft.com>
> Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>   include/exec/cpu-all.h            |  2 +-
>   include/hw/core/cpu.h             | 17 +++++++++++++++++
>   accel/tcg/cputlb.c                |  6 +++++-
>   accel/tcg/user-exec.c             |  6 +++++-
>   target/arm/tcg/sve_helper.c       |  4 ----
>   tests/tcg/aarch64/Makefile.target |  8 ++++++++
>   6 files changed, 36 insertions(+), 7 deletions(-)

Looks good, mostly.

> @@ -1530,6 +1530,7 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
>       target_ulong tlb_addr, page_addr;
>       size_t elt_ofs;
>       int flags;
> +    bool not_fetch = true;
>   
>       switch (access_type) {
>       case MMU_DATA_LOAD:
> @@ -1540,6 +1541,7 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
>           break;
>       case MMU_INST_FETCH:
>           elt_ofs = offsetof(CPUTLBEntry, addr_code);
> +        not_fetch = false;
>           break;
>       default:
>           g_assert_not_reached();
> @@ -1578,7 +1580,9 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
>       *pfull = &env_tlb(env)->d[mmu_idx].fulltlb[index];
>   
>       /* Fold all "mmio-like" bits into TLB_MMIO.  This is not RAM.  */
> -    if (unlikely(flags & ~(TLB_WATCHPOINT | TLB_NOTDIRTY))) {
> +    if (unlikely(flags & ~(TLB_WATCHPOINT | TLB_NOTDIRTY))
> +        ||
> +        (not_fetch && cpu_plugin_mem_cbs_enabled(env_cpu(env)))) {

Rather than introduce a new variable, just test access_type != MMU_INST_FETCH.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

