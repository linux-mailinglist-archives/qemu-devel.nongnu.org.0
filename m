Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012986A800C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:39:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXgKx-0004VT-0J; Thu, 02 Mar 2023 05:38:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pXgKv-0004V5-HX
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:38:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pXgKu-0002UU-7Q
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:38:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677753535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qjKWn7Rsi/fhHKsJ7DJv0aT+tDYoiddDVGwCtFzpo3M=;
 b=gSeYqsuhbI/8vL+5qL6HwiVJSKXyCv6K35SUIh8kkpvWy3FQQpMBzrlaJ3Au2eQnfVgLEY
 4kP28ne8K2d+ovwq613vzoYNWO4vooHplgg6y+coLP86ji+bQiASliaIoQ+fX86h+a2i/I
 yM7j+hTZaQBAgx1+ZJKHCgJ7jJH4pm0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-lR-1GwGyNmClRP1iptbZWg-1; Thu, 02 Mar 2023 05:38:52 -0500
X-MC-Unique: lR-1GwGyNmClRP1iptbZWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E57DA2806041;
 Thu,  2 Mar 2023 10:38:51 +0000 (UTC)
Received: from [10.39.192.48] (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0571C16027;
 Thu,  2 Mar 2023 10:38:49 +0000 (UTC)
Message-ID: <f3ea947e-aa33-f627-25e9-6eed3e2d8b7a@redhat.com>
Date: Thu, 2 Mar 2023 11:38:48 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] acpi: cpuhp: fix guest-visible maximum access size to the
 legacy reg block
Content-Language: en-US
To: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, Ani Sinha <ani@anisinha.ca>,
 Ard Biesheuvel <ardb@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Oliver Steffen <osteffen@redhat.com>,
 Pawel Polawski <ppolawsk@redhat.com>,
 Dann Frazier <dann.frazier@canonical.com>
References: <20230104090138.214862-1-lersek@redhat.com>
 <20230104072457-mutt-send-email-mst@kernel.org>
 <7122894b-ccbf-9d30-ee54-c23c25c0f82b@redhat.com>
 <CAATJJ0K8Qt3-gNFT4nmweRFk-1bSHGicuLPim_V7EjgaXmLtGw@mail.gmail.com>
 <2cf7e982-470f-87eb-7f3e-807499d7c89f@redhat.com>
 <CAATJJ0LoQW9RDF=1=f_D1zWJSgWzMMtJ0FvqdsQYd9zOuuKkgg@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <CAATJJ0LoQW9RDF=1=f_D1zWJSgWzMMtJ0FvqdsQYd9zOuuKkgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/2/23 09:32, Christian Ehrhardt wrote:

> good ~instant
> [08:14:37.267336194] Select Item: 0xE
> [08:14:37.268346995] [Bds]RegisterKeyNotify: 000C/0000 80000000/00 Success
>
> bad ~8s
> [08:15:43.561054490] Select Item: 0xE
> [08:15:51.291039364] [Bds]RegisterKeyNotify: 000C/0000 80000000/00 Success

Yes, this is consistent with my hypothesis.

  PlatformBootManagerBeforeConsole()

    GetFrontPageTimeoutFromQemu()
      QemuFwCfgSelectItem (QemuFwCfgItemBootMenu)
        // "Select Item: 0xE"

    gRT->SetVariable()

    PlatformRegisterOptionsAndKeys()
      EfiBootManagerAddKeyOptionVariable()

        gRT->SetVariable()

        BmProcessKeyOption()
          BmRegisterHotkeyNotify()
            // "[Bds]RegisterKeyNotify: 000C/0000 80000000/00 Success"

IOW, there are at least two gRT->SetVariable() calls in OVMF (with
EFI_VARIABLE_NON_VOLATILE attribute) between the two adjacent log lines
you quoted.

The other functions listed in the call tree may contain further
gRT->SetVariable() calls.

Laszlo


