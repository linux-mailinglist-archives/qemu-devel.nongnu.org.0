Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58D1565D53
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 20:07:05 +0200 (CEST)
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8QTQ-0005nB-Fm
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 14:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8QRm-0004lr-KX
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 14:05:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8QRj-0001vI-Hi
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 14:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656957918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oua6uHW6l3hVpv1CEuryc43i6vMoUb4R9hxwIZGV2P8=;
 b=LaECnd3pyIsav8WNZMo75pQcC3QmQbV7YjEvEiT5TkgMfIS3XInI3E8D5HSMLpEATgCe5R
 vuAjNGHUt2PJeXcFDfrKP0cX0WHPNlxD0PbnCxE84ja/QVvppQNM1jGUK1oka+V/D/rPBq
 Piwpmpc7EWWHBV23oRSVRdYWBfUvMpI=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-0OU3A43SNHyDy-u-Nz45Vw-1; Mon, 04 Jul 2022 14:05:17 -0400
X-MC-Unique: 0OU3A43SNHyDy-u-Nz45Vw-1
Received: by mail-io1-f69.google.com with SMTP id
 bw12-20020a056602398c00b00675895c2e24so5770737iob.19
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 11:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oua6uHW6l3hVpv1CEuryc43i6vMoUb4R9hxwIZGV2P8=;
 b=cxpoTrUBwfJafRxFpAHX57njksBBKi3ItIeclGrzOhgZcgkHBEdHVGWOZvIqkQ0wUH
 z0pc13Ib0SrIXUd8cXSbRd7ScYC70FGdceJKumIHNSOqzlnjehSv3tnA39BeLbJxZ7TZ
 P3rmI9cDA0z+2Hai4BXAXsPm/bg6QqEO5VsMR7KS/TK6A/ccfCQjqBfds7UX8NKRM6ZV
 7NE+egPf9cjqUtOZwPr5dFE18o/EJY3ZmZBp4crF52LTWtOlo/22kkz+L1jlxrsL06UW
 Aao0fn9UtfmhSfeeIv9cIht3h/6ncwA5x/7IUhjRMCEZa8feo9Zx3eBqigTS5Bc6YqSy
 ppJw==
X-Gm-Message-State: AJIora8+qlVlzgUBqYZPa2NPbTJx7YjXlZC4/S5lQqIBjHWRtwa5Q5rY
 AeGvE+Sn624C1KWgOX8GzEG9jaIsswI0ZJUACKCzKW0thtRGrhjsI1V5o5dV3sZURtv+ytXocZD
 LFizZq/iTGa2kkOLi8FMkdCwLPRjmIWU=
X-Received: by 2002:a05:6638:1346:b0:33e:c430:9575 with SMTP id
 u6-20020a056638134600b0033ec4309575mr6832510jad.129.1656957916491; 
 Mon, 04 Jul 2022 11:05:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v6RxXisw/QLOAARa9v4enjm5h363xMlFxTkEAatZd9JCAr9ZPKjObolsE321K8z7HMJ5DeZzIQiWwJWiiIA/c=
X-Received: by 2002:a05:6638:1346:b0:33e:c430:9575 with SMTP id
 u6-20020a056638134600b0033ec4309575mr6832492jad.129.1656957916293; Mon, 04
 Jul 2022 11:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220702113331.2003820-1-afaria@redhat.com>
 <20220702113331.2003820-6-afaria@redhat.com>
 <ac264c3d-3345-38bf-35e5-ddc1b809c3b4@eldorado.org.br>
 <CAELaAXyAAfXGrO-NUSrqkU-Kd1hSzanUsz_Mk1fVSCfK9vhN8Q@mail.gmail.com>
 <679bb1ff-5bc4-7fc0-75e5-58628f577a27@eldorado.org.br>
In-Reply-To: <679bb1ff-5bc4-7fc0-75e5-58628f577a27@eldorado.org.br>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 19:04:40 +0100
Message-ID: <CAELaAXyFdQ=B7rpWR4mvLGnwXLAGn_GOk-EWYDfNO3mzdmnTog@mail.gmail.com>
Subject: Re: [RFC 5/8] static-analyzer: Enforce coroutine_fn restrictions on
 function pointers
To: =?UTF-8?Q?V=C3=ADctor_Colombo?= <victor.colombo@eldorado.org.br>
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

On Mon, Jul 4, 2022 at 6:46 PM V=C3=ADctor Colombo
<victor.colombo@eldorado.org.br> wrote:
> Yes, this line is present at the beginning of the output
> Is this caused by problems with the code being analyzed or is it because
> libclang is getting confused with something that is outside of our
> control?

I think I found the problem: the commands in the compilation database
weren't being parsed properly. I switched to shlex.split() and it
seems to be working now. The WIP v2 is available at [1], if you want
to give it a try.

Thanks for reporting this!

Alberto

[1] https://gitlab.com/albertofaria/qemu/-/tree/static-analysis


