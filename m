Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4C933FC1C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 01:15:09 +0100 (CET)
Received: from localhost ([::1]:35364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMgJa-0001OQ-Vt
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 20:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lMgID-0000LF-7R
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 20:13:37 -0400
Received: from relay64.bu.edu ([128.197.228.104]:48304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lMgIB-0003w6-Ai
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 20:13:36 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 12I0Ct3j004577
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 17 Mar 2021 20:12:58 -0400
Date: Wed, 17 Mar 2021 20:12:55 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 5/6] esp: always check current_req is not NULL before
 use in DMA callbacks
Message-ID: <20210318001255.vnfg2pq6q4k4iqib@mozz.bu.edu>
References: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
 <20210317230223.24854-6-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317230223.24854-6-mark.cave-ayland@ilande.co.uk>
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210317 2302, Mark Cave-Ayland wrote:
> After issuing a SCSI command the SCSI layer can call the SCSIBusInfo .cancel
> callback which resets both current_req and current_dev to NULL. If any data
> is left in the transfer buffer (async_len != 0) then the next TI (Transfer
> Information) command will attempt to reference the NULL pointer causing a
> segfault.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1910723
> Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Tested-by: Alexander Bulekov <alxndr@bu.edu>

