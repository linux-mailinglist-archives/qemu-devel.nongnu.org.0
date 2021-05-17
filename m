Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF34383C18
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:17:33 +0200 (CEST)
Received: from localhost ([::1]:53718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liho4-00072P-On
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lihbe-0004iz-8u
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:04:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lihba-0008PG-Nd
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:04:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621274678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ZXSRuy2X+Df7ZZbouzQfbOREXQBYJ1+DpNado94sn0=;
 b=iAUx4bmnw2gXk+fejAMzH98H8+O2wqZ4ymhHACXR6u+1ad29uRUsy7wns7BFJcCE8QhE70
 Rzu6StF3sGnOSqYwYs6v4TOtKBuhLw4kN70Ts+rVaLNCVUNkflk+FkBxvfpDUpw3nsVp4C
 6o8LHrNnrirULaRqRko5bXLUqcVeoLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-j7IEqEzAMr2eYEe2-TNO7g-1; Mon, 17 May 2021 14:04:34 -0400
X-MC-Unique: j7IEqEzAMr2eYEe2-TNO7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A36C107ACE3;
 Mon, 17 May 2021 18:04:33 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 053755C1D1;
 Mon, 17 May 2021 18:04:32 +0000 (UTC)
Subject: Re: [PATCH v3 3/8] hw/block/fdc: Extract ISA floppy controllers to
 fdc-isa.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210517174947.1199649-1-philmd@redhat.com>
 <20210517174947.1199649-4-philmd@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <239bdcfb-1172-c27f-7cd3-2bb86c8beb3d@redhat.com>
Date: Mon, 17 May 2021 14:04:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517174947.1199649-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

On 5/17/21 1:49 PM, Philippe Mathieu-Daudé wrote:
> Some machines use floppy controllers via the SysBus interface,
> and don't need to pull in all the ISA code.
> Extract the ISA specific code to a new unit: fdc-isa.c, and
> add a new Kconfig symbol: "FDC_ISA".
> 
> Reviewed-by: John Snow <jsnow@redhat.com>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Sorry, I'm seeing build failures on this for patch #03:

../../configure --enable-docs; and make -j13

...

/usr/bin/ld: libcommon.fa.p/hw_isa_isa-superio.c.o: in function 
`isa_superio_realize':
/home/jsnow/src/qemu/bin/git/../../hw/isa/isa-superio.c:132: undefined 
reference to `isa_fdc_init_drives'
collect2: error: ld returned 1 exit status


--js


