Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA2250A7B8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:03:31 +0200 (CEST)
Received: from localhost ([::1]:41466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhb9O-0004mv-K6
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhb68-0002WU-5B
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhb64-0007W5-VR
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650564001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ceU5p+XSUXUy7MQfp6nGLhHdVEprhMypzw+GqJcRTIw=;
 b=hfAVsgMuNf7lwZlyGne1m2FGWUZieq0+bBQLQpIQGFKo4MBTbWBCqvyi0eTCUD/yvGRa+v
 j17DSk5x369tO956J7QZoSoufxUoemmzXUZ1Za8ilmqyrgxVf2rcHVji3+UWzMi545FgC/
 wuYI0cUGk9Oj81E3Mj3xnk4s+8NhHtg=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-BqQPSheqOjWC7M15WPzNlw-1; Thu, 21 Apr 2022 14:00:00 -0400
X-MC-Unique: BqQPSheqOjWC7M15WPzNlw-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-2d11b6259adso49667627b3.19
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 11:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=ceU5p+XSUXUy7MQfp6nGLhHdVEprhMypzw+GqJcRTIw=;
 b=hm4iDo/0klwC+n5gESXh6KGRWZwyNSUQ2NWiBFLibEetYfTOysWlpq6O/RxZo2T+d/
 /v/pUqGwNHkswJrvDcYmp5z3Oa6SQBB0IycPAzW0p3nScId3CqH9quQi7dXA7HN1UfoL
 Sv+WWf53RdeTb31ETmLjGagO45Zybfl3WLStsHQ5ifAtoAmpJUK8NGOd2Ia+nNrKMmoP
 vF3m0ck7YI0Hv0WEWpfsMxPX4w2lC0VXe/80+AuREdqDLTqHFE5eUBu77CmsKFKBl/4I
 ni8Tz9nizzYrvqmmT6QtLkLxyeTvaB5iy7PcuCm59El5wLPkh0/m+8j7fWTFg1QryYhi
 i8eA==
X-Gm-Message-State: AOAM531O5MLmnypdwRXNrZXM1ZsjHya5YNXvJqVUZVDgTUgeABEaN5Vh
 5/dCD6pxVwDNd4vFcQfT52LaOgW3XERCIkGl0xn+09xsuBZSXiio+4njW3OIjh1p6OCSIMBmUu7
 CHP0IkzOzpYif0kEwNvSTVRqccQ1lCg8=
X-Received: by 2002:a81:f10f:0:b0:2d6:935e:c3f8 with SMTP id
 h15-20020a81f10f000000b002d6935ec3f8mr934682ywm.325.1650563999981; 
 Thu, 21 Apr 2022 10:59:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxg7l24XLVSfV4rkMyiw5Y5J/0k1K8B+42fIy/1xNWaP0GPk+BSl+4wgLIJ3BzfgGw1FgaDhbs+96w20Uajirs=
X-Received: by 2002:a81:f10f:0:b0:2d6:935e:c3f8 with SMTP id
 h15-20020a81f10f000000b002d6935ec3f8mr934667ywm.325.1650563999821; Thu, 21
 Apr 2022 10:59:59 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Apr 2022 10:59:59 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <CAFn=p-a1DTR3ve_aQBARLG6NDdGscWQOn1wCjrPiRWL0sDvk9A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-a1DTR3ve_aQBARLG6NDdGscWQOn1wCjrPiRWL0sDvk9A@mail.gmail.com>
Date: Thu, 21 Apr 2022 10:59:59 -0700
Message-ID: <CABJz62MoAvnTaAYcNzKn7_=ENS+YovowS4OozZ7iYHQV2kL6Cg@mail.gmail.com>
Subject: Re: Create qemu-project/py-qemu.qmp repo
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>,
 Victor Toso de Carvalho <victortoso@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 21, 2022 at 12:46:48PM -0400, John Snow wrote:
> Hi Alex: do you have the ability to create a blank/empty "py-qemu.qmp"
> repo under the qemu-project grouping, and add me and Cleber as
> maintainers for it? There weren't any objections when I floated the
> idea [1].
>
> (Though I suggested "py-qemu.qmp" and Dan suggested "python-qemu.qmp".
> I don't think we explicitly reconciled the difference. I like the
> shorter one.)

Since you CC'd me to this message, I'm going to assume you're
explicitly welcoming my input on what specific shade this bikeshed
should be painted ;)

I think I would go with "python-qemu-qmp". Having a dot in the name
of a git repo is not very common AFAICT, and I wouldn't rule out the
possibility of some GitLab feature or other tooling breaking or
misbehaving because of it.

If you're really keen on saving those few extra keystrokes, maybe
"pyqemu" is a better prefix than "py-qemu"? I don't know, it just
looks more natural to me.

-- 
Andrea Bolognani / Red Hat / Virtualization


