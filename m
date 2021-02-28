Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59D13274A8
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 22:41:47 +0100 (CET)
Received: from localhost ([::1]:39000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGTow-0003Sx-T7
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 16:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGTnI-0002sT-CC
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 16:40:04 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGTnG-0003RJ-O4
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 16:40:03 -0500
Received: by mail-pl1-x62f.google.com with SMTP id k22so8674662pll.6
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 13:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k8XNFYU6FUCaTD74LSH+YgPBMetjjla0JES98yHnI0M=;
 b=cu69gfBTnBu34kpZpBKgIQSZ/GDXlzzU7iccVNxrfR7qsgXgL3W82qzPgZuW9/jxW9
 XQy9Ogla2HEFHK/GcoyuehPWxZsJVeaB8BY7lnDf8vlqSbcQ5ylxzZ8af4r9UKXUmL/6
 1cpPiTmKz+Im5hztDLEMWuHaLU7CKrnZqwT/N5VCc5U5g+7i4YWRMdkRdT/Hoy67AnCQ
 jHZyALe83QgRp4yxT+q0MzsG0tzBua5C7iohBBoxsH5xESDnM6Ri70rxm3KfVbcwXMf1
 w+H/WJx22oLBA5/oMzDNggnNho1yhR+CJzvilbUruEV7HzUl4Wc++IdIbIfyGuw5TxcZ
 ckHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k8XNFYU6FUCaTD74LSH+YgPBMetjjla0JES98yHnI0M=;
 b=Q/xnmzw2lWO324L9sMN7jShD4zXsTQT4tgFSo6X3HH63kn69xDGpNYJAW4/D/JemOX
 eKWc6ZF7Zsiolu/IBLUcOctuWJq2cFwuKKlhzByQU6f9nklPnRha6aMSJ9N4E8kgTU+Q
 aKLGR9MnIFgXDhjZqKIL/0J53owi7YaMIEHlclTULIrh7A9ZHdDMkH0C0BqljhOnSGJW
 V9V9OGC8kdV+QYdjJ+Gc9ZkxrvyYgpB7NjcO/EimCJN1m7il46bJLdJ4Pbf/roqlfJ3l
 BCdzGfNk3luZJhMLpGLkeD+xxWWPhZw4ZU6JN6OHch3LgDjkPqrZwgASCIfeA9fXuqh0
 F3SQ==
X-Gm-Message-State: AOAM531MU0o1AudupNiG09eUh94tanzDabuwh+ZQn3QGyXRTPPEL3lj9
 cV4nUQpD5wyDTBPkFXITFLpo6Q==
X-Google-Smtp-Source: ABdhPJzp9fQWlVnumkFrIRHuYfmz9c/lOJnMz9WMc6krUlUHmymxxlS1jocIjT6aFWoqVC14P5tMJw==
X-Received: by 2002:a17:902:b609:b029:e3:4b8d:994 with SMTP id
 b9-20020a170902b609b02900e34b8d0994mr12431674pls.44.1614548400898; 
 Sun, 28 Feb 2021 13:40:00 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id z10sm14936287pjn.11.2021.02.28.13.40.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 13:40:00 -0800 (PST)
Subject: Re: [PATCH 1/2] target/mips: Fold jazz behaviour into
 mips_cpu_do_transaction_failed
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210227232519.222663-1-richard.henderson@linaro.org>
 <20210227232519.222663-2-richard.henderson@linaro.org>
 <8102bde6-d2d3-0058-dddb-db295ce5bfac@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e5f80cc6-7302-93eb-9dc5-d92811b74997@linaro.org>
Date: Sun, 28 Feb 2021 13:39:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8102bde6-d2d3-0058-dddb-db295ce5bfac@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/21 8:14 AM, Philippe Mathieu-Daudé wrote:
>> +    /* Used for the jazz board to modify mips_cpu_do_transaction_failed. */
> 
> Isn't it possible to have other (old) boards doing something similar?

It's possible, but I doubt any need to.

I think the comment in hw/mips/jazz.c is correct, in essence.  That we're
simply being bug-compatible with older qemu, and that real jazz hw does not
discriminate between instruction and data loads.


r~

