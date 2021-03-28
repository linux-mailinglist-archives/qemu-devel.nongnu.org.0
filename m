Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB8B34BE46
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 20:33:13 +0200 (CEST)
Received: from localhost ([::1]:43958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQaDo-0006tF-Ih
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 14:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQaCK-0006QR-0O
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:31:40 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:39689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQaCB-0003Pw-8S
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:31:33 -0400
Received: by mail-oi1-x22a.google.com with SMTP id i81so11074263oif.6
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 11:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fjopxk2H1Yi/IumX4Ne3p4gjdpW+A79BOfb+/LP592I=;
 b=EuNiXtAAyk4rRPsMF+e1sd/ZSjaVvJ8capeGvj1GY00TAWDyKjTwmIz1aiZE6cOYtG
 eCws/UXPvSK5HZzC3YXrmhBBWjzb2pyoccbqHYMBq53VGHMGPmMsxGzWsntlvLIA5srW
 HJn7lsO5i+jtQnqJhYULEZIDyxlF0swgSaHDADZX+kU5og0QBnE2hO/rf7PEAGS/asIP
 XY6ptTIIbHgVecpUtyyor1Ml/vQhoYy/hIBTr6LWiDe5Wwi6WykoKo5hS2eqvryj7O8C
 qJt8rbiwA5WGuuxsNGTykjGnDbsyHylFF6if9VZ7YhqZ+JJUrmv5qlN6iIbR8DemFTLL
 8S/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fjopxk2H1Yi/IumX4Ne3p4gjdpW+A79BOfb+/LP592I=;
 b=f43s0VQdO4ks65rYdoWkEih5KEbrYH4talI2hact17eTH5QEwzwSYMYJeRglBrZ9c/
 VimeCG7Yhr9u0ZDB8vIuF2E/mjtbjQvdL3nOD2WmmKZz7CCbmudTzBNBdcf2/tTl5lt8
 +3FMJN1pd450Ag8UeG1hDuBVCzGD8yZnQ+KXQwYo3nhrlgoDDOHgUR8TQDUfh++T+wBi
 EFQ/7PNZ+wP2gvHEyyXhr5zjxcbGb9X2Ai7wPkUTZSckZblFe2UXxfuwJoxoyxT5gzW4
 ksCMzIWv0r5q/Ky/vu7E097CBnxLPYZAsYLA4jYqxZOPEJM5xL0y/pDJZ77EBUY2O8YP
 01YQ==
X-Gm-Message-State: AOAM533PJjLhxf7om74QaqX0zD5Edeub/F2IUoecCga/UOpBiKNZgFDp
 3pe/2Ij14Z/DGRSgORgYUuP6rA==
X-Google-Smtp-Source: ABdhPJzhF9R9ZJRoZh9s1ve0TK1WxkguG03YhHT/WysYPMwnaiw3UuypeJ4TmR8xsK7Tkp6zqyQpkQ==
X-Received: by 2002:a05:6808:287:: with SMTP id
 z7mr16294171oic.111.1616956288827; 
 Sun, 28 Mar 2021 11:31:28 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id b22sm3723146ots.59.2021.03.28.11.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 11:31:28 -0700 (PDT)
Subject: Re: [RFC v12 52/65] target/arm: make is_aa64 and arm_el_is_aa64 a
 macro for !TARGET_AARCH64
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-53-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <18aeb2e2-63b3-2c86-2ea9-85efd0c3bebd@linaro.org>
Date: Sun, 28 Mar 2021 12:31:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-53-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> +#define is_a64(env) (false)
...
> +#define arm_el_is_aa64(env, el) (false)

Late reply to the v11 thread: 'use" the arguments here by casting them to void. 
  Then you don't need the other changes you make merely to avoid unused variables.


r~

