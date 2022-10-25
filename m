Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD9160C12F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 03:41:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on8v8-00062c-3z; Mon, 24 Oct 2022 21:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1on8v6-00061M-SW
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 21:39:56 -0400
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1on8uy-0006Df-2u
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 21:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1666661985;
 bh=StS7/5rAXiO+1rQ9goRaovLrIJ3hKDmkHJ09/4KJuZE=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=NR3+II0IfEl2lrjyuyx4ZAUJj4U4VmwR907vA1UlDiMQGMigzYf6bAobzHtzl7fOO
 gUEN9bxU9tvm/rBqCgXCwQRE0WHtp/MZmNmt+xONzb61Km+AbBFfmQCnb+P0nPgfaq
 0ialkTWncKIgNIizc2FmUgtiebifHGnAuWlJmIRo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.136.30]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH5Q-1pNZ8P1NXw-00cfgm; Tue, 25
 Oct 2022 03:39:45 +0200
Message-ID: <436afa3a-bb4b-3807-4c01-25d3ddb195a1@gmx.de>
Date: Tue, 25 Oct 2022 03:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4] linux-user: Add close_range() syscall
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <Y1b45IL371MJP2WW@p100>
 <6412545a-5b43-421f-d94a-cf3111725047@linaro.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <6412545a-5b43-421f-d94a-cf3111725047@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/DxSVQ3JwSixVn2H/SJwTQkYa7J+V9GVr9/PhTeoMOhaSHBuPvU
 pp5F+/tpkEp7zIf9J8ZIDNBsNmMzMwZDQLYWNwANpD8jqZS64PCVQZNQiTVYoWPLQgDjRcp
 WeOfNPtEXVH2SGjrSAEkJiXgq7Zt7q2SywMbpyMaHq1xgRTNwUb8qoauDiGVuLJXUfC3Q+T
 quhqc+0nEiNJMlSJGhGoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hXq69NOJlMU=:C/Hp48gCDK0wby9D5qvb9s
 ub6DTmPKn3WTzcwT64Meea+/JLclTuA52nXO8F0PIsK+MSx7u0RXqXBdtQ7rcAXHi9hE0T9zJ
 FtU9vG5BS+39WetqM59iO0o6ymNdi1oXzcSF4XMBo2dUZIiBlwnzCMv5U/imYKAr5fDLc1q+Y
 2ZIKYb2bikSWw+6/P+SHDRpiXeqZhR2giwf82AxlmMi3UU0pEKPmqQ1XALzlB0z9HlmkQ8ajd
 zF5YP5m5rd4wwihdrm2X3mRDrW47kH3bop9gVhvHPbxwyuu/6fK9y5ywwVzrheW+jRqT6r/mi
 MiW54B50v8elSXBEVbmHEUsm3wSc+r/MTsnVSp70agNK5W/6pgEGsCxr4Yr+I4clr2HmH8ixV
 5OMoHT6SSpj0l6RKV3iBcWucL0RpgBeQlF4D3MKz7lTrFqfR0CoF+ksmKecnSO0GZmwUx6FJ5
 hy7vValwRw+znTLw0t/apcfn0Lhl93OxpGruMVwaBz+3V5gzPuRkpZ3Jeznf2cJzVWDXG3lsG
 g0CQyaaIykdY+juyqdvjtBj4n8RSqD1GBWWJADZ54oqAN/+AEI4MCAvKNGGKiVj5nGyK004E8
 u9SYIUwGcl+0OujQchRR94+gKBI4YaL1e79B7XPZllsC0xOk9WvMNnssGyOmC+cKvwQjHsEEu
 ntaCwwIn6cWCJZxsL/LUGQFa6GmwatV04pXLyaqAGI5OBK9Y2fUe572NbXeih9C8HX/mThnew
 CbQ2BNEH3ivC1wF7TqunobOaRKP2I/QqAWEpKwS0AqQK2MoCPK0N0IhobT7OEsVB9K+kBWywH
 XjFEyOb+Umd34teLHG9JJSvL3Llkc5ZKMmmcwY3fVSJ5SC7Hk9JHJvCgUVdd3tNUDzS/bDdpj
 DHDCpEsQxqXF1F3oihna2/HdqJifbxs62rOYjNx0dfeOSEFnihc4nDPQoYlLv+BdRVBTcTLDD
 GrGUMPlmwEktopDUOy35kpC7J2nk5NDkJjb3SsVozP/fVDhdYDS1dMl938W/WF/2X7aU8MRlF
 N6K+Pq8qF5CK+QCkIRmn7zFxRecqe3nkHuFm1eaahX+eUNrNdZZJmWJ42m2ou9i0wqUpEyiAH
 0dTpKHZPLubhDjsmd988VQy1nYONa0xEEE6BlXRKj4e+Vxg0c2/ydfQrihfX8WbXAHQ/Kzfeg
 qHbr0YZr07kdWSr7pJpcadDAao4JooU8nv3//tp0KGDM8BeUoujqnSJup1RY3bfFTBrC+BPJy
 SyGBxRIJ8s+STQFUhGC/ux7SUeEk82Zjl2lVF6lwBbJrU4YODyui6rwe82iI5yivxWboElJhh
 V/UCr4I6ppu8x9iPOY4ybHQgaWpoxu6F8y4Uw5Az+2yZFs89m+WBhebJlepsARVM4uakWBKf4
 UZ2pe6KqXnZKO3a+gBT98m+mXbgf7oDMVXQ8mbzgr2Bnyd9ApMQ5XcV1+2FyLbVKAUC63ItH/
 33/6zvWqdwB7rLwZpuC3GupoMIcGEZ/cZYBedSTRlhweGxZrVA+doOHGYiygY8yDnfTrf3cOY
 H1DmUYt06zzjW+nyXIP4JZQkVROWFrOQwydGZBB+Y2pNb
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 00:39, Richard Henderson wrote:
> On 10/25/22 06:43, Helge Deller wrote:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi=
_long maxfd =3D arg2;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
((sizeof(abi_long) =3D=3D 4 && arg2 =3D=3D (abi_long)0x7FFFFFFFUL) ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (sizeof(abi_long) =3D=3D 8 && arg2 =3D=3D (abi_long)=
0x7FFFFFFFFFFFFFFFULL)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 maxfd =3D target_fd_max;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for=
 (fd =3D arg1; fd < maxfd; fd++) {
>
> Why do we need explicit checks for INT32/64_MAX?
> If the guest passes 0x7FFFFFFFFFFFFFFEULL,

A 32-bit guest (on a 64bit host) will pass 0x7FFFFFFFUL...

> do we really need to iterate over all of those impossible values?

The compiler will optimize one of those checks away, so it's effectively
just one expression.

> I should think some expression involving MIN() is in order.

Helge

