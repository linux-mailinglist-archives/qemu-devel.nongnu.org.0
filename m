Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B659151D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 19:57:59 +0200 (CEST)
Received: from localhost ([::1]:39538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMYv0-0006KE-71
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 13:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMYs1-0003rP-IL
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 13:54:53 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMYrz-00046d-Vx
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 13:54:53 -0400
Received: by mail-pl1-x634.google.com with SMTP id w14so1361614plp.9
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 10:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=1hhCpWSM04GCt+NsDHRBvvjLjdGAbeiIi7V9QJIyBBg=;
 b=v3x2vPQjl9XDcdPWu8QXJE3FzHXTvqTVNeDx1v+X8m0iB45MDhyVZDTgW5o2+MGU03
 g57BFagW2gVuNMFZ+hAW6H8buGFm//ZiKOCo1XA2Dg3VPd2jyroVrSTEw3Zy1DAA401i
 nhpUwsEzeX6upRV0zxa8CjC1Jm2e1KkCICIVfpslSffPGv/2N0fGTtWaFRxhaXO89OQz
 Hnuw3KnXcXY8KezBp/hyPyYSrwGNLbnnKBf3tkB/C4lcN0ygz4TqDztYU3Loj7LeE8xm
 9dps2MdJ3IIKtvtGDPrt4hBzrdG+69hI8v8xNuPv1Dw2dwb34VnivZSyB2SqaMaXdAJd
 1bGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=1hhCpWSM04GCt+NsDHRBvvjLjdGAbeiIi7V9QJIyBBg=;
 b=xQO1mwRG422ziGUHP97EbofciBdemMCjNNWLuGhwT0KYaHyfx3bZ+NChHRUM38s5Ev
 3PN2Nk04cCIDBm0AmkwFpL9/v7irWG0qnqdVFAUF2kxZ4x85izeprFvCxKmptTk/M76W
 B7di26TrmjDbJqWPlDJLjA2cpESQCEj2X/qQrEfvQ8Sxkc/wvakzBgEH6O/plTKalk0Q
 qknRwirW+o/8cCD3iG8KV9Ch5zyowaJvBimX8LG4L6JkGKZDo1cZ2xOi6IOvCvSO50Vx
 P2CQfNpBIb6jIBSMuPWFkXgnt8xNEQQ6NKXG7ccK3VgS3KfVg0KYLICJv58KBfOwUFW7
 Cc5A==
X-Gm-Message-State: ACgBeo1orKRt0LWeWQmfmeaLG00/qK3r9LHjRimXTzBWbPbDE6roDJXS
 V/G2X4nou7kxJW6vY42dXCkhWg==
X-Google-Smtp-Source: AA6agR59Sk0z+XexEbz8VcJDJ7NKTcPGC0hFYuu6jN0XPpSaI3+qLvxR0KVCEdEEuB/RaTL/cqlb3w==
X-Received: by 2002:a17:902:d2c6:b0:16e:d285:c602 with SMTP id
 n6-20020a170902d2c600b0016ed285c602mr5116115plc.81.1660326890472; 
 Fri, 12 Aug 2022 10:54:50 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:a7aa:1d1d:c857:5500?
 ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a170902d38900b0016dcc381bbasm2005173pld.144.2022.08.12.10.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 10:54:48 -0700 (PDT)
Message-ID: <a159021a-bcad-aadd-f57a-197b54eb0160@linaro.org>
Date: Fri, 12 Aug 2022 10:54:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/62] target/arm: Implement FEAT_HAFDBS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <CAFEAcA95O5N_gOJ88zkaPx5BvTFYSSOLF=7XMFc3egCU+s1RkQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA95O5N_gOJ88zkaPx5BvTFYSSOLF=7XMFc3egCU+s1RkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/22 09:31, Peter Maydell wrote:
> Is it possible to rearrange this patchset so the easy
> refactoring patches that do "use a struct to return
> values from get_phys_addr and friends" are at the front
> (ie before the stuff that touches core code) ?
> That way they're easy to take into the tree early while
> the rest of the series is still under review...

Yes, I think so.


r~

