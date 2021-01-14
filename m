Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE992F6BF2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 21:18:28 +0100 (CET)
Received: from localhost ([::1]:40254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l094d-00019u-8A
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 15:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l093k-0000bQ-O9
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 15:17:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l093h-0004TG-Se
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 15:17:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610655448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=crseDl5CqlhLGKmOnNs48qUZmHpVZELz7k9mN+wHZ4g=;
 b=OwmHY0dI++8Y3SJ2LW/Z4r/pNIDRFMVMEPeT+gm4cZsXY1nqaDZXwScvtCFpuWdbFQLQYp
 tf3+fUEP4h0P/JJiXyBQL5lLjYzqaYBpwjQhw63pcdMGCsqXqXmKlSAy2N4zq5aEbcePuG
 RPHiXGV28BHTdyZqc7fse9xKfTknqEQ=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-fH7HDW8FOK24RtrQfE6OzA-1; Thu, 14 Jan 2021 15:17:26 -0500
X-MC-Unique: fH7HDW8FOK24RtrQfE6OzA-1
Received: by mail-vs1-f72.google.com with SMTP id p4so1148535vsq.13
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 12:17:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=crseDl5CqlhLGKmOnNs48qUZmHpVZELz7k9mN+wHZ4g=;
 b=uXQ4Wyuc5wiZ42lvr0BWKXakVKEoaf0Cq4b0RNq5KxHaQtXcSNr6uY7PEAIQ1FHIfH
 LbwY4eRuD+VRBAMvO6qtRLNh1qVAwCEBRaiYfHxpSVMM2nFffZVg01yb8iN2secXpnn6
 rnzd290SZlKRNaecYtommLf8MHI4XbHps1LVJrmQIY5C9aF3IEbqXei3burZbo0gnJ3Q
 oj7jXv/Sbi4mVhw4xFw7aQBDIzRBr6pFJ+Apn8SqAMcyFkVrG+wNKLgKnMzDlHkCRrpo
 wcph/OZ/mkhu5PnwJFzyvcl976CYrRdf4wJXEsdvlr4FM1+xD/Fxe3okjGsqu3L5Fd30
 V3Lw==
X-Gm-Message-State: AOAM530+bOjF1/FEXX9tSq+pS+DiqDNxpO50jEifH5HzrrEfBzwSXhDg
 Sd6AqtDYdt44iLQAQBisSV0jFFZAZAuv9+eoavKgEpIuXgb+Pcp9gOFFtMkPlUOE1w6ztQ0m3PE
 N4MbLrSXVxPDxlUFGghDZAQFRTkb3zNg=
X-Received: by 2002:ab0:2a01:: with SMTP id o1mr7420465uar.133.1610655446248; 
 Thu, 14 Jan 2021 12:17:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuTqJSLK7S2C1nOEyuww8el6U7GB6C9uKwBo9fQ6K6YG7xLPSMpnyFKlUn5gf/b5XdkPDRfhUL0rzzpTzC18s=
X-Received: by 2002:ab0:2a01:: with SMTP id o1mr7420456uar.133.1610655446054; 
 Thu, 14 Jan 2021 12:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20210112164045.98565-1-thuth@redhat.com>
 <20210112164045.98565-2-thuth@redhat.com>
In-Reply-To: <20210112164045.98565-2-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 14 Jan 2021 17:17:00 -0300
Message-ID: <CAKJDGDYGAwzw-SGBasjmezEJGXR5af_B_+5SPtKrcJJrfursRQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] tests/acceptance: Move the pseries test to a separate
 file
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 1:42 PM Thomas Huth <thuth@redhat.com> wrote:
>
> Let's gather the POWER-related tests in a separate file.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS                            |  1 +
>  tests/acceptance/boot_linux_console.py | 19 --------------
>  tests/acceptance/machine_ppc.py        | 34 ++++++++++++++++++++++++++
>  3 files changed, 35 insertions(+), 19 deletions(-)
>  create mode 100644 tests/acceptance/machine_ppc.py
>

We can have other tests moved to this file later. For now,

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


