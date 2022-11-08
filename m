Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE87620B94
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 09:55:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKNA-0005bD-Vs; Tue, 08 Nov 2022 03:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osKN6-0005aM-6M
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 03:54:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osKN3-0004n2-T7
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 03:54:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667897652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5ewUlNdGcfZW60UY5SA4vb9ylWXeeb9MQjl4DijEkN8=;
 b=Y6DGfci0hmLA/qZ2lQwl7npWYcqnoq2BYpZPTGQdEedYZaG1YHV2haidzY0jxSTfKJmqdL
 vyKmEa+Hbf7XuhUUDodTpu/QmHdfsMNE9x4ZOQCrNLBLQRijbkYArlwUKlLWNMJipIkEyT
 rtIVTVzEyHWBqM0MaQ4lTlCSQqisbpQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-189-AwPyHal_PLW16i_gXCX2Fw-1; Tue, 08 Nov 2022 03:54:11 -0500
X-MC-Unique: AwPyHal_PLW16i_gXCX2Fw-1
Received: by mail-qk1-f199.google.com with SMTP id
 bl21-20020a05620a1a9500b006fa35db066aso12335943qkb.19
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 00:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ewUlNdGcfZW60UY5SA4vb9ylWXeeb9MQjl4DijEkN8=;
 b=flwWTp6upmhek4gdSsf2Y9UDBlahx4l8LES0Bcq4iTbbJL4f487OuPzmMpbdavUlkl
 Cfl8B5VMdqX7GtaZk+sMebVPkxDVNvux8KlIdfbFhNmzr7Hr5sjPNHowhEsfrRYnNZAg
 0f3bmwbjWmujeq9g/5bAvHBXopliGh2yzRyp8X1hPwsqrmFGYbHZDYxaiQgLrVNKhkm7
 i8wZ9u5cH7cI0ERakNwvFozyGihUP6sRMtvQsQRIn6fBzEoSDJ2v+LMVDZfI2OR7zdW3
 Ey/6JuL7zUSaggH/KkSstCSQBV71U9dJ10+X4SK6YKkKUYc3d5nyJ17RWlp6PZmz7aSo
 OZow==
X-Gm-Message-State: ACrzQf32VIqx+qKLB8lnDU906qhJcS1+8lO0ML8l783mdRJva8S3azFC
 xbvA2yRFcDCyXdKJpOGNtc1V8bOPkWne7EhWkIaFJQQfLn1zrC/mPkSjomWFIv4QAYx3UR+iRU4
 rmDbf4ui01lzJW/4=
X-Received: by 2002:a05:620a:916:b0:6fa:2149:c535 with SMTP id
 v22-20020a05620a091600b006fa2149c535mr35550112qkv.413.1667897650743; 
 Tue, 08 Nov 2022 00:54:10 -0800 (PST)
X-Google-Smtp-Source: AMsMyM68bNdFA5hamgqrmGaIin1zDvq4vRkXdX9lQFT3zVShCSeKrgRBP/OujzDuExjXVGoS76juqA==
X-Received: by 2002:a05:620a:916:b0:6fa:2149:c535 with SMTP id
 v22-20020a05620a091600b006fa2149c535mr35550107qkv.413.1667897650485; 
 Tue, 08 Nov 2022 00:54:10 -0800 (PST)
Received: from redhat.com ([138.199.52.3]) by smtp.gmail.com with ESMTPSA id
 l2-20020ac80782000000b00343057845f7sm7653275qth.20.2022.11.08.00.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 00:54:10 -0800 (PST)
Date: Tue, 8 Nov 2022 03:54:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: jianchunfu <jianchunfu@cmss.chinamobile.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] libvhost-user: Handling potential memory allocation
 failures
Message-ID: <20221108033133-mutt-send-email-mst@kernel.org>
References: <20221108080141.5756-1-jianchunfu@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108080141.5756-1-jianchunfu@cmss.chinamobile.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Nov 08, 2022 at 04:01:41PM +0800, jianchunfu wrote:
> Add malloc check of virtqueue element in libvhost-user.
> 
> Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index 47d2efc60f..901cd7a2c0 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -2551,6 +2551,10 @@ virtqueue_alloc_element(size_t sz,
>  
>      assert(sz >= sizeof(VuVirtqElement));
>      elem = malloc(out_sg_end);
> +    if (!elem) {
> +        DPRINT("%s: failed to malloc virtqelement\n", __func__);
> +        exit(0);
> +    }

exit is certainly not the right way to handle such errors.


>      elem->out_num = out_num;
>      elem->in_num = in_num;
>      elem->in_sg = (void *)elem + in_sg_ofs;
> -- 
> 2.18.4
> 
> 


