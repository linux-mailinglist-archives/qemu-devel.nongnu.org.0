Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFEF1F6C0B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 18:16:15 +0200 (CEST)
Received: from localhost ([::1]:50618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjPsE-0000IE-4M
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 12:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjPqT-00078c-C4
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 12:14:25 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:38808)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjPqR-0003Tm-Ja
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 12:14:25 -0400
Received: by mail-pj1-x1042.google.com with SMTP id d6so2560538pjs.3
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 09:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=CESDvHLXTFEIdgM4Bo+zcARaWcWwGTL5Sr6D3wtiMyI=;
 b=kwepDbfmV2uYaLXSZkS23HGe3U2c/7XBHQtXjHEm01Ci9Lp00t0WHXjii16v256tiX
 Eg6trgfqsPeDarPNyw57xMnTLnf6VpjSTKWPBOFErJHflh+0NVIeIrwqxkse4OFD0iGF
 ySShbX667hMnil+azjslH2Tqd0qG4Pok+Pl29nWFmUOVlMkaRW7EnBPtmX7kyiecf8nb
 Ae5UqGKNk+ePFEbYTCqkNQCTrjmXhGKn6ZMmTDkPKsDLDSAYmRG1RWWxI4AYMEWX5WGP
 JbZhD20k0/sPD7Fu44Dcak24nGKaGcKHJX4zYybLDM4tAdeSp4eY+fkZWUvu/5cEbzG0
 NH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CESDvHLXTFEIdgM4Bo+zcARaWcWwGTL5Sr6D3wtiMyI=;
 b=jN/vZdgdbX7YvBJeezbd1kbXeOqmXVhymKiZPyeuD5mAzGdLj5IiqCWG/6RIGYXzpR
 ej9fP6fc4IOEXFoXPBAY8t1bHNo+K76XAWy8pjvCVHwF6b1nwuH5y8TfPB8mcGenczut
 v/CKnleFTYpRtQcGvkjEd4Q7+6KnuXTtA5UrNRmJsx/OxTjjO9ao87DUKvBj7Rw71t6/
 y5wY6264+4O8LPOwxrcrFKBDSxexsMpGhrbH+qjNxtxTenzDcL4QI9IyKf7/mz65Z/w+
 EQ47NCUMBMdr3TTwO86WIygA5b8o5LtJWv2D9Ai6HwTCai51cRrBD/RI4BZEHFYSBbtr
 2hgg==
X-Gm-Message-State: AOAM533rAJAM5QLUXa3/qbgfyODLm6tOyoeawn4/EPnyVklrJMMQZmLy
 Y2riSHi58PxQ8SgvoQwxbgAxLMQGjzA=
X-Google-Smtp-Source: ABdhPJyBR+gJm/Cn/nVDrXbMzoCXWD2LZlJokTRgw32Lu8Eb+bgWkz7QD4TRm6GrUvkE8Kh2aKw2ew==
X-Received: by 2002:a17:90a:d244:: with SMTP id
 o4mr8688976pjw.186.1591892055572; 
 Thu, 11 Jun 2020 09:14:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x14sm3631062pfq.80.2020.06.11.09.14.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 09:14:14 -0700 (PDT)
Subject: Re: [PATCH 04/10] target/arm: Convert Neon 2-reg-scalar float
 multiplies to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200611144529.8873-1-peter.maydell@linaro.org>
 <20200611144529.8873-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ade07aa7-fd46-8582-ac6a-6c8f771e4215@linaro.org>
Date: Thu, 11 Jun 2020 09:14:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611144529.8873-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

On 6/11/20 7:45 AM, Peter Maydell wrote:
> Convert the float versions of VMLA, VMLS and VMUL in the Neon
> 2-reg-scalar group to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> As noted in the comment on the WRAP_FP_FN macro, we could have
> had a do_2scalar_fp() function, but for 3 insns it seemed
> simpler to just do the wrapping to get hold of the fpstatus ptr.
> (These are the only fp insns in the group.)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

