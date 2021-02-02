Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC14230C4C3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:02:54 +0100 (CET)
Received: from localhost ([::1]:35834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6y8j-0002iF-N5
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6xnj-0007oP-4s
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:41:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6xnh-00034Q-E7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612280468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQr/QpMnYIivC618jTr+1SZ4HPfJZesTPeLEIFjWxVA=;
 b=A9T3LtOqDXDvzFtHO35vSxHzEQoOtr9tCh1D/wm9xsqHvzvMqD7EtUihpqYYQr1VOrCBhA
 7Rr/0kXzlPSrk7GdzepelUE7+EipF2B9X46s4cTor0WkDNuavFc/BMKJhPGWQamg7kFlW7
 VcYpl+9/rCB7j7XLAbBxBgfvl/IaaIc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-SUTkoGXjPgi6kriQvV0-ow-1; Tue, 02 Feb 2021 10:40:51 -0500
X-MC-Unique: SUTkoGXjPgi6kriQvV0-ow-1
Received: by mail-wr1-f69.google.com with SMTP id s15so12769955wrt.14
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uQr/QpMnYIivC618jTr+1SZ4HPfJZesTPeLEIFjWxVA=;
 b=ddIB6vRugzoj6jkih1OQ/ATjptV5GCL4lh8Qv2HMvusY7AO+r+ZbwYW80VqDgMoYTT
 IsEpni2o5wwOFafRs4ieffTiBbwO6uFRjIQkakGvFrm7i0A5SiIMDyEANKVJIvEXeu72
 pn6V2s/teLpszl63Cmat+YKAbMMieJsOX2DEu9MpPOXB/jYfnNo2x45IYYasNe4UFP0T
 dAk2/k8YA6mFnVDCmXYy7WNVkQ2SNuyFNPRFlsn70E4373SWZKkpFJl/l8X3lp14UAlh
 CXKxVhgjyjO/SoCKNm7BVR7Drc/cbX0h56yEr9Z3mQPoSlhrChWrrI6HScKAqVyaLYN3
 cGsQ==
X-Gm-Message-State: AOAM5339/fITBkx6KdcS4eCN1wxH9B8IyyaIT337b9AbySujEDG9ItXR
 tCCmKhteDWJ3sYy/06mmD+0Cz0hB3u3FDOzGmzsuX8i27Hibzp6Pl6DGoObAiE/wZSvdaLYWM5M
 FNGs64vpa49CjVj+BeSiAJYtTEBFCcHUiSLDgQsGo19YGjI2jKXeWEmmnf+Xx3hSZ
X-Received: by 2002:a7b:c395:: with SMTP id s21mr4204396wmj.97.1612280449324; 
 Tue, 02 Feb 2021 07:40:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymiztdizbvfA9N0h8xIr2iCLps5vsiM7IuKU9tSMBDzvM90dEapoFBtT0urjKZsbFVPi2jcg==
X-Received: by 2002:a7b:c395:: with SMTP id s21mr4204365wmj.97.1612280449057; 
 Tue, 02 Feb 2021 07:40:49 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id r12sm32521511wrp.13.2021.02.02.07.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 07:40:48 -0800 (PST)
Subject: Re: [PATCH] iotests: Revert emulator selection to old behaviour
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210202142802.119999-1-kwolf@redhat.com>
 <48115c56-66cc-3f94-316c-95a9f64879a7@redhat.com>
 <20210202145627.GM4168502@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6cc48ce0-96d0-4ac4-bd5d-d0ebf7325f01@redhat.com>
Date: Tue, 2 Feb 2021 16:40:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210202145627.GM4168502@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 3:56 PM, Daniel P. Berrangé wrote:
> On Tue, Feb 02, 2021 at 03:46:11PM +0100, Philippe Mathieu-Daudé wrote:
>> On 2/2/21 3:28 PM, Kevin Wolf wrote:
>>> If the qemu-system-{arch} binary for the host architecture can't be
>>> found, the old 'check' implementation selected the alphabetically first
>>> system emulator binary that it could find. The new Python implementation
>>> just uses the first result of glob.iglob(), which has an undefined
>>> order.
>>>
>>> This is a problem that breaks CI because the iotests aren't actually
>>> prepared to run on any emulator. They should be, so this is really a bug
>>> in the failing test cases that should be fixed there, but as a quick
>>> fix, let's revert to the old behaviour to let CI runs succeed again.
>>
>> FWIW this is the same problem I had 1 year ago and tried to
>> fix it by sending QMP 'query-version' (introduced in v0.14):
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg675075.html
> 
> In the current failures the issue isn't the version number. Rather some
> of the tests (mistakenly) assume the emulator supports PCI, and we're
> randomly sometimes picking emulator targets that lack PCI.

Then this patch from the same series:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg675088.html

It queries TYPE_DEVICE, but we can query TYPE_PCI_DEVICE too,
which should be selected if a machine have a TYPE_PCI_HOST_BRIDGE
providing a TYPE_PCI_BUS.

Anyway the idea is to query the binary with QMP to see if it makes
sens to run the test with it.

Regards,

Phil.


