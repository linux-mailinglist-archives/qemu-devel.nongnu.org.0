Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CEC625928
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:16:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otS0m-00077b-25; Fri, 11 Nov 2022 06:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otS0j-000744-TW
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:15:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otS0i-0000uw-Gd
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:15:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668165347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QrHOLP8rSzE1Er26tZpZAeiugBWUkeHa1qtarIVCAPw=;
 b=I4RgFaHD/G95/BGwny1/xXcJIkpjS9rUc+gAqpCWRNv7t7z/xQ2fQP51w3DCP8ChMLmSVT
 pqhTal1JXQRKW/CjlWPX/zCFCcfRejZYUcKnWA5mu/rDB090jQOI3guFVd7SZTzSsy8oRi
 TB7JR8TGNvNZxunLoPi1Fhagw4bcJTM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-294-kYOXSaMVPEWzWbT4uF1XFA-1; Fri, 11 Nov 2022 06:15:46 -0500
X-MC-Unique: kYOXSaMVPEWzWbT4uF1XFA-1
Received: by mail-qt1-f197.google.com with SMTP id
 ay12-20020a05622a228c00b003a52bd33749so3380941qtb.8
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 03:15:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QrHOLP8rSzE1Er26tZpZAeiugBWUkeHa1qtarIVCAPw=;
 b=ObZIZ3bL9oM9siHm2BRIEBFp8kPlKSr7e2WPYA/bP4EziCYBVOLw4gFP6CQmFNenGT
 EvGd0UCiyLYTOP9SCkTad86tQ1Y30qOfRIRcxLr6Z+FJ/KAESTa0C3R8xeSNKHKUQILu
 gF5sPCooM8rSgAgy6eZEhL7In4mP5QMzzLsngdF4QwjbLdi6N95ZtU/JBYcVl+K9aQz2
 G9bieGGcMkL2V0fVdzLbu3nH3ZKTCbA7OzJ2vIJ35OISj0xQ8xpMTdIt8qNbAM4XqySL
 u4EmObmviveYuhn4BtB7ILAWvayV6YUi93GBMIKGMLGQtl9HdA1es3i7qEp2JmaA3jKL
 Ek7w==
X-Gm-Message-State: ANoB5plYIdJWBWvi8geppyNKfaLHRn5gNp4rRB1NLPYz2xIVpN60kncG
 nBTfJP/Z8DwYK5XLUeGDi7L5X3iiO/R6C3TNZVbYc2uZdPbVFyFC9+D8W8DCC4sP8PuvIWcQq80
 nBwr5+MRwInQ1mD4=
X-Received: by 2002:a37:843:0:b0:6ee:82bf:188d with SMTP id
 64-20020a370843000000b006ee82bf188dmr550591qki.744.1668165346458; 
 Fri, 11 Nov 2022 03:15:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4k4toCrv1QYLiV00jAVuQgnXYfo8yO4asOJC+BjJSaM81yp4Wd/qUGWv6v3S1iLfCp9wsDKA==
X-Received: by 2002:a37:843:0:b0:6ee:82bf:188d with SMTP id
 64-20020a370843000000b006ee82bf188dmr550581qki.744.1668165346244; 
 Fri, 11 Nov 2022 03:15:46 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 bj17-20020a05620a191100b006cfc1d827cbsm1303454qkb.9.2022.11.11.03.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 03:15:45 -0800 (PST)
Message-ID: <b2d14da2-b760-7994-f16d-df71f675503b@redhat.com>
Date: Fri, 11 Nov 2022 12:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 05/13] block: Inline bdrv_drain_invoke()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: stefanha@redhat.com, hreitz@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-6-kwolf@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221108123738.530873-6-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 08/11/2022 um 13:37 schrieb Kevin Wolf:
> bdrv_drain_invoke() has now two entirely separate cases that share no
> code any more and are selected depending on a bool parameter. Each case
> has only one caller. Just inline the function.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>


Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


