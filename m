Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637EB620B69
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 09:44:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKCL-0007Re-SG; Tue, 08 Nov 2022 03:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1osKCK-0007RI-5x
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 03:43:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1osKCD-0000ON-LU
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 03:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667896981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WfdOiAH+ig1LrnHRKKI75HoLgXvM5OcxXup5DnrhUws=;
 b=VGTkwbnmcrpYywp6Q2DbZXbeygHqfq1Bmp+Hawj6ZskjTyHL59ihNT4ZR6SKPwnj1k+tOD
 mes7OlWMXO+mUCUyM3u5KtGArHSFKDjNj7xaUoLwJXHfATdxM84VP8tI3DabY+/8BMr+a8
 OzS+d2lqCK4TYl18qCT6FpUDHsaPZDE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-344-wD_q5idXNYCPePY2uINU1g-1; Tue, 08 Nov 2022 03:42:59 -0500
X-MC-Unique: wD_q5idXNYCPePY2uINU1g-1
Received: by mail-wm1-f69.google.com with SMTP id
 l1-20020a7bc341000000b003bfe1273d6cso3597211wmj.4
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 00:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WfdOiAH+ig1LrnHRKKI75HoLgXvM5OcxXup5DnrhUws=;
 b=7EYsgOQSTftemSTsj+1X0wqS1qnfXuWj0ck+MHtti47ti8uoMyPa+RhrooMSCP5yGR
 QxLZ2TxLZPf7YkkxtIFzrOZRE4WepZuGzTRGjpkYlSDDbbpM0yOFWDc9l9BsWFLyZOfs
 TeLwAl+qTdL/ibtSEoU4o2/1xCJODiJv0EngG8mPcDwskwyB20JNgMbDKDHY/0OQxuLf
 R6ep5sGNck9OUG69plDtPqIkvyipREUpPEU0LvhEviUJO7UMqGNnRVLQZ0cbrkmLzRr2
 1/Y8pcI+67rYv+kXtuppVpj61T1lAvGvX5cgJmIBJnllFBjLEO+zdABVsVvDjhHx5SQc
 RPWg==
X-Gm-Message-State: ACrzQf1zHH2P90031ZUS/y0Zx/tPF4JLaF2LM9GmKPlOo7mfOaNrQL5P
 aEjSZFCZ+Nw91dOouQ66qOVUCR14i0GSitNk4aalezqi04/nYnRPOgFEg11VSuDbHW3UN/D+1Mq
 sk5iGNVbPDQXTU4w=
X-Received: by 2002:a05:600c:4e45:b0:3cf:3e69:9351 with SMTP id
 e5-20020a05600c4e4500b003cf3e699351mr46978537wmq.2.1667896978515; 
 Tue, 08 Nov 2022 00:42:58 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5cgstsTz/t+K0MaFXTDVP9NXxji3vVW6wvh3jYW1Gs7nTrrl/i88BrpPUjDscF8JOChh6UlQ==
X-Received: by 2002:a05:600c:4e45:b0:3cf:3e69:9351 with SMTP id
 e5-20020a05600c4e4500b003cf3e699351mr46978528wmq.2.1667896978331; 
 Tue, 08 Nov 2022 00:42:58 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 z3-20020adff1c3000000b00236e834f050sm9370437wro.35.2022.11.08.00.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 00:42:57 -0800 (PST)
Message-ID: <6d6d0704-de37-db36-223e-f770311c70fd@redhat.com>
Date: Tue, 8 Nov 2022 09:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/3] net: Restore printing of the help text with "-nic
 help"
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, pbonzini@redhat.com
References: <20221104125705.415923-1-thuth@redhat.com>
 <20221104125705.415923-3-thuth@redhat.com>
 <92cea786-0a5d-1ddd-68d5-14ca98143614@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <92cea786-0a5d-1ddd-68d5-14ca98143614@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 07/11/2022 13.27, Claudio Fontana wrote:
> should -net and -netdev be adapted too?

"-netdev help" already works just fine ... and "-net" should IMHO rather be 
removed than improved ;-)

  Thomas


