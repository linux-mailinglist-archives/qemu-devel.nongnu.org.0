Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6346D07B2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 16:07:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phsvn-0002BW-Hl; Thu, 30 Mar 2023 10:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1phsvl-0002A5-7J
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:07:09 -0400
Received: from mail.xen0n.name ([115.28.160.31] helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1phsvf-0000E1-Hc
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1680185209; bh=3QMfg7hSnmD0ndpGnAYoqF2w+7T7cIIpjpe9cMbCbHU=;
 h=Date:To:Cc:From:Subject:From;
 b=cO5Gmn8//i0JAS3CLkarV2wTSSf0gRfZBrcW8ufiNnfqmMs5F56xGxUexGW0RCdcJ
 Fs8tcnfkucWjuCY57e2vKAYTLKGuB7w0K5rAzeebhCcgfJP30QXbBnWVAA9XRPGGtw
 bjJVHEaDibTS5iOnAkyveqX01hXEG8UIqbNVmQCM=
Received: from [100.100.33.167] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id F13B360112;
 Thu, 30 Mar 2023 22:06:48 +0800 (CST)
Message-ID: <1f1d3d9f-c3df-4f29-df66-886410994cc3@xen0n.name>
Date: Thu, 30 Mar 2023 22:06:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Content-Language: en-US
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Song Gao <gaosong@loongson.cn>, =?UTF-8?B?5p2o5bCP5aif?=
 <yangxiaojuan@loongson.cn>, Bibo Mao <maobibo@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: On integrating LoongArch EDK2 firmware into QEMU build process
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Hi,

Recently there are reportedly increased general interest in trying out 
LoongArch on top of QEMU, among both end users and organizations; and 
the EDK2 firmware port is fully upstreamed since the stable202211 
version, and a build suitable for QEMU is already possible with 
Platform/Loongson/LoongArchQemuPkg in edk2-platforms. I think providing 
pre-built LoongArch firmware would make it much easier to dabble in 
system emulation, helping those users. (They currently have to pull a 
blob from yangxiaojuan/qemu-binary, and remember to pair certain version 
of QEMU with certain revision of the firmware blob. I'm also one of the 
users who can't remember which version to use, but I can always build my 
own; imagine the difficulty an end user would face!)

So I tried to add a LoongArch build to the list stored in roms/, but 
discovered that edk2-platforms seems not included, because all other 
platforms' EDK2 packages are directly under the main edk2 repo.

The question is: is integrating a platform package from edk2-platforms 
okay under the current build system, so we can arrange to provide 
edk2-platforms also as a submodule and go ahead? Or do we (the LoongArch 
firmware community) have to change the code organization to make 
necessary parts available in the main edk2 repo?

CC-ing target/loongarch maintainers from Loongson too as you may have 
more information.


