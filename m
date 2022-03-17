Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A014DC5B5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 13:21:16 +0100 (CET)
Received: from localhost ([::1]:52264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUp7y-0002vS-Lb
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 08:21:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUox0-0005aq-T8
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:10:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUowx-0002oM-US
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647518989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5YnZvtjhkx6K+4nIdO+aFv9BIT3VVkcl5e5jFpitq4Q=;
 b=ctgBtn/iNyFcZERaj0vb52rHcfyTSSwww88P0TFeP4/in+5BOgHDLUD/+LCP7ZvOTrH0OT
 15fEW4fFjwcIHNuHBBpTZQnnpHGIikQmpVuOTMsGPSd5cDuX4uM6b0PUEZqMhvTP4f4e5B
 MadfHQE5W+GKE54hgE4UhqheYPOAAng=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-VPadLgyVMAiSZmHuI1wAHg-1; Thu, 17 Mar 2022 08:09:47 -0400
X-MC-Unique: VPadLgyVMAiSZmHuI1wAHg-1
Received: by mail-ej1-f70.google.com with SMTP id
 hg13-20020a1709072ccd00b006dfa484ec23so354517ejc.8
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 05:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5YnZvtjhkx6K+4nIdO+aFv9BIT3VVkcl5e5jFpitq4Q=;
 b=sn9S074PZ8l50rbIIqiwcD+L4OMkBberxAXNGK98ShfN1GAf86nBHJsl+o9bVEbIJ3
 CIhad8jfKQRLDRjboG4pTgD5+qg3xXvov3zIwPt/2Da6Jidb+r4BMvKovBCbZTSaWjNG
 FsyVtbPtO8B1vyUcxr0QePeg9nc5Lso8k/VJTk0uUMGvwhLFlzds/BeEqFeMMePyJt6K
 YV4xt/ca+9LOoo9sW0VtAi7qpktxm557KiQCe9PC18q7hM23XULIRlf/2bFSBwYMa/bn
 UPTT2Ui0CeHBxEYWfhWyQQU6KZ4JrTHIEOB8EjiAFPnHUcEIKiEd1oMH+MN0zNI4XzON
 jHrQ==
X-Gm-Message-State: AOAM533tuFLWjngkSXk8PrhBbSDSTte+AY0PxJ/BBZeqtKkLUwkQFgqZ
 UeHBSyfA+9dMWbgmsYiAmjbqDxnL8XAhlHwWzcslZcEwrE2oebm+ER5DVGaxIDXPnmH9FsK+sMT
 JAc1WZff3NJGAKJA=
X-Received: by 2002:a17:907:6d93:b0:6df:9f0f:d545 with SMTP id
 sb19-20020a1709076d9300b006df9f0fd545mr1637822ejc.137.1647518986194; 
 Thu, 17 Mar 2022 05:09:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyYL0ad5cyVgyuRTn4SlsAzQoAg29F0BbteN5fRHl+3ICfrVF1TRHfcfKGDic6aKVSioc2rw==
X-Received: by 2002:a17:907:6d93:b0:6df:9f0f:d545 with SMTP id
 sb19-20020a1709076d9300b006df9f0fd545mr1637770ejc.137.1647518985485; 
 Thu, 17 Mar 2022 05:09:45 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a17090673c200b006db8ec59b30sm2275061ejl.136.2022.03.17.05.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 05:09:44 -0700 (PDT)
Message-ID: <3e1a5179-8410-dcad-8d85-b2e4ac3c8240@redhat.com>
Date: Thu, 17 Mar 2022 13:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/14] iotests/149: Remove qemu_img_pipe() call
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-9-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220309035407.1848654-9-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.03.22 04:54, John Snow wrote:
> qemu_img_pipe calls blank their output when the command being run is a
> 'create' call and the command succeeds. Thus, the normative output for
> this command in iotest 149 is to print a blank line. We can remove the
> logging from this invocation and use a checked invocation, but we still
> need to inspect the actual output to see if we want to retroactively
> skip the test due to missing cipher support.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/149     |  7 +++++--
>   tests/qemu-iotests/149.out | 21 ---------------------
>   2 files changed, 5 insertions(+), 23 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


