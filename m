Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E933C1A8A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:30:35 +0200 (CEST)
Received: from localhost ([::1]:49982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1afK-00070J-2X
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1ad0-00047j-5j
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:28:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1acw-0003Zl-Qv
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:28:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625776085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6zb1VTkPWDj/kpddF8IVXRfUm8i9eFBtIuNVhwb9BF0=;
 b=TCZOFQ7ctERWJwQgoxnkSAg+IV4Y7iYe35fV7mvtzEeXEUFM2z+uNkzVuJC3NbhNzT+9eE
 dS2jGMRWqwECaYRYjLeQ4BlZsexNwGm/UMYxHvwXa92ukD6RdalF44BWyPjLIOJcttrEdB
 l/Ygk5NGoG1aJKmKb2srbvWqK0M2AoE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-rn2u90FmMnKJIrTPPW69MQ-1; Thu, 08 Jul 2021 16:28:03 -0400
X-MC-Unique: rn2u90FmMnKJIrTPPW69MQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 v4-20020a3761040000b02903b7d6dd08cbso580848qkb.12
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 13:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6zb1VTkPWDj/kpddF8IVXRfUm8i9eFBtIuNVhwb9BF0=;
 b=q93m3J13MMN9Gm4pQzdT/rSYOVU3Bb1TqctMjpRdeVB3gut+XrzOheFdWQXQYz2viI
 ycfCBcrY4FJpMe/mrH4Z0vrPTnVXIJvyOivjnLf3Tu17MIZI6LCWvTJ0TgTxcUQP4V92
 nl6pnnLbySGTE0xx2r7iFaABg9fL5s7qydzz6gd8VB7JFnjCtFEGMyyk3xCDl/VsCuqs
 MVAv4uLWB5ifra6PAlwBoefnYXUzNHqieq1U0+8IB+HYre8yYNciORhAZpxTf308ZP6w
 N64J+2Z4oGGqrwd3R44dSLaH7/F4Au4t3nD6efJYsnZ/5AGdakIp75fVtFzkO5M//gYO
 XzeQ==
X-Gm-Message-State: AOAM532wEew8+WmSDkcOPu1qxnbfwQ8BkCMx9umsX4XUAW4MINbcKFAh
 0nPqyvWrTk1sJpwmu/DHXm7/dD8hwxyG1eaoImkRqXVSdLy+7PuF/9ZheRA5Ruq9pcK4q8pM/yE
 gZatt5ZeHeTVhX1Y=
X-Received: by 2002:a37:6314:: with SMTP id x20mr26351721qkb.363.1625776083466; 
 Thu, 08 Jul 2021 13:28:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf63AWAIxYpBX0oKeyhtey9XiNBVMF1LjUlDsEpA7K8TaHbI3zN+lpsMGvE3Gh+4FugX3jOg==
X-Received: by 2002:a37:6314:: with SMTP id x20mr26351695qkb.363.1625776083248; 
 Thu, 08 Jul 2021 13:28:03 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id w2sm1480789qkm.65.2021.07.08.13.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 13:28:02 -0700 (PDT)
Date: Thu, 8 Jul 2021 16:28:01 -0400
From: Peter Xu <peterx@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2] docs: Add '-device intel-iommu' entry
Message-ID: <YOdf0YUIqNBmToQH@t490s>
References: <20210707154114.197580-1-peterx@redhat.com>
 <a4006a17ddd5d2a4092c7b64b73ca69f62defb35.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a4006a17ddd5d2a4092c7b64b73ca69f62defb35.camel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Yi Liu <yi.l.liu@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>, Jing Zhao <jinzhao@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Chao Yang <chayang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 01:17:50AM +0300, Maxim Levitsky wrote:
> As far as I know this looks very good.
> Thanks for doing this!
> 
> Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Thanks!

Michael - I just saw a pull req sent, so I wanted to double check: should this
patch go through your tree at last?  Thanks,

-- 
Peter Xu


