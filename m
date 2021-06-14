Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B963A5E40
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:18:43 +0200 (CEST)
Received: from localhost ([::1]:50372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lshnu-0004fa-7o
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lshks-0007pN-DB
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:15:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lshko-0003Cb-RZ
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623658529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OuPg5FG4sN+TnX8szTUkLzVV1sMvKaisS6C4WrzTb8w=;
 b=DWwnPDi4W9FsYO8CI9sCoxGewHih49EgkCMWGIicgT4Rw0sQxvWIJ1xwncWcxAkXO5r4Tk
 q7ywVqg3QJNMFvSbKhLmhQH2x4lE1qHk7R/soZm1Zskis9TUcDS3GCxsEx3aZaEjBffXaM
 GDNwAzFbIMDjlSNd5JoJ1i2Tr2VTVG4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-bIXRjfnlPjOTTAeF-upMkg-1; Mon, 14 Jun 2021 04:15:25 -0400
X-MC-Unique: bIXRjfnlPjOTTAeF-upMkg-1
Received: by mail-ej1-f70.google.com with SMTP id
 k1-20020a17090666c1b029041c273a883dso2742362ejp.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OuPg5FG4sN+TnX8szTUkLzVV1sMvKaisS6C4WrzTb8w=;
 b=Whq29WuHgCdMDVpyQcTI71eXhuM1Kbe9G1UyB2Zfq2NBoVVhAm0qfAl+3GMO/ZMnbi
 F+66vgzp7HZD6giQvIgw0W16DZdpeXyW5QWjIPNv5ywXZbH38joY9sdCvsg/LeJH4U7v
 nKEtOdDbUVkcWPUkSTB9QGBOIFeZmrdxmcL+/FE54365Bi+EUhODqGXYDRNYLmEJby5A
 K3oclaQJ1C/Y3EOJoWDtwJ3no5ptAfmFfrXkISkCa44I12eSj9U64HeRl74T4GsGZJeC
 nm9wDRzba2FSINwUdnhsWnPZaxUbfMcnG1+bnsnGTuZmKSx+uKvIsU/rO+nXOPM1PJqj
 ac5w==
X-Gm-Message-State: AOAM531yocFU1L1jn3GyL7TcGUJXLxafMDZNTeBzV6TJyCXuM25NWEdN
 Mz+Ae1jBvMADQ7NB5vw9ZSIR4IfZt5OhsHW8rT/hLi0fAevFExwgSAvpp/dSr4q1N9o9AoHuY5o
 eRvGNCoYgemQ6VPU=
X-Received: by 2002:a17:906:35cd:: with SMTP id
 p13mr14439436ejb.24.1623658524579; 
 Mon, 14 Jun 2021 01:15:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3fWfL5uu1yW8eko9L9AGGDUkWpaeAEuwLL1uyu4lkn1bsScG4NhIdD5Xf/2O6+vWpNS8zwQ==
X-Received: by 2002:a17:906:35cd:: with SMTP id
 p13mr14439423ejb.24.1623658524370; 
 Mon, 14 Jun 2021 01:15:24 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cd4sm6668630ejb.104.2021.06.14.01.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 01:15:23 -0700 (PDT)
Subject: Re: [PATCH] esp: fix migration version check in esp_is_version_5()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu, hpoussin@reactos.org
References: <20210613102614.5438-1-mark.cave-ayland@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7c83e6b3-4230-b700-15fc-5462c84df3f9@redhat.com>
Date: Mon, 14 Jun 2021 10:15:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210613102614.5438-1-mark.cave-ayland@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.144, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/06/21 12:26, Mark Cave-Ayland wrote:
> Commit 4e78f3bf35 "esp: defer command completion interrupt on incoming data
> transfers" added a version check for use with VMSTATE_*_TEST macros to allow
> migration from older QEMU versions. Unfortunately the version check fails to
> work in its current form since if the VMStateDescription version_id is
> incremented, the test returns false and so the fields are not included in the
> outgoing migration stream.
> 
> Change the version check to use >= rather == to ensure that migration works
> correctly when the ESPState VMStateDescription has version_id > 5.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: 4e78f3bf35 ("esp: defer command completion interrupt on incoming data transfers")
> ---
>   hw/scsi/esp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index bfdb94292b..39756ddd99 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -1120,7 +1120,7 @@ static bool esp_is_version_5(void *opaque, int version_id)
>       ESPState *s = ESP(opaque);
>   
>       version_id = MIN(version_id, s->mig_version_id);
> -    return version_id == 5;
> +    return version_id >= 5;
>   }
>   
>   int esp_pre_save(void *opaque)
> 

You can use the _V version of the macros and get rid of this function 
altogether.  VMSTATE_FIFO8_TEST is not used outside esp.c so it can also 
be replaced with VMSTATE_FIFO8_V, just initializing .version_id in place 
of .field_exists.

Paolo


