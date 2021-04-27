Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C4C36CA2F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:16:03 +0200 (CEST)
Received: from localhost ([::1]:59486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRJa-0007Jp-LK
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbRFX-0004do-FY
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:11:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbRFO-0007Iw-8t
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:11:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619543501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yXs952rf28ZpNWrSgFSCNIUZGE+NI3yBI6opm2XyKXo=;
 b=BiQfcxleIinAYMFVIBbleH5r+0OEQ1q3Gc55jpfmJ21DLrWH7Qqf6RbltGvkE469OTNAvg
 I4aKDrHcfYK81aUsBYeCb+p0Iw+grbOPcZvLve1jCh6iGnQ+kmklIbs1Os5+qsHtucuXkL
 qd4fpSQd0fAzkwB6vgGgm4MapSrdrSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-s3pFPNl0NY-21qYVfqAfwA-1; Tue, 27 Apr 2021 13:11:38 -0400
X-MC-Unique: s3pFPNl0NY-21qYVfqAfwA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7184E801FCE;
 Tue, 27 Apr 2021 17:11:35 +0000 (UTC)
Received: from [10.10.112.236] (ovpn-112-236.rdu2.redhat.com [10.10.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9A7C6A251;
 Tue, 27 Apr 2021 17:11:27 +0000 (UTC)
Subject: Re: [PATCH 3/4] hw/block/fdc: Extract ISA floppy controllers to
 fdc-isa.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210415102321.3987935-1-philmd@redhat.com>
 <20210415102321.3987935-4-philmd@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <6b6838cd-62ce-9066-aa72-8c1b261f346d@redhat.com>
Date: Tue, 27 Apr 2021 13:11:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415102321.3987935-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 6:23 AM, Philippe Mathieu-Daudé wrote:
> Some machines use floppy controllers via the SysBus interface,
> and don't need to pull in all the ISA code.
> Extract the ISA specific code to a new unit: fdc-isa.c, and
> add a new Kconfig symbol: "FDC_ISA".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/block/fdc-isa.c   | 313 +++++++++++++++++++++++++++++++++++++++++++
>   hw/block/fdc.c       | 257 -----------------------------------
>   MAINTAINERS          |   1 +
>   hw/block/Kconfig     |   4 +
>   hw/block/meson.build |   1 +
>   hw/i386/Kconfig      |   2 +-
>   hw/isa/Kconfig       |   6 +-
>   hw/sparc64/Kconfig   |   2 +-
>   8 files changed, 324 insertions(+), 262 deletions(-)
>   create mode 100644 hw/block/fdc-isa.c
> 

LGTM but you'll want someone else to review the Kconfig changes.

Reviewed-by: John Snow <jsnow@redhat.com>


