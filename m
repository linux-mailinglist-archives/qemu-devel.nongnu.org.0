Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF44E6A47
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 22:34:55 +0100 (CET)
Received: from localhost ([::1]:52138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXV6c-0003uY-Tw
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 17:34:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXV5k-0003Dt-O3
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:34:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXV5j-0006k5-8l
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648157638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XT4szfa4tQYi4z2begSMmGOkVY3+3jVy/Z6SDxiuEaI=;
 b=C2l+m9JywpYXzXMFsvrmOI+PKwd97DN9LGygLWS0lz+F+MbmkqFRh8BHePYUZIMGDnUiUJ
 6COnlysAX5S5OP1eJoNqcf/AUHF6FHpngTwFbCKli9CP5oUmxD/RaoQ5AczvcJyt5DPw16
 0C2+oNA0RNSwS/V+TRTXo6F00AWYR34=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-UI6A1TO_N2qExjAlGZTkrg-1; Thu, 24 Mar 2022 17:33:57 -0400
X-MC-Unique: UI6A1TO_N2qExjAlGZTkrg-1
Received: by mail-vs1-f71.google.com with SMTP id
 y10-20020a67c98a000000b00322deefc0d2so1254470vsk.0
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 14:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XT4szfa4tQYi4z2begSMmGOkVY3+3jVy/Z6SDxiuEaI=;
 b=z0zIvSeWoSY0TD5iPd+ZQ+bvO9dYgpIQGUgB9CU30Wig0BWlJInl45wItO76/jg3Rl
 +4MErFVDIKyUWA6d2qIrSNIgnRRhtjreNBgq+V5pBJTjST4TWE75+GPM39v+MDnJLYJb
 i94DSZVdtps04moXstaxUEXU5rqZJ6qa6ez7LZGg5dzVoe3LTlkpHMJFOsDsmbe8M2Q3
 QyN9SC2v4HeIjjQpR923B7D60cBto9lDmZOeWoUe37JoaV+UaKCooyPNpp+gGYA2wVEW
 JIbRxCO7pth55pFkPh/BWp3Ph9aKFCGb1tZ4jEhNweNqgPszPO/ZRNIMUBmd0IF0gtPi
 lsYA==
X-Gm-Message-State: AOAM531ST1rJ+vsS+oxQVKFK0pEQ1SWwT2Zvvjy9oEIPqqfAhg89aNKw
 pMzLBFAhazzBv9CFoZFmh91ALRduT88sjGV1Gz/2G5WXuPI+iNy8ZVeUplFcfa036MurFdb0nbH
 zQNi24qMDAYnoarxK6mbL/Nz8KTlckCw=
X-Received: by 2002:ab0:7c4d:0:b0:34f:3fc0:9b05 with SMTP id
 d13-20020ab07c4d000000b0034f3fc09b05mr3450253uaw.103.1648157636879; 
 Thu, 24 Mar 2022 14:33:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSiGwTjKNlzdURow5hwgrCxJ6qX8vWUHBbLfcMo7OAPOnx49SqV9Hflu1hEp0V4FIIwDS2pT8MCGsnhe57Bf4=
X-Received: by 2002:ab0:7c4d:0:b0:34f:3fc0:9b05 with SMTP id
 d13-20020ab07c4d000000b0034f3fc09b05mr3450246uaw.103.1648157636710; Thu, 24
 Mar 2022 14:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-1-victortoso@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 17:33:46 -0400
Message-ID: <CAFn=p-YM+KMSH9BKvgkWbwNDg_bvag=Vp+MG3Gg4m4j36sLhDw@mail.gmail.com>
Subject: Re: [PATCH 00/14] Fix some qapi examples and a TODO section
To: Victor Toso <victortoso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 1:50 PM Victor Toso <victortoso@redhat.com> wrote:
>
> Hi,
>
> I've being using the examples as unit tests and found a few that
> doesn't work out-of-the-box, might be inteded in order to be less
> verbose in the qapi documentation but nevertheless I'm sending this
> out in case you want to cherry-pick them.
>
> Cheers,
>
> Victor Toso (14):
>   qapi: BlockExportRemoveMode: move comments to TODO
>   qapi: fix example of BLOCK_IMAGE_CORRUPTED event
>   qapi: fix example of BLOCK_IO_ERROR event
>   qapi: fix example of BLOCK_JOB_PENDING event
>   qapi: fix example of DUMP_COMPLETED event
>   qapi: fix example of MEMORY_DEVICE_SIZE_CHANGE event
>   qapi: fix example of UNPLUG_PRIMARY event
>   qapi: fix example of FAILOVER_NEGOTIATED event
>   qapi: run-state examples: add missing member
>   qapi: run-state examples: add missing timestamp
>   qapi: fix example of MEMORY_FAILURE
>   qapi: ui examples: add missing websocket member
>   qapi: fix example of ACPI_DEVICE_OST event
>   qapi: fix example of dump-guest-memory
>
>  qapi/acpi.json         |  5 +++--
>  qapi/block-core.json   |  9 +++++----
>  qapi/block-export.json | 10 +++++-----
>  qapi/dump.json         |  9 +++++----
>  qapi/machine.json      |  3 ++-
>  qapi/migration.json    |  4 +++-
>  qapi/net.json          |  3 ++-
>  qapi/run-state.json    | 16 +++++++++++-----
>  qapi/ui.json           | 12 ++++++------
>  9 files changed, 42 insertions(+), 29 deletions(-)
>
> --
> 2.35.1
>

Good stuff, IMO. Systematically validating our docs will be a good
thing for improving the usability of those docs.

Only the first patch seems like a lateral move, but I assume you had
your reasons.

--js


