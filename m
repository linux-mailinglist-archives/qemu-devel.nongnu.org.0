Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E16C6922AC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 16:53:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVhe-0008A0-Ew; Fri, 10 Feb 2023 10:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQVhc-00089P-FK
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:52:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQVha-00087P-PY
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:52:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676044357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wieZIQRrvXNsMS7H6TSNYg3Ps3nfCOtQPGiGVch7Nz0=;
 b=SvJXTO2cqCKxbHpVdFO0LBTwcVJEk2pEJdWtaG6RsIEd274/D4X3bJgza4rdbUYT3SIQqD
 OtUl5V7Yfq9h2ZEEgO1QV7sTyyJkGTsavm5e03MFmq1LY+WGvhfRNDoFkLIPtnHvLtAgrN
 0wFY2nbdLzNcPaIOpqfwylo/mliUgI8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-519-Kz3afVbiMVWMWWUksRZvkg-1; Fri, 10 Feb 2023 10:52:36 -0500
X-MC-Unique: Kz3afVbiMVWMWWUksRZvkg-1
Received: by mail-qv1-f71.google.com with SMTP id
 ec11-20020ad44e6b000000b0056c2005684aso3356708qvb.23
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 07:52:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wieZIQRrvXNsMS7H6TSNYg3Ps3nfCOtQPGiGVch7Nz0=;
 b=Z0R5Nwr1s4yTubIl2tEoOi3gixx4/OyZK5ab8VlfNOu9hk0vSKMufGk+ue1eoTojWy
 vHfkayrlEugoz3ELie4Y6lphFNiGVlbLWJ3AbH4TmmUlrUS/9BFgb2I/BVdm4fhjpp1v
 0ad0iwg6pIsZoIouFp61fUWsUeBLRT/+UBxapz0tacOe9KD2ouofqdl2q/plreMmdWy/
 BNAQ6YZNoDIOWkTcMfS8WR1qdPP0Bfv59xoky9ggO9br/rffD8CrNhC1mxl2PurztueX
 e4C1GVwkspEi4aC/ioWkPZR84FXu1wg0ldmhV9tal/6E6oXPJTPNt2ts10M9nawD+dQi
 CBLA==
X-Gm-Message-State: AO0yUKXngjtEUVNA3S1Ni+8ClJHpeczCEouhebexeDzbz0V3d2LkOSg6
 IcZmuTNXILFY8shircsHXvRzfUN7bABRONtxscwZScb5rw7Xb7bSQoOElOyrDrY4U5QeoLmabFg
 f4QEykWo+rogotFg=
X-Received: by 2002:ad4:528f:0:b0:56c:4c11:553 with SMTP id
 v15-20020ad4528f000000b0056c4c110553mr8418800qvr.19.1676044356137; 
 Fri, 10 Feb 2023 07:52:36 -0800 (PST)
X-Google-Smtp-Source: AK7set/Q4AuLu/ZuF961IA2h+hWhPLuSwqfEDT5KK/Z88gL5nxJrq4GPKUrNTqF6VeMp/jUk88ECMw==
X-Received: by 2002:ad4:528f:0:b0:56c:4c11:553 with SMTP id
 v15-20020ad4528f000000b0056c4c110553mr8418776qvr.19.1676044355879; 
 Fri, 10 Feb 2023 07:52:35 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-85.web.vodafone.de.
 [109.43.178.85]) by smtp.gmail.com with ESMTPSA id
 n76-20020a37404f000000b00729b7d71ac7sm3736837qka.33.2023.02.10.07.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 07:52:35 -0800 (PST)
Message-ID: <c57510bd-07e8-ab3e-279b-d9730872a1c0@redhat.com>
Date: Fri, 10 Feb 2023 16:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Byte-swapping issue on qemu-user for sparc64 guest
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <d7002aa7ea4bc165e51b84fc5e591f03d8a9d29d.camel@physik.fu-berlin.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <d7002aa7ea4bc165e51b84fc5e591f03d8a9d29d.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/02/2023 16.23, John Paul Adrian Glaubitz wrote:
> Hi!
> 
> There is an unaddressed issue in qemu-user [1] which results in getresuid()
> returning an incorrect UID due to a byte-swapping issue on sparc64.

Oh, there are still people out there using qemu-user on sparc64 hosts? ... 
that reminds me of another outstanding issue which might occur there:

  https://mail.gnu.org/archive/html/qemu-devel/2021-02/msg04240.html

... in case someone has time for fixing this ... (I unfortunately never 
found enough spare time again to revisit the issue).

  Thomas


