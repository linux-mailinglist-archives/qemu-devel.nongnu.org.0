Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DA8619121
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 07:33:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqqFY-0006q1-Vf; Fri, 04 Nov 2022 02:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oqqFU-0006pS-FT
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 02:32:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oqqFR-0004IW-Nq
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 02:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667543530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dX8cYlxJwzDZfvXPmozCJZLGXUiHzZ12cOvdwmDkv18=;
 b=R1NiTbgVWlPCDxV0B6VdSimgNRkPGmp4t6u50K61ez5B20Q/HQQ0Q3R7PBcovJ6MkggJ1U
 pr4yi3sGhubDEFFz3JmVfhpS2jNatykWI045mWn/TA6umKA/4vBjKHA8utYtgd5bzV0MfH
 xqH/LMrv6gDpMoe1DG4RtBiz7WnA+0U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-48-M4Io3TAeNsOgPT3oPflmLg-1; Fri, 04 Nov 2022 02:32:09 -0400
X-MC-Unique: M4Io3TAeNsOgPT3oPflmLg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r187-20020a1c44c4000000b003c41e9ae97dso3781734wma.6
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 23:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dX8cYlxJwzDZfvXPmozCJZLGXUiHzZ12cOvdwmDkv18=;
 b=R/Oz+axsyYc923yCDpWHLyoMEGRCJTSiO7mRpdTeNJhv/WLs65v6qDBajwgcw1loSU
 DjgdzEJKWPMiK+bl7kSz83mmNS/i68krpLcSmVrongdvSNJCKeCBvenrfL7eP0Y+5kad
 d2cah2XyfI+a1p8wuAVZC+2/NUXSQ4NekzNEMuSPGsK4A1CvTqGiqg3B7FlWau18ODIp
 ktccb22UpFEUiMwNbPQbSjFLQjH16zkmG5W7wbh+yefJjrPOQHrETu2Fog7RzkAvkwFB
 9sDzy5tSVQLKV2qXnJGkxBODIrEeaSnsFaHb3outphu2LJOdCN9N2gZMce9QEz3P1j+A
 a2NA==
X-Gm-Message-State: ACrzQf15qpFJ1TKNoozdh01yktSi0vNtaQfurJuGwZZbGg3QpUMnZjPD
 kEUM4QtBgb53wWUtT4T6Ons4EBMHxbeWdyUsjr/njNkTNX7e37SvhVLScvZ7XMZDMYFnZ0JBqPi
 9P2eACKPmzAnKXHs=
X-Received: by 2002:a5d:66c3:0:b0:236:aa03:aa3c with SMTP id
 k3-20020a5d66c3000000b00236aa03aa3cmr20211259wrw.243.1667543528550; 
 Thu, 03 Nov 2022 23:32:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6/B0giTptju8b2+QSdvxuySWuyQWqrYA8qov43OG4E4ougW5ZycKL2COPdW0bIpu1zXYwbpw==
X-Received: by 2002:a5d:66c3:0:b0:236:aa03:aa3c with SMTP id
 k3-20020a5d66c3000000b00236aa03aa3cmr20211248wrw.243.1667543528367; 
 Thu, 03 Nov 2022 23:32:08 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-201.web.vodafone.de.
 [109.43.177.201]) by smtp.gmail.com with ESMTPSA id
 h7-20020a5d4307000000b00236883f2f5csm2509259wrq.94.2022.11.03.23.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 23:32:07 -0700 (PDT)
Message-ID: <3f913a58-e7d0-539e-3bc0-6cbd5608db8e@redhat.com>
Date: Fri, 4 Nov 2022 07:32:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v11 01/11] s390x: Register TYPE_S390_CCW_MACHINE
 properties as class properties
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20221103170150.20789-1-pmorel@linux.ibm.com>
 <20221103170150.20789-2-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221103170150.20789-2-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/11/2022 18.01, Pierre Morel wrote:
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   hw/s390x/s390-virtio-ccw.c | 127 +++++++++++++++++++++----------------
>   1 file changed, 72 insertions(+), 55 deletions(-)

-EMISSINGPATCHDESCRIPTION

... please add some words *why* this is a good idea / necessary.

  Thanks,
   Thomas



