Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A09FA155D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 12:04:58 +0200 (CEST)
Received: from localhost ([::1]:47592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3HIX-0004j4-8a
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 06:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43711)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jbeulich@suse.com>) id 1i3HHS-0004FU-P3
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:03:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jbeulich@suse.com>) id 1i3HHQ-00078o-35
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:03:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:55108 helo=mx1.suse.de)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jbeulich@suse.com>) id 1i3HHP-000774-RL
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:03:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3F680B646;
 Thu, 29 Aug 2019 10:03:44 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1567069347-22841-1-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <131d5f04-7ef9-9a2b-3009-2a93587186ef@suse.com>
Date: Thu, 29 Aug 2019 12:03:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567069347-22841-1-git-send-email-chao.gao@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 195.135.220.15
Subject: Re: [Qemu-devel] [RFC Patch] xen/pt: Emulate FLR capability
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
 Paul Durrant <paul.durrant@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.08.2019 11:02, Chao Gao wrote:
> Currently, for a HVM on Xen, no reset method is virtualized. So in a VM's
> perspective, assigned devices cannot be reset. But some devices rely on PCI
> reset to recover from hardware hangs. When being assigned to a VM, those
> devices cannot be reset and won't work any longer if a hardware hang occurs.
> We have to reboot VM to trigger PCI reset on host to recover the device.

Did you consider a hot-unplug, reset (by host), hot-plug cycle instead?

> +static int xen_pt_devctl_reg_write(XenPCIPassthroughState *s,
> +                                   XenPTReg *cfg_entry, uint16_t *val,
> +                                   uint16_t dev_value, uint16_t valid_mask)
> +{
> +    if (s->real_device.is_resetable && (*val & PCI_EXP_DEVCTL_BCR_FLR)) {
> +        xen_pt_reset(s);
> +    }
> +    return xen_pt_word_reg_write(s, cfg_entry, val, dev_value, valid_mask);

I think you also need to clear the bit before handing on the request,
such that reads will always observe it clear.

Jan

