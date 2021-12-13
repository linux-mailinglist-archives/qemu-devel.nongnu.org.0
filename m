Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EB8472768
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:03:53 +0100 (CET)
Received: from localhost ([::1]:47740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwiBU-0002Xp-EX
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:03:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mwiA0-0001RM-2v
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:02:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mwi9x-0001Dc-85
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639389736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KaE1V+fVD7OLKOljNx1IDFA7uDQo9ORBeTvN2cT7sI4=;
 b=W/91rqYdhUczqeE5pBc588c2rjOdOqSfhkymlqgMeFf4Ar5ACbo4UbM81PSGZ16VpZhR2V
 mUelRDQxK8/bd2VJ7ust/ul+i/MkywubQFyQeIKOlc8rVyXSOx6mJc6kV7G0e/OQ4/zZ1B
 Qadi0WKQKA2pYWMW1Gj/+ZN5yyS3KQw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-L-zriTAQM4GZk4IY5z3vHA-1; Mon, 13 Dec 2021 05:02:13 -0500
X-MC-Unique: L-zriTAQM4GZk4IY5z3vHA-1
Received: by mail-wr1-f72.google.com with SMTP id
 q17-20020adff791000000b00183e734ba48so3685002wrp.8
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 02:02:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KaE1V+fVD7OLKOljNx1IDFA7uDQo9ORBeTvN2cT7sI4=;
 b=ul6MuppIGQzbCFbebykVrNMOLE1gwTaHetBn4wBSkBoslkW9byns0ShiBcYazZ/+vV
 0qbfWYR888F9vXnN3X+3CIyUCOyZjI/op0z6Ta8lCwgD4aqqsOKA2Ayx9oV+HJ4IGnZW
 xXDSzI1Al9MfB2Cn0Z+/BHK2ggpFfFpcnb9F9eiDwI2QEecpT3jLNAja+QpZRGMsWZva
 hEojXkH/VIEviXJX2b4f3JEGvW7oE07XJbrkhh4sP5YV+p/jBuPyG2Zx1Cqz6lMlGzkI
 /qOXeWtota+zZA3FjandvOD7TPo8foKgDOmHfdsvRR4FOPnqnJP8wtC+IaTOmDS+Ot6t
 cLCg==
X-Gm-Message-State: AOAM530DBxYWDcXakOuyGjRdGioQXC2yLG1eFELFfBRPlS26x4uUj7fI
 hZzh3WkywEgX/zXZ9nu1CRRgMLCqtF+JcNTMXw6xvOi/UX1nrvMu9OGd6PjaYoeVpMoV7q7J9S9
 EAbFCN7L0qh24f7o=
X-Received: by 2002:a05:600c:4104:: with SMTP id
 j4mr36470122wmi.178.1639389731996; 
 Mon, 13 Dec 2021 02:02:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtcy8F1At7EX1ZYHjG2kx401S653+Vw/+ZZrY9Baa8NZ51JcbuVr3hSaC589VcxVnnqBMvNQ==
X-Received: by 2002:a05:600c:4104:: with SMTP id
 j4mr36470092wmi.178.1639389731770; 
 Mon, 13 Dec 2021 02:02:11 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id y15sm14753998wry.72.2021.12.13.02.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 02:02:11 -0800 (PST)
Message-ID: <42569854-21ab-a821-49ac-8ab04c5e874d@redhat.com>
Date: Mon, 13 Dec 2021 11:02:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 0/4] virtio-iommu: config related fixes and qtest
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org
References: <20211127072910.1261824-1-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211127072910.1261824-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: lvivier@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/11/2021 08.29, Eric Auger wrote:
> Introduce a qtest for the virtio-iommu device. The test
> allowed to identify an endianess bug in the get_config().
> We also remove the unneeded set_config() and fix the value
> for domain_range.end field.
> 
> Best Regards
> 
> Eric

Thanks, I've queued the series now to my testing-next branch:

  https://gitlab.com/thuth/qemu/-/commits/testing-next

  Thomas



