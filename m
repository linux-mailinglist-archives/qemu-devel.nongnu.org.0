Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3A7325C72
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:16:28 +0100 (CET)
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUYF-0006LJ-HV
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:16:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFUK2-0004WT-Vt
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 23:01:48 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:33510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFUJx-0004wg-Up
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 23:01:45 -0500
Received: by mail-pg1-x52e.google.com with SMTP id g4so5472397pgj.0
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 20:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TDrAlp8RiEG0HWVH5CoQWt1pJOg6ndQnsPjsSHgSy4Q=;
 b=X2KuNquXzYMHgvhUfkVoGZ2cOrHwTsAfxEhsSAehysyoCfdirYx2XMgPzSoVhjEJR2
 0iVn144kpxkVSnEXB3SfeqtwWJFO3ppBo1nF31q3a12Vav2KTHkt3i6xghlArOdGUwgS
 q+thzHx/ssMfAx1cxZISq7eLqcxHzCzXg6CCbBzQQWuMaCmMgxAZBg/CirwVI5G8yior
 aCNG2zwvIHGe0WFkTKQuIwpygDZOJI3qHEmnkifo8hQ4jyUHZnI8JDP2u8fHWBHBV25R
 gQfjPZe+F8gnYee4hOk3LQaVhtY5jzCc4PaWTEI983So2kb5GGZ/jIyD1z8Rfm8dOO1c
 hvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TDrAlp8RiEG0HWVH5CoQWt1pJOg6ndQnsPjsSHgSy4Q=;
 b=h0aaFKE3BhwbM9es+daZqTlMT0mzv41XrFBxYfAqDpJGX4xpDfogGDJRop5wpkD7+H
 uL9DH3vKQGTjzciIo2tTdkhkZHKOc2SjVna1E67eJG12tEDg2d9RPJqbnFM/5xeBuqAi
 C4uQHCWbhL8B04yYnevZJrLiOfoO4w7bpakqmsEJDLHXU00O63wEUwTczNgW+Z2nIUWB
 vB5tPG9E04+DXYD479TgmWcSFmMi9RbGLmco95DohyUmTjhi/IaLHAU+9px2nEEjLZKz
 rz5AaTxeu0TaFG7xhT225ko5pUWtlnHXaley/ZxXDyj3Q0AEnxTZlNb4LC1P1AIOry1y
 e/HA==
X-Gm-Message-State: AOAM532kaU7U77KJM69nNBjmrhrm4YPSRU3PORwhge7fklon2VTUqtvK
 6dCjbtnojLhKNGMZt9u+v38goet3vvBSrg==
X-Google-Smtp-Source: ABdhPJzdvLRDKgUoFSm2HZMVLQ6sPgmmp/8Awm+vw0Eb8M3dw3+k/cq0P+4Voo1vMGvQ9R3iwRA2pw==
X-Received: by 2002:a63:b66:: with SMTP id a38mr1139129pgl.116.1614312100425; 
 Thu, 25 Feb 2021 20:01:40 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id l74sm7678648pga.86.2021.02.25.20.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 20:01:39 -0800 (PST)
Subject: Re: [RFC v1 27/38] target/arm: move sve_zcr_len_for_el to common_cpu
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-28-cfontana@suse.de>
 <15668067-2537-07c9-bb76-a429c9af4a08@linaro.org>
 <11aa0f15-1c05-f29b-f6c7-392a8464a57a@suse.de>
 <11ed31d0-2103-abde-9e6d-99f94d7f5d78@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eda6790c-4664-8e89-0e80-f332bc09451d@linaro.org>
Date: Thu, 25 Feb 2021 20:01:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <11ed31d0-2103-abde-9e6d-99f94d7f5d78@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.435,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 12:13 PM, Claudio Fontana wrote:
> sve_zcr_len_for_el is also called in arch_dump.c in aarch64_write_el64_sve, via sve_current_vq().
> 
> Wonder if a stub is needed, or we need the whole implementation..

For sve_zcr_len_for_el, I'd use the whole thing.  The dump seems to be callable
for any cpu state.


r~

