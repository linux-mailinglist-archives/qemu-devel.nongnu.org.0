Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B5F4A624A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 18:23:40 +0100 (CET)
Received: from localhost ([::1]:50060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEwsV-0003R4-0u
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 12:23:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEv7i-0002Tl-H8
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:31:15 -0500
Received: from [2a00:1450:4864:20::42d] (port=37676
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEv7g-0005nu-Cd
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:31:13 -0500
Received: by mail-wr1-x42d.google.com with SMTP id w11so32726839wra.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 07:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PLrowYvIwdakJXc4kkMY79btDwACPKZmwbjCKOosYJA=;
 b=xh+o987coLsTupcVTXzHjsvzlAZXsAd6Sdj3W4nG1sYAB1szC0LyCfRytpp7TWot1q
 mQAROKxhowbUp9kW8tPbpwufeearL0fGHopRip/ldXYQ7iIN2OnyuDMK9VX/pqYfp+D/
 jh72PpnLqQ07Inq9Te4dTXqmVzwnr/XuCcv3+bdZSHkskIlyGpe0DsCNeLy8f+WP3lvf
 bLKIBWSgNzg62wkI4SlBSqjSm4RICh6Mydz2h+Ecfy5jxDLNIEVpeLJ3+ex6uNSC/VKk
 EN467uz+yMDgGIR2qAir4LShtA2G5D9JeWQWj0R6xkVun2sTy/0Or1cHQ622QRQaR3nl
 avlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PLrowYvIwdakJXc4kkMY79btDwACPKZmwbjCKOosYJA=;
 b=DwsMM0sQvm0H3tNRKGkj9sQJp3C0jXsSzGFxhStYE4FjNLW6a9OSXezahJmPtXPSwl
 h/HdGt0yNhHq8sR98AkGeUB1M6QV+MdM1kWoZCLBbqA22YPJz+WF2gaW6Okfepbcjvcd
 vUaIL2oJ7BJmcQ+Hd/FTeF3Da3hFogJ7OoHl/Q+d6jmekPDQ23FrVa0Ngc+vupgngnnL
 5/UQI+y64OmFbSqajfNLyvMF/lZneizgX+ToGv0T1s9Ju14c5krDsDQW3NhEtM34Td7R
 Drej4wAloXt5Wcfrjo4xfPq0BPDXWDLhJnMxb0vAnCui/FOah0T7HvVoAW8s3D9MGQbD
 KH0A==
X-Gm-Message-State: AOAM532SkY9tznpjuH0OMzogikyoY+NINrhMsm2s9IofjowwkFL9Fsa+
 H8MKY7e4Xb1Dl/W/DXIzFwyrfA==
X-Google-Smtp-Source: ABdhPJw69FAKOoIOR2vpjpDVsj3iGxsH1XIXNVgYMbV++dUNaQeafv08gEFtT9eytKni+ZV40kAobA==
X-Received: by 2002:a05:6000:1846:: with SMTP id
 c6mr21981716wri.683.1643729470920; 
 Tue, 01 Feb 2022 07:31:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r2sm4949187wmq.0.2022.02.01.07.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 07:31:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 701421FFB7;
 Tue,  1 Feb 2022 15:31:09 +0000 (GMT)
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-13-alex.bennee@linaro.org>
 <YflK+fSCdRCzmNrS@strawberry.localdomain>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH  v1 12/22] plugins: stxp test case from Aaron (!upstream)
Date: Tue, 01 Feb 2022 15:29:05 +0000
In-reply-to: <YflK+fSCdRCzmNrS@strawberry.localdomain>
Message-ID: <87o83qy56q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, Luke.Craig@ll.mit.edu, Alexandre Iooss <erdnaxe@crans.org>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com, "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Jan 24 20:15, Alex Benn=C3=A9e wrote:
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
>> Message-ID: <YXCA62xdRDeueQR6@strawberry.localdomain>
>>=20
>> ---
>> [AJB] this was for testing, I think you can show the same stuff with
>> the much more complete execlog now.
>
> Is it true that execlog can also reproduce the duplicate loads which are
> still an outstanding issue?

Are we still seeing duplicate loads? I thought that had been fixed.

>
> -Aaron
>
>> ---
>>  contrib/plugins/stxp-plugin.c     | 50 +++++++++++++++++++++++++++++++
>>  tests/tcg/aarch64/stxp.c          | 28 +++++++++++++++++
>>  contrib/plugins/Makefile          |  1 +
>>  tests/tcg/aarch64/Makefile.target |  3 ++
>>  4 files changed, 82 insertions(+)
>>  create mode 100644 contrib/plugins/stxp-plugin.c
>>  create mode 100644 tests/tcg/aarch64/stxp.c
>>=20
>> diff --git a/contrib/plugins/stxp-plugin.c b/contrib/plugins/stxp-plugin=
.c
>> new file mode 100644
>> index 0000000000..432cf8c1ed
>> --- /dev/null
>> +++ b/contrib/plugins/stxp-plugin.c
>> @@ -0,0 +1,50 @@
>> +#include <stdio.h>
>> +#include <stdarg.h>
>> +#include <qemu-plugin.h>
>> +
>> +QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
>> +
>> +void qemu_logf(const char *str, ...)
>> +{
>> +    char message[1024];
>> +    va_list args;
>> +    va_start(args, str);
>> +    vsnprintf(message, 1023, str, args);
>> +
>> +    qemu_plugin_outs(message);
>> +
>> +    va_end(args);
>> +}
>> +
>> +void before_insn_cb(unsigned int cpu_index, void *udata)
>> +{
>> +    uint64_t pc =3D (uint64_t)udata;
>> +    qemu_logf("Executing PC: 0x%" PRIx64 "\n", pc);
>> +}
>> +
>> +static void mem_cb(unsigned int cpu_index, qemu_plugin_meminfo_t meminf=
o, uint64_t va, void *udata)
>> +{
>> +    uint64_t pc =3D (uint64_t)udata;
>> +    qemu_logf("PC 0x%" PRIx64 " accessed memory at 0x%" PRIx64 "\n", pc=
, va);
>> +}
>> +
>> +static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *t=
b)
>> +{
>> +    size_t n =3D qemu_plugin_tb_n_insns(tb);
>> +
>> +    for (size_t i =3D 0; i < n; i++) {
>> +        struct qemu_plugin_insn *insn =3D qemu_plugin_tb_get_insn(tb, i=
);
>> +        uint64_t pc =3D qemu_plugin_insn_vaddr(insn);
>> +
>> +        qemu_plugin_register_vcpu_insn_exec_cb(insn, before_insn_cb, QE=
MU_PLUGIN_CB_R_REGS, (void *)pc);
>> +        qemu_plugin_register_vcpu_mem_cb(insn, mem_cb, QEMU_PLUGIN_CB_N=
O_REGS, QEMU_PLUGIN_MEM_RW, (void*)pc);
>> +    }
>> +}
>> +
>> +QEMU_PLUGIN_EXPORT
>> +int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
>> +                        int argc, char **argv)
>> +{
>> +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
>> +    return 0;
>> +}
>> diff --git a/tests/tcg/aarch64/stxp.c b/tests/tcg/aarch64/stxp.c
>> new file mode 100644
>> index 0000000000..fb8ef6a46d
>> --- /dev/null
>> +++ b/tests/tcg/aarch64/stxp.c
>> @@ -0,0 +1,28 @@
>> +
>> +
>> +void stxp_issue_demo(void *arr)
>> +{
>> +    asm(".align 8\n\t"
>> +        "    mov x0, %[in]\n\t"
>> +        "    mov x18, 0x1000\n\t"
>> +        "    mov x2, 0x0\n\t"
>> +        "    mov x3, 0x0\n\t"
>> +        "loop:\n\t"
>> +        "    prfm  pstl1strm, [x0]\n\t"
>> +        "    ldxp  x16, x17, [x0]\n\t"
>> +        "    stxp  w16, x2, x3, [x0]\n\t"
>> +        "\n\t"
>> +        "    subs x18, x18, 1\n\t"
>> +        "    beq done\n\t"
>> +        "    b loop\n\t"
>> +        "done:\n\t"
>> +        : /* none out */
>> +        : [in] "r" (arr) /* in */
>> +        : "x0", "x2", "x3", "x16", "x17", "x18"); /* clobbers */
>> +}
>> +
>> +int main()
>> +{
>> +    char arr[16];
>> +    stxp_issue_demo(&arr);
>> +}
>> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
>> index 54ac5ccd9f..576ed5875a 100644
>> --- a/contrib/plugins/Makefile
>> +++ b/contrib/plugins/Makefile
>> @@ -20,6 +20,7 @@ NAMES +=3D howvec
>>  NAMES +=3D lockstep
>>  NAMES +=3D hwprofile
>>  NAMES +=3D cache
>> +NAMES +=3D stxp-plugin
>>=20=20
>>  SONAMES :=3D $(addsuffix .so,$(addprefix lib,$(NAMES)))
>>=20=20
>> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makef=
ile.target
>> index 1d967901bd..54b2e90d00 100644
>> --- a/tests/tcg/aarch64/Makefile.target
>> +++ b/tests/tcg/aarch64/Makefile.target
>> @@ -72,4 +72,7 @@ endif
>>=20=20
>>  endif
>>=20=20
>> +# Load/Store exclusive test
>> +AARCH64_TESTS +=3D stxp
>> +
>>  TESTS +=3D $(AARCH64_TESTS)
>> --=20
>> 2.30.2
>>=20


--=20
Alex Benn=C3=A9e

