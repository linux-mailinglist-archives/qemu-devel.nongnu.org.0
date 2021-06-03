Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B253999B0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 07:17:25 +0200 (CEST)
Received: from localhost ([::1]:43510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lofjQ-0007AV-Cg
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 01:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lofiV-0005kf-Cs
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 01:16:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lofiR-00057O-6U
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 01:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622697382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e9fVW+TS01EtXuoY9K/YrOHbK6T0Q+5KB+hPp54i7GQ=;
 b=UD8NmQncw0XF7rlZo1neT+eqyC7zZanC19580KhxphqgqnnrlEgyy3sO47zvGfUmyG8qnC
 R+Cj6lEPjiakCEU/Jt1IHiSULGr+xixkTkFkrGboQD3oq7MxM1V64WcMbmL4KcZpYir1Mm
 Ei4uGKy1Pzig+qB94HOZ1XzI8IoDlmQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-6LtSRBhTMT69prRl-8ZRoA-1; Thu, 03 Jun 2021 01:16:18 -0400
X-MC-Unique: 6LtSRBhTMT69prRl-8ZRoA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l185-20020a1c25c20000b029014b0624775eso3047314wml.6
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 22:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e9fVW+TS01EtXuoY9K/YrOHbK6T0Q+5KB+hPp54i7GQ=;
 b=gKqtdzMcSh/WK2XaR2Cv818gqgmarFpb2MNcmG2DNd0fH5Ln8abZV0VKD992JhzsnS
 D4Hj9EOw8Fw67f3wNxwbYwfOw8wLjyvW6HDrL15OeaIBeIo1RXnWPhTDH43Z2bwt17qP
 0A2s9MXU9hbKqSfJegqc6OjUUvYGzqY1HqUHoV/+CwCgFPX21Y3viDfMsXfA2wRQSGPj
 wt1Cw+97yrG6bCiYeFzRBs8bElnuhIYhbnyARrRhQatwX5qjjXoJvgb92xOGqOQpacw8
 FlCz53LdQbZS3huNMdskNZYULjuck9xv689yp/4DzL54FUAVkcpfYrMPabsoiUeXwC65
 OfwA==
X-Gm-Message-State: AOAM533a6sC+uIerTpqittahuaYPOf2gWwPtaT3ORkrBYnvbARG5deet
 m25rcIn4WkDBq5X5dqxQ6A4u/dK1NskcgAnPQB0nJSOQlfFAJn4C4UZr+MQrSE5TUB74rwnio/C
 2jhFtsx1SRi17Ihz+yTfojYbxkybN5ko85QotW6sasAzVC4mWFhuzwQSFuNbbjnw=
X-Received: by 2002:a5d:64ec:: with SMTP id g12mr1178115wri.137.1622697377291; 
 Wed, 02 Jun 2021 22:16:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCSyPXVaWnabXjP+FemrvW/gpjvPs371x1OHajB7tvAodyBwUiCOfrSwr0W4ucLtmsI0qaIA==
X-Received: by 2002:a5d:64ec:: with SMTP id g12mr1178098wri.137.1622697377047; 
 Wed, 02 Jun 2021 22:16:17 -0700 (PDT)
Received: from thuth.remote.csb (pd9575772.dip0.t-ipconnect.de.
 [217.87.87.114])
 by smtp.gmail.com with ESMTPSA id l18sm1915769wrt.97.2021.06.02.22.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 22:16:16 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] GitLab: Add "Feature Request" issue template.
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210603001129.1319515-1-jsnow@redhat.com>
 <20210603001129.1319515-3-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5cdd0320-bc34-35b1-74aa-1fb7d677d8bf@redhat.com>
Date: Thu, 3 Jun 2021 07:16:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210603001129.1319515-3-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/06/2021 02.11, John Snow wrote:
> Based on Peter Krempa's libvirt template, feature.md.
> 
> CC: Peter Krempa <pkrempa@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   .gitlab/issue_templates/feature_request.md | 32 ++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
>   create mode 100644 .gitlab/issue_templates/feature_request.md

Reviewed-by: Thomas Huth <thuth@redhat.com>


