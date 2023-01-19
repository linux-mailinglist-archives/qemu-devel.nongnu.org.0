Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D755267396E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:06:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIUc8-0004s6-3u; Thu, 19 Jan 2023 08:05:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIUc6-0004ml-60
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:05:54 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIUc4-0004VE-19
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:05:53 -0500
Received: by mail-wm1-x32d.google.com with SMTP id l8so1471202wms.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 05:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j0jyoen9oRhEGxX6HDNmXPulwK/5VP1mwQ+IBQANnPM=;
 b=wmHAFx6RVw4CYwq4KschfPAA0EnREuQmnrlgLGQUivszOvcDBC22WVkb2D1th6aQPM
 SjbRtnizaT22ok1cYDfE2cQVU6kn9QPZbgTcYtrRCislC27teG8J4QVlF6vMC3SM83JO
 +lcy7dnMuhH6QnMfeBi9TThrkx3AcVl+7VeRjl3w42MLtl0drctVQZhI+w7oMGAbzcWc
 qIYAe/YjxjUQmdCMstyRdpVKaLQPZEnqRiPE6QiXF0+dvQg5OqtwskzdQ5d2OwRUzqaQ
 tSyiwdQfSIjIKVeTt7X1DdEwRDLNrYzlWgk3kifqIE6aIV8f+bOBvRpv9kW7yTZgHEJa
 H75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=j0jyoen9oRhEGxX6HDNmXPulwK/5VP1mwQ+IBQANnPM=;
 b=kqsAI9tGVXh7IlBBtvbgE5m5i8ARdoG7NylnvGQUoZfztPrsj8KBq3nqkJeSCGsa6Y
 rJCH0rvuPcdKIS0ipzKCU2Ue/7KOqkUZ90LqX6kxhWQqyQKDag5YQmGo7lDpax6QmagS
 li0yBZdkVLsEDqXcNqDUx2LzztvZbyzsrZcZDjeI2dhhj/sxrQBPgAg+3UKMkndfl8UA
 7dlF+og1oFKp+7EUiekr8X15wvl7zCNqTcGVW35b8YmP7oCN0UJG0PhVW/AbzzNY7XMr
 7xbpWMPEPZPY0QgMx+zsYQXD5M9v/rJcRwRXwvuCEA6HSEHYVrJ0W8EraqOosG06hzQs
 rxCw==
X-Gm-Message-State: AFqh2kpHV4JNu4uXCNHGVmNBRoMi0gqg3CZRSkEEYR8nxddPcllH0Xg0
 Vrh8IGfOPqDJqDFFNBfa5R7IvQ==
X-Google-Smtp-Source: AMrXdXutG1gCoyWgpSPLOWJT8BOCukn3Sa8pYH5uTQE9JXDCaKzFWL04tTVvLx9d3LrIhbCUbs/PfA==
X-Received: by 2002:a05:600c:5021:b0:3d9:9755:d659 with SMTP id
 n33-20020a05600c502100b003d99755d659mr10224606wmr.22.1674133550038; 
 Thu, 19 Jan 2023 05:05:50 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a05600c379000b003db15b1fb3csm4258571wmr.13.2023.01.19.05.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 05:05:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 132EC1FFB7;
 Thu, 19 Jan 2023 13:05:49 +0000 (GMT)
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116215805.1123514-2-dwmw2@infradead.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant
 <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>, Ankur Arora
 <ankur.a.arora@oracle.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, Claudio Fontana
 <cfontana@suse.de>, Julien Grall <julien@xen.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 armbru@redhat.com
Subject: Re: [PATCH v7 01/51] include: import Xen public headers to
 include/standard-headers/
Date: Thu, 19 Jan 2023 13:02:55 +0000
In-reply-to: <20230116215805.1123514-2-dwmw2@infradead.org>
Message-ID: <87a62eznbm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


David Woodhouse <dwmw2@infradead.org> writes:

> From: Joao Martins <joao.m.martins@oracle.com>
>
> There are already some partial headers in include/hw/xen/interface/
> which will be removed once we migrate users to the new location.
>
> To start with, define __XEN_TOOLS__ in hw/xen/xen.h to ensure that any
> internal definitions needed by Xen toolstack libraries are present
> regardless of the order in which the headers are included. A reckoning
> will come later, once we make the PV backends work in emulation and
> untangle the headers for Xen-native vs. generic parts.
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Update to Xen public headers from 4.16.2 release, add some in io/,
>         define __XEN_TOOLS__ in hw/xen/xen.h]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>  include/hw/xen/xen.h                          |   16 +-
>  include/standard-headers/xen/arch-x86/cpuid.h |  118 ++

