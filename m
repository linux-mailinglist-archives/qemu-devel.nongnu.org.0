Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86554534F22
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:30:47 +0200 (CEST)
Received: from localhost ([::1]:48076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCda-0003ia-CY
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCGf-0002rE-VM
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:07:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCGW-0006hB-Uw
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:07:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653566815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=molU3ZyI2rAkxDpfNCe3IzWByF+8qaKsMk9BqhEveOc=;
 b=GNH7Run/yFHf9FkUntHH26t8XXoo/Frsjrq5yqYc/exKmcuU3uw5Aup4CvftDgQoSg5L7l
 OQcyfxJKCc4HZGbVuDuLamrGemq9M5+Vo5DRPP7ddjAKH0uRKRdgWTMhgS+fFsI7MnBMBi
 b4dmeQGDEzifHX68Unfq4pItzIz/RDo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-mooO73HcMPmHeN5W5qt9qg-1; Thu, 26 May 2022 08:06:54 -0400
X-MC-Unique: mooO73HcMPmHeN5W5qt9qg-1
Received: by mail-ed1-f70.google.com with SMTP id
 r10-20020aa7c14a000000b0042bcc99e4cdso935048edp.18
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 05:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=molU3ZyI2rAkxDpfNCe3IzWByF+8qaKsMk9BqhEveOc=;
 b=jKufZt271wDbTocij0Z+cQzu3vOn4ooUPxxAldGFxveZz11V8twUsNDLkUdB/9+oNs
 mKwg0EfX1VDTivLQuOUvvRj88AM6jZBZ+JYbEMilBbBKoEmanEsCubIzWL3/1FTRTZ5H
 I6C6XKueVkQJRWz8ca1R+fTxggcVqcYizQaifl70Ri4KHwmnSfmvNJQywAO4fHjEVxLd
 ah0Krsl9eA+vBljUcCKOC9wKufsKmTQe0HPb8ADcYaxWCUwJtuSTR46oCFe94pNZ3o3s
 /fVH/bEADwFYaFU8Aokejz9I6ixApbzsecMEdxmBU37BjLAWi2m+44RzcmORA/MqD8gK
 k4Dw==
X-Gm-Message-State: AOAM530WBqoStH0+X/OfmpkrRiUtxliz2JXZJOkfRZh1o+nPHgH9SJYf
 aBGXoJn54bovtxL2KBeUWkDNO8K2Al3rq2WyRoPfHZvHgs2zE8DjNROjg5x9nMwuwdZ92DumLK6
 lYwUpWbFozwqztl4=
X-Received: by 2002:a17:907:9895:b0:6fe:991e:efe3 with SMTP id
 ja21-20020a170907989500b006fe991eefe3mr31983352ejc.74.1653566813242; 
 Thu, 26 May 2022 05:06:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHvq+qq50XvpvK6VzhQbGY3/P7fMDXQAk6r4x1PZBhj7Yzqoc/VQDYQDSapyaKf0BVSOWshQ==
X-Received: by 2002:a17:907:9895:b0:6fe:991e:efe3 with SMTP id
 ja21-20020a170907989500b006fe991eefe3mr31983329ejc.74.1653566812999; 
 Thu, 26 May 2022 05:06:52 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 r22-20020a170906365600b006f3ef214dbesm464507ejb.36.2022.05.26.05.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 05:06:52 -0700 (PDT)
Message-ID: <80765f53-031d-3467-25a1-f5c19648fe6a@redhat.com>
Date: Thu, 26 May 2022 14:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 07/11] scsi-disk: allow truncated MODE SELECT requests
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 fam@euphon.net, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
 <20220424164935.7339-8-mark.cave-ayland@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220424164935.7339-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 4/24/22 18:49, Mark Cave-Ayland wrote:
> According to [1] this truncated request is accepted on real hardware whereas in
> QEMU it generates an INVALID_PARAM_LEN sense code which causes A/UX to get stuck
> in a loop retrying the command in an attempt to succeed.

That's for MODE SENSE, not MODE SELECT.

Truncated MODE SELECT is a bit more iffy, so I'd rather have a quirk for 
this as well.

Paolo

> Alter the mode page request length check so that truncated requests are allowed
> as per real hardware, adding a trace event to enable the condition to be detected.
> 
> [1]https://68kmla.org/bb/index.php?threads/scsi2sd-project-anyone-interested.29040/page-7#post-316444
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> ---
>   hw/scsi/scsi-disk.c  | 2 +-
>   hw/scsi/trace-events | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index 71fdf132c1..c657e4f5da 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -1525,7 +1525,7 @@ static int mode_select_pages(SCSIDiskReq *r, uint8_t *p, int len, bool change)
>               goto invalid_param;
>           }
>           if (page_len > len) {
> -            goto invalid_param_len;
> +            trace_scsi_disk_mode_select_page_truncated(page, page_len, len);
>           }


