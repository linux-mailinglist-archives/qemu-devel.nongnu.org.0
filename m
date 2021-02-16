Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E84F31CB2A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:37:15 +0100 (CET)
Received: from localhost ([::1]:49168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0XS-0002bd-6C
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lC0Td-0007mb-8c
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:33:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lC0Tb-0006mU-3P
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613482393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRq2lvURCE7VNiLRGBA2s0l51gXYsNGCwSVn+CqJMxk=;
 b=XUTY4n8Dnl3+NXYByPs+QaAIwRaV/jky2DvhWiLTqTm9TBO9BlTnvFz4Bz9nScIFWpDynZ
 7kv/zPNSfLuhczSmJIM0EKFxVOXlJltTBUfAmzo1n8hsux90+oNZbaF6BsbiqW2SkMm3mM
 oI7pruHkvLzTVDjmp7osJJbEG5VzBUQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-MjXlzzNBNcSf-CcVvWddtA-1; Tue, 16 Feb 2021 08:33:10 -0500
X-MC-Unique: MjXlzzNBNcSf-CcVvWddtA-1
Received: by mail-wr1-f70.google.com with SMTP id b3so8728175wro.8
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 05:33:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oRq2lvURCE7VNiLRGBA2s0l51gXYsNGCwSVn+CqJMxk=;
 b=ciBXZMiqaJIIYGTwfdryRbUXyc3uwt1naqPB+IzEVCv81UNTweAba5/mzwOcJNI//T
 cCJmbMBcXzp30ICgVdOsg+qK3HJYvmduU7P5qRnNUpFily+sAkBK4R0p6vcj/DJ3H7ci
 MdwPaqBeiO+4b3sXtKjBJARZaZzbJHRg8YZgPZf/Olac9LkuJV7PnV5kkkmdbVmKg0Cr
 vWI0YgRydcAr2mutTr8x/57y6VqUOQtUJYL//Ac/khiOP1CQmyYcY3jYjGQGSPDLZokE
 4fNuQKakOgdKYOhF2PVwYY9gkhuUVfvXrr5fXvfytrPghNU/EIHIWqTIceo4N9yiZTP0
 Uw5w==
X-Gm-Message-State: AOAM532X7b7A0hYXgCgq6U8QXModcS2mnMMcwTB6WZttcUHxzjUQF+9A
 YSbPB+HnODVIMDO6U97fN6Extkgfk7wmz9b+13XVOTRkhR27EyNIQHb2ZyGWAFZvG5WKBjyVL0E
 loR9izsYNgvoOKh4=
X-Received: by 2002:a5d:6b0a:: with SMTP id v10mr24105991wrw.183.1613482388890; 
 Tue, 16 Feb 2021 05:33:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzouB5vhCyoNxnE5H1Utdu6iSYzExfsmFWnpqPOrgq4u1EzXfvyOv9akc9OJy5XvJMtP1Y0CA==
X-Received: by 2002:a5d:6b0a:: with SMTP id v10mr24105969wrw.183.1613482388594; 
 Tue, 16 Feb 2021 05:33:08 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z5sm6288744wrn.8.2021.02.16.05.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 05:33:08 -0800 (PST)
Subject: Re: [PATCH v2 2/3] gitlab: add fine grained job deps for all build
 jobs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210216132954.295906-1-berrange@redhat.com>
 <20210216132954.295906-3-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <13c0ce29-a909-e64e-c304-0ff39dac9212@redhat.com>
Date: Tue, 16 Feb 2021 14:33:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216132954.295906-3-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 2:29 PM, Daniel P. Berrangé wrote:
> This allows the build jobs to start running as soon as their respective
> container image is ready, instead of waiting for all container builds
> to finish.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 46 ++++++++++++++++++++++++++++
>  .gitlab-ci.yml               | 58 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 104 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


