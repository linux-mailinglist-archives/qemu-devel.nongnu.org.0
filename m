Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A8C4499B8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 17:28:42 +0100 (CET)
Received: from localhost ([::1]:38650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk7Vg-00007R-8c
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 11:28:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7Qy-0002oA-9j
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:23:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7Qv-0002F2-52
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:23:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636388624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ROKj5k7PubyUY2OvrKsubGpO0z9maGE2ykRIubpf8NI=;
 b=LRfD+BYjONIhchkkI51wLMAClkPvW0tOsBG1u9blgBapyVntnIMYOsOz1K867ccqV3XW5X
 ms/TgI/II0KExXEp1QcdHZUrtU9K5aSEWII23bo8mQ3cjgetTgfTW/I19tecpj1C5JSpeR
 /4SvWEwWc9V6DraetFZ9ow9co2YsIcc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-QrubeM1VNz2NE_k1YY3lzg-1; Mon, 08 Nov 2021 11:23:42 -0500
X-MC-Unique: QrubeM1VNz2NE_k1YY3lzg-1
Received: by mail-wr1-f69.google.com with SMTP id
 y10-20020adffa4a000000b0017eea6cb05dso4204714wrr.6
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 08:23:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ROKj5k7PubyUY2OvrKsubGpO0z9maGE2ykRIubpf8NI=;
 b=wTz+TliiLhyC8SByh6UNCjr++Dx+5s378D8gjmdfmC/oz+SdFUNQBoIVKRzlWhBXID
 RN/0DOhQrBOoPY8qelsqeBcAVLlfBPH1jaN61ynrHdAkVRWHue8SdCtf0/shUw/2Ztiv
 7CYcF6LWJchBweFK99xpFmhemSZjK4Jp9HppkdraTzHm9Bqs/AWIFrHvGin6hJ7H2oUP
 SEayE49mJZTJhyyvEIY8YaZtI+QMj0a7tQEd+eI10faX/NdxwMpeyTaMxEITX/PnfMVg
 LereuF4e+zwQs+GFlOWPVXU3gGLJfqaIcFF21j2phB/5eVyDk07mU2cNQYvvqmzNeLZI
 EmFw==
X-Gm-Message-State: AOAM530c1ERpzZKcrZvs27DJ6GFGcN/NeMplcIwrhgjCOyDVr0F+sx88
 L+e+493bCCtmKbtglxo6I+WRPCtgxl/H5pDqOGyVQwfNtwKtCi3YdIcXsHX31g7uhfLnYd7qVGO
 IVJynipnptYz+qa0=
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr387029wrv.331.1636388621648; 
 Mon, 08 Nov 2021 08:23:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMzJuUMC+3IkHKZ60qeTBGpNoweZKEVkyab57t8vCsC4+21tXIzr67lvRukJlTqfbNiF3F6g==
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr386996wrv.331.1636388621477; 
 Mon, 08 Nov 2021 08:23:41 -0800 (PST)
Received: from [192.168.43.238] (46.red-193-152-127.dynamicip.rima-tde.net.
 [193.152.127.46])
 by smtp.gmail.com with ESMTPSA id n13sm17424395wrt.44.2021.11.08.08.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 08:23:41 -0800 (PST)
Message-ID: <a35f4f23-db3e-3640-40a1-f6a0cd7aa5d6@redhat.com>
Date: Mon, 8 Nov 2021 17:23:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 03/10] hw/scsi/scsi-disk: MODE_PAGE_ALLS not allowed in
 MODE SELECT commands
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211108143616.660340-1-pbonzini@redhat.com>
 <20211108143616.660340-4-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211108143616.660340-4-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Mauro Matteo Cascella <mcascell@redhat.com>, qemu-stable@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 15:36, Paolo Bonzini wrote:
> From: Mauro Matteo Cascella <mcascell@redhat.com>
> 
> This avoids an off-by-one read of 'mode_sense_valid' buffer in
> hw/scsi/scsi-disk.c:mode_sense_page().
> 
> Fixes: CVE-2021-3930
> Cc: qemu-stable@nongnu.org
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Fixes: a8f4bbe2900 ("scsi-disk: store valid mode pages in a table")
> Fixes: #546

https://gitlab.com/qemu-project/qemu/-/issues/546

> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/scsi/scsi-disk.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index e8a547dbb7..d4914178ea 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -1087,6 +1087,7 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
>      uint8_t *p = *p_outbuf + 2;
>      int length;
>  
> +    assert(page < ARRAY_SIZE(mode_sense_valid));
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


