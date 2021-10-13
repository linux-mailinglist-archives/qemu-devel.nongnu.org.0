Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D063C42B71F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 08:28:24 +0200 (CEST)
Received: from localhost ([::1]:47658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maXkV-0005aA-Ua
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 02:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maXhY-0004AZ-BH
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:25:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maXhW-0001yF-M0
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634106317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G38JLQGSQsyIEnQ9N+YTXzr9SH5V/6f7/dVKrAFqJ0M=;
 b=DFNE5sbjRD3hJVhPfd2dMmP4hRqx58AreNAeOifui7IeG1W+VrKzqBMEKZc2o+VWx5tIwi
 P3aGmDOnxLVxuLLlfuumr26mruZioGPAhJUZLN2O2XJeH7KUro3MBrYG7lGd+k84d16M5m
 GBKeSNfwMGXGxKzzRgqx6qa/gnirdqA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-fEBvMkMUOZ-XkoUlAON-lQ-1; Wed, 13 Oct 2021 02:25:16 -0400
X-MC-Unique: fEBvMkMUOZ-XkoUlAON-lQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so1153426wrh.0
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 23:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G38JLQGSQsyIEnQ9N+YTXzr9SH5V/6f7/dVKrAFqJ0M=;
 b=IhQXzNjMQgM77fLHkB90Mx0cn81yeU4EgAcIrlQzPV9VrJZaxBummC2aPJzml4rxpG
 ee1mb1Y8OlXaL9IQFLny2ghAZrOZvkFkmcAAJYwFHAyi3L9dtoWN3+VG3QWJhdXueKak
 jS0JojbV8K7a32gsvXW1xR6r3Q+2y3hoAWi0N7jjiA6stDjRyBK+MaIy9VpssUkEouPr
 XS6+yrKrI7z+KyLuDpD/T9AVQ3clCEMrDnV11KgEozDunyHvZtlKCWNiuHMXMpNVFYJg
 NzgPr8t38GryrhoEXyNv9dX3JbWma56pqld8YPAsDv3FOtbLyHx3+jF/VHqBtUIZLhJ1
 ABnA==
X-Gm-Message-State: AOAM532++jPuZAynAB1twC/PoIHBqd94RNBADbrc5AMskkZhtwucK4vM
 m7dZk8AMP/14/+GFH0+W4e4ATcPANuNbaleIer25uow7FKPZaTuMVlRrQoF8t0lrgtCAlA4kdsC
 5XfGs5zC83UdaH9E=
X-Received: by 2002:a05:600c:4ece:: with SMTP id
 g14mr10895130wmq.95.1634106315460; 
 Tue, 12 Oct 2021 23:25:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzlT59X7thlbOzUikzgQ9HxtnQbHQmD1aQ7jEUmQ2j7LqRckJ2ieL9wt/6qh6X/aH6hl1UQg==
X-Received: by 2002:a05:600c:4ece:: with SMTP id
 g14mr10895115wmq.95.1634106315279; 
 Tue, 12 Oct 2021 23:25:15 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id g1sm5239320wmk.2.2021.10.12.23.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 23:25:14 -0700 (PDT)
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20211012144040.360887-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/3] s390x: reduce my maintainership duties
Message-ID: <d9549b5a-3129-cb44-8bdf-578da39297c3@redhat.com>
Date: Wed, 13 Oct 2021 08:25:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211012144040.360887-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/2021 16.40, Cornelia Huck wrote:
> I currently don't have enough resources to work on s390x as
> much anymore, so I need to reduce my workload. For many topics,
> we should be well-covered already, so I'll drop out from those.
> 
> Don't worry (or rejoice?), though; I don't plan to disappear.
> 
> Cornelia Huck (3):
>    vfio-ccw: step down as maintainer
>    s390x/kvm: step down as maintainer
>    s390x virtio-ccw machine: step down as maintainer

Queued to my s390x-next branch now, even if it's hard ... thank you for all 
your great work, Cornelia!

  Thomas


