Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD95861EB00
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 07:29:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orvbz-0002m1-Ff; Mon, 07 Nov 2022 01:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1orvbu-0002ln-Ni
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 01:27:54 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1orvbs-00081M-8K
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 01:27:54 -0500
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 1D519419E9DE;
 Mon,  7 Nov 2022 06:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 1D519419E9DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1667802438;
 bh=h3dPnnMhsPslGS7p3Hq80b5MDXZKjZTQyGI+HyLUky4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dv+EKbivK+sBx5Gi/jyu5tFt2F+h7BMJjrHPEGW/GUyKfvf9A6mrGOV/z4C/P+r5l
 o526buiWvMVW2NnkaFgwT/CDeWq9n6omQ/oC44gdw828FNG1IHrOoRlHE/favJd6jB
 EsRSqjBOmXTz8T5Hik0jtN3PIOu+bqZvWqSZNuS4=
Message-ID: <58c2868c-9f60-fb26-f8c4-87e8bc19a90e@ispras.ru>
Date: Mon, 7 Nov 2022 09:27:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Intermittent hang on x86 replay avocado test?
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <CAFEAcA-uLCqTGRPv4KLkc8b4j0QDhx5CFrspcSF+W1NdTDHN1g@mail.gmail.com>
Content-Language: en-US
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <CAFEAcA-uLCqTGRPv4KLkc8b4j0QDhx5CFrspcSF+W1NdTDHN1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04.11.2022 21:53, Peter Maydell wrote:
> On my machine this avocado test:
> 
> ./build/all/tests/venv/bin/avocado run
> ./build/all/tests/avocado/replay_kernel.py:ReplayKernelNormal.test_x86_64_pc
> 
> seems to hang intermittently (maybe 1 time in 3?).
> 
> Does anybody else see this? Looking at the avocado logs suggests
> the record part runs fine but the replay part hangs very early
> in the kernel bootup. (Or possibly Avocado has got confused and
> isn't logging all the output. >
> I couldn't trigger it outside avocado.

I sometimes have the same problem with one of the replay tests (I don't 
remember which one). It hangs with avocado, but does not hang when I run 
it with the same command line without avocado.

It could be some replay issue (like infinite waiting for input in 
main_loop_wait), but I couldn't trigger this behavior with 
logging/debugging enabled.

Pavel Dovgalyuk

