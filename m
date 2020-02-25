Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C453516ECFB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 18:47:47 +0100 (CET)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6eJ8-0003ib-M7
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 12:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6eIF-0003D6-0H
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 12:46:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6eID-00039e-OH
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 12:46:50 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:33108)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6eID-00038V-8O
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 12:46:49 -0500
Received: by mail-pf1-x441.google.com with SMTP id n7so7589791pfn.0
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 09:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qLq7w7LUHYIV/ZKsXVdH5n0pfzZKwwrxPIy/eIHNwWE=;
 b=YkZTIpTWLl1DIgs2QWUHBcORoQhbUWdjYp3uXt0q2xKhMqnCUJXBAAfb78qz2RDiR0
 qTgJEdUEPNuBxumLeGUGJa2zvZTMhZa4rC91P95Dd7QeTfH1ZsyMoy8Byc87v4u6CMIK
 J/5Hxs1xAcGt2Muridma7PQflc2DaqXD7+FyHqn3WfAmNzIb+evQO5gkKnDyeIZwKt/D
 /1Vzv+Jdfd8OSXW21OZK+ORXNILp/F3rjQcVJ3PSYg4CXtUvi7FmZHQS2BcANlAhVHMv
 Oc4j2OEziCAjF1tcwug3WAMktwPcM0VrBHkXVvMQraXpgm+k2urnKyfEP1mzhmJ5gAbn
 XOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qLq7w7LUHYIV/ZKsXVdH5n0pfzZKwwrxPIy/eIHNwWE=;
 b=Thqgv1p6dlfAqlKU8EaM+smMP7OBk5LCBT8eJCdjFXfs8H5DtdYcFFhMd83dkK9qEd
 w4NmdqK/3majEwTFzf7mO9y0nsOYMsv6hzbYto4uSvVHByClsdeiWnKCPf+Ezq82c6Hh
 TdiJ/anmkbAT+rXbd6olppcTjlPNu01rQtfZ7pJ72Qu1ZWcleHjqAlGoP+BmuUqgHiaL
 Szu6n79VFgBpGlzBQFD6znr04qDM1IMyOnSrhrt2CfDt224QDi10k5LqjLrnrDN33gx/
 Sl26cMBe7IlUNcPotiIoouiO3iHBPHX+SvWkTZ7oVyVE/8WtMZv6Wf1E8LtB7O8vSLFt
 MJ5w==
X-Gm-Message-State: APjAAAVVkdh3Mi5aWPDMS2nrQHmxTxHWXb40aZIP0oDLJeQG6Vaz229C
 PsfgY67OvPNrY57BUNaEbgBNBA==
X-Google-Smtp-Source: APXvYqySp5VNciDLobXJebwnsitrMRj/0lXRwnrbuFKCoOmSEZEp4isR30DwCsslGa/2tVz8/dp4UQ==
X-Received: by 2002:aa7:8582:: with SMTP id w2mr55656267pfn.89.1582652806668; 
 Tue, 25 Feb 2020 09:46:46 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d1sm17043130pgj.79.2020.02.25.09.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 09:46:45 -0800 (PST)
Subject: Re: [PATCH v3 7/7] target/arm: Honor the HCR_EL2.TTLB bit
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200218190958.745-1-richard.henderson@linaro.org>
 <20200218190958.745-8-richard.henderson@linaro.org>
 <CAFEAcA_QHoRcfv0oLgxNsuEOaRJOoM9sQHqXZEP-tDeJrziVYw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4dbed837-f3a4-2280-8655-6975dd235e4b@linaro.org>
Date: Tue, 25 Feb 2020 09:46:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_QHoRcfv0oLgxNsuEOaRJOoM9sQHqXZEP-tDeJrziVYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/20 4:01 AM, Peter Maydell wrote:
> The set of operations this traps differs when ARMv8.4-TLBI is
> implemented. It looks like you've applied this access fn to
> the wider with-v8.4-TLBI set? (eg TLBI_VMALLE1 is only trapped
> with ARMv8.4-TLBI, not without.)

Um, that's not true.

ARMv8.4-TLBI adds the *OS and R* insns, and extends this bit to apply there.
But all of the original v8.0 insns are unchanged.


r~