Hmm is the sanitising done here by hand? Because for other stuff in
standard-headers we have a script update-linux-headers.sh which says:

  # - include/standard-headers/ for files that are used for guest
  #   device emulation and are required on all hosts.  For instance, we
  #   get our definitions of the virtio structures from the Linux
  #   kernel headers, but we need those definitions regardless of which
  #   host OS we are building for.  This script has to be careful to
  #   sanitize the headers to remove any use of Linux-specifics such as
  #   types like "__u64".  This work is done in the cp_portable function.

Are we just trying to work around having xen-devel (or equivalent)
installed which is where we get definitions for the actual Xen support.

>  .../xen/arch-x86/xen-x86_32.h                 |  194 +++
>  .../xen/arch-x86/xen-x86_64.h                 |  241 ++++
>  include/standard-headers/xen/arch-x86/xen.h   |  398 ++++++
>  include/standard-headers/xen/event_channel.h  |  388 ++++++
>  include/standard-headers/xen/features.h       |  143 +++
>  include/standard-headers/xen/grant_table.h    |  686 ++++++++++
>  include/standard-headers/xen/hvm/hvm_op.h     |  395 ++++++
>  include/standard-headers/xen/hvm/params.h     |  318 +++++
>  include/standard-headers/xen/io/blkif.h       |  722 +++++++++++
>  include/standard-headers/xen/io/console.h     |   56 +
>  include/standard-headers/xen/io/fbif.h        |  176 +++
>  include/standard-headers/xen/io/kbdif.h       |  576 +++++++++
>  include/standard-headers/xen/io/netif.h       | 1102 +++++++++++++++++
>  include/standard-headers/xen/io/protocols.h   |   42 +
>  include/standard-headers/xen/io/ring.h        |  495 ++++++++
>  include/standard-headers/xen/io/usbif.h       |  425 +++++++
>  include/standard-headers/xen/io/xenbus.h      |   80 ++
>  include/standard-headers/xen/io/xs_wire.h     |  153 +++
>  include/standard-headers/xen/memory.h         |  754 +++++++++++
>  include/standard-headers/xen/physdev.h        |  383 ++++++
>  include/standard-headers/xen/sched.h          |  202 +++
>  include/standard-headers/xen/trace.h          |  341 +++++
>  include/standard-headers/xen/vcpu.h           |  248 ++++
>  include/standard-headers/xen/version.h        |  113 ++
>  include/standard-headers/xen/xen-compat.h     |   46 +
>  include/standard-headers/xen/xen.h            | 1049 ++++++++++++++++
>  28 files changed, 9857 insertions(+), 3 deletions(-)
>  create mode 100644 include/standard-headers/xen/arch-x86/cpuid.h
>  create mode 100644 include/standard-headers/xen/arch-x86/xen-x86_32.h
>  create mode 100644 include/standard-headers/xen/arch-x86/xen-x86_64.h
>  create mode 100644 include/standard-headers/xen/arch-x86/xen.h
>  create mode 100644 include/standard-headers/xen/event_channel.h
>  create mode 100644 include/standard-headers/xen/features.h
>  create mode 100644 include/standard-headers/xen/grant_table.h
>  create mode 100644 include/standard-headers/xen/hvm/hvm_op.h
>  create mode 100644 include/standard-headers/xen/hvm/params.h
>  create mode 100644 include/standard-headers/xen/io/blkif.h
>  create mode 100644 include/standard-headers/xen/io/console.h
>  create mode 100644 include/standard-headers/xen/io/fbif.h
>  create mode 100644 include/standard-headers/xen/io/kbdif.h
>  create mode 100644 include/standard-headers/xen/io/netif.h
>  create mode 100644 include/standard-headers/xen/io/protocols.h
>  create mode 100644 include/standard-headers/xen/io/ring.h
>  create mode 100644 include/standard-headers/xen/io/usbif.h
>  create mode 100644 include/standard-headers/xen/io/xenbus.h
>  create mode 100644 include/standard-headers/xen/io/xs_wire.h
>  create mode 100644 include/standard-headers/xen/memory.h
>  create mode 100644 include/standard-headers/xen/physdev.h
>  create mode 100644 include/standard-headers/xen/sched.h
>  create mode 100644 include/standard-headers/xen/trace.h
>  create mode 100644 include/standard-headers/xen/vcpu.h
>  create mode 100644 include/standard-headers/xen/version.h
>  create mode 100644 include/standard-headers/xen/xen-compat.h
>  create mode 100644 include/standard-headers/xen/xen.h
<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

