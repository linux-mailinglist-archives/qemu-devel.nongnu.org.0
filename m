Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F1033F556
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:21:18 +0100 (CET)
Received: from localhost ([::1]:39290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYv7-0007kL-Ka
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lMYPH-0002Ui-W6
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:48:24 -0400
Received: from relay64.bu.edu ([128.197.228.104]:43446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lMYPC-0006L1-2N
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:48:23 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 12HFlZq7020494
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 17 Mar 2021 11:47:38 -0400
Date: Wed, 17 Mar 2021 11:47:35 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 3/4] esp: ensure cmdfifo is not empty and current_dev is
 non-NULL
Message-ID: <20210317154735.ieygunlmofefebhh@mozz.bu.edu>
References: <20210316233024.13560-1-mark.cave-ayland@ilande.co.uk>
 <20210316233024.13560-4-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316233024.13560-4-mark.cave-ayland@ilande.co.uk>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark,

On 210316 2330, Mark Cave-Ayland wrote:
> When about to execute a SCSI command, ensure that cmdfifo is not empty and
> current_dev is non-NULL. This can happen if the guest tries to execute a TI
> (Transfer Information) command without issuing one of the select commands
> first.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1910723

^ Can't reproduce this one anymore

> Buglink: https://bugs.launchpad.net/qemu/+bug/1909247

However, this still seems to cause a UAF:
https://bugs.launchpad.net/qemu/+bug/1909247/comments/6

-Alex

> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 3 +++
>  1 file changed, 3 insertions(+)

