Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF235E5947
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Oct 2019 10:47:05 +0200 (CEST)
Received: from localhost ([::1]:39212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOHiy-0006AZ-GT
	for lists+qemu-devel@lfdr.de; Sat, 26 Oct 2019 04:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52329)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iOHhb-0003po-0K
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 04:45:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iOHhY-0001Ae-ST
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 04:45:37 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27020
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iOHhY-0001AJ-GX
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 04:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572079535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C87K8gDnTe2PjKVO29Ay5pk9dJHtJSBWrg1tpzLTG1k=;
 b=RdAf8QxwxbkASEl//SiSOSYI1NioKmLR6GVCwF33qoWZJJo9h8Bv7w6cZX42oocdGPHcYe
 50zezAlapjR+ZeOrary07tSwauLC82DKkBh1vxqXUiSa/BIh07RtgCLz3M2JMsEfxYPcg6
 5wst1ZgMwwHts1inZX4NbgHXfHa4omU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-7-sAaFH8NTWiYfeH7aahIQ-1; Sat, 26 Oct 2019 04:45:33 -0400
Received: by mail-wr1-f71.google.com with SMTP id r8so2595595wrx.8
 for <qemu-devel@nongnu.org>; Sat, 26 Oct 2019 01:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QAf2B7KL4+Nxq2tBPi3AhG2VwmmMXDMiaLGnGrzUhJ8=;
 b=WJoI501RqlDuJk3wsalFENkVDyOnIk32L12tLedYxe82nxXKFmSgbB6w+2e4qlxIh+
 obNsk54NUUbAiYKAwDyrUvwDa2oJOW/BVvthdxZN/S5p2JLoraryz4eO/eerddQ3mz6o
 a2OTpjML5ykMOZpYKEGOPjg75A3G5kuwD1pAV1rK9wxWSuIxCYzKO4Hxt0WRkNjrtabe
 m32b7A/mCRWJqADtEIZI6tpS25rW5oeauQzj+7dEWxl+ILIpre/mxd6RoOOoUBsI40mo
 h5MNNoKiBVFuUkgM/Ob5OFEYpsmc+V6/yzD78Q9eSow+EPlHJWpgSJqEA4P1WWyrS/cN
 XzJg==
X-Gm-Message-State: APjAAAXcOdVUkNdTJPMYtkdkZOdvEDUdtNDR52l24flCLx7ZLCxFXn1i
 nq/wM24gxA0K/dzP4lcTnYibGfi+TAkcu49Iu7FVyqag5i+Pmv8iJP2UwO2vxVskP7cYe7rnbtT
 qeJLjCPGfxcXb1R0=
X-Received: by 2002:adf:da4a:: with SMTP id r10mr6849584wrl.356.1572079532019; 
 Sat, 26 Oct 2019 01:45:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwArXvW+j4LDlRMSsZtcJD0YXARPqjWZM/4u5jAGdjsX7eouyEMBnJVwA+0bO8drKi3xb9sBg==
X-Received: by 2002:adf:da4a:: with SMTP id r10mr6849558wrl.356.1572079531650; 
 Sat, 26 Oct 2019 01:45:31 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id l14sm5111964wrr.37.2019.10.26.01.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Oct 2019 01:45:31 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] opensbi: Upgrade from v0.4 to v0.5
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <a88742acd6969991d44f897f7232a847e9768f57.1572045246.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0178d892-dbb5-8970-08eb-416466b53002@redhat.com>
Date: Sat, 26 Oct 2019 10:45:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <a88742acd6969991d44f897f7232a847e9768f57.1572045246.git.alistair.francis@wdc.com>
Content-Language: en-US
X-MC-Unique: 7-sAaFH8NTWiYfeH7aahIQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: alistair23@gmail.com, palmer@sifive.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alistair,

On 10/26/19 1:15 AM, Alistair Francis wrote:
> This release has:
>      Lot of critical fixes
>      Hypervisor extension support
>      SBI v0.2 base extension support
>      Debug prints support
>      Handle traps when doing unpriv load/store
>      Allow compiling without FP support
>      Use git describe to generate boot-time banner
>      Andes AE350 platform support

Do you mind amending the output of 'git shortlog v0.4..v0.5'?

>=20
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> You can get the branch from here if the binaries are causing issues:
> https://github.com/alistair23/qemu/tree/mainline/alistair/opensbi.next

You can use 'git format-patch --no-binary'.

>=20
>   pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin 36888 -> 40984 bytes
>   pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin 45064 -> 49160 bytes
>   pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin 40968 -> 45064 bytes
>   roms/opensbi                                 |   2 +-
>   4 files changed, 1 insertion(+), 1 deletion(-)
[...]
> diff --git a/roms/opensbi b/roms/opensbi
> index ce228ee091..be92da280d 160000
> --- a/roms/opensbi
> +++ b/roms/opensbi
> @@ -1 +1 @@
> -Subproject commit ce228ee0919deb9957192d723eecc8aaae2697c6
> +Subproject commit be92da280d87c38a2e0adc5d3f43bab7b5468f09
>=20


