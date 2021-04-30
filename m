Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F1E36F9BE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:06:28 +0200 (CEST)
Received: from localhost ([::1]:60264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRuc-0004uR-JS
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcQrJ-0001q3-14
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:58:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcQrG-0005jb-E1
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619780333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d2th0M241SW5LdFO+4SYqEyNibCFCUrXOWdT/BD4gbE=;
 b=EIpNPyqMivaXUFEeEoCtzdJfIAognRiItyX44kN1ZmnRXcOUDwKkmzc9/oCXQ7AmqYHrUs
 VyAvoG9UIysjfR6tkS3ctFrzcZ1LN/mJ8jcMa6Sa3lUxVd2PtHWjru0wMgb5BpHc1aZSNl
 /69txOPke9X8E24DxUcK/axc/hUj8NE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-NrggcxSQMq-ApFV9Lofkig-1; Fri, 30 Apr 2021 06:58:51 -0400
X-MC-Unique: NrggcxSQMq-ApFV9Lofkig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C12718BA282;
 Fri, 30 Apr 2021 10:58:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F361C10016FC;
 Fri, 30 Apr 2021 10:58:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 78484113525D; Fri, 30 Apr 2021 12:58:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Gustavo Noronha Silva" <gustavo@noronha.eti.br>
Subject: Re: [PATCH 1/2] ui/cocoa: capture all keys and combos when mouse is
 grabbed
References: <20210429234705.83206-1-gustavo@noronha.eti.br>
 <20210429234705.83206-2-gustavo@noronha.eti.br>
 <87wnsk5jd3.fsf@dusky.pond.sub.org>
 <9e59000c-eb07-45b2-8b39-3a705561c440@www.fastmail.com>
 <52473af1-017d-41e9-95d1-4a33948bfd9d@www.fastmail.com>
Date: Fri, 30 Apr 2021 12:58:45 +0200
In-Reply-To: <52473af1-017d-41e9-95d1-4a33948bfd9d@www.fastmail.com> (Gustavo
 Noronha Silva's message of "Fri, 30 Apr 2021 07:10:28 -0300")
Message-ID: <87r1isxcm2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 'Gerd Hoffmann ' <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Gustavo Noronha Silva" <gustavo@noronha.eti.br> writes:

> Oh by the way,
>
> On Fri, Apr 30, 2021, at 7:02 AM, Gustavo Noronha Silva wrote:
>> >    # @full-grab: Capture all key presses, including system combos. This
>> >    #             requires accessibility permissions, since it performs
>> >    #             a global grab on key events. (default: off)
>> >    #             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
>
> I did not add a Since: here because I wasn't sure how that is handled. Should I add something or is that taken care of at the time of release somehow?

You should add (since 6.1) at the end, like this

# @full-grab: Capture all key presses, including system combos. This
#             requires accessibility permissions, since it performs
#             a global grab on key events. (default: off)
#             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
#             (Since 6.1)

Same for @swap-option-command in the next patch.

Glad you asked, I'm quite prone to not noticing missing these in
review...


