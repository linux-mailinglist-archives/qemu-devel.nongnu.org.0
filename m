Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A9C474211
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 13:08:25 +0100 (CET)
Received: from localhost ([::1]:33408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx6bX-0000We-Vi
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 07:08:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mx6Yr-00085D-2i
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:05:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mx6Yo-0007iE-Bn
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639483532;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5B/3W/JGfhiTB+xdNKuPHFJadRyCOnNlHQmeZJVjqc=;
 b=HiFt/oCu7wawMfJZoyW49RxtGorjRSw7N5eK85M5+ZDO+WM/QUF7BTAaD3XgVb8Ffv9vyi
 +FUjq8RkPAoirYo0XtY7JV1/XoWeNh/t4u4Y+QXV6kyK3rL3+m9yUhJWu5i/R+lspMcFIJ
 UrGooweCCQ9HcthQCqLLDSSrqprJVzw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-WtsVoz5IO82nQyKXK4Sj3A-1; Tue, 14 Dec 2021 07:05:31 -0500
X-MC-Unique: WtsVoz5IO82nQyKXK4Sj3A-1
Received: by mail-wm1-f72.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so7806847wms.8
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 04:05:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n5B/3W/JGfhiTB+xdNKuPHFJadRyCOnNlHQmeZJVjqc=;
 b=dPsuAeOrjeUctg+duH/FtjNrtmeGIRjwVELhRs1fV0yy3GaTKFVxp+dP6gThtsfT5e
 +eKbP69QrCpOe3bL5yH5SA3hFs79aX8WTnXiWTMqicqNmY/To3CHNnTO6VLyCc4hUagW
 QPuVd3af9mA7YLvcCyOz1HgnvD2ppxUhQd4UYDs6V/LH3Z34j3qa493zW1YEJZAdTtb/
 jkPNlAB6xJuHyqXu/NjaBDikgdckVFg/ho82ZFdEoVSEc/DIE2Xlc8jmgwHIGk4RQZqL
 hXrW3fdLOxIWnIG1Cyv67qSna+oVaavg04CrwJLh/sKu8Ceq7Wo3BO8GBsLw35XY8Z4B
 Jj3g==
X-Gm-Message-State: AOAM531KxPr5blb++LHNT8ASAeocQrRrzaJJ3idxX6JjSQKnfcViL0TZ
 gWf+jishDoaycRkRInVMSDmbqtiKKv56fglC5OEsAyyC8s903Weq3fPEqpW6iOoEbmCS43kUO4L
 LUZLfpm1VMmJ+JCI=
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr193670wrm.42.1639483530619;
 Tue, 14 Dec 2021 04:05:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzt1h8QYel3rv+X7Rx5y6f85p/wndhcQ9/J5QiRzY9WQlS0Qvo0RjGU79c4d5uc7AH0LTyw6Q==
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr193632wrm.42.1639483530384;
 Tue, 14 Dec 2021 04:05:30 -0800 (PST)
Received: from localhost (static-58-87-86-188.ipcom.comunitel.net.
 [188.86.87.58])
 by smtp.gmail.com with ESMTPSA id o3sm12347058wri.103.2021.12.14.04.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 04:05:29 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 3/4] hw/display/vga-mmio: QOM'ify vga_mmio_init() as
 TYPE_VGA_MMIO
In-Reply-To: <99ebc4fb-f061-1e57-da07-e66035bacf9b@redhat.com> (Thomas Huth's
 message of "Mon, 13 Dec 2021 11:48:20 +0100")
References: <20211206224528.563588-1-f4bug@amsat.org>
 <20211206224528.563588-4-f4bug@amsat.org>
 <99ebc4fb-f061-1e57-da07-e66035bacf9b@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 14 Dec 2021 13:05:29 +0100
Message-ID: <87o85jz912.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> wrote:
> On 06/12/2021 23.45, Philippe Mathieu-Daud=C3=A9 wrote:
>> Introduce TYPE_VGA_MMIO, a sysbus device.
>> While there is no change in the vga_mmio_init()
>> interface, this is a migration compatibility break
>> of the MIPS Acer Pica 61 Jazz machine (pica61).
>
> It's unfortunate, but as far as I know, it would be pretty difficult
> or even impossible to get this done without versioned machine types?
> So IMHO it's ok to break this in this case here.

Hi

My understanding is that outside of x86*, and now ppc, arm and s390,
no one else really cares about migration compatibility.  I am not even
sure if they really care about migration at all O:-)

So, if the code is better for other reasons, I will not wonder about
migration compatibility.

Later, Juan.


