Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9042EC1FF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 18:22:01 +0100 (CET)
Received: from localhost ([::1]:43976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxCVU-0006Zj-3i
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 12:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kxCUJ-0005wY-BA
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:20:47 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kxCUH-0000T6-Qu
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:20:47 -0500
Received: by mail-wm1-x334.google.com with SMTP id y23so3274857wmi.1
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 09:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:references:from:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=p8JMohoXV3lAz8TMMfuSMpEN9LG9rH4IsIlRAXkoCKQ=;
 b=QtDfiA6CQmna0SaILaV8oUa/fAdroyfRGJVetSVV5hNY2d5qZQWizing/zBjnBWwAN
 f9ANHhcB6aNNJ6ZacPo/RHzUel6B1pDXaXhnZQWZcX4LX59FPCpfJcWvhWj2BDVOpXGE
 EGq1k6OVxHfsPunj8PMj64p3M1cIHmSR91Fddfhs7k6pUmtsIyA6YoDX/iSOCc+yokOu
 ttOCGhgufeEHRZTpu2jKeCSXAaWqoVozIvkf1QT7VPASyDx5zntmpneZl1jUURRg2XQ3
 5SwkqalcrOc8jvbzQHqT3f0NhVbQ12jmbg+q8Un7EDUUpvXXpwUS5DlqUKIu1G4iRrhm
 RAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:references:from:date:in-reply-to
 :message-id:user-agent:mime-version;
 bh=p8JMohoXV3lAz8TMMfuSMpEN9LG9rH4IsIlRAXkoCKQ=;
 b=kJ4mRXbbNWAmaa6qhB+2rbNPVf6udwWDXxOXG5ZaWqiIJEWjNEdyz4bzwBvW+GDL9O
 FTEfoLaouMzfaIuNU0sNNa6zIq1WsQE0kum4L5LzYcwR86TH29uXcLa2b3f/deGBRLLu
 arqDn+FlcnEm3OfTAAXZV4IupOjiejpcLeUArlrY5RSCOUTtm2nF7y2DbT6M5MhBR5Ni
 k3CIpiTzpCGcSlvJmnL2t5dpjTecT0hvVAxKyFFIloTwb/XZctzn+9EmyKgCkdgl3AHE
 UzJo1B9iUCwg0rT7MllzN61qfpMDzrufF+V6wQw5Jv9r8uX6huSBrC0FT2H9rwDGsydd
 wAoA==
X-Gm-Message-State: AOAM532XID2wU2T/MVCfUna1sZn1K6adg3EgI6PcTjxOMEUi/mlucNOF
 S2L5JWMhxtXbv5bq7ek+fusBRvv61zii13uf
X-Google-Smtp-Source: ABdhPJzzPZFI+JA4lRDXzz/tBmSYpsXb1hXohqtiVb6IQMdF3VyCxl7j4CgQQnOcDtt7JLtaLZms8A==
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr4419706wmj.182.1609953643665; 
 Wed, 06 Jan 2021 09:20:43 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id r13sm4088362wrs.6.2021.01.06.09.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 09:20:43 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id f88ee1a9;
 Wed, 6 Jan 2021 17:20:42 +0000 (UTC)
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 2/2] tests: Collapse echoed JSON input to a single line
References: <20201221134931.1194806-1-david.edmondson@oracle.com>
 <20201221134931.1194806-3-david.edmondson@oracle.com>
 <b69093d7-359c-77e4-201a-29a1948796fd@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Wed, 06 Jan 2021 17:20:42 +0000
In-Reply-To: <b69093d7-359c-77e4-201a-29a1948796fd@redhat.com> (Max Reitz's
 message of "Wed, 6 Jan 2021 10:49:06 +0100")
Message-ID: <cuno8i2j82d.fsf@dme.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::334;
 envelope-from=dme@dme.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-01-06 at 10:49:06 +01, Max Reitz wrote:

> On 21.12.20 14:49, David Edmondson wrote:
>> When sending JSON to running qemu, qemu-io, etc. instances, flatten
>> the echoed input to a single line to ensure that comparisons with the
>> expected input (which is always a single line) are successful.
>> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>> ---
>>   tests/qemu-iotests/common.filter | 6 ++++++
>>   tests/qemu-iotests/common.qemu   | 2 +-
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>
> I think this is superseded now by commit 0e72078128229bf9efb54.

Yes, agreed.

dme.
-- 
Here I am, a rabbit-hearted girl.

