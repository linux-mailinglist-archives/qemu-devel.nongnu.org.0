Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469326D63B8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:47:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjgzk-0004CV-Az; Tue, 04 Apr 2023 09:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjgzh-0004Bv-Os
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:46:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjgzg-0005tM-AW
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:46:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680615999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EOC5xMNB8TKUwhrqSALMGxTnLF38Hs5nrhrqBLl6nYM=;
 b=diswIHp3Kk8bHBFXDoC1xDGSmIUco8xblMdh2DwNsGJqx1gOWL07Ka+N52QlWzwF93nF0Y
 4H0C/jfL5xGjK0fSqDPcgKJW+Nd72ImQc18OHjU8TOVNZ/QviIk806kC1RIUdmSW9j/877
 NKbRnQML6TtJFAdS4bIiqz4d/B2bvUU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-auKeAPrcOjeLYyt3_OnB0A-1; Tue, 04 Apr 2023 09:46:38 -0400
X-MC-Unique: auKeAPrcOjeLYyt3_OnB0A-1
Received: by mail-ed1-f71.google.com with SMTP id
 c11-20020a509f8b000000b00501e2facf47so46377047edf.16
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 06:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680615997; x=1683207997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EOC5xMNB8TKUwhrqSALMGxTnLF38Hs5nrhrqBLl6nYM=;
 b=RAEdrvWpPXwVnijEsObeEXCkecu/V1YTKg5R/9fr29uYPoWcGK7XxkOq5v/KyDKFYc
 uqpi6VacvMIIKe1G248GiLexHsXrCkmKBx4/G1TVXShkIgishaM3mHqboZon9AX4MfJN
 Bk4fEjnHphPIOf6Cln18YPL1zdjYbfgdr5lH8n+QahCx3vXsbbkHXu+mU2YmON2ACFjx
 IoLyWOWV1O86cxzNfWxamEPBqTmh81cuonr7M9EyXVNRkg31M+/UsIbn54K3fI0JrvGW
 Xf8ErNJ2DcBUNAjS2vuI2l9qdXfTmtDa/YOCpzzEmZIsxUj9mb5+/JPrkr3PgToTbq4m
 vXvg==
X-Gm-Message-State: AAQBX9cT7yUiLk7jXmNxiGCUzqvsK2UcIX/eZ0CB4JDHvBv6r7UxjnMs
 xbEKY0MRdXtbR+H/A4aKf9S5EP7JZlpJSp3TYY2/zXIPtT90Cc5eYtnJ37si20/tvrNpAwzAVVS
 Siit89VRZ8LSCweg=
X-Received: by 2002:a17:907:8a24:b0:947:791b:fdcb with SMTP id
 sc36-20020a1709078a2400b00947791bfdcbmr2640628ejc.21.1680615996936; 
 Tue, 04 Apr 2023 06:46:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZKGn72BpwOfdhCDqdjHSKetYDAkrw483POzylVVBOQOp0vZ1sAfoVpUPVCPr98oRDnQvzcCQ==
X-Received: by 2002:a17:907:8a24:b0:947:791b:fdcb with SMTP id
 sc36-20020a1709078a2400b00947791bfdcbmr2640574ejc.21.1680615996616; 
 Tue, 04 Apr 2023 06:46:36 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 ae14-20020a17090725ce00b00947a939f6e0sm5693767ejc.77.2023.04.04.06.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:46:35 -0700 (PDT)
Message-ID: <92b731c7-81d4-ef54-cca9-9dcb944e94f0@redhat.com>
Date: Tue, 4 Apr 2023 15:46:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 11/13] block/fuse: take AioContext lock around
 blk_exp_ref/unref()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, Coiby Xu <Coiby.Xu@gmail.com>,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paul Durrant <paul@xen.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <fam@euphon.net>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Juan Quintela <quintela@redhat.com>, Xie Yongji <xieyongji@bytedance.com>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 eesposit@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
 <20230403183004.347205-12-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230403183004.347205-12-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/3/23 20:30, Stefan Hajnoczi wrote:
> These functions must be called with the AioContext acquired:
> 
>    /* Callers must hold exp->ctx lock */
>    void blk_exp_ref(BlockExport *exp)
>    ...
>    /* Callers must hold exp->ctx lock */
>    void blk_exp_unref(BlockExport *exp)
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/export/fuse.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/block/export/fuse.c b/block/export/fuse.c
> index 06fa41079e..18394f9e07 100644
> --- a/block/export/fuse.c
> +++ b/block/export/fuse.c
> @@ -244,7 +244,9 @@ static void read_from_fuse_export(void *opaque)
>       FuseExport *exp = opaque;
>       int ret;
>   
> +    aio_context_acquire(exp->common.ctx);
>       blk_exp_ref(&exp->common);
> +    aio_context_release(exp->common.ctx);
>   
>       do {
>           ret = fuse_session_receive_buf(exp->fuse_session, &exp->fuse_buf);
> @@ -256,7 +258,9 @@ static void read_from_fuse_export(void *opaque)
>       fuse_session_process_buf(exp->fuse_session, &exp->fuse_buf);
>   
>   out:
> +    aio_context_acquire(exp->common.ctx);
>       blk_exp_unref(&exp->common);
> +    aio_context_release(exp->common.ctx);
>   }

Since the actual thread-unsafe work is done in a bottom half, perhaps 
instead you can use qatomic_inc and qatomic_fetch_dec in 
blk_exp_{ref,unref}?

Paolo


