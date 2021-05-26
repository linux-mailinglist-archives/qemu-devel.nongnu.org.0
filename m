Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8228A392178
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:27:48 +0200 (CEST)
Received: from localhost ([::1]:51656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm083-0002qY-Id
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llzwJ-0002QZ-Ac
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:15:39 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:45744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llzwH-0006Xk-BV
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:15:38 -0400
Received: by mail-pf1-x42d.google.com with SMTP id d16so1800616pfn.12
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 13:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=P0stVokZl+/u1AT2ryi8Nfu+u6VDpVuiUX6wqVwjRHI=;
 b=SF4nPBO+EoCy82KMxRf1F+9fW3gFWA4+EmgZZCnE3+5zANnmrDl3IdnSq9rbUpLQX0
 1dA2Mz1afhe3A/hP4bDV/JaLP5FM9jSLWB7EgoS7irC3+skTgLEIjFHdzO6iIxOpMMRj
 e14BvAAmuSA6WU/VXHCGQVW9NpOONkmrMrGy4SiQWNiD0oki0pjGgVfOfOQGG8EEhvom
 ZJi8qkPIHMmmjQrCD/pha0e1pssuKNHmtwRd0N0xS3bWI4aWCrk6qDIW0s5kuxgf9WV4
 VGNMp5QMHllq7CFNvQdV7zBm8tI3++aenWWWMIcMBwcPcLqi2AcK660YsaibOh02A5Ai
 oCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P0stVokZl+/u1AT2ryi8Nfu+u6VDpVuiUX6wqVwjRHI=;
 b=OiACmnSasZAlNMjV/m6SFLGZAeOI5JY2m6azPK9s0IahDDz15JeXdgAapVVnT9yf5A
 bX7QGeWynPTOF3M6DyCpRjGtNLeCFiRvhXv3C3U/DwESdsinSWpkE14fzDa4ZemTHA0Z
 vk2PVSVLCsOPfquw3jVIEgkzyN7HwS/6qFbkR9PWJdi3N8XbjtOTM6OlYunUT2HCuE3c
 UUDuijrnn2vEBvMQvmR5bb47hJh8HHyC3gzHV488bnXpON6YmPiGhFl7b17AdVd2z3Tz
 1OaMTXjHhHDrERZPPUCGlzuIkfbp0iy9pUPQmondRLI4we+BeXY9YUq6u9CJd9HJS7So
 fgOg==
X-Gm-Message-State: AOAM533Mpp/+NKj9mLXR9jArHtODkz9OA2hm1smCIuY3iwFNzGgMyP2y
 VN1hMfNtO8TdSsqN5zKqRMpNW8CMio6HAg==
X-Google-Smtp-Source: ABdhPJxqYZ1Ytv1WExg+euYOGWdz7p8ZfZquImL68y4ozFC70ytKdBJHqfFUYlR0F3DdLGUwLizC/w==
X-Received: by 2002:a05:6a00:16cd:b029:2d0:d876:4707 with SMTP id
 l13-20020a056a0016cdb02902d0d8764707mr38223765pfc.64.1622060135279; 
 Wed, 26 May 2021 13:15:35 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h36sm187268pgh.63.2021.05.26.13.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 13:15:35 -0700 (PDT)
Subject: Re: Denormal input handling
To: morrell@alumni.ucsd.edu, qemu-devel@nongnu.org
References: <746277332.296230.1622055775751.ref@mail.yahoo.com>
 <746277332.296230.1622055775751@mail.yahoo.com>
 <4bc4444e-782a-311c-719d-091a04e20387@linaro.org>
 <b6cc921d-afad-9b39-e13a-9789bd873f99@linaro.org>
 <1098669241.332748.1622058749094@mail.yahoo.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f3b3c646-bf2b-b272-77db-af00563fdd95@linaro.org>
Date: Wed, 26 May 2021 13:15:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1098669241.332748.1622058749094@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> So, DE should not be set for a denormal input if DAZ is set (it is set only 
> when DAZ is 0 -- the default "IEEE mode").

It's not my day is it?  Clearly the bit that I quoted is wrt to the output 
denormal flushing.  But my suggested fix is still not wrong -- have two bits 
that cover both alternatives.

> Can you point me to the ARM documentation?

https://developer.arm.com/documentation/ddi0487/latest

Section D1.12.6 Floating point exceptions and exception traps,
subsection Input Denormal exceptions.


r~

