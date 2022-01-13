Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E89F48D8FA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 14:31:34 +0100 (CET)
Received: from localhost ([::1]:50556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n80CS-0002Me-Qo
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 08:31:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n8090-0000GO-AA
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 08:27:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n808w-0003zp-T6
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 08:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642080473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pOTeD5HgPmqZAsT10G7w3pAIRS88DBwo89VngozI7IU=;
 b=EW9vNrEVKuhyRLSMIaea7j6XZpSNFRlk6GtyD/yhn3xbysvbngTm5dyslOpH6clgrOuitl
 T9YhVAC8wRTkIJhGha58Dq9riV0K83coFNgmiJQ61CWOrzijy6P+cLUIXq9YnTW8eSmvUH
 O/ykzMoYDv+sLeX5gIWE1YzW7m1RUXE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-pFPbZVf9P7aERGrERHSiBQ-1; Thu, 13 Jan 2022 08:27:52 -0500
X-MC-Unique: pFPbZVf9P7aERGrERHSiBQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k36-20020a05600c1ca400b0034aeea679a5so84528wms.0
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 05:27:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pOTeD5HgPmqZAsT10G7w3pAIRS88DBwo89VngozI7IU=;
 b=M8YMBVxW05drECSmKVDsH45HapFaVi1Dw7qeukzkDHN39fbqiIFtJk7R1OR+GMObRd
 afxBSi3Gf1kj/xoFJ8jThIV9eOQQn1xUAfCr/Rw9VD0kD3CaarpvVY+4Lthgfhe3Y40W
 DYB956F1FL8LBXcQ5TOoqHv5aXnTKLkJInaJZSGz3cmhNaIXT3B9TtlNYltHG426SFgf
 a+IBOYnbCJWMSmZ4LJgjaP3ySEkzTIlaILiM1l13wo27u5o5MYeu1wn27seLNYBqe+Cm
 iBbKWMJnsfUr46NjUyfJea30lq7EKh5C8JKo3hR+fJa0Tn2Paikgi8ZOVcSe2NoBi1/Q
 KSCg==
X-Gm-Message-State: AOAM532vZacrh7VMitNrnz3b/wAmiXT4JTQETC2DmTDoIegG3yiwKPlR
 2YhpeS+Xc5DD4tDMXihZhP/B8Id7UyGjUXDFBbwsq5sCrYfP1YlsXLZjAGnGQTn8qu/Jh5sZP6r
 kLXBP9ulZRP2Kg8Q=
X-Received: by 2002:a05:6000:1a8a:: with SMTP id
 f10mr1419778wry.103.1642080471049; 
 Thu, 13 Jan 2022 05:27:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNhpbIWn8uqmA1uV/uIAzNtTBTF/4sSSx/tA0cgtFE6y9Vy97B0BlNqFggVjpsONMZP67YxA==
X-Received: by 2002:a05:6000:1a8a:: with SMTP id
 f10mr1419756wry.103.1642080470800; 
 Thu, 13 Jan 2022 05:27:50 -0800 (PST)
Received: from work-vm (82-132-239-117.dab.02.net. [82.132.239.117])
 by smtp.gmail.com with ESMTPSA id s10sm7245169wmr.30.2022.01.13.05.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 05:27:50 -0800 (PST)
Date: Thu, 13 Jan 2022 13:27:47 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v4 07/23] multifd: Use proper maximum compression values
Message-ID: <YeAo04uxOcOEM/fO@work-vm>
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-8-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220111130024.5392-8-quintela@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> It happens that there are functions to calculate the worst possible
> compression size for a packet.  Use them.
> 
> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/multifd-zlib.c | 4 ++--
>  migration/multifd-zstd.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index 9f6ebf1076..a2fec4d01d 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -54,8 +54,8 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
>          error_setg(errp, "multifd %u: deflate init failed", p->id);
>          return -1;
>      }
> -    /* To be safe, we reserve twice the size of the packet */
> -    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
> +    /* This is the maxium size of the compressed buffer */
> +    z->zbuff_len = compressBound(MULTIFD_PACKET_SIZE);
>      z->zbuff = g_try_malloc(z->zbuff_len);
>      if (!z->zbuff) {
>          deflateEnd(&z->zs);
> diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
> index cc4e991724..97c08367d0 100644
> --- a/migration/multifd-zstd.c
> +++ b/migration/multifd-zstd.c
> @@ -67,8 +67,8 @@ static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
>                     p->id, ZSTD_getErrorName(res));
>          return -1;
>      }
> -    /* To be safe, we reserve twice the size of the packet */
> -    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
> +    /* This is the maxium size of the compressed buffer */
> +    z->zbuff_len = ZSTD_compressBound(MULTIFD_PACKET_SIZE);
>      z->zbuff = g_try_malloc(z->zbuff_len);
>      if (!z->zbuff) {
>          ZSTD_freeCStream(z->zcs);
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


