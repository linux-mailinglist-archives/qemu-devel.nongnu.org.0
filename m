Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725C210D692
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 14:59:41 +0100 (CET)
Received: from localhost ([::1]:59392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iago7-0006XJ-2y
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 08:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1iafxi-0005ZX-5L
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 08:05:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1iafxg-0002aD-TS
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 08:05:29 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:34468)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1iafxg-0002Q5-97
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 08:05:28 -0500
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 9C32896EF0;
 Fri, 29 Nov 2019 13:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1575032724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zZc3arwUEqO9q/icnExJ3VQ8gWQUWx/ktcilXDAhcc0=;
 b=ec4OQd9txgvwN+W2nw/ydleq3CLSb+K/OFTaMhVZIkI/rf18nwZK/AuSzcOQ40TVe0QD70
 XMz0XaUCakV5MZTx+wAPIc+/XezuLIL4DLn2aU/RxBY0VZToAr6y5YVeAO4FS7VLcZ5GN4
 a9SSd4x3R41NFKWEh8Gm79+OFqkaSIE=
Subject: Re: qom device lifecycle interaction with hotplug/hotunplug ?
To: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
References: <CAFEAcA9E-Z-RPwFsAiz9Pi3_MtBUFEU7enJFVrpOQ7UKW8e1DQ@mail.gmail.com>
 <20191128182705.0635d1d4@redhat.com>
 <CAFEAcA-qA6n49KdHsGLqt422L_b_9xPfSaJB3tATQvRdfKt-xw@mail.gmail.com>
 <20191129132641.4c7da6c5@redhat.com>
 <CAFEAcA_gcxqu+N5iV0L5WLyWmm5yxTFNMtmqQryBgVd4CCCT8A@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <119190aa-a9f6-ae5c-b51c-98568287036c@greensocs.com>
Date: Fri, 29 Nov 2019 14:05:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_gcxqu+N5iV0L5WLyWmm5yxTFNMtmqQryBgVd4CCCT8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1575032724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zZc3arwUEqO9q/icnExJ3VQ8gWQUWx/ktcilXDAhcc0=;
 b=q7wcuUyA7GbjRlgcU31/9tpRXB1RavTUTDSS+ljcN2ETFgZ9xOs8nmdqjSene10HNU++Do
 wylcMqFLpy1hQQlKbZtZtnQvnDgwZzXFUehYyF4br1MMYuY97cQxgErMIwNUu3Wg17W6Mi
 VGvbOHTXbyxZVvzO3yNJuMtkrpj295g=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1575032725; a=rsa-sha256; cv=none;
 b=k7+eYwVxEe5vZEiaVxOvcYUq8FUxcNvNs90QOYYFkZEUGgcG4FC/z8R/mFv3V1NfMJsAiL
 zLJhpxwBTrlHomJBpIJPALZtBBZVyKHw9B8MTvavpTjR1w06rVv/stDHaC1urVc1eqbuSx
 3Jiam+ZG0+uwPosHnsHQmkFhTN45n6A=
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/29/19 1:45 PM, Peter Maydell wrote:
> On Fri, 29 Nov 2019 at 12:26, Igor Mammedov <imammedo@redhat.com> wrote:
>> But from the my very limited understanding, on real hardware,
>> once device is uplugged it's gone (finalized) from machine
>> perspective, so it's unclear to my why someone would use
>> realize->unrealize->realize hotplug scenario.
> 
> Well, on real hardware 'unplug' is different from 'unrealize'.
> So I think for QEMU if we wanted to allow this sort of 'unplug
> and replug the same device' we should do it by:
> 
>  instance_init -> realize -> plug -> unplug -> plug -> unplug ->
>    unrealize -> finalize
> 
> So unrealize/finalize is when the device is actually destroyed,
> and if you're going to replug the device you don't destroy it
> on unplug.
> 

Hello everybody,

What I was initially wondering (or afraid of) when this question/problem
comes to me is;
Are there some cases where QEMU does the following (in the context of an
hotplugged device):

instance_init -> realize (and plug) -> unrealize -> change some
properties -> realize
with no unplug / plug in between

because I have the impression, the realize was here to allow setting
properties. But it may be pure nonsense as I do not know well the
underlying mechanisms there.

Regards,
--
Damien


