Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D10660909
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 22:58:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDuiu-0002p9-PA; Fri, 06 Jan 2023 16:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDuiq-0002nX-T4
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 16:57:59 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDuim-00069U-63
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 16:57:53 -0500
Received: by mail-pl1-x62a.google.com with SMTP id d3so3071488plr.10
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 13:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ka0hHnOLgjFjLhaXLXC+5bBe9xg2ba2ROVKZW4H9L/M=;
 b=l+LfT8Gk9eqCpHyTd9Y03r+HjOXluF/FI7O/+TaYGDzYpDCSv8BqAM1TQwFNIZuWgI
 ESdgSOBuGYFVXkYOwgIaMdcjwCIkZ5EKRRqlg3jeJP25Q12S72uY5ds++xSHD8LcxOGq
 AhLbe5ROT4cnkXhRJdCH+MHnxPziu8TMIYj5jP5NV9d1aJtM5zhE7YX3Jvmg+eJ1jGVK
 mhYBtmjKuSzqfGsPsCfV6aNmuLtbzG9jsh6mB/Bceo7USMyPUO41JzKpubZ6cFCXQyAa
 S6oRNw+uXhRPB6jFT0P4jiJVHBiA4f93kVsiHTx7JopLtXSF8xMSKBgyh64EDToliT/I
 CbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ka0hHnOLgjFjLhaXLXC+5bBe9xg2ba2ROVKZW4H9L/M=;
 b=qkOb4rIuLaLa6+GZPMHhkG3GKgZ9enz19g/RepPJQ5wysUbA7Ko4PewgjOV+YOXUH7
 F1nRIBsv7gY7LYEbrrUQDyqlf2s54pPSvO2rbf3zFlySD6rLQO1vvslNVdfjxaJk3I95
 e9pa4WJkhQbHjUWzGoupytrkBWG/EHndGj8oAnMQpqoWb6Bu6IP3rUDc3k252CrIPAwK
 iPIVrpaX351z3Cl34KALuHwlH6S/hZYqqYd7mQLdFUK+nuMkXTAxRHwRSkzBubhq75cc
 2L0mShDWfq0YTT7K+YvC6+44r2WhEhuvnLcaOCDPrIv+m9GAAWKq8jHZzIBQ3SDuq9X7
 mJ9A==
X-Gm-Message-State: AFqh2kqB+OlIXFuQuI+eJR8cxnSUvGVLJxZToVo6peWEXkon8iV7FydV
 BOq+aQVE08sja24lBFWLFMYAxw==
X-Google-Smtp-Source: AMrXdXsekwNZz43yCdTY5eESsQ2PanxaMvQQQx4oPx1d4xEZgzEJ/8sh/5kDnhr8QVoFqJ5tBKRigg==
X-Received: by 2002:a05:6a20:3d14:b0:af:b909:2b3f with SMTP id
 y20-20020a056a203d1400b000afb9092b3fmr95612189pzi.34.1673042270728; 
 Fri, 06 Jan 2023 13:57:50 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a63fd11000000b004a0127e8ca5sm1304076pgh.86.2023.01.06.13.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 13:57:50 -0800 (PST)
Message-ID: <e86ed197-74c3-210f-3827-607f7b58b400@linaro.org>
Date: Fri, 6 Jan 2023 13:57:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 12/21] gdbstub: abstract target specific details from
 gdb_put_packet_binary
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/5/23 08:43, Alex Bennée wrote:
> We unfortunately handle the checking of packet acknowledgement
> differently for user and softmmu modes. Abstract the user mode stuff
> behind gdb_got_immediate_ack with a stub for softmmu.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h | 15 +++++++++++++++
>   gdbstub/gdbstub.c   | 10 ++--------
>   gdbstub/softmmu.c   |  8 ++++++++
>   gdbstub/user.c      | 19 +++++++++++++++++++
>   4 files changed, 44 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

