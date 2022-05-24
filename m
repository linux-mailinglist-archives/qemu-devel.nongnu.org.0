Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFB4532A12
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:11:44 +0200 (CEST)
Received: from localhost ([::1]:54620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTO3-00044g-NE
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntSRO-0002E8-4m
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:11:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntSRK-00058s-R4
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653390650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=27j6k2cZCDZNWXJr0tCIl5JL3x96MfpkYNoEKRGmf48=;
 b=Ui573emDTxI18JMuLN5A4PGpedrKUowggg7bZjzyc0Ct1pK6YCc9k6uEFDR02Jgu4DEA/j
 QyVMVeHUYVRhhi0i+XEkWH/Al/jZkS4W9O555tQpoBpCg9oixPJ+j4B+sbjKJ+eAT98VbN
 hH+t0weXP6dcDIY/mEWif/28m/3T7H0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-eJHVqzUhMjaDPyvNVsubtw-1; Tue, 24 May 2022 07:10:48 -0400
X-MC-Unique: eJHVqzUhMjaDPyvNVsubtw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j14-20020a05600c1c0e00b003973bf0d146so1149162wms.4
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 04:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=27j6k2cZCDZNWXJr0tCIl5JL3x96MfpkYNoEKRGmf48=;
 b=4pKpnaXEoybMFLbmSvhyqbV9qwwmWs0KIGYgHaQkCuPk7rHJ5bygORTDk8Q8yw0jue
 c+ZqAR/iR9chn933YnLsOx14b3NQCwofsKZNUFiEPB3VzyA6WhV0DVWBThPNt84GDyP9
 ivJdn3KD34y7G6/Kjhcbmek2ahmkAlanr+u0NnKW7l/S5uqXf8ewHL/RsAfi6GOJ2gwz
 OPDDvwLuS/+wF8HJAQnbgVR+WJriteyGsWo1cppVyc9HyiXrwmzmfCBBYF+GuLlBh+hX
 98ptw8yaOiBzchz+zdcpp9Gm+ZmCJ78nKci1MefTJXh7gZ8bkReWjlVxe7Enwktli1o5
 asYQ==
X-Gm-Message-State: AOAM533gzGcqdiGkU+h3dF/d1Ec63CMsFTVbp32noD8euWNAoict7ttz
 o8z8J6BE554QAMT0fBDUCtsb4EYbcaKzOhDod+Jl6wWIDh3o3KQ85Xm9cRWSoz8goBRQ9OrXvj2
 rGcCeVz00iZRBCjY=
X-Received: by 2002:a7b:cbda:0:b0:397:48d6:6c9f with SMTP id
 n26-20020a7bcbda000000b0039748d66c9fmr3283910wmi.10.1653390647673; 
 Tue, 24 May 2022 04:10:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFuRjqrd2lUrDP97pOCIWHVQ3Wg0Ph+eJi2dLo7cH1N3zJH+xRTY2kVQFxiQFrVE9wCVph6g==
X-Received: by 2002:a7b:cbda:0:b0:397:48d6:6c9f with SMTP id
 n26-20020a7bcbda000000b0039748d66c9fmr3283886wmi.10.1653390647451; 
 Tue, 24 May 2022 04:10:47 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 s1-20020adf8901000000b0020c547f75easm12292388wrs.101.2022.05.24.04.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 04:10:46 -0700 (PDT)
Message-ID: <8110c080-b439-4ed8-ffc8-13323ba3790c@redhat.com>
Date: Tue, 24 May 2022 13:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, philmd@redhat.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220420115745.13696-1-pmorel@linux.ibm.com>
 <20220420115745.13696-9-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v7 08/13] s390x: topology: Adding drawers to STSI
In-Reply-To: <20220420115745.13696-9-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 20/04/2022 13.57, Pierre Morel wrote:
> Let's add STSI support for the container level 4, drawers,
> and provide the information back to the guest.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
...
> @@ -470,6 +520,69 @@ static const TypeInfo drawer_info = {
>           { }
>       }
>   };
> +
> +/* --- NODE Definitions --- */
> +
> +/*
> + * Nodes are the first level of CPU topology we support
> + * only one NODE for the moment.
> + */
> +static char *node_bus_get_dev_path(DeviceState *dev)
> +{
> +    return g_strdup_printf("00");
> +}
g_strdup("00") please.

  Thomas


