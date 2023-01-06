Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7C0660A82
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 00:58:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDwbC-0007sZ-RK; Fri, 06 Jan 2023 18:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDwb0-0007rp-S9
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:58:00 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDwaz-0001tr-6p
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:57:58 -0500
Received: by mail-pl1-x636.google.com with SMTP id c4so3371393plc.5
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 15:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WJ+ogkemoFE64HRnUFwoSu60J3wH71jlQBxKcEmwQ+M=;
 b=S/ASl0yuS5v/N3LrBCMKVZecXFMzpDvCivA5jKbntl65pEeq8fLS8FDOpkK5vyo3At
 lBrAQXy6QRE7J2mQcqgRKIMRKrBQ02XyuRmTwcMmiioUHYZIbyOWddfwh1fYKc/FsiQ3
 FXM7OzO3iasKjzVr7aMMWmt+5+UB6PfDzk2Pbd5PeIwJ03BaY4lSfB/Atc2rSb0FhBdW
 NWYOVpr+mX/dXFqOyjgZAgP04OnEamNBWGig7bDhiVQZJWfVn16VT4yctozhb6M4zkDF
 B4Al7+xWSoioOC9o3dZqqTgk3yKPBXV9E41tMOykEvHSoSXxfvYo4YNVJsXhVvqXaBn3
 xE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WJ+ogkemoFE64HRnUFwoSu60J3wH71jlQBxKcEmwQ+M=;
 b=66qDhYycDL4Ol2IpqGtvtSvEOeCaMmOk5LhGJyJxub3qhgMZ34Udywm55V/ba9L/B8
 YNNtjD6UcrBmzXXZZ1xDqXbzrjKpa+gIE17HbbDjSfstssZ8J4GqWh/WWsdI4YMM+Cm3
 8U76bzHN9q8nk7iQ+zt5QGhYEvTFD7psp3+SNUu/Mb3Wp4mNEYVpdXIDGYz3c5MlTF/z
 EfQ0KJVjpI1ePzQg2sKKz4y4lSiQlXrkUsxEiopwrkABQOFUhWaKiljw73NcsgasmrL1
 dRzN3RCyp15NILeEbH9sS/8lkzXyeyYOFYexIT8s/qs9fsid+itv8/Fa29LBv3INmOo5
 H7nQ==
X-Gm-Message-State: AFqh2koF0qTOfoY5MmZk26jLXL6dN5mgdaQisv3ZXI2cF4+DimB9+yb2
 hm+zr6qudorHgHq0kO6TUBbvCg==
X-Google-Smtp-Source: AMrXdXvTLrBFr3/cl5ZDYCpcD6aC09zHYJQOFuZCCiTaRA4FhVAIiT2veW60jTUp3t3JO9p54p60cw==
X-Received: by 2002:a05:6a20:b047:b0:b2:6105:e960 with SMTP id
 dx7-20020a056a20b04700b000b26105e960mr53949459pzb.32.1673049475793; 
 Fri, 06 Jan 2023 15:57:55 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a65494b000000b0047850cecbdesm1366978pgs.69.2023.01.06.15.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 15:57:55 -0800 (PST)
Message-ID: <7e695013-7261-50b5-a779-34640701eb6c@linaro.org>
Date: Fri, 6 Jan 2023 15:57:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 00/40] Toward class init of cpu features
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, armbru@redhat.com, ajones@ventanamicro.com
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <CAFEAcA8K=1CNZfDG8i3bSXXSWT7D2oWg4jyupwYmw8oR7MJVsQ@mail.gmail.com>
 <9f9a6c22-315b-de1e-958e-89963c5e7e90@linaro.org>
 <CAFEAcA8cxJFpB9V826DjSsFOy7VYh5TWXb4vRYDUeOMjQgk-eQ@mail.gmail.com>
 <874jt32ppl.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <874jt32ppl.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 1/6/23 15:43, Alex Bennée wrote:
> What about cloning objects after they are realised? After all that is
> what we do for the core CPUClass in user-mode.

No we don't.  Where do you get that idea?


r~

