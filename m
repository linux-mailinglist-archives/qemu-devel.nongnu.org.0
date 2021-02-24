Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA90323A1A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:04:33 +0100 (CET)
Received: from localhost ([::1]:41796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEr20-00085W-NN
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lEquC-0000rp-1e
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:56:28 -0500
Received: from mail.ispras.ru ([83.149.199.84]:52720)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lEqu5-0001dq-Pn
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:56:27 -0500
Received: from [10.12.39.188] (unknown [85.142.117.224])
 by mail.ispras.ru (Postfix) with ESMTPSA id 045A640755ED;
 Wed, 24 Feb 2021 09:56:13 +0000 (UTC)
Subject: Re: [PATCH] virtio: disable ioeventfd for record/replay
To: Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <161303249335.948571.16873882207700527766.stgit@pasha-ThinkPad-X280>
 <20210211094406.664520e6.cohuck@redhat.com>
 <ad446311-c5f9-9887-73d5-3c1f3707e5d1@ispras.ru>
 <fb2d2816-a696-a407-2f92-ec5950db9c4d@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <b59c3b42-b22b-8056-35e5-d7e37c215314@ispras.ru>
Date: Wed, 24 Feb 2021 12:56:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fb2d2816-a696-a407-2f92-ec5950db9c4d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.02.2021 12:05, Paolo Bonzini wrote:
> On 11/02/21 09:56, Pavel Dovgalyuk wrote:
>>
>> That's right.
>> It seems, that ioeventfd is used in virtio-ccw, virtio-mmio, and 
>> virtio-pci. The second one is related to KVM only, right?
> 
> No, it's used for TCG as well (with ARM "-M virt" or x86 "-M microvm").

Thanks for pointing at these machines.
But virtio-mmio does not support ioeventfd disabling as in PCI and CCW 
devices.
Should this option be added first?
Or the following code means that ioeventfd is used only in KVM mode?

static bool virtio_mmio_ioeventfd_enabled(DeviceState *d)
{
     return kvm_eventfds_enabled();
}

Pavel Dovgalyuk

