Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2741B2F2EF3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:24:18 +0100 (CET)
Received: from localhost ([::1]:37346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIif-0006Bx-68
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzIgW-0005IH-7a
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:22:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzIgU-0002mt-GM
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610454118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DVID1fWSM/fly60272S8c7ibjrhQS/0eCp/MmX/Z3AA=;
 b=ZCVAnzUEb3ZbQHWHalJWBxtD2xxHlRKXYWakWTgL1V4u75h+sYAvpCRtETu5XvD/L2mnU5
 QbwrhQk3lp80ohxZHkL3ZY2Vo6KHYs1EhYLNzjTCoZpCwQUfyEzEsqWe9sFAcGT0nQNquV
 rksf0/m/hnkqcpVADBF4gMknpl6wLlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-RiOjrIJkOP61l-CBF9KkZA-1; Tue, 12 Jan 2021 07:21:54 -0500
X-MC-Unique: RiOjrIJkOP61l-CBF9KkZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 790E81842143;
 Tue, 12 Jan 2021 12:21:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-184.ams2.redhat.com [10.36.112.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32A7B5C238;
 Tue, 12 Jan 2021 12:21:51 +0000 (UTC)
Subject: Re: [PATCH] hw/ide/ahci: Replace fprintf() by
 qemu_log_mask(GUEST_ERROR)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210112112955.1849212-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <049f67cc-17e8-80f2-4464-b1fb05b4c814@redhat.com>
Date: Tue, 12 Jan 2021 13:21:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210112112955.1849212-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/01/2021 12.29, Philippe Mathieu-Daudé wrote:
> Replace fprintf() calls by qemu_log_mask(LOG_GUEST_ERROR).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/ide/ahci.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
> index 4b675b9cfd8..6d50482b8d1 100644
> --- a/hw/ide/ahci.c
> +++ b/hw/ide/ahci.c
> @@ -465,8 +465,9 @@ static void ahci_mem_write(void *opaque, hwaddr addr,
>   
>       /* Only aligned reads are allowed on AHCI */
>       if (addr & 3) {
> -        fprintf(stderr, "ahci: Mis-aligned write to addr 0x"
> -                TARGET_FMT_plx "\n", addr);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "ahci: Mis-aligned write to addr 0x%03" HWADDR_PRIX "\n",
> +                      addr);
>           return;
>       }
>   
> @@ -1111,7 +1112,8 @@ static void process_ncq_command(AHCIState *s, int port, uint8_t *cmd_fis,
>       g_assert(is_ncq(ncq_fis->command));
>       if (ncq_tfs->used) {
>           /* error - already in use */
> -        fprintf(stderr, "%s: tag %d already used\n", __func__, tag);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: tag %d already used\n",
> +                      __func__, tag);
>           return;
>       }
>   
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


