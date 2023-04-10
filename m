Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2056DC5DC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 12:47:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plp34-00045G-R5; Mon, 10 Apr 2023 06:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1plp32-00044p-1j
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 06:46:56 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1plp2z-0000c8-Bq
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 06:46:55 -0400
Received: by mail-wm1-x32b.google.com with SMTP id gw13so2588643wmb.3
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 03:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681123612; x=1683715612;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DLtSh0bmCVcVK0YxlfmVq6USEUEilIZomKaTZA1VpuU=;
 b=xVl/joewoJ2YG9vj68asoFoN8gxTBedEApc9urE8JSDltgfyLlrJ+U9fH7mkUeY2lj
 mSURhUsuB4RudQHmCp662EV5UIPVJ49T4XvVHwl2XCbIwrqTShmPEn8cYSir3dK/0+PJ
 xmUgFv0q6uyTmTJzZbjEzJtU7MKq464KNZndiWXMw2Nqc3eu9l8Ua8AMI4Z7kcKJbted
 VWzq5bFRSDWfY13EvZ9bcTjP9uRYrFa2U4Zj5BHgMyUQMxsf2n2B6l98BArpdgpTTloL
 pu0ggFK9h7JK2l4/GRPZVnI7udypGxOPhn5FLq1Ob6TfYbUHgAD8NFCOTdCgfgHFgZID
 xy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681123612; x=1683715612;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DLtSh0bmCVcVK0YxlfmVq6USEUEilIZomKaTZA1VpuU=;
 b=aRSqRM3XoVFu0GZ4vBQPklk0fnL4NGaaUFvAK7B7qlXEVI3Z1CScyIX4E/S6CHAFF8
 6j/2oXbXXElKna9scOQ3gPz6ZbuLDvocvAMxCpuuyPdCA1u/9HEDnAuU2esw7IUxePM2
 62KL4hJll8bvBaBsbhvr95kBjBNqlhBlvh32lDmjxZDPFZeQfKbSyvTJLirIWtv/CAvg
 RICapIOC/Fty6ew6X0dZsOoffZZABhsOc4fviNFXaFUxlzbQyHfQmrIlOALI3svS1DW6
 v9SmkuWwi1ClfNnqCFRwzMpl0Rru2i2QLieR49OfTwR0yLvXC4RiBSr4HfJcJreRT17m
 iTSg==
X-Gm-Message-State: AAQBX9eRrxKKw4XI4fOoARrUmhSu+c5vMN3jAnZQzOxZW09NMQLermOm
 FDrDtkXbgIb/7cEQe/x/+l9wwA==
X-Google-Smtp-Source: AKy350aLXf0Vlj7viXR9lYpNSmFKACwjv20TEXWlNXOojq9sQi0jKuUXWjmQAXC1Gxa4CmcuoKIUTg==
X-Received: by 2002:a1c:4c10:0:b0:3eb:29fe:f911 with SMTP id
 z16-20020a1c4c10000000b003eb29fef911mr4856562wmf.13.1681123611870; 
 Mon, 10 Apr 2023 03:46:51 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a05600c099800b003ee74c25f12sm17005037wmp.35.2023.04.10.03.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 03:46:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 474391FFB7;
 Mon, 10 Apr 2023 11:46:51 +0100 (BST)
References: <20230406022751.757980-1-fei2.wu@intel.com>
 <20230406022751.757980-2-fei2.wu@intel.com> <87v8i9jviv.fsf@linaro.org>
 <b69f70de-ccd8-b534-44f9-7df794f92d04@intel.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Wu, Fei" <fei2.wu@intel.com>
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, erdnaxe@crans.org,
 ma.mandourr@gmail.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] accel/tcg/plugin: export host insn size
Date: Mon, 10 Apr 2023 11:46:24 +0100
In-reply-to: <b69f70de-ccd8-b534-44f9-7df794f92d04@intel.com>
Message-ID: <87pm8cc8v8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


"Wu, Fei" <fei2.wu@intel.com> writes:

> On 4/6/2023 3:46 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Fei Wu <fei2.wu@intel.com> writes:
>>=20
>>> The translation ratio of host to guest instruction count is one of the
>>> key performance factor of binary translation. TCG doesn't collect host
>>> instruction count at present, it does collect host instruction size
>>> instead, although they are not the same thing as instruction size might
>>> not be fixed, instruction size is still a valid estimation.
>>=20
>> I'm not so sure about exposing this information to plugins because we
>> try to avoid leaking internal implementation details to plugins. Aside
>> from that the very act of instrumenting will increase the size of the
>> target buffer.
>>=20
>> If your aim is to examine JIT efficiency what is wrong with the current
>> "info jit" that you can access via the HMP? Also I'm wondering if its
>> time to remove the #ifdefs from CONFIG_PROFILER because I doubt the
>> extra data it collects is that expensive.
>>=20
> "info jit" collects the translation time expansion ratio, it doesn't
> distinguish between hot and cold blocks:
>     TB avg target size  14 max=3D1918 bytes
>     TB avg host size    287 bytes (expansion ratio: 19.7)
>
> My primary aim is to collect the runtime expansion ratio, so hot blocks
> weigh more than cold blocks. My concern is this series might not be the
> proper way to implement it, just as you mentioned in another reply.

