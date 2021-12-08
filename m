Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0756346CE6A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 08:35:30 +0100 (CET)
Received: from localhost ([::1]:56572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1murU8-0002iE-K5
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 02:35:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1murST-0001zq-2R
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:33:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1murSN-0006jw-PR
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638948818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KN2AFOxNPQ8gvBU+3HFZX01HR6GOpLaS7P6gAsnWFI=;
 b=OQo2R8obh/sfxS2jVL7RWoi93fMNUJ2nP4/FEFM+huJLp4xbwTqDwpdEztikvTRoZnOLPo
 S43q1d4rWuDHk9extr42MpDJoWPQ75iLyk1oTE96y01t+/nckSWkEYLNXlydKvQI2+nBCG
 7NmJTMKE5l2tAgegCWcsDiRDcUrNuio=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-pka4Lk5cPGyKYV9KhJ2TPA-1; Wed, 08 Dec 2021 02:33:34 -0500
X-MC-Unique: pka4Lk5cPGyKYV9KhJ2TPA-1
Received: by mail-wr1-f70.google.com with SMTP id
 h13-20020adfa4cd000000b001883fd029e8so164901wrb.11
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 23:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2KN2AFOxNPQ8gvBU+3HFZX01HR6GOpLaS7P6gAsnWFI=;
 b=SYtNcNExm9C9C43uD4ve482ZchdL4t3qgNJaXKXJcAC3bG7B2Ammi2iH/ipM2huB9r
 lmpLXgXGwY4W/k4LN/jh7MlsblFcBDuzNmlAj89OBkCu9XUqauwGN+bdlA3dpgfTgraA
 KqFztCHhSiGaVT3PO1+kHBcoP8joZMQ/aoMnmvtdhDAtL0TKdf7pjAihzO70JvWSzC04
 KV/17N6BjyuXshmNSoxSNJTEePn4fcirjc+Kob8p+rfRZ1MdUMVabT06/JfYMmRsUAsV
 6CWY5ofcrVZMSJwfgNmg4xcNHYzIt/Up6C8iG04X31p/vS9YIRcc6Gjgxsa9dHL3MOeg
 tPQw==
X-Gm-Message-State: AOAM530Zfcf4WYOButJBRa4LlQrnUtB8vXupzX9Iapb7oUxYp2EYGVE/
 V4jYTCqI0O2Jm5bqk6Ex7DGiFdk4c0S/ubzhnSX0N/z9d/BPsNEX11cCkj68VoZb/1FyfPGgb0i
 HJOa7+GgPFq+/OYc=
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr56847606wrw.57.1638948813592; 
 Tue, 07 Dec 2021 23:33:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxh/q0hvGeZigxA4AUoKd3mYaKfhWo4mSHVKAe9kwY/QUrUrsEipwXyYNNF/tWaewr4WNkfg==
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr56847587wrw.57.1638948813435; 
 Tue, 07 Dec 2021 23:33:33 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id h17sm1869346wrp.34.2021.12.07.23.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 23:33:32 -0800 (PST)
Message-ID: <0c40316f-aa00-37ff-096a-ac94279d6a8d@redhat.com>
Date: Wed, 8 Dec 2021 08:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 2/4] tests/qtest: add some tests for virtio-net failover
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211207172342.4058491-1-lvivier@redhat.com>
 <20211207172342.4058491-3-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211207172342.4058491-3-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/2021 18.23, Laurent Vivier wrote:
> Add test cases to test several error cases that must be
> generated by invalid failover configuration.
> 
> Add a combination of coldplug and hotplug test cases to be
> sure the primary is correctly managed according the
> presence or not of the STANDBY feature.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   tests/qtest/meson.build           |   4 +
>   tests/qtest/virtio-net-failover.c | 771 ++++++++++++++++++++++++++++++
>   2 files changed, 775 insertions(+)
>   create mode 100644 tests/qtest/virtio-net-failover.c

Acked-by: Thomas Huth <thuth@redhat.com>

I'll take this series through my "testing" branch (unless someone speaks up 
that it should go through some virtio/network branch instead).


