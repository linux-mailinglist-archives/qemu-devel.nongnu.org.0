Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183194EED02
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 14:18:47 +0200 (CEST)
Received: from localhost ([::1]:55594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naGEn-0000pO-MV
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 08:18:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1naGC3-0007gK-Tk
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 08:15:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1naGC1-0003wF-3K
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 08:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648815350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4s2Rk8xTrDxn45WUdBANXHSrt/No1ZQlhB8GV9/yKV0=;
 b=TRFApMEs/fZWtL4O3jCXddPKwNo6Joc7V+PdZ4mx4nh3O9OcFKsMUM0uYFMYur8VAKucuN
 rTtGwAIg7FB1azXIzgG1AHNN1wpanT0PUd91TbXXj2GgahV/WNzWl4pOcTc7CGUcNSh7/j
 CsoXOg/fWht0e2CfW8/eZrngWcVtDhQ=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-8B0Jopv5Pdme58pDChwN2A-1; Fri, 01 Apr 2022 08:15:48 -0400
X-MC-Unique: 8B0Jopv5Pdme58pDChwN2A-1
Received: by mail-il1-f198.google.com with SMTP id
 j8-20020a92c208000000b002c9e6f83676so1683983ilo.2
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 05:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4s2Rk8xTrDxn45WUdBANXHSrt/No1ZQlhB8GV9/yKV0=;
 b=pEQSQux2sTBYywd3FAkf4Akps//B2BbbQgdTC2TcJzBm371ziqE7RPo7jEN3zgmdkw
 YINYIDwyKu70JinfSMWUTf9Z85W6cT0AicLjdNmn09SJUcAKABqKxE97Zs8t0RQAyo+l
 M4BFqlyF0thYtPFkJbi1aaXXEKCCQP//DZV6db/cMce9CeeDYALZNaeP0ospuduNgkKs
 J0NYtTcHWOoTNQFOt4lZ1ui74tyQKZ0Jrx0x7XmXp+D7peHFgFmZ0U+ldptWNRcVcKuz
 W2ai6+1Eess/5BKOj9etRqugfr+3Fn5uZy+1ZG73AIga+Fp5v917P76/wH8LTNUCKvsm
 9p7Q==
X-Gm-Message-State: AOAM530DVloVJL9yKVyBhim3LxJdYZ52xReYPWxMz12mnBnU3qzUjxNm
 mYJ0y1f+IK8nRbQxFzHiDO+tTGqF7sOUkfgQmLHdqPPOb8pfcWLliN/x4/y3OOt+5BrGQwQx/xJ
 HJkV73pudlSva9ao=
X-Received: by 2002:a05:6638:2610:b0:323:bbe3:550b with SMTP id
 m16-20020a056638261000b00323bbe3550bmr1253321jat.6.1648815346758; 
 Fri, 01 Apr 2022 05:15:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8cIRsAefcaJtvOHm20A51Xh5kXdYOVnlMVS979CiktFDzNllAcdeOO8e92gRXDz9BZlj29Q==
X-Received: by 2002:a05:6638:2610:b0:323:bbe3:550b with SMTP id
 m16-20020a056638261000b00323bbe3550bmr1253316jat.6.1648815346571; 
 Fri, 01 Apr 2022 05:15:46 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a926701000000b002c25d28d378sm1175237ilc.71.2022.04.01.05.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 05:15:46 -0700 (PDT)
Date: Fri, 1 Apr 2022 08:15:45 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] intel-iommu: correct the value used for error_setg_errno()
Message-ID: <Ykbs8afTWA9qLvbt@xz-m1.local>
References: <20220401022824.9337-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220401022824.9337-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 01, 2022 at 10:28:24AM +0800, Jason Wang wrote:
> error_setg_errno() expects a normal errno value, not a negated
> one, so we should use ENOTSUP instead of -ENOSUP.
> 
> Fixes: Coverity CID 1487174
> Fixes: ("intel_iommu: support snoop control")
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


