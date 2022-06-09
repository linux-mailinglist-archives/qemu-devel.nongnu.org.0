Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7745C54534C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:46:36 +0200 (CEST)
Received: from localhost ([::1]:33148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMEs-0003zX-8V
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzKdR-0004ev-Ho
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:03:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzKdP-0007d8-2P
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:03:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654790626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BZwGYWVZli76ogB+9TN8RiRhfdhPjrM5AlUGiMKXZA=;
 b=WxMjw2a9Mw8Cs0OedjP/pGO2QFSJM4uuCW5Z8IVjXW7JaITlotUvRpdsNCIGVMESz/GCfp
 +xpp7p83LdkOkkhSpxENoHII9jUcF1XECmEaw6otlQoS2CUWrQqH3Dl3gCkDTRVGRz3d1o
 r54UhUaLPExgdTvUTW9HLVrfT7YIj44=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-2sp4lUlaMoSvysix7HIFxw-1; Thu, 09 Jun 2022 12:03:45 -0400
X-MC-Unique: 2sp4lUlaMoSvysix7HIFxw-1
Received: by mail-wm1-f72.google.com with SMTP id
 i6-20020a1c3b06000000b0039c6608296dso37033wma.4
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=2BZwGYWVZli76ogB+9TN8RiRhfdhPjrM5AlUGiMKXZA=;
 b=ni0l7TMon+Gqvi5gPHiOfXbzj/zey70qI7dh/r96KVLOM9CehSFHMF+Cr1ML5UuBeC
 of5r6aR0QJlRFjLMh2oX5YzPGKHMiy8T8Nagga6+q/wWRmFUnRFAMJnwSRPdXcuPE9QH
 B6cAL2tHiM0TCNPufON/Hr/2Bp9tQvt+7cUnCCU80Z+CfLc0aGmXfq58GQ67c7EYzpCo
 8reFWkVlrAPDx2SgNVpdw8aQRD87377xdMJf0VzRK7anx+8uvCWp8zoZL1K7ZabNTmWg
 Imsm8jP0tZQbAlFRHNatmiTYGfLMQ7VrS3i6H8HwgkOYAhrS9R9lDAUIJt1DV2eEIclU
 wsAg==
X-Gm-Message-State: AOAM533NqYxwLVv3XVMbcw10H8NFROTDdb6qlPR5DN11aFXpGFAEB7zI
 G+ND032U7j5qWe0c8zrIDb3TMNE1NWZ6C0iDyGPFRaQaaOUsrGZF5FDQ4T3UH8DBk45QGLhPbMU
 DUtdMUrDbePLfUzw=
X-Received: by 2002:adf:d1ec:0:b0:210:2c68:a06d with SMTP id
 g12-20020adfd1ec000000b002102c68a06dmr39231567wrd.37.1654790623860; 
 Thu, 09 Jun 2022 09:03:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziz5Huw3+faA5AG9luNrTEXQx9ZE9Xmk3nrTmqmGMW8pa4ZHhRKyyb20vnyJC9Cp9BP9ngsA==
X-Received: by 2002:adf:d1ec:0:b0:210:2c68:a06d with SMTP id
 g12-20020adfd1ec000000b002102c68a06dmr39231533wrd.37.1654790623619; 
 Thu, 09 Jun 2022 09:03:43 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 d14-20020a5d6dce000000b0020c5253d927sm25126440wrz.115.2022.06.09.09.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 09:03:42 -0700 (PDT)
Date: Thu, 9 Jun 2022 17:03:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 13/20] migration: remove unused QEMUFileGetFD typedef
Message-ID: <YqIZ3DMS0dDZ6KK0@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-14-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524110235.145079-14-berrange@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/qemu-file.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 07c86bfea3..674c2c409b 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -46,10 +46,6 @@ typedef ssize_t (QEMUFileGetBufferFunc)(void *opaque, uint8_t *buf,
>   */
>  typedef int (QEMUFileCloseFunc)(void *opaque, Error **errp);
>  
> -/* Called to return the OS file descriptor associated to the QEMUFile.
> - */
> -typedef int (QEMUFileGetFD)(void *opaque);
> -
>  /* Called to change the blocking mode of the file
>   */
>  typedef int (QEMUFileSetBlocking)(void *opaque, bool enabled, Error **errp);
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


