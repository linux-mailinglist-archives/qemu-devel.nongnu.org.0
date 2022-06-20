Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9404B551F42
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 16:44:45 +0200 (CEST)
Received: from localhost ([::1]:44616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Idw-0005FP-NC
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 10:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3INx-0002Q5-RQ
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:28:14 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3INv-0001xz-Sq
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:28:13 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so10923288pjl.5
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 07:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9K6mtjzoDqovgQg2ye9Y32ljTHqjIORbw6htsWnKFiY=;
 b=YUc9oYhDg+7Si0hSfVp7Gp+kKEELCLyqM5EXeelW7qveJoucITA/yJQQOx7FSmiQKz
 giQEuNX8YrkFqZtCcBtTsUuWvLOGzLJMpEnahOhrKNgqKRgt3yHRxqjEWmCPGxXwKZFe
 1LJ4TxTJ9tWp6pIc12LN/RZECPxUsKslQNGvB9H/3YL8LtT8Kvjbe3NEOF4cKdzXBeA+
 fIz0AW1eEjHd7QpPfhy3cZivyRwzzLT400+Z+VRTBtISD9KRIQ4MJyjMdthu3XDTF6ps
 h2RjRkUmPOxIcA8cyIDTP1SKJPSwOJqHmbxDIx8+7TR9utbSFXDuS8WO6AWJqISrxBQV
 97ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9K6mtjzoDqovgQg2ye9Y32ljTHqjIORbw6htsWnKFiY=;
 b=fW9uZX5SXiEbM33ciaOwL/xmkjzyelgx8FG/NINeon4ktZR2f8cRSXXdtDpRBOM1Uj
 y/TILsvqwRJla4Pr1vU0KOogqGpREj3EOipGTIvENiaDX7Sdjl//giyQuswS2dgDTDIt
 srqrSbCLTds38OstDwGmAoMbGA7Blchrza8mO3+4wlo8m9wO8TRrfdJAPtiYp5Ncwywc
 Oms1gu/EG6br+23pZ6JGCzwXtTKzLpPj17HsFH7QYYwgzqeWx3QFH1S4EYGJ5eUfTGwT
 0exoOT45Qh0Y11EPVxQuG/C+teo2JlsS9VXhcscSDQHJfqS+URXydCZNJ+TLxYX9k23+
 jD6w==
X-Gm-Message-State: AJIora/5V0Ul4Ui49hMqVJzqMS9qvXzIlicKaiSMd4UWlJGDKHMZapzh
 uAOM6ukeZ6ybrk4OhkQCiAS+lQ==
X-Google-Smtp-Source: AGRyM1sV1bb2j6Ls1m13eDbQ/tzeWuem7Ex5YHv50F/Xfujr/j4Cf+KBbavKcT55lH1V91judkmu/A==
X-Received: by 2002:a17:90b:3b4e:b0:1e8:743a:735c with SMTP id
 ot14-20020a17090b3b4e00b001e8743a735cmr38279841pjb.189.1655735290153; 
 Mon, 20 Jun 2022 07:28:10 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:60c5:8f7f:e684:b81d?
 ([2602:47:d49e:3c01:60c5:8f7f:e684:b81d])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a63744b000000b003c25dfd7372sm9116423pgn.26.2022.06.20.07.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 07:28:09 -0700 (PDT)
Message-ID: <41e54f7f-317d-79bd-ca91-a67e8ba6a721@linaro.org>
Date: Mon, 20 Jun 2022 07:28:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: proposed 7.1 release schedule
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <CAFEAcA80ABJ+RXFeoH4mo5yJk5oNh4Zc5QTBN35vVOL4eg0cNQ@mail.gmail.com>
 <a8f5f61a-c976-e48f-48e1-e87fecd61901@linaro.org>
 <CAFEAcA_LzYqxSe=Pa7KJg-GuR8_E=Qfjj0s1by9LMasRiUR9sA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_LzYqxSe=Pa7KJg-GuR8_E=Qfjj0s1by9LMasRiUR9sA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 6/20/22 03:50, Peter Maydell wrote:
> On Mon, 23 May 2022 at 16:08, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 5/23/22 02:53, Peter Maydell wrote:
>>> I just put some proposed dates into the 7.1 schedule page:
>>> https://wiki.qemu.org/Planning/7.1#Release_Schedule
>>>
>>> * 2022-07-12  Softfreeze
>>> * 2022-07-19  Hardfreeze. Tag rc0
>>> * 2022-07-26  Tag rc1
>>> * 2022-08-02  Tag rc2
>>> * 2022-08-09  Tag rc3
>>> * 2022-08-16  Release; or tag rc4 if needed
>>> * 2022-08-23  Release if we needed an rc4
>>>
>>> Does this work for people? I just worked backwards
>>> from a final release date about 4 months after 7.0; easy
>>> enough to shift it forward or back by a week or so if
>>> that works better for some reason.
>>
>> Shifting later a week or so would be better. I'm on holiday from 13-22 July -- unless
>> someone would like to manage merges in that period?
> 
> I've updated the wiki page to move the dates all one week
> later, and removed the "tentative" label.

Thanks.

> Ping me when we get closer to your holiday to remind
> me that I agreed to do merges then :-)

Will do.  :-)


r~


