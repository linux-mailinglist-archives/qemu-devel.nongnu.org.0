Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03ED697BED
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 13:36:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSH0V-0007GY-Sq; Wed, 15 Feb 2023 07:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSH0P-0007CX-9s
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:35:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSH0M-0001y3-QX
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:35:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676464520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hTZA01o0W3zEWuP6jbHAq+qLfMaXTDP9wKXEtqjXo+4=;
 b=eSTkrV2XKsh4HBYNZ/Fy6KI3Up9itQouTYwxErMITPNWJGtA6XN+oCguqIXMVqF4qhtt6m
 xzzS6loYK0hSy3VyzRd/SB6Gr77bauEKTNbhreWxhlMWf0b+utD1O88rBMkksYxEpQxm7w
 dSTcJAJMrD17/sTOqg7wIM48/dOEv0I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-AODznpsLPxmquydm31z7Ng-1; Wed, 15 Feb 2023 07:35:13 -0500
X-MC-Unique: AODznpsLPxmquydm31z7Ng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFAC185D067;
 Wed, 15 Feb 2023 12:35:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C094B2026D4B;
 Wed, 15 Feb 2023 12:35:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B9C3B21E6A1F; Wed, 15 Feb 2023 13:35:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: <qemu-arm@nongnu.org>,  <qemu-devel@nongnu.org>,
 <qemu-block@nongnu.org>,  Joel Stanley <joel@jms.id.au>,  Andrew Jeffery
 <andrew@aj.id.au>,  Peter Maydell <peter.maydell@linaro.org>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 0/8] aspeed: I2C fixes, -drive removal (first step)
References: <20230214171830.681594-1-clg@kaod.org>
 <87fsb7e8m3.fsf@pond.sub.org>
 <9dacf24f-3797-591b-b2af-ae08a0c01259@kaod.org>
Date: Wed, 15 Feb 2023 13:35:11 +0100
In-Reply-To: <9dacf24f-3797-591b-b2af-ae08a0c01259@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
 Goater"'s message of "Wed, 15 Feb 2023 09:32:32 +0100")
Message-ID: <87fsb79ke8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 2/15/23 07:38, Markus Armbruster wrote:
>> C=C3=A9dric Le Goater <clg@kaod.org> writes:
>>=20
>>> Hello,
>>>
>>> This series starts with a first set of patches fixing I2C slave mode
>>> in the Aspeed I2C controller, a test device and its associated test in
>>> avocado.
>>>
>>> Follow some cleanups which allow the use of block devices instead of
>>> drives. So that, instead of specifying :
>>>
>>>    -drive file=3D./flash-ast2600-evb,format=3Draw,if=3Dmtd
>>>    -drive file=3D./ast2600-evb.pnor,format=3Draw,if=3Dmtd
>>>    ...
>>>
>>> and guessing from the order which bus the device is attached to, we
>>> can use :
>>>
>>>    -blockdev node-name=3Dfmc0,driver=3Dfile,filename=3D./bmc.img
>>>    -device mx66u51235f,bus=3Dssi.0,drive=3Dfmc0
>>>    -blockdev node-name=3Dfmc1,driver=3Dfile,filename=3D./bmc-alt.img
>>>    -device mx66u51235f,bus=3Dssi.0,drive=3Dfmc1
>>>    -blockdev node-name=3Dpnor,driver=3Dfile,filename=3D./pnor
>>>    -device mx66l1g45g,bus=3Dssi.1,drive=3Dpnor
>>>    ...
>>>
>>> It is not perfect, the CS index still depends on the order, but it is
>>> now possible to run a machine without -drive ...,if=3Dmtd.
>>
>> Lovely!
>>
>> Does this cover all uses of IF_MTD, or only some?
>
> All use for default devices in the aspeed machines. I think most
> machines use IF_MTD in a similar way.
>
> Yet, one extra use of IF_MTD is to fill a ROM region with the first
> drive contents. It avoids fetching instructions from the SPI flash
> mapping and speeds up boot quite significantly.
>
> Once the default flash devices are created and attached to their
> drive, it is possible to query the block backend without the
> drive_get() API. I have a couple of patches for it and it shouldn't
> be a problem.
>>
>>> This lacks the final patch enabling the '-nodefaults' option by not
>>> creating the default devices if specified on the command line. It
>>> needs some more evaluation of the possible undesired effects.
>>
>> Are you thinking of something similar to the default CD-ROM, i.e. use
>> default_list to have -device suppress a certain kind of default devices,
>> and also have -nodefaults suppress them all?
>
> I would have -nodefaults suppress all flash devices. There are also
> I2C devices but they are less problematic for the machine definition.
> (Well, eeprom contents can be complex to handle)
>
> The next step would be to get rid of the drive_get(IF_MTD) internal
> API, which means finding a way to attach block backend devices from
> the command line to the default flash devices. This should be done
> at machine init time and the blockdev should have some 'bus@addr'
> identifier. I lack the knowledge on how this could be done.

Possibly interesting for you: commit e0561e60f17 "hw/arm/virt: Support
firmware configuration with -blockdev".


