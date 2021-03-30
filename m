Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E124534EB73
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 17:03:41 +0200 (CEST)
Received: from localhost ([::1]:47256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRFu8-0000SN-Dl
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 11:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRFrr-00089c-G9
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:01:19 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRFrp-0001Vm-PK
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:01:19 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so9609170pjh.1
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 08:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HZqrdCMOynGpkAvSOv+CLSQJSgxk82kQF+nyVgm9fZE=;
 b=tI/yjuTlz7Ue3n0bDw7CL/2vo5HZNhKSIbV7fuN+vYAF7TRcbyRcs3SQM/ninMBYoq
 f3fkV4GN8XAPFAlt2HiDfaPodIr3FSs3H7PzeMa2zpNpetLcC1XEqiQmEkUvbQMUeEJy
 02sd7LcKB6yavt78qq1TQBcoO0axXv06jtXgl/NS0rkd7YljwmWOtq8S9WG212Pm5c6n
 MM0w9ZCE8t2nzV1h417RUzOCM4de/aQ2Rnzf7wUC80kBm2fTpEe0r3EJ1Ikdq1iTNsQ7
 luwIbFf4TOCi45zkzEJd5FaeynKunLLDGkyPiQ+fPNV9rb7uwkdmGvJVpKs1aw6NjMgo
 xznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HZqrdCMOynGpkAvSOv+CLSQJSgxk82kQF+nyVgm9fZE=;
 b=UnvbwJE9l7mMN8XNR0YfV2PAkM50g2AbIDYui9pq7hIPyTpRb6nN7+bwlwad1IFdzK
 OSX6RQbkYYDJXvgiLWeMP/XmfzjoIqfQ9UbQqDUFLgjNUZGcNLOuOdPn5s/B6WcQV8bu
 Lk6eHl308SJHmeSlgzwRaJMUNlRuJvKajedhqnnsIiVqISbAXFeyLw10FBMMgqSAM0L+
 1rSIqZWKyp+G0JQp4XWwq22DFE1nQIFEBPK5GS2Po5pH09CUkx/hsu7sTpVmwGiylnsa
 NiOACzCc3H0m6MAFks3LHe2gojb2uJ1temOjpmgXUGMEHzx4/gOAJEYlyHI2bCH79VtE
 572A==
X-Gm-Message-State: AOAM533TfWc6DGxh0/UvjBawon+PM5M8uFiPsTrfkKALltJkTK6m6mwq
 WWMt9vcOb/ooihrmGwX+VKSENJmOEirkYLLY
X-Google-Smtp-Source: ABdhPJwa20iPZomUlTp713oKl7WI9972HDd7wFD6BO4i4cArVM3yG1IocdmJ6jQE/rq11eeu4HsbTA==
X-Received: by 2002:a17:90a:f2d5:: with SMTP id
 gt21mr4914871pjb.197.1617116476221; 
 Tue, 30 Mar 2021 08:01:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id t67sm438776pfc.86.2021.03.30.08.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 08:01:15 -0700 (PDT)
Subject: Re: [PATCH v5 02/10] target/ppc: Disconnect hflags from MSR
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-3-richard.henderson@linaro.org>
 <YFqBtsijRRcEBB/k@yekko.fritz.box> <20210329150522.1b00607d@bahia.lan>
 <d0221e19-6c8b-6cc3-c4aa-2d5fff4ecb8b@linaro.org>
 <YGKvDOCtfbj0avYF@yekko.fritz.box>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c368bcc2-3aa0-608e-c596-b7c9df1923e3@linaro.org>
Date: Tue, 30 Mar 2021 08:01:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YGKvDOCtfbj0avYF@yekko.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/29/21 10:54 PM, David Gibson wrote:
>    B) Just the hflags patches from my / Richard's tree
>       https://gitlab.com/dgibson/qemu/-/pipelines/278497244

Look closer at this one -- it's an s390x test that's failing:

make: *** [/builds/dgibson/qemu/tests/Makefile.include:63: 
run-tcg-tests-s390x-linux-user] Error 2


r~

