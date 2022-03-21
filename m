Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270C34E2DC0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:21:48 +0100 (CET)
Received: from localhost ([::1]:39296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKmx-0006AW-6L
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:21:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWKg8-0007X0-QK
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:14:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWKg7-0008D1-AQ
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:14:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647879282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/+Io6mk0P2tGIkZjVq2duwthE+SrjmeKyiJ8/e18nDk=;
 b=O7kos6tnk0L737uJYPPqWhRXwFtV9/Zg7eSjqCzcaVi00yz/APz0lXgis+ItAm/hUcUaDL
 MzNbZvDZEE9XCXZYczb8O1nBe/UZ3/eMaRK1GuxtLX0m58EL5b3kGzTPv0j6wEN5G5zR18
 ouGrQCwk4gQaAqRd5Ejm4e5jADH8zIE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-3C2FIzhYO62bAfEKkBs_Hg-1; Mon, 21 Mar 2022 12:14:41 -0400
X-MC-Unique: 3C2FIzhYO62bAfEKkBs_Hg-1
Received: by mail-ej1-f70.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso7330573ejs.12
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/+Io6mk0P2tGIkZjVq2duwthE+SrjmeKyiJ8/e18nDk=;
 b=a8JFPbE7F2Brr70ZK5O/7YndUqzZd0zhevOhywsGGivLqJ13c39nDfdwCZW/pMqAWn
 Zi9rKUwySBLPF8gIc9GaYrNw3rjemDn/GtQ68wIILL2Gm5qWoOFOe4pkroWXOuJaJDRp
 yceLJQLzch0n5y/m8bmt7s8UzKDt45tmnQ/y2u74zah4ftKnhCrHgXP0yB49SfZlllxp
 479gzaRk4uubzkyyh5bk+l24afrlwahLZg9WBYfavoDEn3RRjdWf60iL1WkHDMAFd3Qq
 z32OzMOwj6QqmyOY0bb+NBn8abwgFtoiH9NNIkHF0VxGYxz/FdXI41Yge1zWmr5xLbuC
 dKnA==
X-Gm-Message-State: AOAM532NvRJw++sI52+Pyb0YEjSfaiKlWDwOZylb+4Q6aeZEBgW3ya5l
 HcfCpQUJ1ordVHGrJ4T0Z7D5YzUWiv7wOkDtF1uC+5+T6xyTGq0Dchb/+DHzNoxdQyYuWvlUMrH
 GKQEcJOdskFf17J8=
X-Received: by 2002:a17:907:980d:b0:6d6:f910:513a with SMTP id
 ji13-20020a170907980d00b006d6f910513amr20812844ejc.643.1647879280138; 
 Mon, 21 Mar 2022 09:14:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoZFOi9t+C68U5suUA2Ok+aH19zZm0bqkSfol8sA/zPSGrub/E3Lq/IakDw53hiIA0V73/uQ==
X-Received: by 2002:a17:907:980d:b0:6d6:f910:513a with SMTP id
 ji13-20020a170907980d00b006d6f910513amr20812832ejc.643.1647879279980; 
 Mon, 21 Mar 2022 09:14:39 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 og49-20020a1709071df100b006db0dcf673esm7225408ejc.27.2022.03.21.09.14.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 09:14:39 -0700 (PDT)
Message-ID: <678cd508-fb61-4bd0-4d68-f1644f3baeb8@redhat.com>
Date: Mon, 21 Mar 2022 17:14:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/4] tests/qemu-iotests: Move the bash and sanitizer
 checks to meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20220223093840.2515281-1-thuth@redhat.com>
 <20220223093840.2515281-4-thuth@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220223093840.2515281-4-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.02.22 10:38, Thomas Huth wrote:
> We want to get rid of check-block.sh in the long run, so let's move
> the checks for the bash version and sanitizers from check-block.sh
> into the meson.build file instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/check-block.sh           | 26 --------------------------
>   tests/qemu-iotests/meson.build | 14 ++++++++++++++
>   2 files changed, 14 insertions(+), 26 deletions(-)

FWIW

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


