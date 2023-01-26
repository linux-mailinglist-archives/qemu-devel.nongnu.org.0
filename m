Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1A067CD44
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:09:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL2uq-0003AF-45; Thu, 26 Jan 2023 09:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pL2uo-00039r-9E
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:07:46 -0500
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pL2ul-0003q7-LK
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:07:46 -0500
Received: by mail-oo1-xc32.google.com with SMTP id
 b10-20020a4a9fca000000b004e6f734c6b4so239846oom.9
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 06:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7OhGopPWZg4LUj1fj916TEATM5yHm1coUbmyjwrZ4U8=;
 b=WM7+ajRgESX2EBrB3CBlNAObB/C5OCm/XUfdOZF+K5bvVpqALB4+rVceOKFd4XfNQB
 tEwMcl9YdVjN7lQNawhRCKjepNkr6jU04tOl6Iac9XAcCVpiuqyUvgw8IImN2O6RWnN5
 WuIVqHr0coRkbIsWRO3sATyIoW0ucWGjWKzeFfURo/7sXq6xtgk0cOoCE6t9EaIlyMPu
 y3AFEL8mTiu8h3yCdx4RNTEfU/NzPptR1mfcJhN46VriiKuKh37xHU1QEB7zSZ8cRi92
 KyfW3mElipW3w+ihLLXjrRgsWsfvlLdcjY+zTbBDxMAyp2Vy94Pqjz6h2xhjyKgox66a
 aKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7OhGopPWZg4LUj1fj916TEATM5yHm1coUbmyjwrZ4U8=;
 b=1bJ86V1Rc4hYy4c0o7BA2qfOo3FKLA+F3adJQ7gRGwPnashVXOID6ihDnB/gvwGCbY
 Jg48H7IuwlvBwKY0g5jsGMKlF6Z+YQeusBjuaIScH7OyDHxAMc57KNd1SzqmgTKEIVHL
 PX5uHfDOqAR/Vq/o3N/DDy5YqMcrzzpgLZqepHNIZFtm7h2l8RcN75bBVeCsjt5WEQur
 M6F8bNvimyrP+ifo8vhPQa4OQTwCScpKtDwNQdpHVpCS5ru4H0SfBz9QRNlZqajndBiv
 p6m/9Bct6HcQC7TsWcLEFBKRXVUbubfC9G3P+Tn3KNnwPSZ5N9TWNJJZ591SASngzt9C
 cstQ==
X-Gm-Message-State: AFqh2kr0OL0uZs+GrDVii2V+vR1oQf2Lnktr+SwOiJhdbgz2qfxIweGJ
 WrNThFGHsRvIv5+srkt5jHQ=
X-Google-Smtp-Source: AMrXdXuwL3xeknkBrfAzHFzqxfQqRta6Wd9u+P0ik82LLELU0qx6xGOSVfy1xXgmUs1jZ5mNPV5yXw==
X-Received: by 2002:a4a:8c68:0:b0:4a3:aa96:23c7 with SMTP id
 v37-20020a4a8c68000000b004a3aa9623c7mr15765617ooj.6.1674742061027; 
 Thu, 26 Jan 2023 06:07:41 -0800 (PST)
Received: from [192.168.68.107] (200-148-13-157.dsl.telesp.net.br.
 [200.148.13.157]) by smtp.gmail.com with ESMTPSA id
 x2-20020a4aca82000000b00502189f6bdbsm535443ooq.44.2023.01.26.06.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 06:07:40 -0800 (PST)
Message-ID: <334e1cd4-04e1-2ec9-a342-de13e3fd922f@gmail.com>
Date: Thu, 26 Jan 2023 11:07:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: no more pullreq processing til February
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <87pmb1pfas.fsf@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <87pmb1pfas.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.15,
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



On 1/26/23 10:57, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> Hi; we've run out of gitlab CI pipeline minutes for this month.
>> This leaves us the choice of:
>>   (a) don't process any more pullreqs til we get more minutes in Feb
>>   (b) merge pullreqs blindly without CI testing
>>   (c) buy more minutes
>>
>> For the moment I propose to take option (a). My mail filter will
>> continue to track pullreqs that get sent to the list, but I won't
>> do anything with them.
>>
>> If anybody has a better suggestion feel free :-)
> 
> I've submitted a support request (#366644) to GitLab to see if they will
> give us more minutes for this month. Longer term ideas:
> 
>   * Reduce compile time by reducing number of identical object files we
>     build for specific_ss
>   * Move more tests over to custom runners (don't we have an x86 box
>     somewhere?)
>   * Carry out an audit of code coverage for different test sets and
>     rationalise our CI set

What about sub-maintainers running the CI jobs before sending PRs? Should we
stop it? I usually do a full CI run before sending a ppc queue but if we're
having problems with gitlab pipeline minutes then perhaps we should stop
doing that.


Thanks,

Daniel

> 

