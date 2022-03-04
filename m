Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE414CE03E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 23:33:43 +0100 (CET)
Received: from localhost ([::1]:53260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQGUY-0007Jm-Po
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 17:33:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGTD-0006ci-GX
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:32:23 -0500
Received: from [2607:f8b0:4864:20::1030] (port=42858
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGTC-0007Jt-42
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:32:19 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso8714084pjq.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 14:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ujbZ5GyzLuLjuQCTgpLdUJpvtCAFvwAG18S/XuTe9P8=;
 b=xIKbAlYM7g8ojDDbDPz2HLcBTImynD290LL7o7fiK2NaWIqYI+JAbr4+K0U+Epk+Rx
 0gKQlPvyhzR50youXs9c7LbQhC1QJtGBXWxKBwpIXjSZ837iOF/BTuplTfIk87dJzYoT
 4aRI2NoHT9y4oAlGSnSzXFR8uI7Q95CyQBjigRYIiKZ4M2qw0xV4wmHDpAZtLeK38Exx
 jWI3pQ5wYtNbk0Nz4X5kvAt6d4YJJRb0Wp9dwmyNI5+Q1QFT85V9rKUx/uveHVXOchPR
 H5bhtZvSzW1Jd9nclwatFI+Y06gZLpjDIhvx7wRGbcNrT8H2pMZBbGBgHbH0153DHh01
 5o1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ujbZ5GyzLuLjuQCTgpLdUJpvtCAFvwAG18S/XuTe9P8=;
 b=Ralh514e7CKpns50LAD72w87GHmZY1JqkeNmJggLldqTdC2zTisA5VsrrCdtdaW+n0
 OaDGhIIYButEgklb8+vojNQzbNatuPNRsi2xIDjZCVBI6n7o7K7tjXiA+roFrrloUjfu
 lo093rWZh6bgyiRUKTk1wACYCwxpOifqy0pPHjY0KfuxRVGE1SCcQXppw+lLsotXcP5+
 ExgerLAxQltpO6Ybeh9cSXg4Pzx7QXTsSsINxA6vj9gJJs2kIMt6ouBRnOc03TWI7Rkg
 Zt6E2FkGrEXiAfSI+OSy8lddFScGwgn7ixV4TvP6qXXXUJ6ts+ZFEGNYIspEBX/T8rnk
 MIzQ==
X-Gm-Message-State: AOAM533moEhnsbLQ8W+mehBJUFe9gJNiueLeF3X6Bulvhcn1G7fEDssX
 e4aYzMxqDMWFUK3gp/bMN+2ufA==
X-Google-Smtp-Source: ABdhPJxYds9SZbmQPGwJw18KOT1/QaNmEkAw3T50Dvjjnmzvhq0YNABLlLboTL3X7+3A7TfhN8RM9g==
X-Received: by 2002:a17:90a:4146:b0:1bf:2dc8:7407 with SMTP id
 m6-20020a17090a414600b001bf2dc87407mr857234pjg.76.1646433136755; 
 Fri, 04 Mar 2022 14:32:16 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 p27-20020a056a000a1b00b004f3f63e3cf2sm7180157pfh.58.2022.03.04.14.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 14:32:16 -0800 (PST)
Message-ID: <9d079adb-26e1-7af5-c174-6c3868d069ae@linaro.org>
Date: Fri, 4 Mar 2022 12:32:13 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 00/11] QEMU changes for 2021-03-02
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220302181134.285107-1-pbonzini@redhat.com>
 <CAFEAcA8=8tiqmFTFPaNXcqjXy6Rb5xR59Q2VYUXOTbN91rbYuA@mail.gmail.com>
 <088024f5-7066-e6ec-953e-f55d7ff83b96@redhat.com>
 <CAFEAcA--dtmffH4FJUuuE1d6yR-4Mweu481p_y-EsJKEtPRjTw@mail.gmail.com>
 <YiJlSlJube4dOk/m@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <YiJlSlJube4dOk/m@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 09:15, Daniel P. Berrangé wrote:
> Personally I favour turning it into a non-gating job as
> I don't want to invest more of my own time debugging
> non-bugs in it.

I would be in favor of removing it from CI entirely, so that we don't even waste cpu time 
on it by default.  Those that care can run it manually within their own build.


r~

