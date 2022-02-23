Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BA94C1748
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 16:42:30 +0100 (CET)
Received: from localhost ([::1]:36770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMtme-0002ok-Kv
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 10:42:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMtll-00028K-7A
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 10:41:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMtli-00007G-FJ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 10:41:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645630884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPPpZuLPG/3auxiAhHPp5yIgz31Za804M/AAh7y1UQA=;
 b=hxo4ElU8HaaiJvt0CLAV6Wl/qRJkudmxA2/puEHlgiQit64n1I+4B1UM3X6kUp0aCHHL55
 wUIvDZEdjWr4Jw8VjwxmRrLB6yHfgK+xvaCpvpWTAtwQrwr8n0a6JZ34LCiXXHQDyf8S4x
 ocsnatUxzmo7XKt+zOXqTc+ndYL0RF8=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-xQTA6tCBN8CgQUTOP3oKXg-1; Wed, 23 Feb 2022 10:41:22 -0500
X-MC-Unique: xQTA6tCBN8CgQUTOP3oKXg-1
Received: by mail-ua1-f72.google.com with SMTP id
 o23-20020ab03b57000000b00341b8b8b689so1678640uaw.8
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 07:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uPPpZuLPG/3auxiAhHPp5yIgz31Za804M/AAh7y1UQA=;
 b=dRPjdyRNNnMj9dvZXEHjeRJU69+d1XZLzxX/lieyV62LiZ/aqNRV9gQPmw7ofQ2tgY
 QdzCPdQvud03bLhsxWf7yAbamK6BFdLFE/p5F/FamFIaV3CoSyzUoGVfMjbo9yzaPIPa
 EhsaMlHeQG73keC9YF/ljaxN9MyCbocAYxSbFq+jJx3pN9Vs486n/HUNckrLuMAfuXKt
 +InzBDBulX+6E/QC4gxSStAYuKcZjIhX9OLT8uNWDG50gswlzXEQm95xmuyyiobqxRH7
 kiLQrzhdqi4rRmGKPM51Bj7O+IW9ATI+CATPHecMPmPd3K+16wzVoFkq6/hKdKY4I2CI
 ipAA==
X-Gm-Message-State: AOAM532uJeII564G/7uebau9gswLAvrJVMGT9YuFShGJCrYSnttuz8os
 axjp1z8i3Dt1O5ZHtBK1sREzHITxD5Tkai5wrrOLpsdl9vWmTZ89zXJfGW86WaJaBH+I5cNXlIk
 ChEB8rj2KErI9MnXmLbJOwi9eCHnUNjg=
X-Received: by 2002:a05:6102:3591:b0:31b:4f52:29f1 with SMTP id
 h17-20020a056102359100b0031b4f5229f1mr132283vsu.61.1645630882321; 
 Wed, 23 Feb 2022 07:41:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyj8LshElSthh8WgerB5p4zWi2+u6th62w19ZoiFg9dWqpGcTBwU6XhT83AqmHVlAcjmP7iAU8SxS8cGeWByVU=
X-Received: by 2002:a05:6102:3591:b0:31b:4f52:29f1 with SMTP id
 h17-20020a056102359100b0031b4f5229f1mr132272vsu.61.1645630882132; Wed, 23 Feb
 2022 07:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
 <20220221155519.2367-5-damien.hedde@greensocs.com>
 <CAFn=p-ZErejiw7mn_kN6c+57ya4OgS3ANpUa=BtS3Be=vcSOvg@mail.gmail.com>
 <YhZST1fCU54OgoP2@redhat.com>
In-Reply-To: <YhZST1fCU54OgoP2@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 23 Feb 2022 10:41:11 -0500
Message-ID: <CAFn=p-bo39LEvQhKBZZ6ZcEfhaaZ7eQDgDFMOEZtDkCV_XH54w@mail.gmail.com>
Subject: Re: [PATCH 4/5] python: qmp_shell: add -e/--exit-on-error option
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 10:27 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Wed, Feb 23, 2022 at 10:22:11AM -0500, John Snow wrote:
> > On Mon, Feb 21, 2022 at 10:55 AM Damien Hedde
> > <damien.hedde@greensocs.com> wrote:
> > >
> > > This option makes qmp_shell exit (with error code 1)
> > > as soon as one of the following error occurs:
> > > + command parsing error
> > > + disconnection
> > > + command failure (response is an error)
> > >
> > > _execute_cmd() method now returns None or the response
> > > so that read_exec_command() can do the last check.
> > >
> > > This is meant to be used in combination with an input file
> > > redirection. It allows to store a list of commands
> > > into a file and try to run them by qmp_shell and easily
> > > see if it failed or not.
> > >
> > > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> >
> > Based on this patch, it looks like you really want something
> > scriptable, so I think the qemu-send idea that Dan has suggested might
> > be the best way to go. Are you still hoping to use the interactive
> > "short" QMP command format? That might be a bad idea, given how flaky
> > the parsing is -- and how we don't actually have a published standard
> > for that format. We've *never* liked the bad parsing here, so I have a
> > reluctance to use it in more places.
> >
> > I'm having the naive idea that a script file could be as simple as a
> > list of QMP commands to send:
> >
> > [
> >     {"execute": "block-dirty-bitmap-add", "arguments": { ... }},
> >     ...
> > ]
>
> I'd really recommend against creating a new format for the script
> file, especially one needing opening & closing  [] like this, as
> that isn't so amenable to dynamic usage/creation. ie you can't
> just append an extcra command to an existing file.
>
> IMHO, the "file" format should be identical to the result of
> capturing the socket data off the wire. ie just a concatenation
> of QMP commands, with no extra wrapping / change in format.
>

Eugh. That's just so hard to parse, because there's no off-the-shelf
tooling for "load a sequence of JSON documents". Nothing in Python
does it. :\


