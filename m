Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBC53A8A07
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 22:15:02 +0200 (CEST)
Received: from localhost ([::1]:57380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltFSe-0001BX-V2
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 16:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltFRN-00008V-BY; Tue, 15 Jun 2021 16:13:41 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:34306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltFRL-00050X-Nu; Tue, 15 Jun 2021 16:13:41 -0400
Received: by mail-qt1-x830.google.com with SMTP id u20so55300qtx.1;
 Tue, 15 Jun 2021 13:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LyABgyzOhw3zNYJfMkMvbfD+Pdifsq6x8oVeQgQE7ek=;
 b=Dq0gz4LWpJvMVWbJmmMRxOWxeX8YkYjbVfpPxZJbWbbbhDbxfZjpOFN7nst2LdQzpj
 rqgcOlkmcn/qAPOMstSCSFE3kFWGij1nTH6uZoAro8kW0ZUpgtz9Qwp87ZSuB16XVepa
 /bYMFu6zZKVKprIrWG8ixgK9e79IVzPpbVrUGHjh8xsPyNLmcmVd+ySUEwAcoA3ssW4b
 HzNAXXppFYOSUtTTyyjKihcNyFAQfuTD1q6pzULZJzTTma73PmLfUBSbk3PJvf2y5llC
 0Xp6RLxgFaTFJf3byGNtglx6jerL/2dQnntdwVQ7/ylsKVkGMBaZD6uO7iC7iWgMn8Uo
 LDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LyABgyzOhw3zNYJfMkMvbfD+Pdifsq6x8oVeQgQE7ek=;
 b=PEpnjYR/vaylajRarYQUr0cr/FoUzPD9lTnHxfd8F2T4/qxpEHX4vw0QIWKNczu/Is
 ZTZKbrXAoTwlUTiZpTjSAYkRqeRRFxjsLn4+ljF4jMg2FFFB/XCJIfy7QHnsZra8dV7e
 9kvaTLo77itORZRGNvegeW7P7HmSBDIO2kcXP9wYulqk+sZCQE91fD36LBt9CqRxL4/I
 Iz7HZx90h5uItLjAGD07KwZgqq8GRspf87OHD/u2vPCLqxyNoaIYigcRpXqpo9eIMVwY
 RP0XNLz7SMyvEo2rHlgPB9EyDrBYqVHber3D6qVtluQfW2wm7GqqHktZuV2pmFHhUiAi
 J3+A==
X-Gm-Message-State: AOAM530/c5o5cEb/fJ0FE+pWH6KjREbELhi+xVJCoMkJIwNSIN9+eMv7
 SEF6AwP2Wyx+7ZODtuZnRJE=
X-Google-Smtp-Source: ABdhPJzibeOZrnMOOAtk/DAkybQZ76ZqpRWCAIyvXd87sGlWCs5oDK+Ye4d/PY9uA8wH5hyoRzvjKw==
X-Received: by 2002:ac8:5a93:: with SMTP id c19mr1459461qtc.152.1623788017972; 
 Tue, 15 Jun 2021 13:13:37 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:4d9a:784f:a7de:c020:5f1e?
 ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id f193sm80590qke.43.2021.06.15.13.13.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 13:13:37 -0700 (PDT)
Subject: Re: [RFC PATCH 6/8] nvdimm: add PPC64 'device-node' property
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210615013309.2833323-1-danielhb413@gmail.com>
 <20210615013309.2833323-7-danielhb413@gmail.com>
 <874kdzo4kh.fsf@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <f8bc0a7f-c243-7f23-cb20-06191185ec86@gmail.com>
Date: Tue, 15 Jun 2021 17:13:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <874kdzo4kh.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.095,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org, groug@kaod.org,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/15/21 6:33 AM, Aneesh Kumar K.V wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> The spapr-nvdimm driver is able to operate in two ways. The first
>> one is as a regular memory in which the NUMA node of the parent
>> pc-dimm class is used. The second mode, as persistent memory, allows for
>> a different NUMA node to be used based on the locality of the device.
>>
>> At this moment we don't have a way to express this second NUMA node for
>> the persistent memory mode. This patch introduces a new 'device-node'
>> property that will be used by the PPC64 spapr-nvdimm driver to set a
>> second NUMA node for the nvdimm.
> 
> if device-node is not specified on the commandline, we should default to
> the same value of node= attribute? Right now I am finding this default
> to 0.


I agree. I fixed it in the next version to default to the 'node'
value when 'device-node' is omitted.



Daniel

> 
> -aneesh
> 

