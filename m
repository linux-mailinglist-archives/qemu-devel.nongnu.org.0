Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF56578050
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:57:11 +0200 (CEST)
Received: from localhost ([::1]:58842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDOR4-0002bU-48
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDOO5-0006zX-L3
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:54:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDOO2-0004jv-Il
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658141641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3T/0Gd6KzqWSk+in+OSqd9+mGbrACq2r6OJxGurZNjk=;
 b=YMGpIpmQrXFars89xbfOul5qEmbKbKhYvdnx0WTPn1cir+QKZmmm66Hq80+S0yVeh8EYcI
 QAKYeDN9/ewOfB5G/drPN2EbOPpG601wu4fx8ivwdgSRtb8zTv89O5yp2NF+hODRG5BuNI
 KIQ7lAOPRvdyD0KG8RFXso2CScQT704=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-lhHKBfxBNhCVAzfa3MAqSA-1; Mon, 18 Jul 2022 06:53:58 -0400
X-MC-Unique: lhHKBfxBNhCVAzfa3MAqSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3C78101A54E;
 Mon, 18 Jul 2022 10:53:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CEC3403D0C1;
 Mon, 18 Jul 2022 10:53:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0EF2F21E690D; Mon, 18 Jul 2022 12:53:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Damien Le Moal
 <damien.lemoal@opensource.wdc.com>,  Dmitry Fomichev
 <dmitry.fomichev@wdc.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hanna
 Reitz <hreitz@redhat.com>,  qemu block <qemu-block@nongnu.org>,  Eric
 Blake <eblake@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,  Fam Zheng
 <fam@euphon.net>,  Hannes Reinecke <hare@suse.de>
Subject: Re: [RFC v4 0/9] Add support for zoned device
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <87pmiaubjz.fsf@pond.sub.org>
 <CAAAx-8LNouyevjpbkC4yrQ+twfx+7-XvTzJ+3fkZ19xmm8g=8A@mail.gmail.com>
Date: Mon, 18 Jul 2022 12:53:56 +0200
In-Reply-To: <CAAAx-8LNouyevjpbkC4yrQ+twfx+7-XvTzJ+3fkZ19xmm8g=8A@mail.gmail.com>
 (Sam Li's message of "Tue, 12 Jul 2022 13:59:32 +0800")
Message-ID: <871quid73v.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sam Li <faithilikerun@gmail.com> writes:

> Markus Armbruster <armbru@redhat.com> =E4=BA=8E2022=E5=B9=B47=E6=9C=8812=
=E6=97=A5=E5=91=A8=E4=BA=8C 13:47=E5=86=99=E9=81=93=EF=BC=9A
>>
>> Sam Li <faithilikerun@gmail.com> writes:
>>
>> > This patch series adds support for zoned device to virtio-blk emulatio=
n. Zoned
>> > Storage can support sequential writes, which reduces write amplificati=
on in SSD,
>> > leading to higher write throughput and increased capacity.
>>
>> Forgive me if this has already been discussed, or is explained deeper in
>> the patch series...
>>
>> The commit message sounds like you're extending virtio-blk to optionally
>> emulate zoned storage.  Correct?
>
> Yes! The main purpose is to emulate zoned storage only for the zoned
> device files. Right now, QEMU sees those as regular block devices.
>
>> PATCH 1 adds a new block block device driver 'zoned_host_device', and
>> PATCH 9 exposes it in QAPI.  This is for passing through a zoned host
>> device, correct?
>
> Yes! It allows the guest os see zoned host device. It is still in
> development. Maybe the implementations will change later.

Your cover letter only mentions the virtio-blk part, not the
pass-through part.  Please correct that if you need to respin.


