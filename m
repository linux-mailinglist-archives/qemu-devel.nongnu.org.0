Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA132CD582
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 13:32:12 +0100 (CET)
Received: from localhost ([::1]:60920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kknmM-0006cT-SC
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 07:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kknlE-00063s-3h
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:31:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kknlC-0001a1-EO
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:30:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606998657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7kS5OzR9MaP4rg6v65bO9wp7fuT8Mlo97khH7RfT/8A=;
 b=Mc9lHYv+eJ9nvPMu+AFWuH3qTMyiJNANriKVCuZ8m5MZW52TLCP6N2dw9g9d/v17MwKYq8
 pCbAWHlkWAnfd/qiCcXND+8BIb3pRV63ESZlESFGW5jyphLzG1FGWaFAO2+pB4Vgifp0Om
 zQgAM2HBCrPHaXNZrBuEM/NKv/wsYvY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-cvAltL-dMvucIBB20gBJZw-1; Thu, 03 Dec 2020 07:30:53 -0500
X-MC-Unique: cvAltL-dMvucIBB20gBJZw-1
Received: by mail-wm1-f72.google.com with SMTP id h68so1451424wme.5
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 04:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7kS5OzR9MaP4rg6v65bO9wp7fuT8Mlo97khH7RfT/8A=;
 b=ddhDNh+HAcBP+PM5GFDewRex9UuCmj9fKO5moV44+9xx8Lcf8+hDtn24iED3varJTu
 peJavrKXlJdXx1J/MqO36ol9loR9JksssOpRf1fR6MeOMt9CLAfbUiQISmbNQ+y5q7uU
 ir8sW5vRoY2S4QaHF41fAaApNeNqIHT4Pz90mgUvIy43l+b0w1yws/qjRifjTrUBgAa4
 FunI6H9oc5YmQAVBwEszMxYvn1soudFh+Pa3Jd65axfd+83614swdU7qkQMgn/evAVy6
 5pf61c8Qu/0gdD9bGIN90if9Gb556dEdn6cZhR+gYQC+mNxvZTSFS0bQfMVJvJKfIFVw
 nkgw==
X-Gm-Message-State: AOAM533zuFkomfQPx2TVi+QFDjblmK5H0yIASUDpbt09TToPcwcn2bnd
 mrT2k+ckjuxTlSGwXPCj0cxgpgzucGGL4x0sp2niO0L2gbk0HGwKPpdEulb5pwn/3UKEt7/GoPU
 W8JImFsWZN1wLNEU=
X-Received: by 2002:a1c:2ec6:: with SMTP id u189mr3154405wmu.31.1606998651838; 
 Thu, 03 Dec 2020 04:30:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFU0Rce5xt0m4IRYEuLf54Y/Am8zBybCFOfYjYxaWKxqBO65/pcgLdJCXeEPSpkbcj65g7QQ==
X-Received: by 2002:a1c:2ec6:: with SMTP id u189mr3154389wmu.31.1606998651603; 
 Thu, 03 Dec 2020 04:30:51 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id 20sm1299479wmk.16.2020.12.03.04.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 04:30:50 -0800 (PST)
Subject: Re: [PATCH for-6.0 00/11] target/arm: enforce alignment
To: Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <CAFEAcA9XFGbyYfcpoOVhtV_wySi9=DyMGe84C4uwYG14Z6bD6Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <56701347-e0a0-ae47-8bba-f5cdff253475@redhat.com>
Date: Thu, 3 Dec 2020 13:30:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9XFGbyYfcpoOVhtV_wySi9=DyMGe84C4uwYG14Z6bD6Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Pavel

On 12/1/20 4:55 PM, Peter Maydell wrote:
> On Wed, 25 Nov 2020 at 04:06, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> As reported in https://bugs.launchpad.net/bugs/1905356
>>
>> Not implementing SCTLR.A, but all of the other required
>> alignment for SCTLR.A=0 in Table A3-1.
> 
> Something in this series breaks the 'make check-acceptance'
> record-and-replay test:
> 
>  (30/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt:
> PASS (9.14 s)
>  (31/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '31-tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt',
> 'logdir': '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/result...
> (90.19 s)
> 
> The log shows the "recording execution" apparently hanging,
> with the last output from the guest
> [    3.183662] Registering SWP/SWPB emulation handler
> 
> thanks
> -- PMM
> 


