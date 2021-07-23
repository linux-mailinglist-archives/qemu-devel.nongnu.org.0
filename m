Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE273D3888
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 12:21:14 +0200 (CEST)
Received: from localhost ([::1]:58452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6sIr-0004hR-Av
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 06:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m6sHr-0003xA-LY
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:20:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m6sHp-0002Vx-6Z
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627035607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/6oLomxhqjzY1zwUqJ48SM9cj5e1t4aiqcjUnSzBCRY=;
 b=L/rj/chpBn2QeEPj9wICkNOUc4lcT5JJ/ZBu7bZAsWDXsTo8KGsa884M6xLqnP5I96ezf2
 IG/JCaI/1pBrtPCLOnLjz19umIaCAaoLmrMZx1VCRRhy6SYQOySX+VgwXUaJq4iMBM2ccj
 UqMaIiVI8pUMrq5FeEzYvIlyWE+LNZk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-B9tuSt9OMN-SbYUPevMO7Q-1; Fri, 23 Jul 2021 06:20:06 -0400
X-MC-Unique: B9tuSt9OMN-SbYUPevMO7Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 d14-20020adfe2ce0000b029013a357d7bdcso789884wrj.18
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 03:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/6oLomxhqjzY1zwUqJ48SM9cj5e1t4aiqcjUnSzBCRY=;
 b=spNY0GpkMuDtBDenNfsGD0Uvl9RZUSa02mXzJbRzjDMLM2IgqCsOBAl3Voz7w60vN8
 ICfl//7WUfBAcW4mAOKGS9lbaKIgXjrFJ29aj2i2saWoFT7hM1LLdPCP08ffkFY02ozZ
 G4q5uHS50ZLLCy1jfBLW2CKK8iC1N7xztFM3RJjoyfbrodOlsPYGf4XKCJhtEkuKz5dt
 XKU7bUvEPswz7xSpmgqNO1UypJP+fKVrU1KoO9ypA02xy9ULDkNfkEgxhQI4oJp2M32Y
 0qoT8J3YbpGiK5l+61lDvikm57qSmuG+RWRqFP0cBBaBFwZOcP2Qq38OR4mS4cYv9pW7
 Z6cA==
X-Gm-Message-State: AOAM531LgOW2PSrFhp0pPxvuWpQTqpSQwVd9X/4llsrA+Vdjn5p/PPdx
 KPgJcmngfLDLRNcE4pGZRMImjupH06f2JAOQy96OL/IvX4qGLe0JsBBevBymbNIUnln1NmGQY8J
 lBD9EdudTG24820g=
X-Received: by 2002:a7b:cb4d:: with SMTP id v13mr2430406wmj.68.1627035605532; 
 Fri, 23 Jul 2021 03:20:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+t8LEx/Kei398Hx4ozlPqpF3CTNgeGbt4WNYeSUa6B4UzEA92Fy4Sjwzg2tCt7+1Q3MQYyA==
X-Received: by 2002:a7b:cb4d:: with SMTP id v13mr2430390wmj.68.1627035605352; 
 Fri, 23 Jul 2021 03:20:05 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id q7sm27293029wmq.33.2021.07.23.03.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 03:20:04 -0700 (PDT)
Date: Fri, 23 Jul 2021 12:20:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: Replace Eduardo as "Host Memory
 Backends" maintainer
Message-ID: <20210723122002.3e5c96f9@redhat.com>
In-Reply-To: <20210723100532.27353-2-david@redhat.com>
References: <20210723100532.27353-1-david@redhat.com>
 <20210723100532.27353-2-david@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Jul 2021 12:05:30 +0200
David Hildenbrand <david@redhat.com> wrote:

> Edurdo asked me to take over co-maintaining "Host Memory Backends" with
> Igor, as Eduardo has plenty of other things to look after.
> 
> Thanks a lot Eduardo for your excellent work in the past!
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4256ad1adb..420c8a48a1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2547,7 +2547,7 @@ S: Maintained
>  F: net/netmap.c
>  
>  Host Memory Backends
> -M: Eduardo Habkost <ehabkost@redhat.com>
> +M: David Hildenbrand <david@redhat.com>
>  M: Igor Mammedov <imammedo@redhat.com>
>  S: Maintained
>  F: backends/hostmem*.c


