Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798213B9861
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 23:56:16 +0200 (CEST)
Received: from localhost ([::1]:58096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4fP-0007qw-4h
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 17:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lz4eU-0006s0-1Y
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:55:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lz4eR-0005Qe-E4
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625176508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YinDB3O0gpIcKqYXAlGeUG1RXR5N8QCQpobSv1gZln4=;
 b=NPZvzZs/TwdBsMvW41C311AmiHEuKs8Y39mlXcdf3ZD8YOwmVRmBmWozoccPCfChUmTQ4R
 Su19vDEEOMIaGGiztsdTemqBGq+JXhlLLLs6chKhq6/VrUMI1lSSIJJJEJ8VkMdssK5aGu
 yYjBUk4AOSvzCKBWtIeejVFqasLjaaY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-SL9cH0NiOm-CqurHzQKYfA-1; Thu, 01 Jul 2021 17:55:07 -0400
X-MC-Unique: SL9cH0NiOm-CqurHzQKYfA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m40-20020a05600c3b28b02901f42375a73fso2398316wms.5
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 14:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YinDB3O0gpIcKqYXAlGeUG1RXR5N8QCQpobSv1gZln4=;
 b=BI5jPJa4sARWd8WgavxXd0BIF+gopn1wQRRVM5y2wwmbfJo32h3ExOw7QwtucAkPlx
 iV1rsSyRbf9fFUVdH8VyhI7eN2VVjbCUkBuPXoMoIbwbPtPp/I/a/3JOPZKBc/AVcQR4
 qFuK5/A7laythOUTPo3TSwmzIW/RcwYwR7nvca2cK28q7m/joWejJ0iGeGUtwFFD0kA2
 BEAR7tVwSnbpA+y3eB8mwEYUIWLOhyV8ZNYV6SOWdjVyaxhe0qGeSixnCl1WzoZs7exv
 8As+4qVn0N3fAVIwVUykyQpI+oGo2ae2z7ZsbdrGykr7T+KL/XVh5EZ75pX/HV5GBpdP
 J76w==
X-Gm-Message-State: AOAM533AhCYl96vn6rK1e/vcJw6ospHju+yOaZsL7ftPryTX9ALra4Cr
 N9pxoK9Jaxt0rouYjsGjjtLX8p+PdK4Z0vU24efAyCkLASfUWj58byj+NginCfgK85wbYeIm+qV
 P9HWxDNk0xDwAA2U=
X-Received: by 2002:a1c:f216:: with SMTP id s22mr1932501wmc.18.1625176506642; 
 Thu, 01 Jul 2021 14:55:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFSfV/172tqLFqOHzpg2snwMPLaMCMuZY2b3lyoIl4tpJaMh04RKFyjVb4rdWVPPJKHL0DtA==
X-Received: by 2002:a1c:f216:: with SMTP id s22mr1932483wmc.18.1625176506471; 
 Thu, 01 Jul 2021 14:55:06 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id s17sm1141681wrt.58.2021.07.01.14.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 14:55:06 -0700 (PDT)
Subject: Re: [PATCH] virtiofsd: Add missing newline in error message
To: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>, qemu-devel@nongnu.org
References: <e5914ad202a13e9c1bc2a5efa267ff3bd4f48db6.1625173475.git.hubert.jasudowicz@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4081fc8a-7a52-2903-eeeb-c044bc7dfd01@redhat.com>
Date: Thu, 1 Jul 2021 23:55:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e5914ad202a13e9c1bc2a5efa267ff3bd4f48db6.1625173475.git.hubert.jasudowicz@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: virtio-fs@redhat.com, qemu-trivial@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/21 11:11 PM, Hubert Jasudowicz wrote:
> From: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>
> 
> Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>
> ---
>  tools/virtiofsd/fuse_virtio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


