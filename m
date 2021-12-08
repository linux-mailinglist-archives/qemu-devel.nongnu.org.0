Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6FF46D121
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 11:34:38 +0100 (CET)
Received: from localhost ([::1]:48480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muuHV-0005Bd-Fj
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 05:34:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muuG9-0004RS-FO
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 05:33:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muuG7-0002uF-Mg
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 05:33:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638959590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RayQTkh5qpH6mtjxZMvxNcypFgvmmb7AUx1Fk9LTj+4=;
 b=QN5YiMGtrma6MKXSd6qUe9xLlW8RhhuXKJwUwO7qWxbKTy2HPux4bpZHEdsqOj/LALy2xf
 Evw078wAYGAZklG/zid9fHSauMoDylYW9ghoUYd4XHubwLl+rhEFnbikOekH3XiSJ+x/EK
 eJb18nTnkRDuNT+dO2mebXwQzsOk+io=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-6Gmcr59SPiinOpEIkIgHHA-1; Wed, 08 Dec 2021 05:33:09 -0500
X-MC-Unique: 6Gmcr59SPiinOpEIkIgHHA-1
Received: by mail-wr1-f71.google.com with SMTP id
 h13-20020adfa4cd000000b001883fd029e8so281101wrb.11
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 02:33:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RayQTkh5qpH6mtjxZMvxNcypFgvmmb7AUx1Fk9LTj+4=;
 b=y5OZm1i6v/AOB08hlX/T7mnQldN1/WfgXAPfkn09Y2gwQOEC+1iQAOGvxHcXy8Kxww
 qRATBrOiMsPPGvJir3KOqwWCD391p3l1uGC3UTtw4pEYrq09x4jqwQxVF5LxxrqSHfoM
 oxS72EhTFWYuGT3bAlYDuP/3wylbnfvj5Be/vlI9rGG/AwW/rTJcBk+fKFBSwbAqOYBg
 K3c8m4VMpKe+Rnte9PUQtV8H0tWwdp/bEH9evPKD2NIfj9hD/nfzfWoWYMqZgSqDNuVO
 CgWz7WSrernJ52N/JLH9eiotLKu8340xGwCbf/738fv9IzQRVYEA4WrqxMLbOqqoC9jL
 Kmag==
X-Gm-Message-State: AOAM532LjKUQl0CcNjHiJAddtpE3M+CcJCv3KH7eIwOmBdZDV1Hr8tqB
 CIBGCIZ1u3w9/t1caOJy3saUMn+TtWctp3unxUY99SUvX7WMZMP8Yt8kfuv0t8mawVdNAvE9cHk
 KWqcPWTcnF/DIuXQ=
X-Received: by 2002:a7b:c084:: with SMTP id r4mr14818903wmh.107.1638959588306; 
 Wed, 08 Dec 2021 02:33:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCVNR4UKiTjDXHNUsdpUY9bag14xixygVrEeDtZ/8H5d0/4dHEWXebtzLTc/3FxQrxTsIcdA==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr14818853wmh.107.1638959587957; 
 Wed, 08 Dec 2021 02:33:07 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id b197sm2265497wmb.24.2021.12.08.02.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 02:33:07 -0800 (PST)
Message-ID: <b3e786fe-a399-c35f-39d4-80d13456bbd8@redhat.com>
Date: Wed, 8 Dec 2021 11:32:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 02/12] s390x/pci: don't use hard-coded dma range in
 reg_ioat
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20211207210425.150923-1-mjrosato@linux.ibm.com>
 <20211207210425.150923-3-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211207210425.150923-3-mjrosato@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/2021 22.04, Matthew Rosato wrote:
> Instead use the values from clp info, they will either be the hard-coded
> values or what came from the host driver via vfio.
> 
> Fixes: 9670ee752727 ("s390x/pci: use a PCI Function structure")
> Reviewed-by: Eric Farman <farman@linux.ibm.com>
> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-inst.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)


Reviewed-by: Thomas Huth <thuth@redhat.com>


