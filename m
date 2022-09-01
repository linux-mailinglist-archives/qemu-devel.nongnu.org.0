Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8845A914B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:54:49 +0200 (CEST)
Received: from localhost ([::1]:53334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTf2G-0004Wc-DB
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oTeRc-0007zW-KH
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:16:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oTeRZ-0006qA-1w
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662016612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IQWJZI9U4jeQovT+1TLiJjyQS3AfgKiSuy5v557H5v0=;
 b=WCgCla10gQjVtERpnCByFbb2BXN2PizhEt+LMIU3mykh+nRpx+jxUvn2cmIRodBMWzy4Rp
 Vlf9RYrE8QpkcLAnHrclV4Dnu+aSrIJcQ9oJF94D7L+Q+ueCzGCIpS9iil25qz8HFH16vZ
 wBjf2LGJNDLwNnb6goKIax6dsoby3/w=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-540-j4MlB2q_MmajZ7BQuOs_0A-1; Thu, 01 Sep 2022 03:16:51 -0400
X-MC-Unique: j4MlB2q_MmajZ7BQuOs_0A-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-11eadf59e50so4582447fac.8
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=IQWJZI9U4jeQovT+1TLiJjyQS3AfgKiSuy5v557H5v0=;
 b=kKm2yIyiGo4TW4xtDAbRprP7foKtfGi0YFJUIe/ywvDrRzQPT0Abq/cgOMuzDL3NCW
 tUSwi+RyqglUMA0TRLVyyIk/xNbps++oHH4Y9cfo7+z7xeQ75qUEGElFLJ3X/7xYW+Fi
 Q47AHuP5Oi6/Nv9ty5eCN8IPHWUKCGxRh0rooJwtUkaR0rMt9KMHUm4DmCHdguaynBW6
 sOI61b55WS69oRgbKn0VRyFMf3qW4DTnhH/x7/zAYYwckdXzgDuBqmcz0x0bGfnlOgQ2
 AE0aRGPO3rCRz36eoXf0Zj5jbYz1DvG6MF/g4VHFB/9Bndts3Vjd2J+qroAkvmbZdFPs
 Xihg==
X-Gm-Message-State: ACgBeo0byB++jPp+zjHcofkek54999xl2TDbbDldLUh4wJuj39LiqL6w
 RFTK3F9hd0citaBhJ3CBYcVDA5xm+uyMXfaEfjVYOFCQ84dmbgR9VlEmuf4UYCn3T2fCYGLbMbd
 vR4ZuDea15+eykL8ihR+JLdzk+RRoQB8=
X-Received: by 2002:a05:6808:219a:b0:344:e94a:ec43 with SMTP id
 be26-20020a056808219a00b00344e94aec43mr2894047oib.205.1662016610500; 
 Thu, 01 Sep 2022 00:16:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR56JF6/9mXyFVUv+I7QBHFUH8uhvY1jcMXUgtrWamhDs9xQYBjB8d3BVrM3qNfRAVs/QeRa4j5dTII6PldsNP4=
X-Received: by 2002:a05:6808:219a:b0:344:e94a:ec43 with SMTP id
 be26-20020a056808219a00b00344e94aec43mr2894043oib.205.1662016610322; Thu, 01
 Sep 2022 00:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220802075200.907360-1-bmeng.cn@gmail.com>
 <CAEUhbmW5Mcc5+ebHxVdm9N8bsMUj3gRWA0GBz8whtFacPymm2w@mail.gmail.com>
In-Reply-To: <CAEUhbmW5Mcc5+ebHxVdm9N8bsMUj3gRWA0GBz8whtFacPymm2w@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 1 Sep 2022 11:16:38 +0400
Message-ID: <CAMxuvazqAc03zvQ+nuDC7GCP2_k7miuop6FYN1u620K6R7RKzQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Enable unix socket support on Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, Sep 1, 2022 at 10:13 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi,
>
> On Tue, Aug 2, 2022 at 3:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Support for the unix socket has existed both in BSD and Linux for the
> > longest time, but not on Windows. Since Windows 10 build 17063 [1],
> > the native support for the unix socket has come to Windows. Starting
> > this build, two Win32 processes can use the AF_UNIX address family
> > over Winsock API to communicate with each other.
> >
> > [1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
> >
> > Changes in v4:
> > - instead of introducing CONFIG_AF_UNIX, add fallback afunix.h header
> >   in os-win32.h, and compile the AF_UNIX stuff for all Windows hosts
> > - drop CONFIG_AF_UNIX
> > - introduce a new helper socket_check_afunix_support() to runtime-check
> >   the availability of AF_UNIX socket, and skip those appropriately
> >
>
> All patches in this series have been reviewed. Would you please queue
> this? Thanks!

Yes, I was going to do it. Thanks


