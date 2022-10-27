Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8A160F457
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:03:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onzgm-0000R4-30; Thu, 27 Oct 2022 06:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1onzgb-0000OT-6d
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:00:29 -0400
Received: from mout.gmx.net ([212.227.15.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1onzgY-0003tN-TT
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1666864824; bh=0RCCiTJc/RNkV9K4ZOw6MIyqaqOzzihDO31oOWQ34s8=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=FdVZLmgI4opgNSL1uo4c59+kWQ4D8V+78g7UuZ3u1HSqI5HK7MaOjFoU7w+UkVdS2
 iJPJNkkkUHdYOKTdmiNKtDTCW0hj19Rga78slf6FY5ZZ2Hq//wXrhVJxZdQd3ofBLk
 HRM/NoHDG0Y/HqMavLLb/7W5JL8QL07xNKZazXPVjmVj/+5k6lM71zTev163pvZNS/
 UMcGFUM2GSlyGGLPnsnDl+9NeKKuODSrH35zvUR15PyKIHHtwGjjbm6awBuyc9Y+Rd
 nUhc/yoTuZWkKKVBe8IniEZAoS0kEx3QGUo13aeXkkpmCqO7B/MzQsyVT8mgqPDrgh
 kM2R+9VaUIo1w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.164.228]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSKyI-1ocy8W0mVc-00ShQq; Thu, 27
 Oct 2022 12:00:24 +0200
Message-ID: <c2aaa3e1-a5aa-1e7a-1d24-e0bccfaed2d3@gmx.de>
Date: Thu, 27 Oct 2022 12:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] target/hppa: Fix fid instruction emulation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <Y1ol0OCotNwb6ccV@p100>
 <c7d806c1-3f3b-f29b-0578-0b562ca9d3bf@linaro.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <c7d806c1-3f3b-f29b-0578-0b562ca9d3bf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:je241OyHlXPpNpf3KeR6DD00dgiBOhAJnYIH2y0SC2189A50n1Q
 68HSvRcwTdU1dJiO1zuSstU2cav4zKRcajb/ymBFq2QM0ZAffzR87wXbhtO6LhTL5/NrZZ1
 zE6hgwf+l/pzToz8+5gOUXb8uOy8j4MoiPf7OuT+LjNXQINI5iD52Qv68c3Foq/jgxt/TM4
 KL5SFfHn93jeaX3tl7oWg==
UI-OutboundReport: notjunk:1;M01:P0:YYe2ViSnOec=;WBBbHz5/z60XLk7tl+9EI2yK5XP
 qqvdW3sIBy9meIPtW1iziz9w41/sF3qDNB6zljeNtI2VRx4O9/0bWRvWQH1kjNsUYJBfJBMqK
 Z+6HNktGC197Kf1Dck8hfcrmVgOG+VgBw1S74F5tBTS6LKitlJrUExnpR/FbPpriltQUfilZF
 k3adCKkCVF03fsC6wK84h3b7aE9Jq8z4G1/Xhu++9q9AvjYdN7eHDo1pL7mollnxPzx86HgVL
 gEvFFaeRNNrWOHhwSxUvmyzoMcaNTHRAel4rZgP+8iQW0A0zUflV4fmGsP5V2aBrZ10p93tkV
 8rHw9RAiDAEVmlwcwOpYQzSM8PZd3nQtfEeulxFKYle33QiLAfMItEjqhwA16EgnFXmnf6RSb
 OiD6jH7V1LmbkF3jkSYZChE9bwpTTZzwSn75yvSZmuooKA8aDimq2ltnTARsLqpnTSkSooYIU
 1TJoO80ucPUSIAKsUXfU7Owh5pvqeVgl0Gbmv4o4C3tqtIcsFQqGBsoYXKmdl6ry2SKVvXZM7
 nD9wIg7zfYEfKzfuubpMrIfLx06IeMTLY5x7GiNZvWq67U1UrM7S8zOPD6SPu1DfXt54JqOEf
 VpfZVK45CMV06OBTk9RU8HTS6YsnoQCWuaNjCtR5uI7V0DTede1tKHHMQSyDfS86+0vRbOWZE
 R0fG3sc0EZ34YwH7Hyg+MKwK1tXj+tnwfHwWyq2FrZ1KlvI7dL8DRvRGbTSMCQyZEai9c0WHn
 zgQ/jn/birMdtTTL/LGWIjhQFlFb/UMS4EWM9hc2PKycUuA4K8s8YKvFbnY5dHI04rs6AZEbW
 gpOod5g8V9clBRtGh8IEoSMcIooDp7WiixkAhHITHvhdg5DNMdP/6pxqxrt1s2mJdZ3Dl0dZt
 4QdIc4ppYInmhrwzeXkMtbIii87rMA4uvpZfPWcU0jBSSuRLnCOOEezOm5JysXQ/5hBn4gabW
 S/ZskjlR4ywqmwXLNJoWlarOadA=
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/27/22 11:48, Richard Henderson wrote:
> On 10/27/22 16:31, Helge Deller wrote:
>> The fid instruction (Floating-Point Identify) puts the FPU model and
>> revision into the Status Register. Since those values shouldn't be 0,
>> store values there which a PCX-L2 (for 32-bit) or a PCX-W2 (for 64-bit)
>> would return.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/target/hppa/insns.decode b/target/hppa/insns.decode
>> index c7a7e997f9..3ba5f9885a 100644
>> --- a/target/hppa/insns.decode
>> +++ b/target/hppa/insns.decode
>> @@ -388,10 +388,8 @@ fmpyfadd_d=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 101110 rm=
1:5 rm2:5 ... 0 1 ..0 0 0 neg:1 t:5=C2=A0=C2=A0=C2=A0 ra3=3D%rc32
>>
>> =C2=A0 # Floating point class 0
>>
>> -# FID.=C2=A0 With r =3D t =3D 0, which via fcpy puts 0 into fr0.
>> -# This is machine/revision =3D 0, which is reserved for simulator.
>
> Is there something in particular for which this is failing?
> Per the manual, 0 means simulator, which we are.

I can't say yet if it's really failing.
I noticed it while trying to get MPE/iX installed in a hppa guest.
In some doc (sorry don't know which one right now) I saw that 0/0
values were illegal values, which is why I changed the values to
become those of a PA7300LC CPU from a  B160L machine (which
we currently emulate with the hppa SeaBIOS).

> So far we haven't identified as a particular cpu, have we?

Not really, but as just mentioned the SeaBIOS reports back a B160L.
If we support more machines this needs to be adjusted.

>> +static bool trans_fid_f(DisasContext *ctx, arg_fid_f *a)
>> +{
>> +=C2=A0=C2=A0=C2=A0 nullify_over(ctx);
>> +#if TARGET_REGISTER_BITS =3D=3D 64
>> +=C2=A0=C2=A0=C2=A0 save_frd(0, tcg_const_i64(0x13080000000000)); /* PA=
8700 (PCX-W2) */
>> +#else
>> +=C2=A0=C2=A0=C2=A0 save_frd(0, tcg_const_i64(0x0f080000000000)); /* PA=
7300LC (PCX-L2) */
>> +#endif
>> +=C2=A0=C2=A0=C2=A0 return nullify_end(ctx);
>> +}
>
> Missing ULL suffix.

Will fix.

Helge

