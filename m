Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9944547E0F5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 10:47:08 +0100 (CET)
Received: from localhost ([::1]:46590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Kgl-0001nk-Ar
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 04:47:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n0Kew-0000sC-RQ
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:45:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n0Keu-00073i-87
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640252711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WHk+E7Fe30hqNla/gUkc9YaWFlwvzFIYoGHu03hzJ8M=;
 b=gNJpR6NdmjVBQbNhO0ZTrIG4VUIFcpqG8p57vHWBOBvq33t+QQFL+gnhUGHJIOffTJ96Q9
 tn4+BbHkRgAUliSX/nYjf3fd6fLx0sTXQiHmfZVYJGsCTO1ejt1ofmKKUV5nC1tZEuAnqL
 54B5P8t8Pr5T/hvnjl8IRhyDB5uojNU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-gNw11dTyMMy3SZOcH9EGqA-1; Thu, 23 Dec 2021 04:45:09 -0500
X-MC-Unique: gNw11dTyMMy3SZOcH9EGqA-1
Received: by mail-wm1-f71.google.com with SMTP id
 d4-20020a05600c34c400b00345d5d47d54so498696wmq.6
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 01:45:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WHk+E7Fe30hqNla/gUkc9YaWFlwvzFIYoGHu03hzJ8M=;
 b=7Ri1ex02X1IfQ21JhMF/sSgmjXc63GNhXwB/FmM+6J6CVufjM7cYTXqQIiVHbaZx11
 RMWvRF63picOJ1xluVld6xvU0XHIGP42UnFzX8JyXRA3/aCdzVnPq6PmXWEbC4tphkqh
 xh9Lx2PwL0KEqphP6CJA4la0kpdxR3bkObTLnZ4NRQTcaSPnqK9d/TGROQTwdq26+TgK
 Ajwq3ojXlw8rs7uKilOx/cGqOrMH3wI61aU/ofUsvxpSchshRflqot6/CmtUCTsbMD8R
 pbr9BmvUwdRTQUASMBLFPXo1FEf7VDnjYlOsOs7w9mQlvPcvHFYIZBNyNH6JSw+ZZzGA
 sS7Q==
X-Gm-Message-State: AOAM532KEBR75mAC8aeOAG0qJjcOJrYxRxLarHFWlZsiTt7yqER2jnBr
 8LHOwY6gwfcBCrJ4w52wImEbtkmDkvjh6V6f9SMoail5SQRUA7TmnBUhAzLv91Mcj8BlEdMMK8M
 aCs2ur3sqqWrdL40=
X-Received: by 2002:a5d:568a:: with SMTP id f10mr1104474wrv.509.1640252708640; 
 Thu, 23 Dec 2021 01:45:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJLkIcrJNP3pVUa6Wueze++RbjhsuFMZUeYTcaHItSnmjIIcX43W+HnKmEAz84viEI2Wwjfw==
X-Received: by 2002:a5d:568a:: with SMTP id f10mr1104456wrv.509.1640252708416; 
 Thu, 23 Dec 2021 01:45:08 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id n17sm18994wmc.32.2021.12.23.01.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 01:45:08 -0800 (PST)
Message-ID: <fbdd3ddc-115a-19b0-ce3f-b44c19301799@redhat.com>
Date: Thu, 23 Dec 2021 10:45:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/3] block: support sha256 fingerprint with pre-blockdev
 options
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211118143547.2045554-1-berrange@redhat.com>
 <20211118143547.2045554-3-berrange@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211118143547.2045554-3-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.264, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.11.21 15:35, Daniel P. Berrangé wrote:
> When support for sha256 fingerprint checking was aded in
>
>    commit bf783261f0aee6e81af3916bff7606d71ccdc153
>    Author: Daniel P. Berrangé <berrange@redhat.com>
>    Date:   Tue Jun 22 12:51:56 2021 +0100
>
>      block/ssh: add support for sha256 host key fingerprints
>
> it was only made to work with -blockdev. Getting it working with
> -drive requires some extra custom parsing.
>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   block/ssh.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


