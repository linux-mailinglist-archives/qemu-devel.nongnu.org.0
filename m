Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A898663C3AF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 16:25:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p02Sa-0004YU-DH; Tue, 29 Nov 2022 10:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p02SU-0004Xa-3E
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:23:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p02SS-0000DU-Dm
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669735417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k6QBfQDE7ddwIP+S81jfaV17uD0XVKuGoIs7rVYeHbk=;
 b=hfybhjC8sp1jW94MC59H3Ph3jnUpvcD1giwoyywkI1O366bPITzWEOdfzwiFDVcxxqi4sv
 npJ285KLSZIz9y9saAHKXr868/eGT930k1Rst9r3sPgGSw9fqYbsdqlZAm8vNxOk8mAM/6
 6eE5BtBFTkHdpj7k4gzicp1ARsGRCck=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-1yXwGitsMLaVD0Lf1Oo2ag-1; Tue, 29 Nov 2022 10:23:31 -0500
X-MC-Unique: 1yXwGitsMLaVD0Lf1Oo2ag-1
Received: by mail-qv1-f72.google.com with SMTP id
 b2-20020a0cfe62000000b004bbfb15297dso20193401qvv.19
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 07:23:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k6QBfQDE7ddwIP+S81jfaV17uD0XVKuGoIs7rVYeHbk=;
 b=Tnoi1aCBiT6FLkS0Wrbze0SuuDLYMp2pxp+gldoVf9O+6MlG9wJs0eSlgZ44NX07si
 OKYaVLfeYPNrvBvtPHrmknO6cvjKXXkKGZCjv5CYt2hDSIkRRfd6ywUdkRlmsxzq6T1c
 xnYCheoxaEXRdP6CSbzYL5lzdem2G1JkQTjySd4oMqSMUgq5QecrVFPgZYCbm83qbn5b
 7Uc0V2v6S4R4wcaR32jaLGq1gm2d8KqXlS2UcrOqA2Fmb5qZqRdWUjKzgcpznc3gWCUz
 IfrcCzDH8BBNS/1HEn9CgpaAlmBAXy3rWEO+yFYGQ5EylwdnxkW4Ih5GrO1I8Hgo9SUL
 +F/w==
X-Gm-Message-State: ANoB5pksH4O5NDaZ2M5UTBmZ3lbTN6EuzOloRm9EG7j6OQeZbNphc+qq
 FLrrjhALiySqI1ydInj1r/viJKHqkzDXb+PKw2xnca6ZT7P+n4aATpWFoGH+rX+1mtg3p2J3WBz
 4r/QNqaQorP8NLkw=
X-Received: by 2002:ad4:43c5:0:b0:4c6:a5c3:3a7c with SMTP id
 o5-20020ad443c5000000b004c6a5c33a7cmr36411634qvs.63.1669735409576; 
 Tue, 29 Nov 2022 07:23:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7FUxYfx0IZW2OVdMg7yFFL0n3+P6M7spjhRoy4IL/wAHnYonPYZ7cLZTPIoFAv+j9IFlZiIQ==
X-Received: by 2002:ad4:43c5:0:b0:4c6:a5c3:3a7c with SMTP id
 o5-20020ad443c5000000b004c6a5c33a7cmr36411616qvs.63.1669735409307; 
 Tue, 29 Nov 2022 07:23:29 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 fg17-20020a05622a581100b003999d25e772sm8785564qtb.71.2022.11.29.07.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 07:23:29 -0800 (PST)
Date: Tue, 29 Nov 2022 10:23:28 -0500
From: Peter Xu <peterx@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 zhengchuan@huawei.com, huangy81@chinatelecom.cn
Subject: Re: [PATCH] migration/dirtyrate: Show sample pages only in
 page-sampling mode
Message-ID: <Y4Yj8OAX02uR1lh2@x1n>
References: <20221129040404.4151126-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221129040404.4151126-1-zhenzhong.duan@intel.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Nov 29, 2022 at 12:04:04PM +0800, Zhenzhong Duan wrote:
> The value of "Sample Pages" is confusing in mode other than page-sampling.
> See below:
> 
> (qemu) calc_dirty_rate -b 10 520
> (qemu) info dirty_rate
> Status: measuring
> Start Time: 11646834 (ms)
> Sample Pages: 520 (per GB)
> Period: 10 (sec)
> Mode: dirty-bitmap
> Dirty rate: (not ready)
> 
> (qemu) info dirty_rate
> Status: measured
> Start Time: 11646834 (ms)
> Sample Pages: 0 (per GB)
> Period: 10 (sec)
> Mode: dirty-bitmap
> Dirty rate: 2 (MB/s)
> 
> While it's totally useless in dirty-ring and dirty-bitmap mode, fix to
> show it only in page-sampling mode.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


