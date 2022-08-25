Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1305A19DC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 21:57:44 +0200 (CEST)
Received: from localhost ([::1]:51372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRIyw-0006Nv-5L
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 15:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRIw2-0004lL-GI
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 15:54:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRIvz-000658-7v
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 15:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661457273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oZjOPRxnqwC080BgrRPtssNP5nZd8v3WVl01i/YfsCk=;
 b=NvnhKogQXI6qxXipm6Y3WQYQNxvQBZ3GSQxqaX7vv9Csp+N7ziA6LHLRuLEICSWmM2Zipy
 FSKmve3ZYk46H5n2ZL5a/KZZ6rglBUptVA4LCFXMGY3hCxGOcgxvNLuVxjPoOiKU0T74f9
 gjzpWzWX1gEGN3+odWMFfmPtB2UsFSU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-5-ndqJ0hhvOfKto2YGF2fv8g-1; Thu, 25 Aug 2022 15:54:32 -0400
X-MC-Unique: ndqJ0hhvOfKto2YGF2fv8g-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay27-20020a05600c1e1b00b003a5bff0df8dso3021028wmb.0
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 12:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc; bh=oZjOPRxnqwC080BgrRPtssNP5nZd8v3WVl01i/YfsCk=;
 b=Rwv16tm6aJFYYfDrdADcfMeK2BYkwdxqstrVTWM4593LRS0exhIn41cSPygAtP7TvL
 6St0NWVWTbjlrNvTqvMZuNPve2TqvKgEE3ddM4l69vRbbbTtVajGUbu6tREqKgZjbsfN
 C7dJUd+9BGxYjqExThHG30o/Whw64TBaz/GUl2Avsk+7b/nnaOZxjaUe4e8pwd0MzCoj
 guwbXNMyO2GcZPBlx37uIx/1JbhJ4TpRsxl4sCHUhiohRA2BfhyH0yjugQB96/FL0omc
 by9TabJzlSMd2gkhyQehAnaF/C5RQR6WWqT18cFOzWHtuxsFg6sSCMOW99mlFmFOC1t6
 IBGw==
X-Gm-Message-State: ACgBeo1nqzuUpd6JdHxTZnM34sGw9aBxI+XrbmqnoUyI1lOXSvu6LC7X
 o6TzE8assURgjVQOsueL8KSnHYotHmcDFn4UCGEKEzaQytxQWkkBqKQcYngETcaS9XV9Bl3fdHi
 a4gfIHpLQr41Y4A0=
X-Received: by 2002:a05:600c:4fcb:b0:3a5:f2cc:2f19 with SMTP id
 o11-20020a05600c4fcb00b003a5f2cc2f19mr3168069wmq.142.1661457271320; 
 Thu, 25 Aug 2022 12:54:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Ei90koVbXMqWA2oo1T6nzAbjp6DlWdMX02bCci26ffBT64wTs7SwME3mXM+UCtuqqx3T1oQ==
X-Received: by 2002:a05:600c:4fcb:b0:3a5:f2cc:2f19 with SMTP id
 o11-20020a05600c4fcb00b003a5f2cc2f19mr3168056wmq.142.1661457271099; 
 Thu, 25 Aug 2022 12:54:31 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 i186-20020a1c3bc3000000b003a601707174sm196728wma.33.2022.08.25.12.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 12:54:30 -0700 (PDT)
Message-ID: <8b49b0cf-7fb3-1450-c72b-cdc21003ceeb@redhat.com>
Date: Thu, 25 Aug 2022 21:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: libvfio-user test-client-server test hanging in the CI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


  Hi Elena, Jagannathan & John!

I noticed that the libvfio-user test-client-server test is recently hanging 
in the check-system-centos jobs in QEMU's gitlab-CI. Normally the test 
finishes within 20 minutes, see e.g. here:

  https://gitlab.com/qemu-project/qemu/-/jobs/2928561403

(notice that test-client-server has number 252/274 here).

But in many recent runs, it seems to hang after number 251:

  https://gitlab.com/qemu-project/qemu/-/jobs/2922743324
  https://gitlab.com/thuth/qemu/-/jobs/2934299005
  ...

Could you please have a look? Also, why is the test not timing out after 
some minutes? ... completely blocking the CI job for the rest of the hour 
'til the global 60 minutes timeout kicks in is not very nice :-(

  Thanks,
   Thomas


