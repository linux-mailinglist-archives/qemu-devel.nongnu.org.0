Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F41FB383CCD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:58:55 +0200 (CEST)
Received: from localhost ([::1]:38408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiS7-0007iP-1b
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lihqA-0005Il-IH
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:19:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lihq5-00074Y-Dp
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621275576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NckmnCAsXRpN8HWkv3W6yagA9yqGO4hveznHN168K0c=;
 b=P8yoHJB/2AO/FjF5k8Xx0TnePO6Bv8LWzwArUdGETE7+4fUjYpc4q/nGZVkCcaZnX2HQFi
 loQguj9QUZUm2CNg+/Dy6NilMWf9FmgiJkuxTSTF/L83U2jer1z/2zBEbSk+ZUGTp2QiVD
 otPV3aYgxaE2bZrVyvLrzcgKRtyU+gI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-oPOt8qH7NS-N1CQbFoflDg-1; Mon, 17 May 2021 14:19:33 -0400
X-MC-Unique: oPOt8qH7NS-N1CQbFoflDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A99E801B16;
 Mon, 17 May 2021 18:19:32 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A73CC60C04;
 Mon, 17 May 2021 18:19:31 +0000 (UTC)
Subject: Re: [PATCH v3 3/8] hw/block/fdc: Extract ISA floppy controllers to
 fdc-isa.c
From: John Snow <jsnow@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210517174947.1199649-1-philmd@redhat.com>
 <20210517174947.1199649-4-philmd@redhat.com>
 <239bdcfb-1172-c27f-7cd3-2bb86c8beb3d@redhat.com>
Message-ID: <14574bd1-6658-dbf3-0591-94e8168e89ea@redhat.com>
Date: Mon, 17 May 2021 14:19:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <239bdcfb-1172-c27f-7cd3-2bb86c8beb3d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 2:04 PM, John Snow wrote:
> On 5/17/21 1:49 PM, Philippe Mathieu-Daudé wrote:
>> Some machines use floppy controllers via the SysBus interface,
>> and don't need to pull in all the ISA code.
>> Extract the ISA specific code to a new unit: fdc-isa.c, and
>> add a new Kconfig symbol: "FDC_ISA".
>>
>> Reviewed-by: John Snow <jsnow@redhat.com>
>> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Sorry, I'm seeing build failures on this for patch #03:
> 
> ../../configure --enable-docs; and make -j13
> 
> ...
> 
> /usr/bin/ld: libcommon.fa.p/hw_isa_isa-superio.c.o: in function 
> `isa_superio_realize':
> /home/jsnow/src/qemu/bin/git/../../hw/isa/isa-superio.c:132: undefined 
> reference to `isa_fdc_init_drives'
> collect2: error: ld returned 1 exit status
> 
> 

It appears to show up if you enable the mips-softmmu target.

> --js


