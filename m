Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC08570AC9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 21:34:47 +0200 (CEST)
Received: from localhost ([::1]:47294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAzB8-0001I6-BN
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 15:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1oAz6t-0007qi-Ft
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 15:30:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1oAz6p-0000MX-MR
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 15:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657567812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qM6zdtWMHQ9cS2qhNT7mLpfjXy11cGUyLnPQ/rZbAnU=;
 b=ctxEdpepCzxGsHrqSnopAkqL9Hc62BUCxD1rvLlv43V+VIcGebOY2ANtgh0W8S20ig47DQ
 Ap9dRaVCxpQQZnFib8w3Gzz2d96AlS9f1GBf8nPRQ0BP2WBjsofDnmRhcB5vmFBCK3bM0E
 JVAHpUi3sfkiOpNXdNLVfBLFl5P/0Fw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-KAfJT7WRNCuAjVt447GvyQ-1; Mon, 11 Jul 2022 15:30:04 -0400
X-MC-Unique: KAfJT7WRNCuAjVt447GvyQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 jg29-20020a170907971d00b0072b5acf30e7so1060851ejc.8
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 12:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qM6zdtWMHQ9cS2qhNT7mLpfjXy11cGUyLnPQ/rZbAnU=;
 b=AXKXNh41rzKOHHvBjhuvq3/BTEIFOM8rtXZtBBAlWeQTq0KYMTnGLQUp+esgqzW8bR
 hdw9dSkbJ0li7f9fRqCOijuWn/5IFYI0X+t8sqT+xCKH2OBQIBB1Q/9ZrBK8m8UKwDqE
 1I+jBj5KIdgdJeYqQ3eDuy685R4M3CCQLFVoX1tRjEXXvIYJHcSQ52+dML960UqQmZny
 whSeDiEpCHfv/DD4+a4wGqULy8Y4UB2sZANG9Tuf35Ulc/3xiiKzL9Xxak9nzoLEooCi
 8Y3jRFQDbXxxvsGb7CzrxB4ovCJBVbV9ZqO7UeEF/qL8V2rmDurgVRWpXP0UU3EyHs7T
 PAoQ==
X-Gm-Message-State: AJIora9u9ac8BwUIpnnuGOfwJxcvPUbyCtYB9SIU+4KQYyp15GzVKXo1
 rw+a8neF2J8LTam0McAJuo2VohyOhXmFGzcksP8+V+emCpulYg/dl1phcCaEA1nX3qKRxRbWcA+
 ol+0N4erzURBt0Z0/+IFfAleMVcjFIbs=
X-Received: by 2002:a05:6402:11:b0:431:680c:cca1 with SMTP id
 d17-20020a056402001100b00431680ccca1mr27517762edu.420.1657567803269; 
 Mon, 11 Jul 2022 12:30:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s2J6ML5mRZmp2nVhgfVb0GzHuQ46aqH1QA3tSaNkvi0IVYvgZScoyCuj5y4wcp1s5mbcR63YvTnWJyBAUGazg=
X-Received: by 2002:a05:6402:11:b0:431:680c:cca1 with SMTP id
 d17-20020a056402001100b00431680ccca1mr27517746edu.420.1657567803109; Mon, 11
 Jul 2022 12:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-2-leobras@redhat.com>
 <YsccDel9oiTPqvHW@xz-m1.local>
 <CAJ6HWG5YbABGpacT9hD1dx0-o3Ey8sN++=MxhEaGML62jzQ=xQ@mail.gmail.com>
 <Ysc5hpnTb3k96Ubo@xz-m1.local>
 <904f8698a28c27bddbabaa1207a695fe0a832607.camel@redhat.com>
 <YsdbnfbTnE/ZJvQt@xz-m1.local>
In-Reply-To: <YsdbnfbTnE/ZJvQt@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 11 Jul 2022 16:29:52 -0300
Message-ID: <CAJ6HWG7C9_dhtLD8UDMePgTfj97b63Wb5fCr=3k+eEE0DbQMKw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] QIOChannelSocket: Fix zero-copy flush returning
 code 1 when nothing sent
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Thu, Jul 7, 2022 at 7:18 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Jul 07, 2022 at 06:14:17PM -0300, Leonardo Br=C3=A1s wrote:
> > Having 'if(queued =3D=3D sent)' will cause us to falsely return '1' in =
two buggy
> > cases, while 'if queued =3D=3D 0) will either skip early or go into 'in=
finite' loop.
>
> I'm not sure I strictly follow here..
>

Sorry, I was thinking of a different scenario.

> Imagine the case we do flush() twice without sending anything, then in th=
e
> 1st flush we'll see queued>sent, we'll finish flush() until queued=3D=3Ds=
ent.
> Then in the 2nd (continuous) flush() we'll see queued=3D=3Dsent immediate=
ly.
>
> IIUC with the current patch we'll return 1 which I think is wrong because
> fallback didn't happen, and if with the change to "if (queued=3D=3Dsent) =
return
> 0" it'll fix it?

Yes, you are correct.
It's a possible scenario to have a flush happen just after another
without any sending in between.

I will fix it as suggested.

Best regards,
Leo

>
> --
> Peter Xu
>


