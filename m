Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C9955B850
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:44:58 +0200 (CEST)
Received: from localhost ([::1]:50184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jQX-0007Bw-E5
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1o5jNp-0005E1-Mv; Mon, 27 Jun 2022 03:42:10 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:49510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1o5jNo-0000Lb-0z; Mon, 27 Jun 2022 03:42:09 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 039DD21B51;
 Mon, 27 Jun 2022 07:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656315724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vkUGsKr8fjOdjm2YRnkahiVhw1CvLkFJk1DG4EccaXo=;
 b=PuSVDLpoQbfwBDj8zuidXe4Y3t/XnnYEm59FP2Gptsb7yv5WCZr6EA8L27jPgm0p84Er94
 s3+TkZvXwck7UelhQ6TWrLpYr019hRTF+PuhdZZORA4Jdyx/wLYOP/CIs2Ew/7kbfRToQb
 pBIEd2Z+cejK6HYxsEeQHqDCdwMePWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656315724;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vkUGsKr8fjOdjm2YRnkahiVhw1CvLkFJk1DG4EccaXo=;
 b=dqesQnVKJk3GiySR5+4MLvJYU70682hmrcKapKvINQ60u18e32DDeyu6hmeSsW+Ui90BSQ
 PbNojT4P86zjFWBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C388713456;
 Mon, 27 Jun 2022 07:42:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mg5FL0tfuWLheAAAMHmgww
 (envelope-from <hare@suse.de>); Mon, 27 Jun 2022 07:42:03 +0000
Message-ID: <b0c0ec17-5c85-e95f-c0c1-35a9cc714c1d@suse.de>
Date: Mon, 27 Jun 2022 09:42:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC v3 5/5] qemu-iotests: add zone operation tests.
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-6-faithilikerun@gmail.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20220627001917.9417-6-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=hare@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/27/22 02:19, Sam Li wrote:
> ---
>   tests/qemu-iotests/tests/zoned.sh | 49 +++++++++++++++++++++++++++++++
>   1 file changed, 49 insertions(+)
>   create mode 100755 tests/qemu-iotests/tests/zoned.sh
> 
> diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests/zoned.sh
> new file mode 100755
> index 0000000000..262c0b5427
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/zoned.sh
> @@ -0,0 +1,49 @@
> +#!/usr/bin/env bash
> +#
> +# Test zone management operations.
> +#
> +
> +QEMU_IO="build/qemu-io"
> +IMG="--image-opts driver=zoned_host_device,filename=/dev/nullb0"
> +QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT
> +
> +echo "Testing a null_blk device"
> +echo "Simple cases: if the operations work"
> +sudo modprobe null_blk nr_devices=1 zoned=1
> +# hidden issues:
> +# 1. memory allocation error of "unaligned tcache chunk detected" when the nr_zone=1 in zone report
> +# 2. qemu-io: after report 10 zones, the program failed at double free error and exited.
> +echo "report the first zone"
> +sudo $QEMU_IO $IMG -c "zone_report 0 0 1"
> +echo "report: the first 10 zones"
> +sudo $QEMU_IO $IMG -c "zone_report 0 0 10"
> +
> +echo "open the first zone"
> +sudo $QEMU_IO $IMG -c "zone_open 0 0x80000"
> +echo "report after:"
> +sudo $QEMU_IO $IMG -c "zone_report 0 0 1"
> +echo "open the last zone"
> +sudo $QEMU_IO $IMG -c "zone_open 0x3e70000000 0x80000"
> +echo "report after:"
> +sudo $QEMU_IO $IMG -c "zone_report 0x3e70000000 0 2"
> +
> +echo "close the first zone"
> +sudo $QEMU_IO $IMG -c "zone_close 0 0x80000"
> +echo "report after:"
> +sudo $QEMU_IO $IMG -c "zone_report 0 0 1"
> +echo "close the last zone"
> +sudo $QEMU_IO $IMG -c "zone_close 0x3e70000000 0x80000"
> +echo "report after:"
> +sudo $QEMU_IO $IMG -c "zone_report 0x3e70000000 0 2"
> +
> +
> +echo "reset the second zone"
> +sudo $QEMU_IO $IMG -c "zone_reset 0x80000 0x80000"
> +echo "After resetting a zone:"
> +sudo $QEMU_IO $IMG -c "zone_report 0x80000 0 5"
> +
> +# success, all done
> +sudo rmmod null_blk
> +echo "*** done"
> +#rm -f $seq.full
> +status=0

Caveat: I'm not that familiar with qemu-iotests.
FWIW:

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), GF: Felix Imendörffer

