Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F6F3C704D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 14:31:32 +0200 (CEST)
Received: from localhost ([::1]:53448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3HZS-0000uP-VN
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 08:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m3HXs-0008WQ-PQ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 08:29:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m3HXp-0000kW-Pm
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 08:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626179388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+1o5E18U7UXcpAwDfZdefDbyTfPts7zdxh0wbqm4SLQ=;
 b=YlEpJ/bMmcnEeojcSrHxdFblKcQwvPdpOl9uF59hIPpo+2/19TIjRPQsllLv2mYHICOqA5
 MrjK6YzGnlpLsZzllY85ePv7uiWDp6XCZ7NO8i3zrKqvBqOAAW74ilK6pabbQjG/COvzy6
 uGmGHcXQ0vRyzHKMIWpSC+ESx/4g2i4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-44ayPA1dNXK-DNinOMB4MA-1; Tue, 13 Jul 2021 08:29:45 -0400
X-MC-Unique: 44ayPA1dNXK-DNinOMB4MA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k16-20020a7bc3100000b02901d849b41038so462362wmj.7
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 05:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+1o5E18U7UXcpAwDfZdefDbyTfPts7zdxh0wbqm4SLQ=;
 b=pxotFqty7IOypsSDBYjOMRZqYyprhnp1AZUl+YgNNY1p8bei41UeHSNlIyEpCJCgJm
 y6O8H28K/SrJQZYOvUC114N9DPQ4eNv6KueGxYn8UrxkmmWHGjJXp3KAlPe/MMArrDrI
 ffzu37OQbMhf/J12Bkgl8G7zsJk0t4Rp1nqHfU4yxYdRkWrM1vjwHXyrtoMFhQZwwX8q
 T0z+ox9geyBNDh3hnfkvS6qOE3M0DPDyy89VkFzAjNICiMElfqiHfwlGvBsTs+8UY49e
 XR5H1GO9kscsOgMyOClF4zMSHuvedl12E5aJCqGeMob7ffnxsJm8G5dXZerqlUyrce4g
 rw2g==
X-Gm-Message-State: AOAM531meElfyfTvQg3nRD99OxolrU3NUritp1CclIr4ciHfqdHO9nvq
 qp0XRQe6f5q98rG8GfhvHm4TsfJCikqbfT37uR0942ZfUYN1el3R9OrlguNBUAco5Z4X6WK0UBC
 QMqHQ2RaTtNXITQA=
X-Received: by 2002:a05:6000:1243:: with SMTP id
 j3mr5694459wrx.244.1626179384611; 
 Tue, 13 Jul 2021 05:29:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq26xP5N9xA6EHxHd1YODUhs34YfZEniYZYM9yDlYFPKezHOtVewO4ejoNBwTPk+ekq3NrgA==
X-Received: by 2002:a05:6000:1243:: with SMTP id
 j3mr5694437wrx.244.1626179384447; 
 Tue, 13 Jul 2021 05:29:44 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u2sm14861265wmc.42.2021.07.13.05.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 05:29:43 -0700 (PDT)
Subject: Re: [PATCH] configure / meson: Move the GBM handling to meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210713111516.734834-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fbc46ce8-511f-65eb-fa62-aa123bfb0562@redhat.com>
Date: Tue, 13 Jul 2021 14:29:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713111516.734834-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/07/21 13:15, Thomas Huth wrote:
> The GBM library detection does not need to be in the configure script,
> since it does not have any user-facing options (there are no
> --enable-gbm or --disable-gbm switches). Let's move it to meson.build
> instead, so we don't have to clutter config-host.mak with the related
> switches.
> 
> Additionally, only check for GBM if it is really required, i.e. if we
> either compile with OpenGL or with virglrenderer support.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued, thanks.

Paolo


