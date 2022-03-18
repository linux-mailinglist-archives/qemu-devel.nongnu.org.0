Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74654DE094
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:56:36 +0100 (CET)
Received: from localhost ([::1]:43888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGq3-0003LB-Qf
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:56:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVGVS-0008A7-2G
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:35:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVGVP-0002Ux-6J
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647624914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lsXXvjMMNRzE8cc/BmtkbZNvUZ6URBYi1FQcx5kQIT4=;
 b=Gvrg3X8WbhKQyjF/d7O0m32RAS/c8d5GerW9LJTK+/5zwUq1/5qvyvdOr/eIT6b8SDf5c6
 eHw2SKgC3csKxUI/cgG8UZxUQjMcl7ZeK0oMOh+qOGcgStqa3S4ynGEaUleVV/XEfjEvEM
 4BjgpO25K6KnfeKEltCn4aQZmNVkKmM=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-zzG4XQ72NUuOqmWkX9t0Nw-1; Fri, 18 Mar 2022 13:35:12 -0400
X-MC-Unique: zzG4XQ72NUuOqmWkX9t0Nw-1
Received: by mail-ua1-f71.google.com with SMTP id
 q8-20020a9f2b48000000b00349f5af14baso4090393uaj.17
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 10:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lsXXvjMMNRzE8cc/BmtkbZNvUZ6URBYi1FQcx5kQIT4=;
 b=SfDH05wTqX83yxSZHv0Efe4oefaCG5RfMLJuf7u3aA21hua+qaxi4qAL6OwZryMZqc
 3hn3fyQNoXJMIQPp4iZIAadzZMVAxjMEX2GhMJaF+//uYy1PFv35c97k57uvPKhYkXrt
 32UPGO0ii5GFXhPVHTlzwcfTxjAvoEz2w2Z6cIRyVYPYHugKI2H72SuApQ2XvrJmfz9h
 9huPYrFUYyJYmQm4dpLA6i5yEs+t7rjyGvI+zMuA/RQm3R457Oykok50n3Cqr/436ZtW
 R8Y0f6kvDBUCC2B8Qn1uG3wgHrb3AuDH7zvJ/CZZIk2R2mE5F/7ckIL4uoLiE4TWjrRd
 fxJg==
X-Gm-Message-State: AOAM5313gMFDSkawODNUO9XtIFb//p+KLyf1Koj8PB6p7Vo/zIX0b7tN
 98b/engaxo1DKykzcyRivXV0Njv/p4XVWstQ1bMC4KiUHf3bi01gpEqCLgivnQdFO2XXYlrvpaG
 piGoP8adOLdNB6mkFkXyyZgg96PTMoKM=
X-Received: by 2002:ab0:7c4d:0:b0:34f:3fc0:9b05 with SMTP id
 d13-20020ab07c4d000000b0034f3fc09b05mr3621344uaw.103.1647624912493; 
 Fri, 18 Mar 2022 10:35:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk1taV7AGfB7Ct8FT7l46LL9wuJAWcNyZEtOHQrOWUjWpuhGd+APkvOVInMm/NGXmuQZnSEkV/q2CEtbkjM0E=
X-Received: by 2002:ab0:7c4d:0:b0:34f:3fc0:9b05 with SMTP id
 d13-20020ab07c4d000000b0034f3fc09b05mr3621332uaw.103.1647624912244; Fri, 18
 Mar 2022 10:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220203022405.1336635-1-jsnow@redhat.com>
 <CAFn=p-bL4XoZMajFffM9LKtFZBKj8W=x2qMQAiewSxLJAP7Qfw@mail.gmail.com>
 <cac97a40-6dd6-2ede-d7f0-c7b198d44c7c@redhat.com>
In-Reply-To: <cac97a40-6dd6-2ede-d7f0-c7b198d44c7c@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 18 Mar 2022 13:35:01 -0400
Message-ID: <CAFn=p-acU9C8FFjxQ0SttQLuH87czX_mxz9Y0DKfhhsy-UQiDg@mail.gmail.com>
Subject: Re: [PATCH 0/4] iotests: finalize switch to async QMP
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 12:32 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 08.02.22 20:52, John Snow wrote:
> > Squeak Squeak...
> >
> > ...Any objections to me staging this?
> >
> > (This patchset removes the accommodations in iotests for allowing
> > either library to run and always forces the new one. Point of no
> > return for iotests.)
>
> I took this as =E2=80=9Cif I don=E2=80=99t reply, that=E2=80=99ll be repl=
y enough=E2=80=9D :)
>
> Looks to me like the rebase is minimal (just shuffling the imports in
> patch 4 a bit), so I guess this=E2=80=99ll help even before you resend:
>
> Acked-by: Hanna Reitz <hreitz@redhat.com>
>

Great, thanks! I just didn't want to pull the rug out from under
anyone on this and really wanted an explicit "yes, sure".

You're the best!

--js


