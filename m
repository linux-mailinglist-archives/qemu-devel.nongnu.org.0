Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799524F9908
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 17:08:35 +0200 (CEST)
Received: from localhost ([::1]:58630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncqDy-0006cj-JJ
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 11:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncpwA-0002gs-4D
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:50:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncpw7-0007h6-UQ
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649429406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=91iaYYgs3fMq24NZCfe009fHrqzI3APvsmUag0ANRf0=;
 b=Q2Bhf0kXUEGvyMa/ggs33sV35sFNmZIfi2jzeJF37fSFVJ2WUBNWgLyNbVtum8GZgDzOPs
 Omwn/AD+d9OXJXm1sXtZhhtVoreQWuanKR9OepLHlfYZZnv8weA7cJZz91HnKFcYWKqoKF
 HcIMQkzkTlvu+EK/ZhkPyCkiTucPxmk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-eaJON9X4OfmPK6N5phXwMw-1; Fri, 08 Apr 2022 10:50:05 -0400
X-MC-Unique: eaJON9X4OfmPK6N5phXwMw-1
Received: by mail-ed1-f70.google.com with SMTP id
 l24-20020a056402231800b00410f19a3103so4746664eda.5
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=91iaYYgs3fMq24NZCfe009fHrqzI3APvsmUag0ANRf0=;
 b=5NgzYTyqZVpBdQrXnWxPxCJ7kzOKI+h0RPRHzUqzjoVAzsiXo9ghvdNXe1PvvX872f
 v9aZimpRGb48PxEGLH+QTqUwkps1T+rDJvJt+9YLOLofoafqq6I0O68uGnFnZasaE0Yz
 8JNjzzadIf+9ebShu1XJkuYjEpFQlkVhBZeSw2WZSNfS8QrHqF/a6yjdFVZTz+Ynd5zZ
 dqrF8Bk8KP2vxS6Y/gIgMXe4l+gtv24k8Z3fkFr5k1Iqk/xlYJcB418dhHESxHml33yu
 nyo0DpDUwKJltlMRZVGzwJvw5dhoXV9ZywMI18FsuPUqyM4ITbTtsyiQC417CIZIRD+G
 iJQA==
X-Gm-Message-State: AOAM531o//iy1He+/vHXAc2NlM0NF8IInwN6VBJ4Dx5GcFq5ToBmhNch
 JKPJBrGJmI3JwOnhci5k4YBawAbWnPFKFpmyBwyoM5CkK/Z0Q+MqMCgqj7cVPR02bhOfxYASB7F
 7icNBHv7aW2AEOtI=
X-Received: by 2002:a17:906:5e53:b0:6e7:681e:b4bc with SMTP id
 b19-20020a1709065e5300b006e7681eb4bcmr18998467eju.139.1649429404662; 
 Fri, 08 Apr 2022 07:50:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/Kut4TBpG+B2W3S6sQ+0W7leJowfVGCJ+IdFazE/sRTJ1PdKu9q8duMt8EuKJGPhotqDCwA==
X-Received: by 2002:a17:906:5e53:b0:6e7:681e:b4bc with SMTP id
 b19-20020a1709065e5300b006e7681eb4bcmr18998454eju.139.1649429404509; 
 Fri, 08 Apr 2022 07:50:04 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a170906689800b006e835893777sm1791080ejr.52.2022.04.08.07.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 07:50:04 -0700 (PDT)
Message-ID: <a98919f8-4805-0d2d-9255-c484050f5256@redhat.com>
Date: Fri, 8 Apr 2022 16:50:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 7/7] iotests: copy-before-write: add cases for
 cbw-timeout option
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220407132726.85114-1-vsementsov@openvz.org>
 <20220407132726.85114-8-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220407132726.85114-8-vsementsov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, vsementsov@openvz.org, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.04.22 15:27, Vladimir Sementsov-Ogievskiy wrote:
> Add two simple test-cases: timeout failure with
> break-snapshot-on-cbw-error behavior and similar with
> break-guest-write-on-cbw-error behavior.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   tests/qemu-iotests/tests/copy-before-write    | 81 +++++++++++++++++++
>   .../qemu-iotests/tests/copy-before-write.out  |  4 +-
>   2 files changed, 83 insertions(+), 2 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


