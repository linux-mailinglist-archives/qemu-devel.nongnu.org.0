Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CA231869B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 10:08:14 +0100 (CET)
Received: from localhost ([::1]:36130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7xN-0008DQ-59
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 04:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lA7vB-0007Bd-OW
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:05:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lA7v8-0002Hv-Na
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:05:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613034352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p/iEe5dpWF8xZpEEUFzKabFpTRbsc5T+TGhP04CHsuo=;
 b=EUJou3QUdstrOOrOP8cLv0VI7iM3P+fn2S6Ji5P4gLn6Da02hZPT3onsdq7kML7I3TmSmQ
 Ug27sYX1gTzFvk0F66+ZEQZCnoXpmlkNOni4eWDu3TLSrtqgo5T2BQzMwTrjru4K/RJ+3G
 +bR3Gn+3e1p+rvUUJc0qrfATXXlvGrI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-PhGCDVhSNXy99NgnUU6puw-1; Thu, 11 Feb 2021 04:05:51 -0500
X-MC-Unique: PhGCDVhSNXy99NgnUU6puw-1
Received: by mail-wm1-f69.google.com with SMTP id c125so1555851wmf.9
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 01:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p/iEe5dpWF8xZpEEUFzKabFpTRbsc5T+TGhP04CHsuo=;
 b=QBKfTzYY/Vwln2yVLh005bIMaLyiOLQiW6bo1VIt073gHwn99aNoqQ9Tnvz9W2F+n6
 d18Kf5AYbWiAgHb24M4Fbd/nD8VNrIEvx7AksYqofLbs8QncnicTNKbjuVvnUXqg0BQP
 9ojfZHmJ1maj6J2Q/jpIUs33kTHYW433T91Bf6ueZrXcvk7K3hlhivROKOCHNRFySDnT
 n//hucF8UKEJ8Xj32PVzn5FmgnUF+DWlwBK1gbN+IRHQ0NA4POD2KKAx25z9f2YEceMt
 DQl2Mq8mjdTwPm5jPFpU1xXQBepVsmxYilGLwc3FU0eGskJ9ooElXpErGIk9QB6hoQTD
 uYDw==
X-Gm-Message-State: AOAM530xaxjkVHOUClNCVgjCOw8mvFhNqEd4bT+wQZTFTvv/U+M/xHIX
 gDkFqk2VaqBq4e/0qz9dxLDdOowMQSmjuphIsCaqoVRCiJNRDQqsCu6S9jjqY9n/4x38fdpk7j6
 lH8DXfg34dV6HZ+Y=
X-Received: by 2002:a1c:dcc4:: with SMTP id t187mr4100916wmg.107.1613034349820; 
 Thu, 11 Feb 2021 01:05:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTKSA6BA8nAdlKxAjWlEw27SEQPtWIcnyghbkXzpmzj3cO1YQ6FuD2PUoq+IKh2eqtcB1OKQ==
X-Received: by 2002:a1c:dcc4:: with SMTP id t187mr4100896wmg.107.1613034349679; 
 Thu, 11 Feb 2021 01:05:49 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m5sm6379336wmc.25.2021.02.11.01.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 01:05:46 -0800 (PST)
Subject: Re: [PATCH] virtio: disable ioeventfd for record/replay
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Cornelia Huck <cohuck@redhat.com>
References: <161303249335.948571.16873882207700527766.stgit@pasha-ThinkPad-X280>
 <20210211094406.664520e6.cohuck@redhat.com>
 <ad446311-c5f9-9887-73d5-3c1f3707e5d1@ispras.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fb2d2816-a696-a407-2f92-ec5950db9c4d@redhat.com>
Date: Thu, 11 Feb 2021 10:05:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ad446311-c5f9-9887-73d5-3c1f3707e5d1@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/02/21 09:56, Pavel Dovgalyuk wrote:
> 
> That's right.
> It seems, that ioeventfd is used in virtio-ccw, virtio-mmio, and 
> virtio-pci. The second one is related to KVM only, right?

No, it's used for TCG as well (with ARM "-M virt" or x86 "-M microvm").

Paolo

> And the first one should be updated too for replay.


