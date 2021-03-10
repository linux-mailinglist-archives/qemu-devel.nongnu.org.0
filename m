Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31E13341DB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:46:48 +0100 (CET)
Received: from localhost ([::1]:46912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK12t-0006E7-FH
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:46:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lK115-0005gh-8H
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:44:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lK111-0003gL-8e
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:44:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615391088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zWmyU2lC/AbkBkxrih63FL5NoDug6l/pt072NyvGa0w=;
 b=a5l7LPF6ScvO+TeHQUDgtoAeIP8sMi32oCDYqioN0yHjGFVK0FiL5k2Rcnvosxo3wMLpVm
 vb+idWe33TNwmPQ917ImMIV+KcsO2KOcTz1H0OaiIIEjRk0ncMRrS4X5tyX4FJOpPeKKLf
 14D9lJOa92mWFc5ohgxZRsrJzTpV5/M=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-mO0yERKONOumGx9CCX20ow-1; Wed, 10 Mar 2021 10:44:46 -0500
X-MC-Unique: mO0yERKONOumGx9CCX20ow-1
Received: by mail-pj1-f70.google.com with SMTP id w2so4913217pjk.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 07:44:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zWmyU2lC/AbkBkxrih63FL5NoDug6l/pt072NyvGa0w=;
 b=hQ63vz7p5C3b9Wr8sE6wkMLaGKxWsuSExdmgAYmIT/xC+BNw3QqhtF1NvmoFZBYH5+
 PxB6+XJGTWMeUcEIixQnbzkZXGuNygaQ0BXNL3mEQtkXmf9jxbgRZd9OJB8DyZDS2HKI
 NeGuw2CvxMQCV8YNmzmssCZFKH1ZAYIji3RR1LGaN/cySKqk+xVagh/7pPeAPLI17fOu
 urskdqZC/mZnMz9dDXy8ybEbOLqQ0l312FMqhGVmdmTlnqjnvlgVrVP3WDLOTj6ZlJOX
 DKEcCCLMNMCt5nisVyQf1wO746eEqto+axm75wM1SPWvC3t/rSVhdYjGLf5M+bB503Yj
 BOxQ==
X-Gm-Message-State: AOAM530A0+928Fmlgby3XDJswCfiaZ6PjhrMkW0Bb97/oM+UE5It043v
 AML5QGCNkUPwuchJ7IPQzmQ+2ikLK03TUoZgihi56dH9oFkDP8De6DkoD4eUvkSMzVkBBCMfXMU
 bq7VrHTWd76e7G3A/KYmS2lS3F+hcPRs=
X-Received: by 2002:a17:902:a607:b029:e4:c03e:3a9f with SMTP id
 u7-20020a170902a607b02900e4c03e3a9fmr3605758plq.14.1615391085766; 
 Wed, 10 Mar 2021 07:44:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9OtSOcNyxTbZR7bd9DIxyFyEe1wLM1KEeBFy20jiiQ2KM5rhMJ/wCwFHDYTJWUxbR4MuO8/lGxCE5DJhc8/0=
X-Received: by 2002:a17:902:a607:b029:e4:c03e:3a9f with SMTP id
 u7-20020a170902a607b02900e4c03e3a9fmr3605739plq.14.1615391085447; Wed, 10 Mar
 2021 07:44:45 -0800 (PST)
MIME-Version: 1.0
References: <20210309165035.967853-1-thuth@redhat.com>
 <87y2ev2lmr.fsf@dusky.pond.sub.org>
In-Reply-To: <87y2ev2lmr.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 10 Mar 2021 16:44:34 +0100
Message-ID: <CABgObfZPLEam+b-_o+U40B7ingd8e09y6C1xkSJgxBE2FOe-dA@mail.gmail.com>
Subject: Re: [PATCH v2] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 2:17 PM Markus Armbruster <armbru@redhat.com> wrote:
> One more has crept in: "u2f-key" (commit bb014a810, v5.2).  It's buggy:
>
>     $ qemu-system-x86_64 -S -usbdevice u2f-key
>     qemu-system-x86_64: -usbdevice u2f-key: '-usbdevice' is deprecated, please use '-device usb-...' instead
>     **
>     ERROR:../qom/object.c:508:object_initialize_with_type: assertion failed: (type->abstract == false)
>     Bail out! ERROR:../qom/object.c:508:object_initialize_with_type: assertion failed: (type->abstract == false)
>     Aborted (core dumped)
>
> Broken right in the commit that added the stuff.  The sugar never
> worked, and should be taken out again.

Agreed.

> "braille" is the only driver with a factory.  "-usbdevice braille" is
> sugar for
>
>   -device usb-braille,chardev=braille -chardev braille,id=braille
>   -machine usb=on
>
> It's buggy:
>
>     $ qemu-system-x86_64 -S -usbdevice braille
>     qemu-system-x86_64: -usbdevice braille: '-usbdevice' is deprecated, please use '-device usb-...' instead
> [three seconds tick by...]
>     Segmentation fault (core dumped)

Also breaks in the same way with "./qemu-system-x86_64 -S -chardev
braille,id=b", so it's irrelevant.

> It neglects to actually parse PARAMS:
>
>     $ qemu-system-x86_64 -S -usbdevice braille:"I'm a Little Teapot"
>     qemu-system-x86_64: -usbdevice braille:I'm a Little Teapot: '-usbdevice' is deprecated, please use '-device usb-...' instead
> [three seconds tick by...]
>     Segmentation fault (core dumped)
>
> The whole machinery in support of optional PARAMS has long become
> useless.

Agreed. But if parameters and u2f-key are removed, in a separate patch
even, then -usbdevice can be kept as it is in wide use in the wild and
there are no specific issues to be worried about.

Paolo


