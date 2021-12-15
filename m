Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8486D4758A4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:15:00 +0100 (CET)
Received: from localhost ([::1]:36980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxTBT-0003Cc-Lf
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:14:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSjN-00024S-Up
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:45:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSjK-0003sH-Ar
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:45:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639568753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SpBo8aghy1B7yXif69m+A9thwesc+po3nvHh2osABG0=;
 b=EG06VIc78tbdE1hwvshrtrVLl7vaSltCcDS2nnyBLz7rNRIO9Eo3kO9zVqjeQg6jWdBR2J
 IXlqfE5Y7x0DmmMIVw64LDMRrInntRY4DFu0AmxMpDrqZpKDdP5ZYmNBk6rqF2GIX0fcoB
 fG8JP8orj1T4eYxo5EN9XtQ45jfjCo8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-9S_6GUiQPEaS-Q8XulmVlw-1; Wed, 15 Dec 2021 06:45:52 -0500
X-MC-Unique: 9S_6GUiQPEaS-Q8XulmVlw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r10-20020a1c440a000000b003456b2594e0so338644wma.8
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 03:45:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SpBo8aghy1B7yXif69m+A9thwesc+po3nvHh2osABG0=;
 b=TuxtxWkVzgVCXYJquidO5TA7amxTjAb5uiRqfE2iJ7mUs6TEAsTDWd2tPVbuLF76dS
 yqn4t9zaU3OIgKOE/4LJUMdXRsN2WVsQZLz/FBRd1CqsG+eIFy9kb8jpaJxOKEt+dp9W
 1ogyvx8NK8NsdSkxxDON7aGfuTg3ohICjB/ZEEoKIKL40Or9Mfld0K1pm71JNWjfjGkd
 IZJw4NrlQD6fFQEvZXAtG7VhmpjMmPD9AytA0kCBfv862rICYz0J7J+BBFilXkWttt9G
 qHdeWAeftp5XMCao559t7TtyhoD+nUtBqMDnbY2YzHi2r2h51gYIbQxKpaLbZCkZnr2X
 tYIQ==
X-Gm-Message-State: AOAM530odc5PID2JXDZPTHJeilMljycUpY8PJUZkispaGIBZLP6P14q4
 /U9GlAxoj7bWNxc/IrUjCwEf8cHiWlRB7W75RRqmgT/athgVazbdMthj98yMbdZ6Yte+diYj+Ow
 5be7Nz/e0fSJFLxM=
X-Received: by 2002:a05:6000:181:: with SMTP id
 p1mr4073583wrx.292.1639568751220; 
 Wed, 15 Dec 2021 03:45:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgi1mIOJOD+3Huc4ed01AJ1sptierD6pk7BD7OBjCHFjFFdScyVtn2pf81vuXvYm7Gdfkhtg==
X-Received: by 2002:a05:6000:181:: with SMTP id
 p1mr4073558wrx.292.1639568750940; 
 Wed, 15 Dec 2021 03:45:50 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id bh16sm5901519wmb.1.2021.12.15.03.45.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 03:45:50 -0800 (PST)
Message-ID: <55c4523c-32a1-0c38-86f8-33f439c74aa6@redhat.com>
Date: Wed, 15 Dec 2021 12:45:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 07/18] tests: integrate lcitool for generating build
 env manifests
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-8-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211124130150.268230-8-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 14:01, Daniel P. Berrangé wrote:
> This introduces
> 
>   https://gitlab.com/libvirt/libvirt-ci
> 
> as a git submodule at tests/lcitool/libvirt-ci
> 
> The 'lcitool' program within this submodule will be used to
> automatically generate build environment manifests from a definition
> of requirements in tests/lcitool/projects/qemu.yml
> 
> It will ultimately be capable of generating
> 
>  - Dockerfiles
>  - Package lists for installation in VMs
>  - Variables for configuring Cirrus CI environments
> 
> When a new build pre-requisite is needed for QEMU, if this package
> is not currently known to libvirt-ci, it must first be added to the
> 'mappings.yml' file in the above git repo.
> 
> Then the submodule can be updated and the build pre-requisite added
> to the tests/lcitool/projects/qemu.yml file. Now all the build env
> manifests can be re-generated using  'make lcitool-refresh'
> 
> This ensures that when a new build pre-requisite is introduced, it
> is added to all the different OS containers, VMs and Cirrus CI
> environments consistently.
> 
> It also facilitates the addition of containers targetting new distros
> or updating existing containers to new versions of the same distro,
> where packages might have been renamed.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  .gitmodules                     |   3 +
>  Makefile                        |   2 +
>  docs/devel/testing.rst          | 104 ++++++++++++++++++++++++++++-

Thanks for the detailed documentation.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  tests/lcitool/Makefile.include  |  17 +++++
>  tests/lcitool/libvirt-ci        |   1 +
>  tests/lcitool/projects/qemu.yml | 115 ++++++++++++++++++++++++++++++++
>  tests/lcitool/refresh           |  67 +++++++++++++++++++
>  7 files changed, 306 insertions(+), 3 deletions(-)
>  create mode 100644 tests/lcitool/Makefile.include
>  create mode 160000 tests/lcitool/libvirt-ci
>  create mode 100644 tests/lcitool/projects/qemu.yml
>  create mode 100755 tests/lcitool/refresh


