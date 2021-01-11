Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21F72F18E6
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 15:56:49 +0100 (CET)
Received: from localhost ([::1]:35332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyyci-0005Fw-J2
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 09:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kyyWx-0001hV-3V
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 09:50:51 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kyyWu-0008R7-CI
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 09:50:50 -0500
Received: from [172.17.10.14] (unknown [172.17.10.14])
 by beetle.greensocs.com (Postfix) with ESMTPSA id AEB5221C35;
 Mon, 11 Jan 2021 14:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1610376644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=B3qJbjEteXVYAqVIFPYk31dITi1ngRiw5JWBmHO43nc=;
 b=zPT6f31A/d8vP5WMhsf7Rf/3VQXTMXGZUT94sxNpyHRQZ0eVujFAsz1coFQ3BibVXut3bo
 kwlOAAYytTrY/oaFPlEsMW7s6r++WPrtwKF5VvxNPzpwBjheY2WkT8jZynFUB/gSakwLU0
 5cuDND1SfnMdBIJMYRwRF8PbzmqleZA=
To: qemu-devel@nongnu.org
From: Luc Michel <luc.michel@greensocs.com>
Subject: About creating machines on the command line
Message-ID: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
Date: Mon, 11 Jan 2021 15:50:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 richard.fuhler@sifive.com, berrange@redhat.com, sam.grove@sifive.com,
 Mark Burton <mark.burton@greensocs.com>, f4bug@amsat.org, armbru@redhat.com,
 edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

We would like to work on improving QEMU to be able to create custom 
machines from the command line. The goal here is to get feedback from 
the community and shape the future developments.

The use case mainly comes from people working with tools to customize 
their designs, such as SiFive Core Designer 
(https://scs.sifive.com/core-designer). This kind of tools may allow 
creation or customization of a whole SoC, from the number of cores, to 
the memory and IRQ mapping of peripherals etc.

The ultimate goal would be to be able to create any kind of machine on 
the command line. However we are aware that this is a substantial amount 
of changes in QEMU.

In its current state, QEMU allows for very limited customization of 
existing machines on the command line. We identified the following 
limitations (feel free to add to the list):

   - Most devices are not user creatable. Moreover, sysbus devices must 
be explicitly allowed by a machine to be creatable through `-device`,

   - Memory regions cannot be created on the command line,

   - Device MMIO regions cannot be mapped on a bus from the command line,

   - GPIOs and clocks cannot be wired from the command line,

   - CPUs are not sysbus devices (and not user-creatable). They need 
special care when creating them regarding system reset. Not being on a 
bus means that they must be reset manually on system reset. This is done 
in machines by registering a QEMU reset handler.

   - Machine specific boot code is usually hard-coded into the machine 
itself.  Some architectures (e.g. ARM) do factorize bootloader related 
code, but there is no standard way of doing that in QEMU.

We don't want to address all those limitations at once. We plan to start 
with the following scenario:

   - Start with a base machine that would handle CPU creation and 
bootloader stuff. Note that the "none" machine is probably not 
sufficient in its current shape. It does allow only one CPU and 
obviously does not handle the boot process.

   - Allow for this machine every sysbus devices we want to be user 
command-line creatable (and mark them user_creatable if needed)

   - Add command line options to create memory regions (probably ram 
ones at first)

   - Add command line options to map a memory region (including sysbus 
device MMIO regions) onto another (memory_region_add_subregion)

   - Add command line options to connect GPIOs and clocks.

This would hopefully allow for simple machines creation. We would then 
be able to use either the command line or the `-readconfig` option to 
create the machine.

Note that we are not planning to use QMP/HMP for now. From our 
understanding, a `device_add` request is always considered as hot-plug, 
which is not what we want here.

Please tell us what do you think about this plan. Any feedback is 
appreciated.  Then we can discuss the details of how to do this properly.
Thanks!

--
Luc

