Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F3E2FA586
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 17:04:41 +0100 (CET)
Received: from localhost ([::1]:42892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1X1D-0007FD-QD
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 11:04:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Wz6-0006Tx-H7
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:02:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Wz1-0006fk-7i
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610985741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7tRZyX7hylJwc7IHK1DzTIjwHwoBXd1TWBBqGCxjwo=;
 b=JZwqNVDR+eB/DmwKLynqygBZEmaaw+aN7fbMNIQDdJZV1Yv5TV2if65xW+ULOMMrROmD/E
 M4ZdZ9LDjqHrcVKSZfndwdRENvN57jHPlMV14KFKglWD1fc3fWdyJldudt6s8pYwJnm0ax
 rHNWb1LXb7uIudsn2SqsFufBX4i4awc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-0bMgauD-OG6Irczc-GHD9A-1; Mon, 18 Jan 2021 11:02:19 -0500
X-MC-Unique: 0bMgauD-OG6Irczc-GHD9A-1
Received: by mail-ed1-f71.google.com with SMTP id f4so2192298eds.5
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 08:02:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w7tRZyX7hylJwc7IHK1DzTIjwHwoBXd1TWBBqGCxjwo=;
 b=gwUluk1UkoeHw/coNajHBGv+GHElr3M6QJd3k0ZVAXm0DmPEiXE6TGXQzmRAFl3YBW
 BI/4S/j8Nln14N4VM0Xdtfo09jkyTNYMB8SvaoU1A4xaao5rlzXNFPksjEeUEnzx1YM+
 cNeVb7x/2lwshn+TxlfmzBHYLXDvfv0rX/SorJUnZvIQLQEXkEuLqHEHjXvfCfsg4m8L
 XXS+fHSk/OdCKhxbIpIRLbDTfieUfArP5yrQJk1+jCU+/26r3vAiXqMl3/EwJWGXiNHk
 eGX8wNWbLMDuhginHMHeBDs+abqxFaWnH44wKOzmga5xO3c4lomfHbkJwqSx1Gei3Kom
 kLdA==
X-Gm-Message-State: AOAM533ti7zgpK7orXrEvxRF1sBvERR/UpTRSYwEfJJcEPdWfBTPpeT+
 zOxfCmSdkUnPQd56Oc+HkKYdcFDNYvJQzuUScd5Kd0Haj1pvzQ+j+kznACAncqGYkqWUALQHN/b
 lCadjFQqoysfeE/k=
X-Received: by 2002:a05:6402:35ca:: with SMTP id
 z10mr139126edc.174.1610985738739; 
 Mon, 18 Jan 2021 08:02:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8/tn2TQaAsELx+hluPqe0cSuG5IClA4WtbJgnkXz5BRufZcmXPUomfDtdA3ijxa6hh7GxZg==
X-Received: by 2002:a05:6402:35ca:: with SMTP id
 z10mr139102edc.174.1610985738496; 
 Mon, 18 Jan 2021 08:02:18 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k2sm9589073ejp.6.2021.01.18.08.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 08:02:17 -0800 (PST)
Subject: Re: [PATCH 2/2] virtio-scsi-test: Test writing to scsi-cd device
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210118123448.307825-1-kwolf@redhat.com>
 <20210118123448.307825-3-kwolf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b2a33ab2-7b4c-154f-c8b8-15a140b8add6@redhat.com>
Date: Mon, 18 Jan 2021 17:02:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118123448.307825-3-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alxndr@bu.edu, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 1:34 PM, Kevin Wolf wrote:
> This tests that trying to write to a (read-only) scsi-cd device backed
> by a read-write image file doesn't crash and results in the correct
> error.
> 
> This is a regression test for https://bugs.launchpad.net/bugs/1906693.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/qtest/virtio-scsi-test.c | 39 ++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


