Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D2E2F9B81
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 09:49:42 +0100 (CET)
Received: from localhost ([::1]:35608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1QEH-0004D3-1H
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 03:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1QCU-0003BJ-7k
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 03:47:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1QCS-0006o9-21
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 03:47:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610959666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQng26T63oR052weeKvBe+tzGN+onjnoC+fi4ppkjFk=;
 b=Ar8gJhaRxEQYlMiLruW9xbM/0rJxzuiNbzTAXNWjyzDLzrleJEfL1KIXIR7i2kMX6iJxsA
 vzER1J93s8eYC1ElO2oF9EpfEZ1OlHmeGQlsPrFM6a3ddlsL2U2JykyIbJAYSVeme1exyZ
 TCrrO3bHLEh2/lBL5D6J5Mhbv2PmVDk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-VQ_oRnWDOvGrAy3iDBfqpQ-1; Mon, 18 Jan 2021 03:47:44 -0500
X-MC-Unique: VQ_oRnWDOvGrAy3iDBfqpQ-1
Received: by mail-wm1-f71.google.com with SMTP id z12so4168534wmf.9
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 00:47:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iQng26T63oR052weeKvBe+tzGN+onjnoC+fi4ppkjFk=;
 b=j2P0yyDTWbSRwBiSfpEZ+jGTKdo8Yxp0iIYiLG4H82cdvech0vTqJGrYSQGxm3NpEa
 IE3nle54Sd+fc2nyu3AAokH2ELVZ5acWG+l26ceoS8dO/zWod3feKsAU44UAx495HGWv
 7j4QYcHj/ZDFQQeL09KScMGKr2mCbFsWPN5M+MTDxPHXkbMChnmOhut7BfctxwZ7ozaC
 bZzkbj3p6DYQ/o5FEEmpz8LT4XHnpy/1psqC/xfoyNf7LCWfaKh8/XRerXIxDBZobxG0
 BnCAB8WY4HgkC1afuRQpXaKeX27DDLHBkhJUK4kLhT5YgJ6/DhXn4mr07JXlYNUvdhR7
 LegA==
X-Gm-Message-State: AOAM530tb+LX+GdeOUpxjSovi1jx8u2uzFtofFlMmTZMWtjU1guwfJZ+
 E3rrfBs+7L0fzFoSopVna9soO738qz5R0M73N6BcwP5wTZpg7dqX+r2corgWvlPeJNt3wWbp+s5
 WBGO5dGLDLPELAig=
X-Received: by 2002:a1c:e4c5:: with SMTP id b188mr19990049wmh.78.1610959663083; 
 Mon, 18 Jan 2021 00:47:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhtoZLB/PymTdiht3w8Uq45A5mGgWtIBNqqpUC7V9o0bojiRccu3Y950uPUZ6C8sbb1OUSjA==
X-Received: by 2002:a1c:e4c5:: with SMTP id b188mr19990038wmh.78.1610959662916; 
 Mon, 18 Jan 2021 00:47:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b3sm21386088wme.32.2021.01.18.00.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 00:47:42 -0800 (PST)
Subject: Re: [PATCH v2] ide: atapi: check logical block address and read size
 (CVE-2020-29443)
To: P J P <ppandit@redhat.com>
References: <20210118063229.442350-1-ppandit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cdd8168a-3362-e038-8e7e-0a082a2f1917@redhat.com>
Date: Mon, 18 Jan 2021 09:47:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118063229.442350-1-ppandit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 Prasad J Pandit <pjp@fedoraproject.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Wenxiang Qian <leonwxqian@gmail.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/01/21 07:32, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> While processing ATAPI cmd_read/cmd_read_cd commands,
> Logical Block Address (LBA) maybe invalid OR closer to the last block,
> leading to an OOB access issues. Add range check to avoid it.
> 
> Fixes: CVE-2020-29443
> Reported-by: Wenxiang Qian <leonwxqian@gmail.com>
> Fix-suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>

Thank you!  This looks great.

With the small spacing fix suggested by checkpatch,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

You may add a small patch on top to clamp s->nb_sectors at 
(uint64_t)INT_MAX << 2, just to be super safe.

Paolo


> ---
>   hw/ide/atapi.c | 30 ++++++++++++++++++++++++------
>   1 file changed, 24 insertions(+), 6 deletions(-)
> 
> Update v2: range check lba value early in cmd_read[_cd] routines
>    -> https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg00151.html
> 
> diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
> index e79157863f..35b8494dc8 100644
> --- a/hw/ide/atapi.c
> +++ b/hw/ide/atapi.c
> @@ -322,6 +322,8 @@ static void ide_atapi_cmd_reply(IDEState *s, int size, int max_size)
>   static void ide_atapi_cmd_read_pio(IDEState *s, int lba, int nb_sectors,
>                                      int sector_size)
>   {
> +    assert (0 <= lba && lba < (s->nb_sectors >> 2));
> +
>       s->lba = lba;
>       s->packet_transfer_size = nb_sectors * sector_size;
>       s->elementary_transfer_size = 0;
> @@ -420,6 +422,8 @@ eot:
>   static void ide_atapi_cmd_read_dma(IDEState *s, int lba, int nb_sectors,
>                                      int sector_size)
>   {
> +    assert (0 <= lba && lba < (s->nb_sectors >> 2));
> +
>       s->lba = lba;
>       s->packet_transfer_size = nb_sectors * sector_size;
>       s->io_buffer_size = 0;
> @@ -973,35 +977,49 @@ static void cmd_prevent_allow_medium_removal(IDEState *s, uint8_t* buf)
> 
>   static void cmd_read(IDEState *s, uint8_t* buf)
>   {
> -    int nb_sectors, lba;
> +    unsigned int nb_sectors, lba;
> +
> +    /* Total logical sectors of ATAPI_SECTOR_SIZE(=2048) bytes */
> +    uint64_t total_sectors = s->nb_sectors >> 2;
> 
>       if (buf[0] == GPCMD_READ_10) {
>           nb_sectors = lduw_be_p(buf + 7);
>       } else {
>           nb_sectors = ldl_be_p(buf + 6);
>       }
> -
> -    lba = ldl_be_p(buf + 2);
>       if (nb_sectors == 0) {
>           ide_atapi_cmd_ok(s);
>           return;
>       }
> 
> +    lba = ldl_be_p(buf + 2);
> +    if (lba >= total_sectors || lba + nb_sectors - 1 >= total_sectors) {
> +        ide_atapi_cmd_error(s, ILLEGAL_REQUEST, ASC_LOGICAL_BLOCK_OOR);
> +        return;
> +    }
> +
>       ide_atapi_cmd_read(s, lba, nb_sectors, 2048);
>   }
> 
>   static void cmd_read_cd(IDEState *s, uint8_t* buf)
>   {
> -    int nb_sectors, lba, transfer_request;
> +    unsigned int nb_sectors, lba, transfer_request;
> +
> +    /* Total logical sectors of ATAPI_SECTOR_SIZE(=2048) bytes */
> +    uint64_t total_sectors = s->nb_sectors >> 2;
> 
>       nb_sectors = (buf[6] << 16) | (buf[7] << 8) | buf[8];
> -    lba = ldl_be_p(buf + 2);
> -
>       if (nb_sectors == 0) {
>           ide_atapi_cmd_ok(s);
>           return;
>       }
> 
> +    lba = ldl_be_p(buf + 2);
> +    if (lba >= total_sectors || lba + nb_sectors - 1 >= total_sectors) {
> +        ide_atapi_cmd_error(s, ILLEGAL_REQUEST, ASC_LOGICAL_BLOCK_OOR);
> +        return;
> +    }
> +
>       transfer_request = buf[9] & 0xf8;
>       if (transfer_request == 0x00) {
>           /* nothing */
> --
> 2.29.2
> 


