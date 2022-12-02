Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E960F6403C0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 10:50:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p12fz-0007r3-0N; Fri, 02 Dec 2022 04:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p12fb-0007mx-FV
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 04:49:25 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p12fZ-0002BG-SY
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 04:49:23 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 125-20020a1c0283000000b003d076ee89d6so3407132wmc.0
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 01:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pMRGbekBr8ZkXSycQ8nBee4a4iRcCPgpBoHy8mCbccc=;
 b=MGCHRsAzZKbFe8CpYLK5t5DJWpEcIsf5DhxBqx8SHBximiI8Z6ERCh17S7jC3IDKVW
 2JkZRYKy2CvDXEIymx9NBDUAPCnDfDXCeFMz6sEMkUmaZfXYw1GBHY9AtjyA1ZffwTTl
 BuhAx9aFNOhm/GIAS293ThMfn9JRI7Lg1vT7bc0wWIpcrZ8M2k98ESEN1LIehnIroyAH
 nWYxUFGXsrCTm7ydQqV22Go0EQ/X6zmp+a5pOIjdG0aQar2NiBkd10DwnJ8TlOAoMHae
 OyGJY15xblW1nA6YmY2yIWTNIxdHUrrY8qnM9TKPkLGhBI+K5CwFk6r16qGWWGTFTykU
 aUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pMRGbekBr8ZkXSycQ8nBee4a4iRcCPgpBoHy8mCbccc=;
 b=w4Lm7Sx4edtl9geiDaueetR4NR/3cElHaehcVcoqSWOLYXONQ7UnMBwT4KcYoUGUaS
 nwEa3RelBjnJ6N90GQ6GpzcjIv9QSeqLMte17Tctmf7ddLLa7DgczFcSmP/d/Ijt/6Tu
 MNzKYA5h8pMmZFtZl6wxEEf951tUmZKBc2TNij+c2DOIvCS3icOBDGrTnk9zNqDIG6cN
 HGwKyjeXeHSvv6C7pjEm5HvHQ1vvn8BuVOG0d6EHrDfCOq+H/vpJXs9A2izCHM6rqhYB
 634OXbcLdB7pWWXngbdR3c1vIhF20RWfkppbCJOKc2Gy0eRke2Dbuf57QORZCIqEVdH/
 vdvQ==
X-Gm-Message-State: ANoB5pnmX0nMlf38PZkyikKQGB2rQLgFXspaa9qVIw/GYSsATTQXNlLI
 0mkiNUL+XxvVLNrojLTzj8Rvjw==
X-Google-Smtp-Source: AA0mqf78P4PPx1Ak6kcO4NtkTM3iIU+/mV1Df6DMwSCDoqWT7XlLTRK6a5QOj3EMfS9fkbcPboBABw==
X-Received: by 2002:a1c:7318:0:b0:3cf:cb16:f24a with SMTP id
 d24-20020a1c7318000000b003cfcb16f24amr54211144wmb.182.1669974559288; 
 Fri, 02 Dec 2022 01:49:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v5-20020adfebc5000000b00241c6729c2bsm6526230wrn.26.2022.12.02.01.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 01:49:18 -0800 (PST)
Message-ID: <9b81a6f2-7bf9-4ada-d7ba-c8a9dffcb2d3@linaro.org>
Date: Fri, 2 Dec 2022 10:49:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: tests/qtest: Is vnc-display-test supposed to work on Darwin?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

The vnc-display-test is failing on Darwin:

tests/qtest/vnc-display-test:45038): ERROR **: 10:42:35.488: vnc-error: 
Unsupported auth type 17973672

Is it supposed to pass, or should we skip it similarly to Windows?

Thanks,

Phil.

