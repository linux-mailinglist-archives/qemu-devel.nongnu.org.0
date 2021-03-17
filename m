Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B28733F72B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:36:36 +0100 (CET)
Received: from localhost ([::1]:39082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMa5y-0003RA-VC
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lMZoF-0005EA-9T
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:18:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lMZoA-0007UK-5J
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:18:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616001488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hJT4yM1+7mtMnAOaQeH/2zqwwPDrFYJP8P/iphHWKX0=;
 b=G+Rsn5CQkYiB7Q8NTadzkouscHSMYlWa9jj7r8msOuBo0LlPd6osPSQaZh/mk7zMKPb3HO
 zz5/Syi1ihNXT6CdSwyn23AyhVLJhUjzjRsjMP8hG3VbYUUYrizmMTekr9lSjkgOwQoMMq
 h+5CwfB3mX20/J6oNvSqvDf0TLwcrJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-27LbqBtxN7Wf3Jlj_tMjCQ-1; Wed, 17 Mar 2021 13:18:06 -0400
X-MC-Unique: 27LbqBtxN7Wf3Jlj_tMjCQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C7DD801817;
 Wed, 17 Mar 2021 17:18:05 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-112.ams2.redhat.com
 [10.36.113.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F7715C5DF;
 Wed, 17 Mar 2021 17:17:57 +0000 (UTC)
Subject: Re: [RFC PATCH 5/8] qtest/libqos: Restrict CPU I/O instructions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210314232913.2607360-1-f4bug@amsat.org>
 <20210314232913.2607360-6-f4bug@amsat.org>
 <b1dc01eb-0090-e47e-2731-c1920d9cda42@redhat.com>
 <66630c68-d8ff-45ca-24e6-bbef1fc566ee@linaro.org>
 <235ffc43-288b-85aa-29f9-8f23e596674b@amsat.org>
 <b5d2af4c-9288-91cd-5352-4ef1dff18742@redhat.com>
 <01d3a3b3-ae23-e292-839d-27bda71324c2@amsat.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <79753a45-2862-ed4e-2be0-fd04799d05c2@redhat.com>
Date: Wed, 17 Mar 2021 18:17:56 +0100
MIME-Version: 1.0
In-Reply-To: <01d3a3b3-ae23-e292-839d-27bda71324c2@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/17/21 17:24, Philippe Mathieu-Daudé wrote:
> On 3/17/21 4:59 PM, Laszlo Ersek wrote:

>> If this is about an "IO Bus" or "IO instructions", then we should call
>> the macro TARGET_HAS_IO_BUS or "TARGET_ISA_HAS_IO" (or
>> "TARGET_HAS_IO_INSNS"), or something like those. My only confusion was
>> about the "IO Port" expression in the macro name; the idea is OK from my
>> perspective otherwise.
> 
> TARGET_HAS_IO_BUS / TARGET_HAS_IO_INSNS LGTM
> (ISA bus is not particularly relevant for the AVR target).

Apologies for being unclear -- by "ISA", I meant "instruction set
architecture".

So "TARGET_ISA_HAS_IO" was a synonym for "TARGET_HAS_IO_INSNS" -- i.e.,
no IO-specific machine code instructions.

> Thanks for the feedback :)

My pleasure :)
Laszlo


