Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C387B56BE74
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 19:26:23 +0200 (CEST)
Received: from localhost ([::1]:54096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9rkE-0004SN-C9
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 13:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o9rdN-0006yE-Nj
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 13:19:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o9rdL-0004tp-2c
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 13:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657300753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=atT01Hf6S3Odo1eNr8fl+cxth+AeR8C4xpYoQbIIoC0=;
 b=f5INn4XjWWd6eoLTAiWitvxDQW3kKXpHOVvMPySHpcwz8IcBOT2fKYFXlIhTGBkO3s/JYb
 n8rwnG552kw7tJaRyxkD8+KuTubqa4vjCbYc4yc9ih9Z3xWWN2ORLDa28DSwWRJgsje9hV
 VL5ZV05wK8/GP3ofxljKklNocsE5tXw=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-DTJPm7SUNeewUKp4XPEm_A-1; Fri, 08 Jul 2022 13:19:06 -0400
X-MC-Unique: DTJPm7SUNeewUKp4XPEm_A-1
Received: by mail-io1-f71.google.com with SMTP id
 w24-20020a6bd618000000b0067991012f7aso1465000ioa.6
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 10:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=atT01Hf6S3Odo1eNr8fl+cxth+AeR8C4xpYoQbIIoC0=;
 b=5M5g/XdzfwK187BapRu8CsHEKE3GOC85Mo3QxOrXAs3jU3RR3MQJ2ITyBKzD/QzZsG
 FlmwXQuUZmZ1OePByljH3ZWbUGkCGYrgNcttvM7lOSKq0MZzk2MI8ZR4K1OkuGI8BSyX
 ZD1dxdaQAMhXvWToibwKRXyWPoda6p+AjGtDRXLOMCyPqjZ1sxwAoOPI0ibHKOyte2ko
 bKEKquxoch/xn475F1swtay0+Uc/Y5kscts57FaFNb7NXkCIev5d8kFvTpJcVNOyKIf0
 +zO3xReT+9FLvblD/2gE+R2szqlfQbwI/RyO+F/396CbhX2A6XayvNMm9RQTX3EGSrMM
 2z7Q==
X-Gm-Message-State: AJIora8bFfQAdK00vwA69OZfjldnp3GclBnXYS8Buru5BL7s/8h0h/Le
 wM2RZeZYYgZG3h5cx1LNVs9K6wdlX7fke10gjGAL1bQAV1vNgNbnPYOpZnOofuw6f2zAZhZYQvt
 FXNsrL1g2e2IInvHvtF8H/FjysfkBLkc=
X-Received: by 2002:a05:6602:1593:b0:678:d98b:cf60 with SMTP id
 e19-20020a056602159300b00678d98bcf60mr2603495iow.172.1657300745799; 
 Fri, 08 Jul 2022 10:19:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tckQgyN7g5SsrZ0++aXES0u+OktZUarFLU50CGzQmvFVIgsKcEYF3ksLAO5Y7Vy/KQjx+AL/ORYABjmNFz22Q=
X-Received: by 2002:a05:6602:1593:b0:678:d98b:cf60 with SMTP id
 e19-20020a056602159300b00678d98bcf60mr2603486iow.172.1657300745657; Fri, 08
 Jul 2022 10:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220702113331.2003820-1-afaria@redhat.com>
 <YsMVJLqNYmmpqjGc@redhat.com>
 <CAELaAXymGtALk+ZeMqWJX0mvj1_2p4MbaS4A+eY8V51KDNOddg@mail.gmail.com>
 <YsPlP6t0ALDkF4MU@redhat.com>
 <CAELaAXxdBvtxf2fXu1OxerBH+dTY_iti8CF-GMgGZpaWxgK_Gg@mail.gmail.com>
 <YsRi0SfAK3SVwQ2H@redhat.com>
 <CAELaAXz_xmBDQzCK3SdkryoAnynE0CRUBg4TNv6ZwntuenANkA@mail.gmail.com>
 <YsVgvYXt967wscOA@redhat.com>
In-Reply-To: <YsVgvYXt967wscOA@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Fri, 8 Jul 2022 18:18:29 +0100
Message-ID: <CAELaAXxLWY_M=WH0iwDfjP9OFZZY1H92f7ksnJVanKD21mP0pw@mail.gmail.com>
Subject: Re: [RFC 0/8] Introduce an extensible static analyzer
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Alberto Garcia <berto@igalia.com>,
 John Snow <jsnow@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Markus Armbruster <armbru@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Jul 6, 2022 at 11:15 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
> For clang-tidy, I've been trying it out integrated into emacs
> via eglot and clangd. This means I get clang-tidy errors reported
> interactively as I write code, so wouldn't need to run a full
> tree analysis. Unfortunately, unless I'm missing something, there's
> no way to extend clangd to plugin extra checks.  So it would need
> to re-implement something equivalent to clangd for our custom checks,
> and then integrate that into eglot (or equiv for other editors).

That would be very handy. Still, running the script on the whole tree
would be necessary to ensure that changes to headers don't break
translation units that are not open in the editor.

Alberto


