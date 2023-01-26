Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C6767D1E3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 17:40:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL5HN-00070T-6x; Thu, 26 Jan 2023 11:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL5HE-0006zM-JW; Thu, 26 Jan 2023 11:39:06 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL5HC-00062L-8D; Thu, 26 Jan 2023 11:39:03 -0500
Received: by mail-ej1-x635.google.com with SMTP id ss4so6539671ejb.11;
 Thu, 26 Jan 2023 08:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/M+AwHoOb6Q/cbcuqucdNLzy+SDrxKDNkvEggvENf8M=;
 b=QRUfcYE5S6lFRpdpsXIChdtMUZ4A2bg/horWHc1TCO+EPHqSgKSlLSG2XlvTPVKyCw
 mO8viffwY72Vx9JDEig9t+AtalqdkKgQsSa+cztfN97kGhOECI4vglu0hRT5MXeUBu6g
 +b0+xwc4eUvo3ldC7QHQq0+Fv/IT7wqQizaGD4/flppfrmpeU1RzAi6innf7d7dqhkK6
 oQI7D+++O15C6/BOcQYZqAvwmiT0pCR17Am0bVoyiC78oiQQdVG/DAZ2yNN95bq1C9Mn
 Wai+EPUh4d8d8FLLg71N/ECLrRiSxmW9H59OA4GkubMn7jyaOBniWwweMu0iwUxkCC9b
 xv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/M+AwHoOb6Q/cbcuqucdNLzy+SDrxKDNkvEggvENf8M=;
 b=o3rFefrvLsql9CkE9ceSBqUYSebWEsgQOP0dfdch/NGpSCN18+wjIFF7mdrkmIt2sW
 sgGJshM1LH9VPUlgtv1Uz0c5mFQ//d35RW111ySjp1xvNuEkPpQAiGIgRIjoEHauRnUm
 mxyKUBbAmIbKLsW0IkcTvfOCPffy2/llor4La9PyLhfXdDurorcqHrTPaNR9/e4rPvaW
 JncJm0nPIjHr8KauepKv/fTKTrlu+jPv36ypJ5/d14P9MRgV42g1QOjgTfdXEEZHUxNp
 30bJuQIHe8tMJzgXBZPnXxXOK4f+hvMOviWz7N+LR+d50kV1CJJQjGvNHBudef1WeZGk
 ONdQ==
X-Gm-Message-State: AFqh2kqUfXiyLzmHDp5BgVGh9LBL4b4G7fZ3fFWlu2BZAPphkWhqbvoT
 tW67tO8rr8J7wsunyFGbEDg=
X-Google-Smtp-Source: AMrXdXvSLTcBzgozYyovCI9AByUcSwLQ51lcdAI3jw+v1E27RnwUgxBMNPOSrliR7b27G01SdrnLJQ==
X-Received: by 2002:a17:907:c30c:b0:86e:a013:c269 with SMTP id
 tl12-20020a170907c30c00b0086ea013c269mr44558289ejc.9.1674751139976; 
 Thu, 26 Jan 2023 08:38:59 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb2004c1ba1824932b7f6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:4c1b:a182:4932:b7f6])
 by smtp.gmail.com with ESMTPSA id
 bq21-20020a056402215500b0046c7c3755a7sm977500edb.17.2023.01.26.08.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 08:38:59 -0800 (PST)
Date: Thu, 26 Jan 2023 16:38:54 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH 1/4] hw/ppc: Set machine->fdt in e500 machines
In-Reply-To: <4c36b71c-15c4-1a84-a14d-c675bb7bd313@gmail.com>
References: <20230125130024.158721-1-shentey@gmail.com>
 <20230125130024.158721-2-shentey@gmail.com>
 <4c36b71c-15c4-1a84-a14d-c675bb7bd313@gmail.com>
Message-ID: <A41F1D92-0A76-4DC7-8881-359632850441@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 26=2E Januar 2023 15:58:18 UTC schrieb Daniel Henrique Barboza <danielh=
b413@gmail=2Ecom>:
>
>
>On 1/25/23 10:00, Bernhard Beschow wrote:
>> This enables support for the 'dumpdtb' QMP/HMP command for all
>> e500 machines=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/ppc/e500=2Ec | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/hw/ppc/e500=2Ec b/hw/ppc/e500=2Ec
>> index 9fa1f8e6cf=2E=2E7239993acc 100644
>> --- a/hw/ppc/e500=2Ec
>> +++ b/hw/ppc/e500=2Ec
>> @@ -659,9 +659,14 @@ done:
>>       if (!dry_run) {
>>           qemu_fdt_dumpdtb(fdt, fdt_size);
>>           cpu_physical_memory_write(addr, fdt, fdt_size);
>> +
>> +        /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
>> +        g_free(machine->fdt);
>> +        machine->fdt =3D fdt;
>> +    } else {
>> +        g_free(fdt);
>>       }
>>       ret =3D fdt_size;
>> -    g_free(fdt);
>>  =20
>
>I tried to do this change last year when introducing 'dumpdtb' and Phil h=
ad some
>comments in how the FDT was being handled by the e500 board:
>
>https://lists=2Egnu=2Eorg/archive/html/qemu-devel/2022-09/msg03256=2Ehtml
>
>
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>+
>+    /*
>+     * Update the machine->fdt pointer to enable support for the
>+     * 'dumpdtb' QMP/HMP command=2E
>+     *
>+     * The FDT is re-created during reset,
>
>Why are we doing that? Is it really necessary? This seems to be only requ=
ired at cold power-on=2E

The e500 boards have user-creatable eTSEC nics which are registered with t=
he machine via the platform bus mechanism=2E IIUC this mechanism causes the=
se nics to show up only after reset=2E The nics need to show up in the devi=
ce tree, so the reset trigger was apparently chosen to create the fdt=2E

N=2EB=2E: The size of the fdt needs to be known during machine_init to che=
ck whether it fits into guest ram=2E That's what the dry_run parameter is f=
or=2E

Does that explanation help?

Best regards,
Bernhard

>
>+ so free machine->fdt
>+     * to avoid leaking the old FDT=2E
>+     */
>+    g_free(machine->fdt);
>+    machine->fdt =3D fdt;
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>I ended up not going after Phil's concern=2E I don't think it's required =
to accept
>this change, but it would simplify it a bit if the FDT isn't required to =
be
>re-generated on boot=2E
>
>
>I'm CCing Phil in case he wants to comment on it as well=2E
>
>
>
>
>Daniel
>
>
>>   out:
>>       g_free(pci_map);

