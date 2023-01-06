Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B015660864
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 21:40:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDtV3-0002D6-JG; Fri, 06 Jan 2023 15:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDtV1-0002CK-GM
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 15:39:35 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDtUz-000093-VM
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 15:39:35 -0500
Received: by mail-pl1-x630.google.com with SMTP id d9so2854161pll.9
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 12:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6+voQvns6oeouTZyhNJXTaf1ms9oOZAS7BFJe7KDG+0=;
 b=EJCh+On0HMHCSilu6O0zQfvVXlCijIQaYI5PqhlDHbPnUqWn9fdQ8BdoavHM4oOoc4
 rOdP7JvBzjQDko9BcOWlLX8lGCJz7LfKSvurbO58DM585c5CuYyj6PoZHLpCD67rIoDS
 yTaRAhOHomkxG2Voe6MGTVHbgiPf9iiM4eLKA7iUBr6ldmAWHGou5vXCKTD1inz5XcaW
 2B4Ov6YapZYFFS0HBRyhRU3HN1GMaG+/vSIH40RWnVZ7Bb9kV07rCNXpZCMdb0wogLKh
 bddtXNCXtMvSUz318cLlPo5S1V2XWWmpUNXac2lO4b6ANSAYFP9GfyS+muYmvM7DS9BS
 iWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6+voQvns6oeouTZyhNJXTaf1ms9oOZAS7BFJe7KDG+0=;
 b=ihijTE/XAh5QX7ZOka1iTWr2jmD/DA5VlsKabV4scX1fDizhcRek1/NBpHfNPvQ7vF
 L2OOwbbLXFipeO/KovUGucmDOyvpKiGbkc2Dy3OjcgN0kG6yk14hW9hV24AuAdvP1eig
 oyybr1gG68WrbjoabX2iZMU6ffiUSt+R+wcnDGPrErHVVLRUufX7UJNy2DCGvhsMrmql
 K/NlfmUw5l+6F3pf/otfxbZ5fV25RWcW14fa5ZoKuqS+LdZQ2qw0B86pjNua/tAsRwFE
 aYrFMJxk7BSXUC/zVKUSwBlhdbU8LNqJX30iB7LQZBolLTXusW7SUMW53DN9wXCq5n8b
 qG/Q==
X-Gm-Message-State: AFqh2ko33oF1MBODOmQQ+Z/fKje8xOljCClFcY0j9epYsJbr4Z6VKQwT
 eFOE76/UrI2wnUo6Iray0M815w==
X-Google-Smtp-Source: AMrXdXvonP2GKbd2280IKM3iIRmBZzfypH3CAK2UyKx4Q/mlPVmpr5vcgzlTDyUkNCX3LF8Eyr5O6A==
X-Received: by 2002:a05:6a20:4995:b0:ad:9646:b9b with SMTP id
 fs21-20020a056a20499500b000ad96460b9bmr63894081pzb.49.1673037572469; 
 Fri, 06 Jan 2023 12:39:32 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a63ed10000000b00476799699e4sm1283554pgi.30.2023.01.06.12.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 12:39:31 -0800 (PST)
Message-ID: <fd27912b-53ac-e22e-3d0f-d6dbd12e1c48@linaro.org>
Date: Fri, 6 Jan 2023 12:39:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 05/21] gdbstub: define separate user/system structures
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
> In preparation for moving user/softmmu specific bits from the main
> gdbstub file we need to separate the connection details into a
> user/softmmu state. These will eventually be defined in their own
> files.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   gdbstub/gdbstub.c | 91 +++++++++++++++++++++++++++--------------------
>   1 file changed, 53 insertions(+), 38 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

