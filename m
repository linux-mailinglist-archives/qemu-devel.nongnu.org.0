Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E38356F4B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 16:51:57 +0200 (CEST)
Received: from localhost ([::1]:59662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU9X9-0005TB-Kd
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 10:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lU9W9-00050U-3M
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 10:50:53 -0400
Received: from relay64.bu.edu ([128.197.228.104]:55011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lU9W6-0007wb-N7
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 10:50:52 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 137EnUJC008265
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 7 Apr 2021 10:49:33 -0400
Date: Wed, 7 Apr 2021 10:49:30 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH] tests/qtest: add one more test for the am53c974
Message-ID: <20210407144930.3332oqbwzidrou6z@mozz.bu.edu>
References: <bb30a76c-c758-6829-d3fe-3e2d01cf55b6@ilande.co.uk>
 <20210402162052.264952-1-alxndr@bu.edu>
 <0c024eae-533b-f3fa-8878-9f90d283eef9@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c024eae-533b-f3fa-8878-9f90d283eef9@ilande.co.uk>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210407 1404, Mark Cave-Ayland wrote:
> 
> Even though I can't reproduce the assert() here, looking at the code I think
> I can see how do_cmd is not being reset when a DMA command is issued. Does
> the following solve the outstanding fuzzer asserts?

Hi Mark,
I guess there must have been something timing-sensitive in the
reproducer... Too bad it didn't work.

> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 0037197bdb..b668acef82 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -357,6 +357,7 @@ static void handle_satn(ESPState *s)
>      cmdlen = get_cmd(s, ESP_CMDFIFO_SZ);
>      if (cmdlen > 0) {
>          s->cmdfifo_cdb_offset = 1;
> +        s->do_cmd = 0;
>          do_cmd(s);
>      } else if (cmdlen == 0) {
>          s->do_cmd = 1;
> @@ -390,6 +391,7 @@ static void handle_s_without_atn(ESPState *s)
>      cmdlen = get_cmd(s, ESP_CMDFIFO_SZ);
>      if (cmdlen > 0) {
>          s->cmdfifo_cdb_offset = 0;
> +        s->do_cmd = 0;
>          do_busid_cmd(s, 0);
>      } else if (cmdlen == 0) {
>          s->do_cmd = 1;
> 

With this applied, I don't see either of those asserts anymore.
Thank you!
-Alex

> 
> ATB,
> 
> Mark.

