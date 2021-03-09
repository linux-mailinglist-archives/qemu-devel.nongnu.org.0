Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606023331C0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 23:49:44 +0100 (CET)
Received: from localhost ([::1]:59584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJlAd-0001zN-D0
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 17:49:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJl7D-00007g-7r
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 17:46:11 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJl78-000510-9k
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 17:46:07 -0500
Received: by mail-ej1-x636.google.com with SMTP id ox4so16942307ejb.11
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 14:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qgpfLvnAOCxxPxOJR+pBvrl9WblplWp6yWxypkbTwso=;
 b=rp7QszFu5EnMAlBSUJJkn7qd7XVQpOnZuqd8rIxVfr8rlW0PsZWm257A3Q71JhJkH8
 3IGZMAFWt4XINdkag+cS9EhB2m/wTjf9EAQFW8cPB1LqmjpA9YN79b7nxet7JZpR8Xqz
 y1+2VYr/aeaZ9jkw0GgyLvUuBCNx2ggubyVszApNrVV0U9L1pyVITH0mhH5DOS/7d673
 ymMaVkj6jL9uxttH8YX2uV1pkBIiE9/sLCUcAWXvBUdXCBGBtadG6K8DrJNkjfoY24UJ
 qubU85ldlCO20C+4j8bNqW2XFneH4uWNAcKRFtQZBOgxcpoYQh32F4EWmfgbOFTht+aE
 IiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qgpfLvnAOCxxPxOJR+pBvrl9WblplWp6yWxypkbTwso=;
 b=T04UkOgXaKulFfS9S6n9rJOSxSQguJghBb3UySZ7WOBv0XRBp/xCgO6j6BxPnm1erS
 3AMkLl8NJtHGTlAZFEmaQapInGLUWH2bBgVNE8wBew6kb2zCg8GRr0ETj0gNfWvpvplF
 5jEHUgdOPBk8gIiCZ6AwPyV9BMvXzpBiv+K3k8X6fTjn0SV+2CnP1q6TIzrQtsSpTBr3
 OAFnGvIrGRKNvlhdFtdaWaifAjNlhcdm1sx7bRwcLRzpvPEkPfZAnr8CuOGZcNHJmtJH
 vEncnKI3N5zg5bVdVb5D6S6nHDEbVmicQwCrEf1EynwfuYd+/luE0zpKqCp/q8ACkqxI
 1evQ==
X-Gm-Message-State: AOAM5323CG1WJBSj7nhCu+P8w3wOBO8gwsZCIb8mTlHe1VVtE/xkWrPH
 vIhCxe3HLDjBDy1ZDfZ0xk4=
X-Google-Smtp-Source: ABdhPJz6zB6Y+qNRcVGDgBUKpEgvMVMlbaxiaAEznR0AmDcmvGM3uIT87bI8MSkG/TxtmhKSQlxP7A==
X-Received: by 2002:a17:906:3ac3:: with SMTP id
 z3mr390751ejd.106.1615329964757; 
 Tue, 09 Mar 2021 14:46:04 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id cy5sm9734890edb.46.2021.03.09.14.46.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 14:46:04 -0800 (PST)
Subject: Re: [PATCH 0/3] target/tricore: Pass MMUAccessType to
 get_physical_address()
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20210127224255.3505711-1-f4bug@amsat.org>
 <20210210121236.fc5skykdhirc4nd4@schnipp-desktop>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <638d6540-d29c-866b-bb13-41dd5d75afbc@amsat.org>
Date: Tue, 9 Mar 2021 23:46:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210210121236.fc5skykdhirc4nd4@schnipp-desktop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Brenken <david.brenken@efs-auto.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Joe Komlodi <komlodi@xilinx.com>,
 Andreas Konopik <andreas.konopik@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 1:12 PM, Bastian Koppelmann wrote:
> Hi,
> 
> On Wed, Jan 27, 2021 at 11:42:52PM +0100, Philippe Mathieu-Daudé wrote:
>> Taking notes while reviewing commit 671a0a1265a
>> ("use MMUAccessType instead of int in mmu_translate").
>>
>> Philippe Mathieu-Daudé (3):
>>   target/tricore: Replace magic value by MMU_DATA_LOAD definition
>>   target/tricore: Pass MMUAccessType to get_physical_address()
>>   target/tricore: Remove unused definitions
>>
>>  target/tricore/cpu.h    | 12 ------------
>>  target/tricore/helper.c |  9 ++++-----
>>  2 files changed, 4 insertions(+), 17 deletions(-)
> 
> Thanks for the cleanup. I applied it to my tricore.next queue.

Thanks Bastian!

Phil.

