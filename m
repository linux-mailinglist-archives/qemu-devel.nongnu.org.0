Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91C865CCEC
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 07:18:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCx56-00041W-3W; Wed, 04 Jan 2023 01:16:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pCx4v-00040m-An
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 01:16:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pCx4s-0008EW-Gp
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 01:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672813001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ClrXD7L79iVgpB0eMwX/cIj9Gy2uQCqfraocOb6X5RI=;
 b=TR403yjjV8E5xFHVcGO5Qnm2BRQP/LUdDLJXzoh/W5p3g1RG2z3uIl9tnbgH9ARp6ebIxN
 XsPQ1I4E/v3fFz2KJmi3SMAbVMMe0c/R1pT8H4nAD0HKeWzEMFJ2elBUFS4eN+Q4wI/Cy+
 mAZ9rw9TI+zW/t9S6oCN27eOTaBDApA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-pTziVJfTPcK2Ts2LZm65gw-1; Wed, 04 Jan 2023 01:16:38 -0500
X-MC-Unique: pTziVJfTPcK2Ts2LZm65gw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFA32857D0D;
 Wed,  4 Jan 2023 06:16:37 +0000 (UTC)
Received: from [10.39.192.86] (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6C691731B;
 Wed,  4 Jan 2023 06:16:36 +0000 (UTC)
Message-ID: <b9e104b6-66cf-0335-7319-60e07789b224@redhat.com>
Date: Wed, 4 Jan 2023 07:16:35 +0100
MIME-Version: 1.0
Subject: Re: IO port write width clamping differs between TCG and KVM
Content-Language: en-US
From: Laszlo Ersek <lersek@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: "Ard Biesheuvel (kernel.org address)" <ardb@kernel.org>,
 qemu devel list <qemu-devel@nongnu.org>
References: <aaedee84-d3ed-a4f9-21e7-d221a28d1683@redhat.com>
 <ea401dd3-53f1-b27c-4a5a-9085ce5ab051@redhat.com>
In-Reply-To: <ea401dd3-53f1-b27c-4a5a-9085ce5ab051@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
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

On 1/4/23 07:06, Laszlo Ersek wrote:
> On 1/3/23 18:42, Laszlo Ersek wrote:
>> (resending with qemu-devel on CC; sorry!)
>>
>> Hi,
>>
>> this is with QEMU-7.2.
> 
> This is a regression. It works fine with QEMU-5.0. The regression has
> not been fixed since QEMU-7.2, as of master @ 222059a0fccf ("Merge tag
> 'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu into staging",
> 2022-12-21).
> 
> I'm bisecting.

Something's definitely going on with TCG. At v6.0.0-1974-ge0da9171e02f,
I cannot even *start* the domain I'm using for testing, because QEMU
errors out with:

qemu-system-i386: -accel tcg: failed to map shared memory for execute:
Permission denied

Laszlo


