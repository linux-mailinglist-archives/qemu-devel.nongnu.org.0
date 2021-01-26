Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B72B303878
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 09:59:13 +0100 (CET)
Received: from localhost ([::1]:46238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4KBs-00007Q-EQ
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 03:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l4KAR-00086l-RQ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 03:57:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l4KAP-0001so-GG
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 03:57:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611651460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zFjDNju+IbFRC093skKqGkZD03+G17gmYSwMvLD7cOk=;
 b=QHHx8AeuoFHNk8bL7vU6kKuyY0nFW+wQSW0MmK5vlK4Hoa7ILFLaHzcapjQAcVPREthkSd
 UwTXszWxwOf5XsDvi5324xTtd9WPT40qrtK+Z7AklJ9ww7VzmFhExRRWjehWxqG1h0eyDu
 xquWSScH5ChvongRdom9RYCl4Nc+2c8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-c1256NHzMuyjUmtwUG29gA-1; Tue, 26 Jan 2021 03:57:38 -0500
X-MC-Unique: c1256NHzMuyjUmtwUG29gA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84F84879511;
 Tue, 26 Jan 2021 08:57:37 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-177.ams2.redhat.com
 [10.36.114.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D8035F9B7;
 Tue, 26 Jan 2021 08:57:33 +0000 (UTC)
Subject: Re: Thread safety of coroutine-sigaltstack
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
 <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
 <fc35da77-a5c2-08dd-05f2-0ebe781b338c@redhat.com>
 <CAFEAcA8GWMh=Cbrnw4+mzbG7gkHLkeQKXCTGxev6iYu8Q8TkxQ@mail.gmail.com>
 <bd4c2b77-11f5-88aa-ff9b-63f5782e99cd@redhat.com>
 <CAFEAcA_ZtJAQDiGRNeBzcmJ8mvrR-nDVGr=7ECHJmEogY-_T_Q@mail.gmail.com>
 <d797d8fd-5f50-89b2-d858-85573372ffb4@redhat.com>
 <74c3929b-555c-0e17-feaa-a8e893d2f9ed@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <1d7f7f7a-ab4f-d50b-3e3f-25f018021483@redhat.com>
Date: Tue, 26 Jan 2021 09:57:32 +0100
MIME-Version: 1.0
In-Reply-To: <74c3929b-555c-0e17-feaa-a8e893d2f9ed@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/25/21 23:45, Paolo Bonzini wrote:
> On 25/01/21 23:15, Laszlo Ersek wrote:
>>
>> - How does this case differ from the registration of types? type_init()
>> is a constructor function, and it generally ends up adding some
>> structures with function pointers (I reckon) via type_table_add(). The
>> main executable doesn't call into the device code directly -- only the
>> constructor function calls another function from the same module. The
>> main executable only goes through the registered type interfaces. How
>> does the linker know in that case to preserve the whole object?
> 
> We use either link_whole or extract_objects() for libraries that have
> type-registering constructors.

Thanks! The meson reference manual explains these.

Laszlo


