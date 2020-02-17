Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDFC161A79
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 19:48:23 +0100 (CET)
Received: from localhost ([::1]:50806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3lRO-0006FT-SM
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 13:48:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49100)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lQJ-0005iJ-MU
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:47:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lQI-0002l9-Mm
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:47:15 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:44191)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3lQI-0002kl-Fn
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:47:14 -0500
Received: by mail-pg1-x541.google.com with SMTP id g3so9532859pgs.11
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 10:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SQYCMe6wIG8jhXInFmL49ufA0NkdujsXTeT1131Spc4=;
 b=TMDmlJKakiIFixn5dQGUUAVnADI/bXCzhMPoJsFX66UjiW7lZugNQLlgSvOBGvfYSi
 brwYvUHOy8WrO0tKv1Ymqn+IrqrVwGHPQQonxDGsqd05uDiHG57+76QUgMzrrOmT/y8L
 Vzpime6WYhOa8ttZmUbjvfp3u3lLJwBR+rdsmvwGjksS+y8HR/cLAtB9cx2saIpFS85T
 0QqRAc9VI5DhEVv0C61d+O2uhrrntU8wcCMLakV0FcEN3TvNsI6hQhuGFSEfAD/kEUs/
 929ARqf5wPVyWYAN8FDUCfMQONtCmhspNMoxqsErNohtdVbykTjPn/7FJ3H+E6yhDotm
 mYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SQYCMe6wIG8jhXInFmL49ufA0NkdujsXTeT1131Spc4=;
 b=ZC8nHIQInerjDlQlMuXUTUyS8L55t3yfxiv0f2UgUysf0gPn9zbjxilfXk8Qg9PpuW
 XRnKTZJEIh5dwALX4RMOdGY8LokRoOgNr+84SR3UdBsKwO/KxnqLFmZni1DuB7tWchZV
 gWpO5iyk1c5AeRN15eh7+zr083fRi9/BsUJ5vva2lEgw45sQ2i7f+Y8a3vw0Qd4RsF3O
 iihwXaBFCllZavT1PCKu83c4vt8jkCM2l9RQCrQdxNXZngAId+5Z4178wZ3m/B4Y0cKt
 ndXmOm4CJxhqDoo5p0U2xOrVMS1Qn4XLhKlEUpnkiCUeYbfaDu4jKnklgMfCag1SwBl0
 dkEQ==
X-Gm-Message-State: APjAAAVBd06aQbPuBaw+xqD0B+pTds/MYtA6OBEr3l3Mi4NXPplrjcCO
 2k0RK+ZTPsm4fYgwe/XbkjSxaveztOk=
X-Google-Smtp-Source: APXvYqx7HMBUDSzVAFbVdLYlD5nArXNldutg5H6i30xMet2MS+qooFd1j9tWckp+XLPYwRE+8s7aVg==
X-Received: by 2002:a17:90a:6545:: with SMTP id f5mr514559pjs.42.1581965233399; 
 Mon, 17 Feb 2020 10:47:13 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 w18sm1149128pfq.167.2020.02.17.10.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 10:47:12 -0800 (PST)
Subject: Re: [PATCH v5 07/79] vl.c: ensure that ram_size matches size of
 machine.memory-backend
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-8-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <441cedce-b96b-a596-e18c-5e0964290642@linaro.org>
Date: Mon, 17 Feb 2020 10:47:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-8-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: pasic@linux.ibm.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/20 9:33 AM, Igor Mammedov wrote:
> Extend set_memory_options() to check that size specified by -m
> matches the size of backend pointed by memory-backend.
> And in case of -m was omitted adjust ram_size to match that
> of explicitly provided backend.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

