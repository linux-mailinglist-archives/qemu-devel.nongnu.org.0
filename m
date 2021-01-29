Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FE1308DF8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:07:54 +0100 (CET)
Received: from localhost ([::1]:33398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5a3d-0004Ur-QQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l5a2J-0003mg-9E
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:06:31 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:37577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l5a2G-00066V-M3
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:06:30 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C5E6A7462E1;
 Fri, 29 Jan 2021 21:06:25 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9B5277462D3; Fri, 29 Jan 2021 21:06:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 999217462BD;
 Fri, 29 Jan 2021 21:06:25 +0100 (CET)
Date: Fri, 29 Jan 2021 21:06:25 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/2] pci: add romsize property
In-Reply-To: <9aae8014-8f86-ad1c-1a67-f08312aeb8d9@redhat.com>
Message-ID: <dbff55a-3a-6873-32c1-2a1974b02f8e@eik.bme.hu>
References: <20210129192838.582771-1-pbonzini@redhat.com>
 <20210129192838.582771-3-pbonzini@redhat.com>
 <ee924cca-8b90-df77-b544-c6405f6b761@eik.bme.hu>
 <9aae8014-8f86-ad1c-1a67-f08312aeb8d9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com, lersek@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021, Paolo Bonzini wrote:
> On 29/01/21 20:51, BALATON Zoltan wrote:
>> otherwise the BIOS emulator in the guest firmware crashes and this works so 
>> I think romfile can be empty and it's a useful feature to have in this case 
>> for example. I don't know if this patch changes anything about that but the 
>> commit message saying that romfile cannot be empty may be wrong.
>
> The empty property value configures the device not to have a ROM file at all. 
> The commit message says that ROM files (if they exist) cannot be empty, 
> corresponding to this code in pci_add_option_rom:
>
>    } else if (size == 0) {
>        error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
>        g_free(path);
>        return;
>    }

OK, then it was just not clear to me that the commit message talks about 
the romfile itself and not the property.

By the way, does it make sense to compare uint32_t value to -1 and could 
that provoke some compiler/sanitiser warnings? Is it better to have a 
signed type or use UINT32_MAX or simlar instead?

Regards,
BALATON Zoltan

