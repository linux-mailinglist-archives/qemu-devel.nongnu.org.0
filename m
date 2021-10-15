Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DCE42FBDF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:19:02 +0200 (CEST)
Received: from localhost ([::1]:39172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSjN-0004CK-FI
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbSgD-0008DM-Nh
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:15:47 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbSg3-0004Tx-Jj
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:15:44 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 133so9447076pgb.1
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 12:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xHOuwQKivOUSkj6cdHM715OY+jHY4XgJzVf3fTPSZ7A=;
 b=IV1LmiIavr/B4vrZu7T1kwL8umtfSoNvl1PnyYHVlm0mg3PFt8bHazG0jMO4XbzY+O
 Fslc73yDOevKYFJVq7pEyzn8ffSAT/1Noh0zVrQiurKaVJTYgIXmNG/cul5vPb5H7BC8
 Gx6wl9sNmZ+p0PvswsmuzXpZet7XnjLlxoWpq+aNHVh4mk7UiFjFmtIjRhB/FoPDQitW
 LDRKHvD0WQAaV6enMnLCEQdzos/2UIceH8fBMZCzaslmFP/CcMwrqPEQpv5eTKkQ6lPc
 pb42HjXrspjJofm0hS6nYt3K6kx50A/wcw5ZymrjoPGvwXSOSzkkHZMLxlF8GibYnorn
 TrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xHOuwQKivOUSkj6cdHM715OY+jHY4XgJzVf3fTPSZ7A=;
 b=nvw/r0uXKGLjFJ1VWVPjjquVH72oFyQ1P7MEX1Jn+ehnwdwV9LZzEn5t+cHdHyVRiz
 /LGord/poR7rR7KsQZkeYHX0Bq3oToFIPAB9/vf76kdugZyUrbHn4UCP2kLO+bWf509y
 AoTZdlTZd81YRZL0rWhdUn11m8TzRMQ9cngJq9diG1EP2c5q8a1T0PDP+TJOfYBdvScl
 IY9iYpCmLa4Xm6wy5zkfHSyLu0kLxvPqBzfAOSAIzHyir6Bai21qYZZXJZdQ0hjxM1MG
 c26woW1oZ+tXGLTuKJnEmgFJBOZacGnoueJXWoTHkFWg07+GsdkgEHpeY8AOkxnRDtiA
 CPag==
X-Gm-Message-State: AOAM533UjynIK3e39YXTkM3O7VSsgd/Ik8fREpz2zjE02gLZ0EopvKm9
 +4yPVScDASkK+uebfGeoo2b4vg==
X-Google-Smtp-Source: ABdhPJzPj6YXG0Fd+zn+BigKpP9jLywMao6XZ14iaQHALwEUF8l3fNSmwvsOuGPTfzBYUJMAHrkT/w==
X-Received: by 2002:a05:6a00:1488:b0:44d:25b2:f80b with SMTP id
 v8-20020a056a00148800b0044d25b2f80bmr13408466pfu.20.1634325333860; 
 Fri, 15 Oct 2021 12:15:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e20sm5646982pfc.11.2021.10.15.12.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 12:15:33 -0700 (PDT)
Subject: Re: [PULL 37/40] monitor: Tidy up find_device_state()
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu block <qemu-block@nongnu.org>
References: <20211013090728.309365-1-pbonzini@redhat.com>
 <20211013090728.309365-38-pbonzini@redhat.com>
 <3d80dc6b-66bd-34f7-8285-48c0647d6238@de.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c01b47a1-43e2-71b7-1cdd-9a1d0f685eb3@linaro.org>
Date: Fri, 15 Oct 2021 12:15:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3d80dc6b-66bd-34f7-8285-48c0647d6238@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 4:08 AM, Christian Borntraeger wrote:
> 
> Am 13.10.21 um 11:07 schrieb Paolo Bonzini:
>> From: Markus Armbruster <armbru@redhat.com>
>>
>> Commit 6287d827d4 "monitor: allow device_del to accept QOM paths"
>> extended find_device_state() to accept QOM paths in addition to qdev
>> IDs.  This added a checked conversion to TYPE_DEVICE at the end, which
>> duplicates the check done for the qdev ID case earlier, except it sets
>> a *different* error: GenericError "ID is not a hotpluggable device"
>> when passed a QOM path, and DeviceNotFound "Device 'ID' not found"
>> when passed a qdev ID.  Fortunately, the latter won't happen as long
>> as we add only devices to /machine/peripheral/.
>>
>> Earlier, commit b6cc36abb2 "qdev: device_del: Search for to be
>> unplugged device in 'peripheral' container" rewrote the lookup by qdev
>> ID to use QOM instead of qdev_find_recursive(), so it can handle
>> buss-less devices.  It does so by constructing an absolute QOM path.
>> Works, but object_resolve_path_component() is easier.  Switching to it
>> also gets rid of the unclean duplication described above.
>>
>> While there, avoid converting to TYPE_DEVICE twice, first to check
>> whether it's possible, and then for real.
> 
> This one broke qemu iotest 280 on s390:
> 
> 
> 280   fail       [13:06:19] [13:06:19]   0.3s   (last: 0.3s)  output mismatch (see 
> 280.out.bad)
> --- /home/cborntra/REPOS/qemu/tests/qemu-iotests/280.out
> +++ 280.out.bad
> @@ -37,14 +37,14 @@
>   === Resume the VM and simulate a write request ===
>   {"execute": "cont", "arguments": {}}
>   {"return": {}}
> -{"return": ""}
> +{"return": "Error: Device 'vda/virtio-backend' not found\r\n"}

Hmm, this test doesn't seem to have been attempted during staging:

   https://gitlab.com/qemu-project/qemu/-/jobs/1681194907

Is there something extra that needs to be installed on s390x.ci.qemu.org to have this test 
run?


r~

