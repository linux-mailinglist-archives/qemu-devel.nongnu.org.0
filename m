Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443D04462F7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 12:46:50 +0100 (CET)
Received: from localhost ([::1]:38324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mixgH-0006ie-1U
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 07:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mixcB-0005aT-2Y
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:42:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mixc8-00062T-Rm
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636112552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b7eAcV+hHwSNZGPZ70OxFpJrgtEIdtEAhY0ZShQ2dxo=;
 b=IiMxweNSLrCkG+d3D5PIw9j/wXSd7/UgtUyWPElX9rds3u9L3nSfcC1bCRhebuwrXCXbtq
 WHfGdC/5MyEaDsy85CxxrdPujHohejtVI9OOyjDYp8bnqGd04kbcudUNJHGhrPimi+NnYj
 91Tg2oZfl6btfq4KfonfnUBYi/MlBEQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-lpfToq4BNG2FjSPpdrpqxQ-1; Fri, 05 Nov 2021 07:42:31 -0400
X-MC-Unique: lpfToq4BNG2FjSPpdrpqxQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so5577267wmc.7
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 04:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b7eAcV+hHwSNZGPZ70OxFpJrgtEIdtEAhY0ZShQ2dxo=;
 b=Zb+jDM9KM9n7u4cUVoW5WJhoEph2LV4/Z70lEepquwK3og0ev/VxsEaHHsio5u1suF
 oOlBRwyH9j5CEvCTf3L5PMZGWRBSxVNslM7dbUj2c1LzZWSS4nRdFIZAYiKbfYDbNAJT
 JTL1TXrE22/DDtXYJ1vSK375GTsbNFtT3oTFY7u2TgQv0pClh/RLwbII89T+6VCKBR2A
 dbbYqwyR11j+BRuq2KV7jUQnLz9eylHZSguF0VGnH1PGH4NXhAGUd3ikjqg0QrJfs4H0
 SANjAyF/hs/67QI4vvsjOTOCI/lhbwODOUqukTrV21Z0tPHVGoF9GFq8X6h4WGQlghJk
 Tbew==
X-Gm-Message-State: AOAM532Dt8WBUkmLtfZBmQ+4p2eOCKpQCMdwg5FIAflOX64eZ7f3KWcR
 CVKAHIgfDkylV7V8V0IFULlsACpcjVs61BMGywRgBpwAVGWg895CcXNv1ckEEE+AQL82luSsJnv
 QKxITPGFtm9CAsaA=
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr58537096wrq.354.1636112549813; 
 Fri, 05 Nov 2021 04:42:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo5eu7w6jLqhkDLZieboY7wu79A+rUYuXPCgu6+fdiD22IpCh97bB5r8qg3ugM2AzRZXbZNg==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr58537071wrq.354.1636112549646; 
 Fri, 05 Nov 2021 04:42:29 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id y12sm7848267wrn.73.2021.11.05.04.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 04:42:27 -0700 (PDT)
Message-ID: <8e8d660f-6710-e389-8b2b-16afca44f274@redhat.com>
Date: Fri, 5 Nov 2021 12:42:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] hw/scsi/scsi-disk: MODE_PAGE_ALLS not allowed in MODE
 SELECT commands
To: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-devel@nongnu.org
References: <20211105113729.530200-1-mcascell@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211105113729.530200-1-mcascell@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Darren Kenny <darren.kenny@oracle.com>,
 Li Qiang <liq3ea@gmail.com>, qiuhao.li@outlook.com,
 Alexander Bulekov <alxndr@bu.edu>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 12:37, Mauro Matteo Cascella wrote:
> MODE_PAGE_ALLS causes an off-by-one error in mode_sense_page() when accessing
> the stack-allocated mode_sense_valid buffer. MODE_PAGE_ALLS is only valid for
> MODE SENSE commands. Do not process it in MODE SELECT commands.
> 

Cc: qemu-stable@nongnu.org

> Fixes: CVE-2021-3930
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=2020588
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> Reported-by: Qiuhao Li <qiuhao.li@outlook.com>

See also:
https://lore.kernel.org/qemu-devel/20210204225041.1822673-1-philmd@redhat.com/

> ---
>  hw/scsi/scsi-disk.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index e8a547dbb7..5852e8dcfd 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -1087,6 +1087,7 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
>      uint8_t *p = *p_outbuf + 2;
>      int length;
>  
> +    assert(page != MODE_PAGE_ALLS);
>      if ((mode_sense_valid[page] & (1 << s->qdev.type)) == 0) {
>          return -1;
>      }
> @@ -1428,6 +1429,11 @@ static int scsi_disk_check_mode_select(SCSIDiskState *s, int page,
>          return -1;
>      }
>  
> +    /* MODE_PAGE_ALLS is only valid for MODE SENSE commands */
> +    if (page == MODE_PAGE_ALLS) {
> +        return -1;
> +    }
> +
>      p = mode_current;
>      memset(mode_current, 0, inlen + 2);
>      len = mode_sense_page(s, page, &p, 0);
> 


