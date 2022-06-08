Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770CA54359B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:53:15 +0200 (CEST)
Received: from localhost ([::1]:48786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyx3a-0002Gv-Fe
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nywer-0001xi-RL
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:27:41 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nyweq-0001JU-Bw
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:27:41 -0400
Received: by mail-ej1-x62c.google.com with SMTP id v1so31147165ejg.13
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 07:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XSZA6O7q+yKK73V5YU/4+qeuxKus8AaeRcozUWxV5Rg=;
 b=nlBUKcqDiP1IgA2T5DWkI9RQ/7jCVqs3F/A0rXW8RBlhts8dTizaUkCrn9P03x02wA
 dBFr7Gy1ty4GGBY9kS6NUPIlVg4m287itjCunOi1fqkFn0ze5zNQ088Xr95tinw51XxZ
 Dt1a6/6YMqMxxrQQ/MB3+V5wLqAY4n71rL6EOX+8hbKi+6sqYoGprLoOvNX/BXCsQq5i
 DvcqFr50QD/5O50tW+ivkvVHBb7hafzkYvWg13dzM9urgDLs35pqsYmYRtb/rmnBKvCX
 sxIc4NsjsMFKl7g/CUGEhrAeUI0EdO0Xq2u9ueO78T9S1gDiQS+UAVH9oVdV9bxfJ4wy
 L3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XSZA6O7q+yKK73V5YU/4+qeuxKus8AaeRcozUWxV5Rg=;
 b=iepHt46/5mUwJdbV/PmTR7GRjLLszfOQbpR2VAqhMS1wbH1SjGFm/NQrsUFSu2Pc6g
 g3Q3DCFbHZ0cTR4jFHTSn+6vSlA9E4Kx/F7ohJYFk7qj53HGHWcJI2EoqdBWl0rXw3gq
 +C0bh44CJMOFgLzKkXw/tuttsOAXTY+rv5kK1RzS05kS2UfrLotsfwqqmNWNrCZ4MVPa
 sWaHWA51mfYCR++CZn28w5kGCa786DSjl3XNJ21v9huIrlWXm0Mc9dnU54LZyDMmuxDD
 0YrJRUR9QVaPNIj4T2wZFwQ32HifHCXhXRGIAYi7uLzKUHg+8hl1+yQPj5QRKVcxDxy4
 bgOA==
X-Gm-Message-State: AOAM533xEyBRhSTXThm9hIDe6ReJGmsM0rScfRkNxREUO/ARCusfcE8o
 z6GY3Ib4/jEN5v9AEgy1/rM=
X-Google-Smtp-Source: ABdhPJxGNYzDR3zYFRe4UDLpq/f1A/F/8bPSFTvkYtji2JNfck4PlCCCUuGCCgIc2LclPR7oE4B4DQ==
X-Received: by 2002:a17:907:761c:b0:6d6:e553:7bd1 with SMTP id
 jx28-20020a170907761c00b006d6e5537bd1mr31218287ejc.5.1654698458786; 
 Wed, 08 Jun 2022 07:27:38 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 y21-20020a056402135500b0042aa5a74598sm12889248edw.52.2022.06.08.07.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 07:27:38 -0700 (PDT)
Message-ID: <97f0df53-73fa-0ddb-d6df-088a41fb5588@redhat.com>
Date: Wed, 8 Jun 2022 16:27:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 06/10] hmp: add basic "info stats" implementation
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
References: <20220530150714.756954-1-pbonzini@redhat.com>
 <20220530150714.756954-7-pbonzini@redhat.com> <Yp+aha8olzKWwOCz@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yp+aha8olzKWwOCz@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/7/22 20:35, Dr. David Alan Gilbert wrote:
>> +        monitor_printf(mon, "%s", iec_binary_prefix(value->exponent));
> OK that's better; but it's a shame the limits don't come from something
> shared; iec_binary_prefix goes upto 60 and si_prefix goes way below -9
> 
> Reviewed-by: Dr. David Alan Gilbert<dgilbert@redhat.com>
> 

I can remove the limits altogether, and consider it a bug of the 
provider if they're not respected, but it's a bit ugly to have an 
assertion failure in that case.

Paolo

