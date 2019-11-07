Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA6EF30B7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 14:59:37 +0100 (CET)
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSiK0-0004Ea-Eq
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 08:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iSiJ2-0003mm-T0
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 08:58:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iSiJ1-00027m-LC
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 08:58:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38168)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iSiJ1-00027U-FH
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 08:58:35 -0500
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3FA1383F3B
 for <qemu-devel@nongnu.org>; Thu,  7 Nov 2019 13:58:34 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id f11so1151060wmc.8
 for <qemu-devel@nongnu.org>; Thu, 07 Nov 2019 05:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pth5O67QkmYj65OQSszsmoJLqCJ0DrQJ04ZmzMDHRHA=;
 b=ShArsFir//PKxkCvdEWd5LoKV1Bj5ocqdz+8XEFT1lUK+WvPFfAKTYQ8w9InUP/Ifn
 leFxEV7w45Ssh0vC97NwzwJAAE0kTSuY7ffUV6d/VTu7ttP5m8U8Dm0bx2b2Qnmr/Fda
 apyIee65bmw0IaOCxcY9378r/CRn79bettCXsGJYy8cu5Hk1hSipXRNKa3apCp4Dbb5H
 riGF3lDjSHjuk+KW+JGAj8DkJBa5rpAdJZcpZCA3E32PQegGvtjVt5re9g3EeOoW9iS/
 3po/l7dkx0Z7PxeLKEXW7h9fi4vgTZyHlcIksLe7zG8ev+fr+tzEpH/GqMu3TwQ8s7jG
 VfzQ==
X-Gm-Message-State: APjAAAXXlmyRzRqydaCH5VXVoFN7UdeZ/xWl0qcvuTQXc5KQglfI6Yo+
 JFaUifZ2P/o6Wv2zu7UakSlFizMB5n0zPrb72/9vNQodOX80lkzMyqYwCDkQgzp7LupFgOOOm7I
 uxqq+oAiHICo7O7c=
X-Received: by 2002:a5d:664f:: with SMTP id f15mr2931085wrw.8.1573135112840;
 Thu, 07 Nov 2019 05:58:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqx8sEBUHDkb92/a1fWARFt+OBCx5sO5Jgiz8nb4ef/XJ1/6wjjiseE6lbAhrz8PAicVWqt2TQ==
X-Received: by 2002:a5d:664f:: with SMTP id f15mr2931067wrw.8.1573135112559;
 Thu, 07 Nov 2019 05:58:32 -0800 (PST)
Received: from [10.201.49.199] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id y78sm3137911wmd.32.2019.11.07.05.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2019 05:58:32 -0800 (PST)
Subject: Re: privileged entropy sources in QEMU/KVM guests
To: Laszlo Ersek <lersek@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <03e769cf-a5ad-99ce-cd28-690e0a72a310@redhat.com>
 <CAKv+Gu8gqfu_mOm2zK64dmj5CkVaPvix3gEMEFQScyk1CnOv6w@mail.gmail.com>
 <ef126cd5-7b64-1b8a-ca74-11bd06b5f4b1@redhat.com>
 <421cf4ef-ea84-c7e6-81aa-c24a91459de5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <659cd76f-2f46-1e08-342b-ee2fa0877fd8@redhat.com>
Date: Thu, 7 Nov 2019 14:58:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <421cf4ef-ea84-c7e6-81aa-c24a91459de5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 Jian J Wang <jian.j.wang@intel.com>,
 edk2-devel-groups-io <devel@edk2.groups.io>,
 Bret Barkelew <Bret.Barkelew@microsoft.com>,
 qemu devel list <qemu-devel@nongnu.org>, Erik Bjorge <erik.c.bjorge@intel.com>,
 Sean Brogan <sean.brogan@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/11/19 14:27, Laszlo Ersek wrote:
> The VirtioRngDxe driver is a UEFI driver that follows the UEFI driver
> model. Meaning (in this context), it is connected to the virtio-rng
> device in the BDS phase, by platform BDS code.
> 
> Put differently, the non-privileged driver that's the source of the
> sensitive data would have to be a "platform DXE driver". The virtio
> drivers are not such drivers however.

Yes, it would have to be a platform DXE driver.  What is it that limits
virtio to the BDS phase?

Paolo

