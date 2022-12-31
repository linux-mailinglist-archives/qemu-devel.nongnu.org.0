Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C09365A065
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 02:16:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBQSu-0005tE-M4; Fri, 30 Dec 2022 20:15:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pBQSb-0005mf-VS
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 20:14:55 -0500
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pBQSZ-0007Qy-Ts
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 20:14:53 -0500
Received: from [IPV6:2601:646:8600:40c1:5967:deb4:a714:2940]
 ([IPv6:2601:646:8600:40c1:5967:deb4:a714:2940])
 (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 2BV1EVmS1463922
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 30 Dec 2022 17:14:32 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 2BV1EVmS1463922
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2022120601; t=1672449273;
 bh=p758Zgd+yGDuok+ksdSxE2idQGSI127bm719tcowUaE=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=G4LeLSN1au620qGat9Nr+WlKrYb7uSchs4cjj5ly0FiMkE05k6lizUbSIlwEBhEI7
 w+kdSn+PABHB9xif38RY+Vt10NnD9unHylbnxZnZ87bqtWrwGBZxtAk0jS7Jn/WHzr
 oc5/PdIRZ8o6PVFPfme08Ihme5BC2aHQftb1nYb6lVOECNg9d21n9nE7eJgw/in88R
 FYfBTgAypVgCc1Fvqd2QayztYKT2cqjxFjY+fodRgQbu+B0C/jwmJj71Wl/2thAyQC
 2HncnwoI+KOaHMwZgSQ0rXJ86AQzrJ1MQRbmk4UOf+auLmv94S6xThtlWKI5pNiChR
 6CYFmtuhbDQpg==
Message-ID: <7dc37024-5bdd-1206-020b-5072629b80dd@zytor.com>
Date: Fri, 30 Dec 2022 17:14:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Borislav Petkov <bp@alien8.de>, pbonzini@redhat.com, ebiggers@kernel.org, 
 x86@kernel.org, linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
 ardb@kernel.org, kraxel@redhat.com, philmd@linaro.org
References: <Y6x1knb8udpSyMSp@zx2c4.com>
 <9188EEE9-2759-4389-B39E-0FEBBA3FA57D@zytor.com> <Y6z765zHrQ6Rl/0o@zx2c4.com>
 <AF921575-0968-434A-8B46-095B78C209C1@zytor.com> <Y62MdawGaasXmoVL@zn.tnic>
 <Y68Js5b0jW/2nLU4@zx2c4.com> <Y68Zf/MKmX3Rr18E@zn.tnic>
 <CAHmME9oPUJemVRvO3HX0q4BJGTFuzbLYANeizuRcNq2=Ykk1Gg@mail.gmail.com>
 <Y69B40T9kWfxZpmf@zn.tnic> <E5D0A77E-5ABC-4978-9A66-37B60DA43869@zytor.com>
 <Y69h6ur79SMhu61F@zx2c4.com> <46466e54-25c3-3194-8546-a57cd4a80d9d@zytor.com>
In-Reply-To: <46466e54-25c3-3194-8546-a57cd4a80d9d@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:7c80:54:3::138
 (failed)
Received-SPF: pass client-ip=2607:7c80:54:3::138; envelope-from=hpa@zytor.com;
 helo=mail.zytor.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

On 12/30/22 17:06, H. Peter Anvin wrote
> 
> TThe 62 MB limit mentioned in boot.rst is unrelated, and only applies to 
> very, very old kernels that used INT 15h, AH=88h to probe memory.
> 

I am 88% sure this was fixed long before setup_data was created, as it 
was created originally to carry e820 info for more than 128(!) memory 
segments. However, as we see here, it is never certain that bugs didn't 
creep in in the meantime...

	-hpa


