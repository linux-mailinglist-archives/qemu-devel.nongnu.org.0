Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61A42D5E18
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:39:39 +0100 (CET)
Received: from localhost ([::1]:35280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knN6Y-0000ix-Kr
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knMuf-0001Ir-Cp
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:27:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knMuc-0007bB-ID
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607610437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8rn2VH4T8LuIT+s6rlqEBKnGBqM/nvNt/ScI69+xP3I=;
 b=fNyffFdKY0BoLStxXVHzKRO/PX8plME2OWWZrFLttEByl7OHBKSQxlePx0fD6KpFDs6Fx1
 nFWuoKfM6jS4c4RQ/FsR4X16AWTV/MnG3Nu3igS7yd/9X2I316KZJe2C+zHfogSKQ7txj+
 MOKjq2YjKNJmonDVdoT9V3ApRGkjkro=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-a40822ySNtaUS464ZMfSxQ-1; Thu, 10 Dec 2020 09:27:15 -0500
X-MC-Unique: a40822ySNtaUS464ZMfSxQ-1
Received: by mail-wm1-f72.google.com with SMTP id a134so1166898wmd.8
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 06:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8rn2VH4T8LuIT+s6rlqEBKnGBqM/nvNt/ScI69+xP3I=;
 b=WKSez89rx1IpJIhYX6JoF2YGaxNKbWltf4E1JfRezp7seTSjHd2owda3Ag25fhTiIF
 qGr8fj9k5NE1VfUiiQPIngjmh/+Ot+RslyL/PQpBjZ1HYzDocMhUurcoFtYTwzqA0a2+
 +3a1LZfozMZ46Y7zz+Hnla/6Qr6ryp0iibumhUT9FMwgpnDfjI0WKgLdSFDJNsL7sphT
 3WrUEaJ/GqojPaODwVGfFaVtwyp3ChyXooZKSDZxmVjNn7CB9NuGFDymU3alpDUzF/UI
 EgBll3m948RhdQQNI8Jyifjr3ayuA91WGLCNeX9awidUPgBeK5WHcFp/JsqtQfysD8V4
 vGCg==
X-Gm-Message-State: AOAM530JPYHdeIrzrFPtt7ntbCYlt8a9fEZ4EM+fwqOqE50f2p6K70n5
 F+P8tHm4/Q4F3UOoEXbuga7fcP0IaypXQFSwJwjSnDS6CVt/7nlB8MtzwJXY+07kkDCLPUV7j3a
 lrQCHKKRJrQvdP2k=
X-Received: by 2002:a1c:2646:: with SMTP id m67mr8479011wmm.81.1607610434242; 
 Thu, 10 Dec 2020 06:27:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJWAdz+KqZMUM8QDoTMVk+MZI2a3+4LfwDInoEr+NawwT5wR47Yw7MbaR5q6dQWccikQgqIQ==
X-Received: by 2002:a1c:2646:: with SMTP id m67mr8478997wmm.81.1607610434130; 
 Thu, 10 Dec 2020 06:27:14 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c10sm8484225wrb.92.2020.12.10.06.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 06:27:13 -0800 (PST)
Subject: Re: [PATCH v3 09/13] poison: remove GNUC check
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-10-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ec8d32e4-11ca-8a59-c021-5b212b8f6d78@redhat.com>
Date: Thu, 10 Dec 2020 15:27:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-10-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> QEMU requires Clang or GCC, that define and support __GNUC__ extensions
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/exec/poison.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


