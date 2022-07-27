Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46213583330
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 21:12:39 +0200 (CEST)
Received: from localhost ([::1]:37424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGmSU-0003JB-3f
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 15:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oGmKB-0006Zd-ES
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 15:04:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oGmK7-0004UK-Mn
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 15:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658948639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nAni1DVazzgY7pmVEIEYbtHygX+chAkfLSomdaNaCaw=;
 b=dde9VBDfVaQDzVK/Fqc+Qhn7Zc8kQh/4ki2yOMAZhfXZ0uDWqVn9bRXVnNf8HASdah80vl
 tZQ91fddJV7Tq/FdoC9eNoIRJMTOgi4JkIZ4MRUbeizBklUIhFHhN4TrqPMfteNdC1+Hmd
 NFk8xosSRfoMtRFoivNLq8IQ6KChzK4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-6cQqwcB3MSK-A2DmVzxd6w-1; Wed, 27 Jul 2022 15:03:54 -0400
X-MC-Unique: 6cQqwcB3MSK-A2DmVzxd6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4606B1019C8D;
 Wed, 27 Jul 2022 19:03:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0EB0141511F;
 Wed, 27 Jul 2022 19:03:50 +0000 (UTC)
Date: Wed, 27 Jul 2022 21:03:49 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org,
 richard.henderson@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, venture@google.com, Avi.Fishman@nuvoton.com,
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org,
 bin.meng@windriver.com, qemu-block@nongnu.org, thuth@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
Message-ID: <YuGMFRDj3tLOIJK7@redhat.com>
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ilnuda33.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Am 18.07.2022 um 11:49 hat Markus Armbruster geschrieben:
> Hao Wu <wuhaotsh@google.com> writes:
> 
> > This type is used to represent block devs that are not suitable to
> > be represented by other existing types.
> >
> > A sample use is to represent an at24c eeprom device defined in
> > hw/nvram/eeprom_at24c.c. The block device can be used to contain the
> > content of the said eeprom device.
> >
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> 
> Let me add a bit more history in the hope of helping other reviewers.
> 
> v3 of this series[1] used IF_NONE for the EEPROM device.
> 
> Peter Maydell questioned that[2], and we concluded it's wrong.  I wrote
> 
>     [A] board can use any traditional interface type.  If none of them
>     matches, and common decency prevents use of a non-matching one,
>     invent a new one.  We could do IF_OTHER.
> 
> Thomas Huth cleaned up the existing abuse of IF_NONE to use IF_PFLASH
> instead, in commit 6b717a8d44:
> 
>     hw/misc/sifive_u_otp: Use IF_PFLASH for the OTP device instead of IF_NONE
> 
>     Configuring a drive with "if=none" is meant for creation of a backend
>     only, it should not get automatically assigned to a device frontend.
>     Use "if=pflash" for the One-Time-Programmable device instead (like
>     it is e.g. also done for the efuse device in hw/arm/xlnx-zcu102.c).
> 
>     Since the old way of configuring the device has already been published
>     with the previous QEMU versions, we cannot remove this immediately, but
>     have to deprecate it and support it for at least two more releases.
> 
>     Signed-off-by: Thomas Huth <thuth@redhat.com>
>     Acked-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>     Reviewed-by: Markus Armbruster <armbru@redhat.com>
>     Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>     Message-id: 20211119102549.217755-1-thuth@redhat.com
>     Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> 
> An OTP device isn't really a parallel flash, and neither are eFuses.
> More fast-and-lose use of IF_PFLASH may exist in the tree, and maybe of
> other interface types, too.
> 
> This patch introduces IF_OTHER.  The patch after next uses it for an
> EEPROM device.
> 
> Do we want IF_OTHER?

What would the semantics even be? Any block device that doesn't pick up
a different category may pick up IF_OTHER backends?

It certainly feels like a strange interface to ask for "other" disk and
then getting as surprise what this other thing might be. It's
essentially the same as having an explicit '-device other', and I
suppose most people would find that strange.

> If no, I guess we get to abuse IF_PFLASH some more.
> 
> If yes, I guess we should use IF_PFLASH only for actual parallel flash
> memory going forward.  Cleaning up existing abuse of IF_PFLASH may not
> be worth the trouble, though.
> 
> Thoughts?

If the existing types aren't good enough (I don't have an opinion on
whether IF_PFLASH is a good match), let's add a new one. But a specific
new one, not just "other".

Kevin


