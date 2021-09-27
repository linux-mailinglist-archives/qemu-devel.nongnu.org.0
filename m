Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371CE419F6E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 21:49:50 +0200 (CEST)
Received: from localhost ([::1]:59696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUwdJ-0005Zr-8I
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 15:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <n54@gmx.com>) id 1mUwPE-0007nH-9y
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:35:16 -0400
Received: from mout.gmx.net ([212.227.15.18]:57117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <n54@gmx.com>) id 1mUwPC-0004wW-85
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632771302;
 bh=JcW+erZawbM56MKk7ybbEmNYwDSkCxRe7acLe6Y2rRE=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=Y6VOcvBDqNXJdL4bpgCADg2K3iKPPSzmans5J6GxjB159StDbFa3eQyobpPZatq7s
 V8fufbX7F+AooCVyKECNUVWauVXulHDzxDYPsELs1IMAxl7UuFijv0VcO7sCGvpoqS
 zJYN4raSCPKLRbCWssBz+71uXeGShRvodTQmqpMc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.5] ([89.76.119.14]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N2mFi-1myrkI0Fe0-0135k6; Mon, 27
 Sep 2021 21:35:02 +0200
Subject: Re: [PATCH v6 12/40] accel/nvmm: Implement AccelOpsClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210924093847.1014331-1-f4bug@amsat.org>
 <20210924093847.1014331-13-f4bug@amsat.org>
From: Kamil Rytarowski <n54@gmx.com>
Message-ID: <dde3cf11-fe52-ea94-a1f8-01fd8a54c9f7@gmx.com>
Date: Mon, 27 Sep 2021 21:34:25 +0200
User-Agent: Mozilla/5.0 (X11; NetBSD amd64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210924093847.1014331-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GvRIn93Hf3gC77+iIQRLwscE6MBs112Z4g0UD5cvIVPX2w37LFk
 yzAss3hhFj2p839HbX3dWKeMtzULoYzGoVbtSZsXns8yvjWpEbDBxCBR7h9YLqepWEOyceW
 Ldhaem/pe75QyuldBtoc5DKWVLBSSvzwb98MXFtkTvsCkXH3vYemUz++g6CFG748i5OuTG9
 jr1pSEBLALl2tNEjzZ6og==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LZX8Ey12IYA=:+K2MxO7+4T8QO44hKAnPZl
 PxwQPFqvaA7FWfSSoscV9q/crQwYKpTNBCsBu7fApqw+jc/nF13R3n/ELHy5sk5w5v/GiGWR+
 BjJCARA/lm3U3KZo+K9npY8Nmz1PpJr+jTenqYL7M70Kl+TQ/k89QOT13xHbMbNgr4jtOI+Xd
 7Wpyss9wC0P9RbJDcJdbwShKK0BweWrqmVRFQ2xoGd0c5JNp1BfoX7AdH+7O7w9DmHOpOQZ0L
 BIH8PMYYG1bF1lhPu2prFEy5hjSmI3CeYtv3ZKr5vwQxkMDiqMYUQYIFI1TCyJmzJm7dye3je
 I7jkovNVBkRE6iK1N4tfbSahRu6vtLJljkPZyDOIRR27RTwkApgKxkFTOmNlCGkkIwZRaXBls
 jzDz4zfnl7i7AQxbj9Klmz5G35KiTByZHbliP+X+eMStO2qXmmFXvLjqVVp1QNvenmKaCLxfE
 vPkW0ulTE61XD7+3nNP3iivsNojZiWydwDUdHcZSHQ0Qn81laVx5zdH6CA9aCCGFCjV8dsE9f
 jbo9YlkL8fxpN1cBPoE863PcfZc+xi/X0Gm/KidoUpBMAJt3aZlPSsTBPqxuB/jAOSFE6u0G8
 o8BuA3XiOlnu7CqXNsMBOmbfV2dJxrRLc7BPxXromPbZ4FYEpVzziqZLU9lJa2YTzu3pPA5MQ
 YiYyfIv/XcBFniEtPvIYxVWFgPA5vSL0EXZRdPyJM3yVr9MgYJshq4aGgIKtwH3otgAUbFf1C
 +mHHVcXRZKcSrSCt/V7e81HuR9udkkr102Web5sKwgTsUwxfDXAVACSn6LS/cSWd6dUlFgneo
 RnLgvh8xkA5drPwsUNoxnIo+VVv/Otm3u/3xfHfDQ3CjwmAcL9yal7JhXWv+wAGHmoCsbUXP4
 8bvoBYCARDcA0OtkxmEylx6C0UjEMk+Dn4u0kdOleelmyTxyZch4YE4Cl7qZcHVLDeReEZ0JL
 Wk3N/JZy9EbCwIpA9owy8wvWzWW4rSqavhShMG15AUrTl56h8jeLVq4TfpmvQ3dU0Rm8UOr75
 YpyrzsxouHQXnQq7x0HRSKzoPh7ziaE1629lLM/eE1e5RCiE9KJziW6elimF+Yd/Qw==
Received-SPF: pass client-ip=212.227.15.18; envelope-from=n54@gmx.com;
 helo=mout.gmx.net
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Reinoud Zandijk <reinoud@netbsd.org>, Kamil Rytarowski <kamil@netbsd.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.09.2021 11:38, Philippe Mathieu-Daud=C3=A9 wrote:
> Since there is no specific NVMM handling for cpu_has_work() in
> cpu_thread_is_idle(), implement NVMM has_work() handler as a
> simple 'return false' code.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Kamil Rytarowski <n54@gmx.com>
> ---
>  target/i386/nvmm/nvmm-accel-ops.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-a=
ccel-ops.c
> index f788f75289f..36296f79ff8 100644
> --- a/target/i386/nvmm/nvmm-accel-ops.c
> +++ b/target/i386/nvmm/nvmm-accel-ops.c
> @@ -83,6 +83,11 @@ static void nvmm_kick_vcpu_thread(CPUState *cpu)
>      cpus_kick_thread(cpu);
>  }
>
> +static bool nvmm_cpu_has_work(CPUState *cpu)
> +{
> +    return false;
> +}
> +
>  static void nvmm_accel_ops_class_init(ObjectClass *oc, void *data)
>  {
>      AccelOpsClass *ops =3D ACCEL_OPS_CLASS(oc);
> @@ -94,6 +99,7 @@ static void nvmm_accel_ops_class_init(ObjectClass *oc,=
 void *data)
>      ops->synchronize_post_init =3D nvmm_cpu_synchronize_post_init;
>      ops->synchronize_state =3D nvmm_cpu_synchronize_state;
>      ops->synchronize_pre_loadvm =3D nvmm_cpu_synchronize_pre_loadvm;
> +    ops->has_work =3D nvmm_cpu_has_work;
>  }
>
>  static const TypeInfo nvmm_accel_ops_type =3D {
>


