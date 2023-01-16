Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C764266B78B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 07:41:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHJAm-0001uU-Rh; Mon, 16 Jan 2023 01:40:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pHJAi-0001sq-AR
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 01:40:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pHJAd-0006RU-L1
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 01:40:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673851238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9G5EYjytyI/zZio3oHoqFxDIPqMosTbU5EuiK1tDZNk=;
 b=jEOt5uJzqfWhNUjvJCg8kcDBptd7vjzHzjd36d+4gwhN/C4yF19Lj2iTUWv6WkajWw7SSg
 LR1pmb6cpxpSuNUv7ATimV14Y9CyaVBTvpfvueI/m9A9ENfMtpoEYkhxnmCL+ifyQDDkL0
 xl/B6VTyn5bgFDe3XGjg/uSZoVsrk5I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-RfstTey5O1iS7T9WtDmpGQ-1; Mon, 16 Jan 2023 01:40:34 -0500
X-MC-Unique: RfstTey5O1iS7T9WtDmpGQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4544029ABA00;
 Mon, 16 Jan 2023 06:40:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CC6A492B10;
 Mon, 16 Jan 2023 06:40:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D62DF21E6A28; Mon, 16 Jan 2023 07:40:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  BALATON
 Zoltan <balaton@eik.bme.hu>,  Thomas Huth <thuth@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v2 01/21] hw/block: Rename TYPE_PFLASH_CFI02 'width'
 property as 'device-width'
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-2-philmd@linaro.org>
 <791cd783-4f27-dd18-c6bd-b9a316bb42cd@eik.bme.hu>
 <8507ed0d-fc90-8ce3-2d7d-82c106b20231@linaro.org>
 <CAFEAcA-h49eXgS63LARX0aMgBknNcaURGxqammQh5U9OZQ7v4A@mail.gmail.com>
Date: Mon, 16 Jan 2023 07:40:31 +0100
In-Reply-To: <CAFEAcA-h49eXgS63LARX0aMgBknNcaURGxqammQh5U9OZQ7v4A@mail.gmail.com>
 (Peter Maydell's message of "Fri, 13 Jan 2023 13:37:34 +0000")
Message-ID: <875yd7vv6o.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 9 Jan 2023 at 14:19, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>>
>> On 9/1/23 14:33, BALATON Zoltan wrote:
>> > On Mon, 9 Jan 2023, Philippe Mathieu-Daud=C3=A9 wrote:
>> >> Use the same property name than the TYPE_PFLASH_CFI01 model.
>> >
>> > Nothing uses it? Can this break command lines and if so do we need
>> > deprecation or some compatibility function until everybody changed the=
ir
>> > usage?
>>
>> Good point... I missed that :/
>
> That should not be possible, because the cfi02 device
> is a sysbus device that must be mapped into memory. There's
> no useful way to use it on the QEMU commandline; the only
> users are those creating it from C code within QEMU.

I'd say beware of -global, but "fortunately" cfi.pflash01 cannot work
with it, since its '.' sabotages the -global's syntax.

Related prior discussion in the cover letter of "[PATCH RFC 0/1] QOM
type names and QAPI" and the replies to it:

    Message-Id: <20210129081519.3848145-1-armbru@redhat.com>
    https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07541.html

The patch there became commit e178113ff6 "hw: Replace anti-social QOM
type names".

[...]


