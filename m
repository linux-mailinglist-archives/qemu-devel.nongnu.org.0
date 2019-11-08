Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30460F5080
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 17:03:59 +0100 (CET)
Received: from localhost ([::1]:56804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT6jt-0003jA-IV
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 11:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1iT6eK-0000XR-Ns
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:58:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1iT6eJ-0008Um-NW
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:58:12 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:34520)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1iT6eG-0008Rr-Qo; Fri, 08 Nov 2019 10:58:09 -0500
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 2247596EF0;
 Fri,  8 Nov 2019 15:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1573228686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CY7NMoOalLR5kDxou9MKFlDhUBoay+Dc1KO9XSx/ydQ=;
 b=W/mCihPGChacv/FwC9GGDhRh5JRYYaM/hnRd6JKzSdSIdqz+aoxB9UKYpiPQ5i9FOBcesa
 UDzsDVc1M2Tidh13LIu9UslzzZh9YqJ5PndfNImOnJ/dk4CT6V1bkRoJSxrMcR75L+1IyX
 JBf7XLv68LOL7waggSmiR6Du1XzEqR4=
Subject: Re: [PATCH v5 00/13] Multi-phase reset mechanism
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <efef625a-8162-5454-128f-489d636563a1@greensocs.com>
 <aae84bfb-e735-0aac-124c-9abbdea882ff@greensocs.com>
 <CAFEAcA9QW1JTg72YiGDxuEi5Dip99KUxuHAqDnVma1=A_qqbQQ@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <a8486664-535d-8b19-4cef-703539e5b9b8@greensocs.com>
Date: Fri, 8 Nov 2019 16:58:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9QW1JTg72YiGDxuEi5Dip99KUxuHAqDnVma1=A_qqbQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1573228686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CY7NMoOalLR5kDxou9MKFlDhUBoay+Dc1KO9XSx/ydQ=;
 b=blkdNHMiN8Ipe/pqsXYqaQ59SDfnga7XHMVtWkxpPWVkv7O+AqB1OkGyuO483MUWXzcKFe
 uCM1q6XdSEDVEUrSZZQs2jhacl5YE3dOZ7fR0V+tLHDLEE8R9pH7wlGcW+YJDiqKaq9afZ
 7kA6Qr+sjnGZ6fyyJ8YYes8eqfPqSWo=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1573228686; a=rsa-sha256; cv=none;
 b=QgK4M1QWQmiFsmBc16D7Wc1V7cVVIJfVgRSCxPgpdMYQjChuYpRkCOZk7K5mDngsSaR2ru
 V44E/W+Dk40TzfAmuWFIuTOYtpSoiC78QGooFBA676cOm8CqPo+KqdyLvdvpLDbRsK9hEB
 Vhkgn5EsH+HpdGBSqUW/UcebOfrzM5I=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Edgar Iglesias <edgari@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/8/19 4:28 PM, Peter Maydell wrote:
> On Fri, 8 Nov 2019 at 15:26, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>>
>> On 10/29/19 4:53 PM, Damien Hedde wrote:
>>> Hi,
>>>
>>> Does anyone has comment about the interface / patch 3 ?
>>> Should I try to split it ?
>>
>> ping
> 
> Hi; this patchset is still in my to-review queue, but we've
> just gone into softfreeze for 4.2 so I'm a bit short on time
> to look at anything that's not for this release.
> 
> I do definitely want to get this patchset in early in the
> 5.0 release cycle though.

Hi,
I understand,
Then I'll maybe try to advance more on the multiple reset type handling
and a do v6.

Thanks,
Damien

