Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7AA577F15
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 11:55:08 +0200 (CEST)
Received: from localhost ([::1]:48156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDNT2-0002sy-0e
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 05:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDNQI-0000N1-8E
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:52:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDNQG-0003Qy-RR
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658137936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ODB4k5uWd/SSmqTwO869KXlx+d0XUhV3Gqn6FfdXG5I=;
 b=dBAFDlOtoCsHABX+IIs28TCvKZlLoUKWp5fW8xfk+SI9A6vQx5nN45V8z7E+gPdWu5P0sp
 /hulXIV015HgE2XG1yRuxyoRsNY5Q8uF2+Kp1veSydV2Uh+ampzIUH/X8iN+sGDWeLyI5r
 vHW8FGXCRbHgGxGL+bCF3qFeYp+KevA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-ciLdc-9UMpydDA7A38cIkQ-1; Mon, 18 Jul 2022 05:52:03 -0400
X-MC-Unique: ciLdc-9UMpydDA7A38cIkQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F61C85A589;
 Mon, 18 Jul 2022 09:52:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D89FE1121314;
 Mon, 18 Jul 2022 09:52:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CC29221E690D; Mon, 18 Jul 2022 11:51:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Hao Wu <wuhaotsh@google.com>
Cc: peter.maydell@linaro.org,  richard.henderson@linaro.org,
 qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  venture@google.com,
 Avi.Fishman@nuvoton.com,  kfting@nuvoton.com,  hskinnemoen@google.com,
 f4bug@amsat.org,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 thuth@redhat.com
Subject: Re: [PATCH v5 7/8] hw/arm: Set drive property for at24c eeprom
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-8-wuhaotsh@google.com>
Date: Mon, 18 Jul 2022 11:51:59 +0200
In-Reply-To: <20220714182836.89602-8-wuhaotsh@google.com> (Hao Wu's message of
 "Thu, 14 Jul 2022 11:28:35 -0700")
Message-ID: <87edyid9z4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Hao Wu <wuhaotsh@google.com> writes:

> This patch allows the user to attach an external drive as a property
> for an onboard at24c eeprom device.

What's the contents of the EEPROM before the patch?

I guess the patch lets users replace that contents.  Why would a user
want to do that?

>                                     It uses an unit number to
> distinguish different devices.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>