See my reply to Richard but:

  Subject: [PATCH  v9 00/13] TCG code quality tracking and perf integration
  Date: Mon,  7 Oct 2019 16:28:26 +0100
  Message-Id: <20191007152839.30804-1-alex.bennee@linaro.org>

may be of interest?

>
> Thanks,
> Fei.
>
>> Richard, what do you think?
>>=20
>>>
>>> Signed-off-by: Fei Wu <fei2.wu@intel.com>
>>> ---
>>>  accel/tcg/plugin-gen.c       | 1 +
>>>  include/qemu/plugin.h        | 2 ++
>>>  include/qemu/qemu-plugin.h   | 8 ++++++++
>>>  plugins/api.c                | 5 +++++
>>>  plugins/qemu-plugins.symbols | 1 +
>>>  5 files changed, 17 insertions(+)
>>>
>>> diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
>>> index 5efb8db258..4a3ca8fa2f 100644
>>> --- a/accel/tcg/plugin-gen.c
>>> +++ b/accel/tcg/plugin-gen.c
>>> @@ -881,6 +881,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const Disas=
ContextBase *db,
>>>          ptb->haddr2 =3D NULL;
>>>          ptb->mem_only =3D mem_only;
>>>          ptb->mem_helper =3D false;
>>> +        ptb->host_insn_size =3D &db->tb->tc.size;
>>>=20=20
>>>          plugin_gen_empty_callback(PLUGIN_GEN_FROM_TB);
>>>      }
>>> diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
>>> index bc0781cab8..b38fd139e1 100644
>>> --- a/include/qemu/plugin.h
>>> +++ b/include/qemu/plugin.h
>>> @@ -151,6 +151,8 @@ struct qemu_plugin_tb {
>>>      /* if set, the TB calls helpers that might access guest memory */
>>>      bool mem_helper;
>>>=20=20
>>> +    uint64_t *host_insn_size;
>>> +
>>>      GArray *cbs[PLUGIN_N_CB_SUBTYPES];
>>>  };
>>>=20=20
>>> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>>> index 50a9957279..2397574a21 100644
>>> --- a/include/qemu/qemu-plugin.h
>>> +++ b/include/qemu/qemu-plugin.h
>>> @@ -336,6 +336,14 @@ void qemu_plugin_register_vcpu_insn_exec_inline(st=
ruct qemu_plugin_insn *insn,
>>>   */
>>>  size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb);
>>>=20=20
>>> +/**
>>> + * qemu_plugin_tb_n_insns() - query helper for host insns size in TB
>>> + * @tb: opaque handle to TB passed to callback
>>> + *
>>> + * Returns: address of host insns size of this block
>>=20
>> If we went ahead with this we need to be very clear when you can call
>> this helper because the data will only be valid at certain points (which
>> is another argument against this).
>>=20
>>> + */
>>> +void *qemu_plugin_tb_host_insn_size(const struct qemu_plugin_tb *tb);
>>> +
>>>  /**
>>>   * qemu_plugin_tb_vaddr() - query helper for vaddr of TB start
>>>   * @tb: opaque handle to TB passed to callback
>>> diff --git a/plugins/api.c b/plugins/api.c
>>> index 2078b16edb..0d70cb1f0f 100644
>>> --- a/plugins/api.c
>>> +++ b/plugins/api.c
>>> @@ -188,6 +188,11 @@ size_t qemu_plugin_tb_n_insns(const struct qemu_pl=
ugin_tb *tb)
>>>      return tb->n;
>>>  }
>>>=20=20
>>> +void *qemu_plugin_tb_host_insn_size(const struct qemu_plugin_tb *tb)
>>> +{
>>> +    return tb->host_insn_size;
>>> +}
>>> +
>>>  uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb)
>>>  {
>>>      return tb->vaddr;
>>> diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
>>> index 71f6c90549..3e92c3b8ba 100644
>>> --- a/plugins/qemu-plugins.symbols
>>> +++ b/plugins/qemu-plugins.symbols
>>> @@ -39,6 +39,7 @@
>>>    qemu_plugin_start_code;
>>>    qemu_plugin_tb_get_insn;
>>>    qemu_plugin_tb_n_insns;
>>> +  qemu_plugin_tb_host_insn_size;
>>>    qemu_plugin_tb_vaddr;
>>>    qemu_plugin_uninstall;
>>>    qemu_plugin_vcpu_for_each;
>>=20
>>=20


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

