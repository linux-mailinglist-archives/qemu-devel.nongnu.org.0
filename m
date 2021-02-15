Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6C631B56F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 07:41:36 +0100 (CET)
Received: from localhost ([::1]:51378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBXZe-0001Y4-Sr
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 01:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lBXYN-0000hS-Q8
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 01:40:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lBXYI-0007QH-Py
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 01:40:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613371207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+p0Y8GedPtn/71Oz16Vt8jnlrkYwKc6sVyJvPT85Rs=;
 b=ViPB5ngR03JVCSUyQkhZpvGwmeaaZ50W8a7CNDqF89tabaAU44NfPJ88kNPGZXrtxJOaLG
 Lf4NG4s0eDvBnit91gc2KfNnkhn6xypfFu56ItGAEtHX8NST0ud5LrFUzGGKxWWmBCC4Sa
 6wdTtPNxwHxXfjsb+FtzxwuwsK53xSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-Bj7nuoi1N-SI30x2k0X2zQ-1; Mon, 15 Feb 2021 01:40:03 -0500
X-MC-Unique: Bj7nuoi1N-SI30x2k0X2zQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BEA2192AB79;
 Mon, 15 Feb 2021 06:40:02 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-80.ams2.redhat.com [10.36.112.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00DF670953;
 Mon, 15 Feb 2021 06:40:00 +0000 (UTC)
Subject: Re: Qemu mipssim patches, mips malta and virtio bugs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Reinoud Zandijk <reinoud@NetBSD.org>
References: <20210211153746.GA25676@dropje.13thmonkey.org>
 <acf26892-c47c-7059-f3d1-8ef5bdcdcb8b@amsat.org>
 <2951213f-7610-857d-c20c-12bc26877490@amsat.org>
 <YCekTE6Aik0OoLLg@diablo.13thmonkey.org>
 <b86fcf3d-8be4-0d6e-e85b-7b4137fc7238@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4e4e5704-ac91-f577-8b7b-ce5393cc98cd@redhat.com>
Date: Mon, 15 Feb 2021 07:39:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b86fcf3d-8be4-0d6e-e85b-7b4137fc7238@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/02/2021 14.14, Philippe Mathieu-Daudé wrote:
> On 2/13/21 11:05 AM, Reinoud Zandijk wrote:
>> On Fri, Feb 12, 2021 at 10:44:55AM +0100, Philippe Mathieu-Daudé wrote:
>>>>> i'd like to get the following simple patches to the MIPS/mipssim target adding
>>>>> virtio-mmio devices to it.
>>>
>>> Please submit your patches as a series so we can review them on
>>> the list:
>>> https://wiki.qemu.org/Contribute/SubmitAPatch#Use_git_format-patch
>>
>> Oh thanks, i didn't know that; i've created a new patch with the OR gate you
>> suggested. We deliberated about the change here and we'll at least keep it
>> here locally for testing and profiling code until a real `virt' platform is
>> developed for MIPS. Until then it would IMHO be a good expansion to mipssim.
>> I'll try to get a proper patch posted on the list :)
> 
> What I forgot to mention is that QEMU aims to keep models the closer
> to the hardware, so modifying MIPSsim to some Frankenstein is unlikely
> to be accepted.

Well, mipssim never was a real hardware, in fact it is already some kind of 
"virt" machine. So you could theoretically also extend this machine instead 
of introducing a new one (but I'm not a MIPS guy, so no clue what makes more 
sense).

  Thomas


