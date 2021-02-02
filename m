Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001A230C353
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:16:23 +0100 (CET)
Received: from localhost ([::1]:60028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xPj-0002ib-2D
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:16:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6wyo-0000HP-4H
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:48:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6wye-0003sp-Ha
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612277302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zs7WfE0l8OFjJqpqGf+OqzTfNZxOzwsRhE2+8V0mYMo=;
 b=OYUHDZ9nBEytH/PInkQzNtQo752F+vJDR9pYnikVV9+XzUGZdfj208jfIRBlHwOwIM6dhW
 nxdkMiVyJgHQbq8hhE9dzjYJ4GAAT+WpaF4R4CPRTx6WEHkwbgTPecjBXyDOobrzls9rvt
 iIMgYuYRs1GDTEX1S/XpWILU0CWdFmk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-c-aO9iH3M-WsZBNhet44ng-1; Tue, 02 Feb 2021 09:48:21 -0500
X-MC-Unique: c-aO9iH3M-WsZBNhet44ng-1
Received: by mail-wr1-f72.google.com with SMTP id l10so12690332wry.16
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:48:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zs7WfE0l8OFjJqpqGf+OqzTfNZxOzwsRhE2+8V0mYMo=;
 b=YidH76Me4ocjmd/thjdLg21OirMoILqe/poEnAkbQnLQE/lS7OTtj/QVqKkYZtbbAi
 aQnyxR99Yob5vzzIA6x3PuDbACuR1gu63hebELlTqRVcBAm/n90dCWoC9yO497818eUv
 XuG87CS78pRao1bInMlu3DfI2wAE/YLyfCV1B8mKtdcoKDl/78t2evCZCeRttKO+8g/7
 9eiQlhidMiG7krm1QekFfNUbW9aioRCKaSHwtJ+bEXsgSlAB5nWv5zR7zP8nK5sKSgA+
 GZORqC65aUN07TRUY2xb4CXBlDjKLcXd8glHOU/cOW3YlhmvZ4c7+0XhLKYaXS7oTUtU
 OHJg==
X-Gm-Message-State: AOAM530GuwLdgm6d5kKuRkPlAWz3X3Wu1LreQJ9+nMQ2fy3WVnd4lg5/
 jLDHUOfFn0drqQSYZvkf6KR8nKogPxll5MTztcr/32P68lD6wn7uOldFX7tc+6SYAkjPvZXG3jE
 dFtyZipOCnuugnYM=
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr3890245wmh.77.1612277299937; 
 Tue, 02 Feb 2021 06:48:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEqFnJ6GMb9qMnSjUQH+ETIUSPdOLhUI9LzDMyXxrFTq0ib+SR00Q991aJdtulV5HzdobF/Q==
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr3890232wmh.77.1612277299764; 
 Tue, 02 Feb 2021 06:48:19 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id k6sm33259242wro.27.2021.02.02.06.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 06:48:18 -0800 (PST)
Subject: Re: [PATCH] iotests: Revert emulator selection to old behaviour
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
References: <20210202142802.119999-1-kwolf@redhat.com>
 <48115c56-66cc-3f94-316c-95a9f64879a7@redhat.com>
Message-ID: <f06a1cd4-5cbb-36d3-a420-30d004ecb20c@redhat.com>
Date: Tue, 2 Feb 2021 15:48:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <48115c56-66cc-3f94-316c-95a9f64879a7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forgot to Cc Wainer & Willian in case they are interested in
providing a better long term fix.

On 2/2/21 3:46 PM, Philippe Mathieu-Daudé wrote:
> On 2/2/21 3:28 PM, Kevin Wolf wrote:
>> If the qemu-system-{arch} binary for the host architecture can't be
>> found, the old 'check' implementation selected the alphabetically first
>> system emulator binary that it could find. The new Python implementation
>> just uses the first result of glob.iglob(), which has an undefined
>> order.
>>
>> This is a problem that breaks CI because the iotests aren't actually
>> prepared to run on any emulator. They should be, so this is really a bug
>> in the failing test cases that should be fixed there, but as a quick
>> fix, let's revert to the old behaviour to let CI runs succeed again.
> 
> FWIW this is the same problem I had 1 year ago and tried to
> fix it by sending QMP 'query-version' (introduced in v0.14):
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg675075.html


