Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C29A2F3C94
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 00:38:08 +0100 (CET)
Received: from localhost ([::1]:37510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzTEl-0004XM-FP
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 18:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzTCY-0003Fm-EB
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 18:35:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzTCV-0002dv-1g
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 18:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610494545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oSwIJ7h2r/lzqzknP//2YOOCYZu8tyQjslhkvE0oFl0=;
 b=GfB4T7hjv3lDiqCkRZRCIMpUaGHKxXpQ+r+0lKA8g3PyrtuqhGWoL8XS5JqYfAI/rUAI1m
 eEC/fKvnkyR1T2B/J72yex3Rig/tes4n0+EU2ZnM03xlkpMgGei1fVF0R6+YgvDDEo0Ivg
 AybYcYq36q0PsKpUs2A7oSE6Ynev7zI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-3vk28TWrNZi10GKnjYQspQ-1; Tue, 12 Jan 2021 18:35:42 -0500
X-MC-Unique: 3vk28TWrNZi10GKnjYQspQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99CD9802B40;
 Tue, 12 Jan 2021 23:35:40 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C1CA60BFA;
 Tue, 12 Jan 2021 23:35:36 +0000 (UTC)
Subject: Re: [PATCH] decodetree: Open files with encoding='utf-8'
To: Eduardo Habkost <ehabkost@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
References: <20210108151632.277015-1-f4bug@amsat.org>
 <2cde5504-9df6-93fb-a014-daee2b907fde@linux.vnet.ibm.com>
 <20210112211127.GC4161@habkost.net>
From: John Snow <jsnow@redhat.com>
Message-ID: <f3fe6cae-41bc-31b9-c26f-893c78a8c9b0@redhat.com>
Date: Tue, 12 Jan 2021 18:35:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112211127.GC4161@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 4:11 PM, Eduardo Habkost wrote:
> [CCing John, Wainer]
> 
> On Fri, Jan 08, 2021 at 05:51:41PM -0500, Daniele Buono wrote:
>> I had a similar issue in the past with the acceptance tests.
>> Some VMs send UTF-8 output in their console and the acceptance test
>> script would bail out if the locale was not UTF-8.
>>
>> I sent a patch on the ml but it probably got lost:
>> https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg06086.html
>>
>> I can re-spin it if you guys are interested
> 
> The mbox at
> https://lore.kernel.org/qemu-devel/20200721125522.20511-1-dbuono@linux.vnet.ibm.com/
> can still be applied cleanly, I don't think you need to resubmit.
> 
> However, we have no owner for tests/acceptance/avocado_qemu in
> MAINTAINERS.  Is anybody currently taking care of
> tests/acceptance patches and making sure they are merged?
> 

I touch these tests sometimes, but I know very little about avocado 
overall, so I don't think it's going to be me taking point here.

(I don't mind taking a reviewer stanza for something like *.py, though.)

Acceptance (Integration) Testing with the Avocado framework
W: https://trello.com/b/6Qi1pxVn/avocado-qemu
R: Cleber Rosa <crosa@redhat.com>
R: Philippe Mathieu-Daudé <philmd@redhat.com>
R: Wainer dos Santos Moschetta <wainersm@redhat.com>
S: Odd Fixes
F: tests/acceptance/

Why is this only "Odd Fixes"? Isn't it new within the last ~2y? The 
avocado_qemu module itself was largely written by Cleber, Philippe and Caio.

--js


