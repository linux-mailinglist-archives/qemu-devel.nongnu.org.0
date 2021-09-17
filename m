Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E38A40F489
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 11:09:39 +0200 (CEST)
Received: from localhost ([::1]:40272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR9sI-0001eT-5H
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 05:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mR9qv-0000Py-Bh
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:08:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mR9qs-0002Ol-V4
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631869689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V5HQSopQ6f9Gj4o1Ly9Yb4R8kWw02BHdFLYsCzXQRBs=;
 b=QZ55hushImAMWmZ9QIaQFX9d6NGvv0dQuZqGQppNQlwdNxrYlfB8lcWzoKLL5JylzmquYg
 R8asb0Dk5139n8eaxfTNPqJhYcA57f3RYCpWPdkKSvs2F68mBY2Z+jLImxtNpG6FxDr6ik
 hGIJ5NgXPFOHqq0r0FPo2zI92E493B0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-0NY8yP5vO_WbIwMBvSR_-Q-1; Fri, 17 Sep 2021 05:08:08 -0400
X-MC-Unique: 0NY8yP5vO_WbIwMBvSR_-Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so3486822wmj.8
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 02:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=V5HQSopQ6f9Gj4o1Ly9Yb4R8kWw02BHdFLYsCzXQRBs=;
 b=XwplF1KB+uFdssKwztJyjPxUhwjWC5Zc/znWUj9jrgSCCKJ+lAVs03KLExJtE5SPye
 uNmXQQKRyyju+ksRjdC5kNPoAipzsaySwSQMnmWDMri35uAj94L+IV2MeauQ7sSgdc+A
 PfHLOy3+rPR6mANnWmtM3yU6/0h8Bn5JhqKQSdq7rn05yzuNmVR/9BOzvjBgQoxkeA5V
 AaIPymR15p02qtWCMFfWUOUJ5cbxLHWQBImOCtPZbMGRCV4Jg4V3TRY8W+N02k6r702t
 5kryTNApaB+4Ej4DG+33NJX0uUjdr/w/NLAmW/WO0e2tJ691MWGt12p8PDguwhOOdRAY
 Dldg==
X-Gm-Message-State: AOAM531hdMdwOpQw6vkeDFWdZHHAeMmFEj3qOzr5LwuKIPbYJyKb+1Eo
 iYC5TsfB2wKGzPo8rUc/BsEJ5TdUtxXl10yt7TWkutIomBFeSN7/h1eMUhDg0B5RFrU0LGEvOD2
 O/yx6LUxfdtkLuNs=
X-Received: by 2002:adf:9d47:: with SMTP id o7mr10889092wre.50.1631869687425; 
 Fri, 17 Sep 2021 02:08:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygubMCdPFShdicPHGufU7crmrElt4U3wPGqYnNZlQLrVG3+wgZz0tVMHPpcHwN0+U/CjviGw==
X-Received: by 2002:adf:9d47:: with SMTP id o7mr10889070wre.50.1631869687250; 
 Fri, 17 Sep 2021 02:08:07 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id o26sm9950976wmc.17.2021.09.17.02.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 02:08:06 -0700 (PDT)
Subject: Re: [PATCH v3 05/16] iotests/297: modify is_python_file to work from
 any CWD
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-6-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <79575288-2552-15d4-8694-db2bc2fe9347@redhat.com>
Date: Fri, 17 Sep 2021 11:08:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916040955.628560-6-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.09.21 06:09, John Snow wrote:
> Add a directory argument to is_python_file to allow it to work correctly
> no matter what CWD we happen to run it from. This is done in
> anticipation of running the iotests from another directory (./python/).

“the iotests” or just 297?  All of the iotests would sound like an 
ambitious goal.

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297 | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


