Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADE9332E8D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:52:35 +0100 (CET)
Received: from localhost ([::1]:54756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhT8-0005Zh-RK
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJfa1-0000CX-BN
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:51:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJfZz-0007Na-DE
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:51:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615308690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/0+ApRdvUstN2dmsPikElv94suiYNpEV6mKUaoBwApg=;
 b=WVlNJf56vXp4Cew3DbRI8lCOQL1VzAraMoUP76KYKThIDvhhuBF0ZT6UT552Bqa5NfH8hr
 IJAyAT5pEVSBV/Lz4lckWB8vIsMOjD5orE6RzRwXNNuYT2B/FUutgUJhYFhRgl3HnlQnBU
 bJURFr//WYloOBvahomy4ZqfvTpzT5w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-yuzw_lcGNdaPdo8PtN4lsw-1; Tue, 09 Mar 2021 11:51:28 -0500
X-MC-Unique: yuzw_lcGNdaPdo8PtN4lsw-1
Received: by mail-ej1-f71.google.com with SMTP id gv58so5888292ejc.6
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/0+ApRdvUstN2dmsPikElv94suiYNpEV6mKUaoBwApg=;
 b=KoTGH+OIi164+FoomHGc5izEyFXuC+inKKrhAR3N1NN84nPojmvr0bl/lc5OzBW/Ql
 R6ttS09SRfM4Yfk5U1ShibQ97BSkz/uTj8MLLkWy9nAL5gXO+thupL4RGdZQUAj3T7Sx
 Y/+NUBlUcBs8MHIPEpbVCJAptarjdxBNXGxW6YRcqTSPltFfD0Qh4Wl4BXsLVk2AB7/a
 mhFwclLTMtLKgvqv1ANpRCzQw8m9lPpwcjlYCIzYFF6ZZXyhYMWADDH2ILFJBH29pnDp
 TOH9EqMFlOUAjBtSR995tIoNiprxkLo+bP8sQVO7suMm69mHWqRCd6uAspcL0b8gqCmv
 eG/w==
X-Gm-Message-State: AOAM5331yumm6S3LuRhV/I9myqTMkzVnywR06oJ5NeavMp4g1pzRNMm8
 +Q1hDSGXM75EfZzlDQut5s9YX99EEp/AF2LMLOKB61WMKJH0MXVPS1vkXuvRjcXelPMUpNq/2S4
 j0sqCYnmsRFRXr+A=
X-Received: by 2002:a17:906:3c18:: with SMTP id
 h24mr21094591ejg.435.1615308686950; 
 Tue, 09 Mar 2021 08:51:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxOBm+Z6V9ueU4CDnPBUhhSuOPi14NKS0ArNcMRr6RgttVz+xPvdRSbzogsBKcIuqxaOUHqg==
X-Received: by 2002:a17:906:3c18:: with SMTP id
 h24mr21094564ejg.435.1615308686797; 
 Tue, 09 Mar 2021 08:51:26 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k9sm7195591edn.68.2021.03.09.08.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 08:51:26 -0800 (PST)
Subject: Re: [PULL v2 03/19] roms/opensbi: Upgrade from v0.8 to v0.9
To: Alistair Francis <alistair.francis@wdc.com>, peter.maydell@linaro.org
References: <20210304144651.310037-1-alistair.francis@wdc.com>
 <20210304144651.310037-4-alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <11f66e7f-a02a-42d3-5da9-085cc9e846c5@redhat.com>
Date: Tue, 9 Mar 2021 17:51:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304144651.310037-4-alistair.francis@wdc.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alistair,

On 3/4/21 3:46 PM, Alistair Francis wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Upgrade OpenSBI from v0.8 to v0.9 and the pre-built bios images.

> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Message-Id: 20210119234438.10132-1-bmeng.cn@gmail.com
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../opensbi-riscv32-generic-fw_dynamic.bin    | Bin 62144 -> 78680 bytes
>  .../opensbi-riscv32-generic-fw_dynamic.elf    | Bin 558668 -> 727464 bytes
>  .../opensbi-riscv64-generic-fw_dynamic.bin    | Bin 70792 -> 75096 bytes
>  .../opensbi-riscv64-generic-fw_dynamic.elf    | Bin 620424 -> 781264 bytes
>  roms/opensbi                                  |   2 +-
>  5 files changed, 1 insertion(+), 1 deletion(-)

For pull-request you can use git-format-patch with --no-binary:

   --no-binary
           Do not output contents of changes in binary files,
           instead display a notice that those files changed.
           Patches generated using this option cannot be applied
           properly, but they are still useful for code review.

I did the same mistake last year and this broke QEMU patchwork
instance. No sure it is still in use, so Cc'ing Stefan.

> diff --git a/roms/opensbi b/roms/opensbi
> index a98258d0b5..234ed8e427 160000
> --- a/roms/opensbi
> +++ b/roms/opensbi
> @@ -1 +1 @@
> -Subproject commit a98258d0b537a295f517bbc8d813007336731fa9
> +Subproject commit 234ed8e427f4d92903123199f6590d144e0d9351
> 


