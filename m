Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893D54EB1A9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 18:17:02 +0200 (CEST)
Received: from localhost ([::1]:33270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZEWj-0004qI-5E
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 12:17:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZEUL-0003HH-Dd
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 12:14:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZEUJ-00083a-1h
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 12:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648570469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E+7MF2TGyp3UclcVzInsc9+zY698udBmqnz/YlhvoXc=;
 b=Jphb5Id/lcN3hyRGi15WGqdBzAEe3s8qq8r7lI1tMZRG3KL7KvycimalJlUY7C5/toTmtT
 zE7lC3ctFjD0Vwz8rRwtXeqqGX7uhsynl0lJkzbbkVWOlqJrx8Rv766AOKzWQVW+RHeds6
 /23NZa1W5at2uZphuptDsek+1NlQwwI=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-6ZH60-lsPPylVmR8asj8gQ-1; Tue, 29 Mar 2022 12:14:27 -0400
X-MC-Unique: 6ZH60-lsPPylVmR8asj8gQ-1
Received: by mail-vk1-f200.google.com with SMTP id
 l23-20020ac5cdb7000000b0033ffe029887so2337036vka.0
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 09:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E+7MF2TGyp3UclcVzInsc9+zY698udBmqnz/YlhvoXc=;
 b=pCCZeUJJZm5CWPZdIkt6ezWXWTvV9hn3uGc3qqtLCyb9HB8DlqNTvjUf2KvM8xapfu
 be5oDbmq5wMOGN//vC/tBivKUzQ1M4oAqlZ6EzQniOTvLtRZaonPQV0pfg+SYunAUgXp
 xFYn63zDnTMiIL54UGv+9Bz/A0BxZf3NZ7sOq0VODVGKcwoayNYDClXBOcDm2VLxSd6x
 JzLu9qC0SxreQmhxl7J6mBIEgeO4wapVGTxnlRvUoL4NFxP8mT1iVBSWpQPQCiuwfyxW
 ZbW5wEQU9tmJyEXLmhFYHsyXBzjkaLngE0XkCqp9Jl/5SOD6HA5zbWfB0REPTe5Xcgk0
 MM9g==
X-Gm-Message-State: AOAM530ewBSapBhyobcCMWmpj5gVvDLefAZfmZb05+T6SNbOYz7B0FeC
 UnucnTx27Fp/L8TteFwrgyCebyx1o2hNzYHn557ik1Lezywvhi+zYzXWRcSyrl/LwH2IxUH8S81
 yErJDPWRZFU7rXzs87FFlORHr2D2wGqc=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr17816260vsa.38.1648570466916; 
 Tue, 29 Mar 2022 09:14:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXIyX0GvEXE5mUCC2VaX7Uh93JU5kid6MuMb2futtZQeaaqNHBkp02CqQoXZnvrpXp3AtIlFiEC51eo2tcyIA=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr17816244vsa.38.1648570466768; Tue, 29
 Mar 2022 09:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220328140604.41484-1-victortoso@redhat.com>
 <87ilrwycir.fsf@pond.sub.org>
In-Reply-To: <87ilrwycir.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 29 Mar 2022 12:14:16 -0400
Message-ID: <CAFn=p-bPhKciC+4XZXTyGnKLf3incOrJEgM0iZLht+QeuUqZ7A@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Fix some qapi examples and a TODO section
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Eric Blake <eblake@redhat.com>, Victor Toso <victortoso@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 12:00 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Victor Toso <victortoso@redhat.com> writes:
>
> > Hi,
> >
> > I've being using the examples as unit tests and found a few that
> > doesn't work out-of-the-box, might be inteded in order to be less
> > verbose in the qapi documentation but nevertheless I'm sending this
> > out in case you want to cherry-pick them.
>
> Lovely doc fixes.  I want them all.  Thanks!
>

Seconded.

Reviewed-by: John Snow <jsnow@redhat.com>

Thanks!


