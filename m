Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917F233371A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:15:45 +0100 (CET)
Received: from localhost ([::1]:54424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJu0O-0005HM-Kl
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lJtyi-0003yR-4t
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:14:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lJtyf-0002pT-9N
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615364035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0RO6DJtzxn8KS8e2sc/XE0BMoC4uzgPjpZYSmpSBX2w=;
 b=f/yxHUKeaU4DtrThkuGt4vGD7quKWgoupRtoYN3yRclGVz4byGZBAnjw62HLjt9PR7hzLN
 TN+cz2Ut4zIlgF+9te/o348IC09dBfgXbvUDbfxve94lrRJkBoRS7ZKw2A886k/qffi8Od
 eY3r1u6gWOSOBik7CoDHblQE0pYTudE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-5NdapzmdNHGWae-SqSAFxw-1; Wed, 10 Mar 2021 03:13:54 -0500
X-MC-Unique: 5NdapzmdNHGWae-SqSAFxw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09A9F80432D;
 Wed, 10 Mar 2021 08:13:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD0F65D9DB;
 Wed, 10 Mar 2021 08:13:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 370CF1132C12; Wed, 10 Mar 2021 09:13:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 3/4] fdc: Inline fdctrl_connect_drives() into
 fdctrl_realize_common()
References: <20210309161214.1402527-1-armbru@redhat.com>
 <20210309161214.1402527-4-armbru@redhat.com>
 <ebe654b3-aafb-658d-ba80-ebc3e60d59a5@linaro.org>
Date: Wed, 10 Mar 2021 09:13:48 +0100
In-Reply-To: <ebe654b3-aafb-658d-ba80-ebc3e60d59a5@linaro.org> (Richard
 Henderson's message of "Tue, 9 Mar 2021 12:25:18 -0600")
Message-ID: <87lfav77er.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> On 3/9/21 8:12 AM, Markus Armbruster wrote:
>> @@ -2565,6 +2551,7 @@ static void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl,
>>                                     Error **errp)
>>   {
>>       int i, j;
>> +    FDrive *drive;
>>       static int command_tables_inited = 0;
>>         if (fdctrl->fallback == FLOPPY_DRIVE_TYPE_AUTO) {
>> @@ -2604,7 +2591,13 @@ static void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl,
>>       }
>>         floppy_bus_create(fdctrl, &fdctrl->bus, dev);
>> -    fdctrl_connect_drives(fdctrl, dev, errp);
>> +
>> +    for (i = 0; i < MAX_FD; i++) {
>> +        drive = &fdctrl->drives[i];
>
> FWIW, the declaration could be local to this loop.

Old-school habits.  John, got a preference?


