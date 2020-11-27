Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3D02C6A3B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 17:55:10 +0100 (CET)
Received: from localhost ([::1]:33956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kih1Z-0007YN-VN
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 11:55:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kigyr-00061d-1v
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:52:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kigyp-0005iy-6u
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606495938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UNmUjX3epuDm+Yjz+Skt4feca0hwkq9q7/r5P4jRwKU=;
 b=dOvUHpinwjcdXWlt5E0uJYWQvLb5Z/83RJt2Xo+X9PnzNMx/d2TLtxQS7GATJYXlD7FGVt
 rxvG22pY5vywvjbkd2LZeaJfByhqxxJR8MmFOBrGHTPbLXmrN26sNJu0AgfJf0fQGLzmun
 +QXWeAz3lt1KjqJ3Md1xZmLtwSvM8Ac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-q45ta20TOCCkM4OUmGjmLg-1; Fri, 27 Nov 2020 11:52:14 -0500
X-MC-Unique: q45ta20TOCCkM4OUmGjmLg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 432028049C3;
 Fri, 27 Nov 2020 16:52:13 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-74.ams2.redhat.com
 [10.36.112.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FCFD5C1C2;
 Fri, 27 Nov 2020 16:52:12 +0000 (UTC)
Subject: Re: [RFC] ich9:cpuhp: add support for cpu hot-unplug with SMI
 broadcast enabled
To: Igor Mammedov <imammedo@redhat.com>
References: <20201124122507.1014839-1-imammedo@redhat.com>
 <bf87cef4-cac9-1c1b-5bd4-c6bc97dff994@redhat.com>
 <20201126213807.3205f5db@redhat.com>
 <cae2bede-1177-df14-07a6-dc3be75b7edd@redhat.com>
 <20201127160742.4c81cb3d@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <926113ec-8fa1-7d3b-ff3f-f1eda692e83d@redhat.com>
Date: Fri, 27 Nov 2020 17:52:11 +0100
MIME-Version: 1.0
In-Reply-To: <20201127160742.4c81cb3d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, ankur.a.arora@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/20 16:07, Igor Mammedov wrote:
> On Fri, 27 Nov 2020 15:48:34 +0100
> Laszlo Ersek <lersek@redhat.com> wrote:

>> The firmware logic needs to be aware of is_removing though, at least
>> understand the existence of this bit, as the "get pending" command
>> will report such CPUs too that only have is_removing set. Shouldn't
>> be a problem, we just have to recognize it.
>
> firmware shouldn't see bit #2 normally, it's cleared in AML during
> CSCN, right after remove Notify is sent to OSPM. I don't see a reason
> for firmware to use it, I'd just mask it out on firmware side if it
> messes logic.
>
> potentially if we have concurrent plug/unplug for several CPUs,
> firmware might see bit #2 which it should ignore, it's for OSPM
> consumption only.

Yes, that's what I meant.

Currently, inside the scanning loop of the QemuCpuhpCollectApicIds()
function in "OvmfPkg/CpuHotplugSmm/QemuCpuhp.c", there is no branch that
simply skips a CPU that was reported by QEMU_CPUHP_CMD_GET_PENDING. Now,
such a branch will be necessary.

This is what I mean (just for illustration):

$ git diff -b -U5

> diff --git a/OvmfPkg/Include/IndustryStandard/QemuCpuHotplug.h b/OvmfPkg/Include/IndustryStandard/QemuCpuHotplug.h
> index a34a6d3fae61..ddeef047c517 100644
> --- a/OvmfPkg/Include/IndustryStandard/QemuCpuHotplug.h
> +++ b/OvmfPkg/Include/IndustryStandard/QemuCpuHotplug.h
> @@ -32,10 +32,11 @@
>
>  #define QEMU_CPUHP_R_CPU_STAT                0x4
>  #define QEMU_CPUHP_STAT_ENABLED                BIT0
>  #define QEMU_CPUHP_STAT_INSERT                 BIT1
>  #define QEMU_CPUHP_STAT_REMOVE                 BIT2
> +#define QEMU_CPUHP_STAT_FIRMWARE_REMOVE        BIT4
>
>  #define QEMU_CPUHP_RW_CMD_DATA               0x8
>
>  #define QEMU_CPUHP_W_CPU_SEL                 0x0
>
> diff --git a/OvmfPkg/CpuHotplugSmm/QemuCpuhp.c b/OvmfPkg/CpuHotplugSmm/QemuCpuhp.c
> index 8d4a6693c8d6..9bff31628e61 100644
> --- a/OvmfPkg/CpuHotplugSmm/QemuCpuhp.c
> +++ b/OvmfPkg/CpuHotplugSmm/QemuCpuhp.c
> @@ -258,35 +258,44 @@ QemuCpuhpCollectApicIds (
>        DEBUG ((DEBUG_VERBOSE, "%a: CurrentSelector=%u: insert\n", __FUNCTION__,
>          CurrentSelector));
>
>        ExtendIds   = PluggedApicIds;
>        ExtendCount = PluggedCount;
> -    } else if ((CpuStatus & QEMU_CPUHP_STAT_REMOVE) != 0) {
> -      DEBUG ((DEBUG_VERBOSE, "%a: CurrentSelector=%u: remove\n", __FUNCTION__,
> -        CurrentSelector));
> +    } else if ((CpuStatus & QEMU_CPUHP_STAT_FIRMWARE_REMOVE) != 0) {
> +      DEBUG ((DEBUG_VERBOSE, "%a: CurrentSelector=%u: firmware remove\n",
> +        __FUNCTION__, CurrentSelector));
>
>        ExtendIds   = ToUnplugApicIds;
>        ExtendCount = ToUnplugCount;
> +    } else if ((CpuStatus & QEMU_CPUHP_STAT_REMOVE) != 0) {
> +      DEBUG ((DEBUG_VERBOSE, "%a: CurrentSelector=%u: remove\n", __FUNCTION__,
> +        CurrentSelector));
> +
> +      ExtendIds   = NULL;
> +      ExtendCount = NULL;
>      } else {
>        DEBUG ((DEBUG_VERBOSE, "%a: CurrentSelector=%u: no event\n",
>          __FUNCTION__, CurrentSelector));
>        break;
>      }
>
> +    ASSERT ((ExtendIds == NULL) == (ExtendCount == NULL));
> +    if (ExtendIds != NULL) {
>        //
> -    // Save the APIC ID of the CPU with the pending event, to the corresponding
> -    // APIC ID array.
> +      // Save the APIC ID of the CPU with the pending event, to the
> +      // corresponding APIC ID array.
>        //
>        if (*ExtendCount == ApicIdCount) {
>          DEBUG ((DEBUG_ERROR, "%a: APIC ID array too small\n", __FUNCTION__));
>          return EFI_BUFFER_TOO_SMALL;
>        }
>        QemuCpuhpWriteCommand (MmCpuIo, QEMU_CPUHP_CMD_GET_ARCH_ID);
>        NewApicId = QemuCpuhpReadCommandData (MmCpuIo);
>        DEBUG ((DEBUG_VERBOSE, "%a: ApicId=" FMT_APIC_ID "\n", __FUNCTION__,
>          NewApicId));
>        ExtendIds[(*ExtendCount)++] = NewApicId;
> +    }
>
>      //
>      // We've processed the CPU with (known) pending events, but we must never
>      // clear events. Therefore we need to advance past this CPU manually;
>      // otherwise, QEMU_CPUHP_CMD_GET_PENDING would stick to the currently

Thanks
Laszlo


