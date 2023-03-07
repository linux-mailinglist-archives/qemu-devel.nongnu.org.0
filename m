Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AEF6AE0FC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:45:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXcP-0007nj-Nj; Tue, 07 Mar 2023 08:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pZXcN-0007nC-Gx
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:44:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pZXcL-0006O5-Qr
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:44:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678196673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dmiQHpWKfZyLhC5SVl0VMC30MyvCnk/7F+JlRSX6IZ0=;
 b=TxH8P045fb028t9Cl9KOU86AYENGZMVC2HDfF5XAJKKO7/wRd5rWmyfV8/bt3PQMI4xFTa
 iHNBcDcBjk8binvIzhJsX6McpZ0JiMURAh2IjCvDGWgNcF2chEZyrMrP8zy9IZl9EbBHXO
 88C7bnG+LwN1l6edsH0pbhAo4Rw4mBM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-D1U0RYS9MBCsjP7irAAc3A-1; Tue, 07 Mar 2023 08:44:31 -0500
X-MC-Unique: D1U0RYS9MBCsjP7irAAc3A-1
Received: by mail-ed1-f69.google.com with SMTP id
 ee15-20020a056402290f00b004f059728d91so1991220edb.23
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 05:44:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678196671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dmiQHpWKfZyLhC5SVl0VMC30MyvCnk/7F+JlRSX6IZ0=;
 b=khsWB4JWTNRWjoisQWqvZhTAbi518Eh+TWErf6dgHQE1iOy1yUiBMOnvN6iuT9vBHU
 ewp3v88dvZ30jFoa08AP9rtCMzRkrnPRkfMN+XiSI4DLaQElTVm1NXLpLFWcSF29q9gm
 w0rdF3PszU3WF8Uw0ki2EAE8mKPXPLZ4C0QbJVzsztFGMa45wVcOZpuMpCgZgC2L25zg
 kb3Z5fP3j8iRTTp45bedxgBEHjqEgOoHLFWa+K+iq8BOPiRWFW7D4BrP0fpTTx41uUaP
 jiOQh5vAv4sOEfB7XXpUUzQey73Tyhm3cF2YkicENrPngio2Y6dVJxg7JU1Z6e0yuags
 dg9Q==
X-Gm-Message-State: AO0yUKU0w9KgaHEWAMBPSkCWwJdsyvHIkN4yH/pYLzOqLcEBy2bBrTPt
 RmLjTL5Lxr6h3Ad4PTZ2/5GZaiFRGBWG2yFgZUG5lItRsUF1cWLDS0N/73T2QXoG/eMDNDXgfq8
 lZnauc1d6j+DlKfo=
X-Received: by 2002:a17:907:961c:b0:8b1:811e:cd30 with SMTP id
 gb28-20020a170907961c00b008b1811ecd30mr18455616ejc.22.1678196670815; 
 Tue, 07 Mar 2023 05:44:30 -0800 (PST)
X-Google-Smtp-Source: AK7set9v9uFbT1blvcyGBi/2zVQsCSG9jPURmeS3XNCJUaX+6+dHBBdESdxFYfOqMP5Pn3ET4mX7gw==
X-Received: by 2002:a17:907:961c:b0:8b1:811e:cd30 with SMTP id
 gb28-20020a170907961c00b008b1811ecd30mr18455593ejc.22.1678196670529; 
 Tue, 07 Mar 2023 05:44:30 -0800 (PST)
Received: from ?IPV6:2003:cf:d729:7d22:58d:9cdf:192f:c786?
 (p200300cfd7297d22058d9cdf192fc786.dip0.t-ipconnect.de.
 [2003:cf:d729:7d22:58d:9cdf:192f:c786])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a50d507000000b004acc6cbc451sm6780774edi.36.2023.03.07.05.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:44:30 -0800 (PST)
Message-ID: <97638730-0dfa-918b-3c66-7874171b3e5c@redhat.com>
Date: Tue, 7 Mar 2023 14:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Deadlock with ide_issue_trim and draining
Content-Language: en-US
To: Fiona Ebner <f.ebner@proxmox.com>, QEMU Developers <qemu-devel@nongnu.org>
Cc: "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <1e3813b6-f2d0-9bd5-a270-e5835c13b495@proxmox.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <1e3813b6-f2d0-9bd5-a270-e5835c13b495@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07.03.23 13:22, Fiona Ebner wrote:
> Hi,
> I am suspecting that commit 7e5cdb345f ("ide: Increment BB in-flight
> counter for TRIM BH") introduced an issue in combination with draining.
>
>  From a debug session on a costumer's machine I gathered the following
> information:
> * The QEMU process hangs in aio_poll called during draining and doesn't
> progress.
> * The in_flight counter for the BlockDriverState is 0 and for the
> BlockBackend it is 1.
> * There is a blk_aio_pdiscard_entry request in the BlockBackend's
> queued_requests.
> * The drive is attached via ahci.
>
> I suspect that something like the following happened:
>
> 1. ide_issue_trim is called, and increments the in_flight counter.
> 2. ide_issue_trim_cb calls blk_aio_pdiscard.
> 3. somebody else starts draining.
> 4. ide_issue_trim_cb is called as the completion callback for
> blk_aio_pdiscard.
> 5. ide_issue_trim_cb issues yet another blk_aio_pdiscard request.
> 6. The request is added to the wait queue via blk_wait_while_drained,
> because draining has been started.
> 7. Nobody ever decrements the in_flight counter and draining can't finish.

Sounds about right.

> The issue occurs very rarely and is difficult to reproduce, but with the
> help of GDB, I'm able to do it rather reliably:
> 1. Use GDB to break on blk_aio_pdiscard.
> 2. Run mkfs.ext4 on a huge disk in the guest.
> 3. Issue a drive-backup QMP command after landing on the breakpoint.
> 4. Continue a few times in GDB.
> 5. After that I can observe the same situation as described above.
>
> I'd be happy about suggestions for how to fix it. Unfortunately, I don't
> see a clear-cut way at the moment. The only idea I have right now is to
> change the code to issue all discard requests at the same time, but I
> fear there might pitfalls with that?

The point of 7e5cdb345f was that we need any in-flight count to 
accompany a set s->bus->dma->aiocb.  While blk_aio_pdiscard() is 
happening, we don’t necessarily need another count.  But we do need it 
while there is no blk_aio_pdiscard().

ide_issue_trim_cb() returns in two cases (and, recursively through its 
callers, leaves s->bus->dma->aiocb set):
1. After calling blk_aio_pdiscard(), which will keep an in-flight count,
2. After calling replay_bh_schedule_event() (i.e. qemu_bh_schedule()), 
which does not keep an in-flight count.

Perhaps we just need to move the blk_inc_in_flight() above the 
replay_bh_schedule_event() call?

Hanna


