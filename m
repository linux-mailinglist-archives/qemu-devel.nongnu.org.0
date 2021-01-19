Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEBA2FC4BB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 00:29:49 +0100 (CET)
Received: from localhost ([::1]:50568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l20RY-0000RY-DS
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 18:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l20QN-0007sn-2m
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 18:28:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l20QI-0005e5-5w
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 18:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611098909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9NvwcaztMgxhC1idQOp+4eMerGgLDoeHVQkA8te7TDE=;
 b=gxuh7stwNKhkb0P1D2l9JhMCYW62SeQt+3VkBuk3z56qIfSt+bB6IWER+Snezs1/AP7cEg
 StXiQCxFXc1G/axE4KOAADT7YrkPlm2Q2rikWCI1BWfrohNyIG++odwLXtRBwOd8hqvtlx
 aqq1fkK42ZIp/AdUMKBl0qYmKcvYRjU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-2B5FZtElMleEDy1lemCqLg-1; Tue, 19 Jan 2021 18:28:27 -0500
X-MC-Unique: 2B5FZtElMleEDy1lemCqLg-1
Received: by mail-ed1-f71.google.com with SMTP id x13so10187686edi.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 15:28:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9NvwcaztMgxhC1idQOp+4eMerGgLDoeHVQkA8te7TDE=;
 b=QQwod12d4b0f2t/ES8bzO9VrM1pnkZiwmYttay+3T8R4wLGWODndTuGchFFxq0sBrN
 +fTSKLJ4/T4gVNObx+LfImJVE3pE4WTH1qlDwf9oJ72fT4MtQYqeWt20N+tXQkaNN7CK
 OfawjBN2g0PbxfyNuDlkkJylZgI9n2Cqlhov6DQrWBzbfAxEf5qlN7IclFKwx2aUk8E1
 eLJ1VkHh//rqpgNDtt+j9cVx4eZ5+NyczUsRyCqWoQ+6mDGpkSD7dlcDHq7XM/YCvVcX
 UeQ1PNS4+YdDW/AGZaPfUY4MkVri2XF7qC4IFrEGT5hSpa1mv6V57YaIgWcjrrvxM5QL
 pO4A==
X-Gm-Message-State: AOAM531JxqHeiDIBY/zwd0sJwj+we6Weqhga3qikGJxKzdNzoAu8dcZO
 LPT6jJxRUho90cI3HUpaxKt4L/sbCX8u0xB8whnEb7LE5JNrZ0vrr1vaWw0r88t6+Wk4DURv76M
 9ZJo7jbGlQxKouhI=
X-Received: by 2002:aa7:cd4c:: with SMTP id v12mr5231854edw.17.1611098906142; 
 Tue, 19 Jan 2021 15:28:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrR1jgnovo1DbWwNSKwuGChXZydNwxNE5DciOmJSPFzv7VPndOZ+MeLAsaSLPFu4Wciiaq/w==
X-Received: by 2002:aa7:cd4c:: with SMTP id v12mr5231835edw.17.1611098905898; 
 Tue, 19 Jan 2021 15:28:25 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id mb15sm125339ejb.9.2021.01.19.15.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 15:28:25 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] hw/usb/dev-uas: Report command additional adb
 length as unsupported
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20210118170308.282442-1-philmd@redhat.com>
 <20210118170308.282442-3-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2a315ec4-b24a-00ea-c789-87cb963892f6@redhat.com>
Date: Wed, 20 Jan 2021 00:28:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118170308.282442-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Ed Maste <emaste@FreeBSD.org>,
 qemu-block@nongnu.org, "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Han Han <hhan@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 6:03 PM, Philippe Mathieu-Daudé wrote:
> We are not ready to handle additional CDB data.
> 
> If a guest send a packet with such additional data,
> report the command parameter as not supported.
> 
> We can then explicit there is nothing in this additional
> buffer, by fixing its size to zero.
> 
> This fixes an error when building with Clang 11:
> 
>   usb/dev-uas.c:157:31: error: field 'status' with variable sized type 'uas_iu' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>       uas_iu                    status;
>                                 ^
> 
> Reported-by: Daniele Buono <dbuono@linux.vnet.ibm.com>

TBH this should be (chronological order):
Reported-by: Ed Maste <emaste@FreeBSD.org>
Reported-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Reported-by: Han Han <hhan@redhat.com>

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Ed Maste <emaste@FreeBSD.org>
> Cc: Han Han <hhan@redhat.com>
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  hw/usb/dev-uas.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
> index cec071d96c4..b6434ad4b9c 100644
> --- a/hw/usb/dev-uas.c
> +++ b/hw/usb/dev-uas.c
> @@ -16,6 +16,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/module.h"
> +#include "qemu/log.h"
>  
>  #include "hw/usb.h"
>  #include "migration/vmstate.h"
> @@ -70,7 +71,7 @@ typedef struct {
>      uint8_t    reserved_2;
>      uint64_t   lun;
>      uint8_t    cdb[16];
> -    uint8_t    add_cdb[];
> +    uint8_t    add_cdb[0];      /* not supported by QEMU */
>  } QEMU_PACKED  uas_iu_command;
>  
>  typedef struct {
> @@ -700,6 +701,11 @@ static void usb_uas_command(UASDevice *uas, uas_iu *iu)
>      uint32_t len;
>      uint16_t tag = be16_to_cpu(iu->hdr.tag);
>  
> +    if (iu->command.add_cdb_length > 0) {
> +        qemu_log_mask(LOG_UNIMP, "additional adb length not yet supported\n");
> +        goto unsupported_len;
> +    }
> +
>      if (uas_using_streams(uas) && tag > UAS_MAX_STREAMS) {
>          goto invalid_tag;
>      }
> @@ -735,6 +741,10 @@ static void usb_uas_command(UASDevice *uas, uas_iu *iu)
>      }
>      return;
>  
> +unsupported_len:
> +    usb_uas_queue_fake_sense(uas, tag, sense_code_INVALID_PARAM_VALUE);
> +    return;
> +
>  invalid_tag:
>      usb_uas_queue_fake_sense(uas, tag, sense_code_INVALID_TAG);
>      return;
> 


