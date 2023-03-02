Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620606A81AD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:57:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhYq-00038N-It; Thu, 02 Mar 2023 06:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam.zheng@bytedance.com>)
 id 1pXhYp-00038F-D9
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:57:23 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fam.zheng@bytedance.com>)
 id 1pXhYm-0000kp-ME
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:57:22 -0500
Received: by mail-wm1-x32d.google.com with SMTP id k37so10552509wms.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9Lo2dTFJPqsTbR6f6cGl41i7bVUomprempAaw1rbHc=;
 b=i/+rjxXyz3jpM0fW7CFjykQxPpBNPQ+zBGpOMuXqLiMlhhy5mSxoNh/fQL4WTem49j
 ifxthfC1TACk6E4GRJCNAkuVRX5QSWJyWazecqPe8z4B/il6O33QhIpCu/Ey8lUEq61L
 E5Tcbg/kpWBJ2BzW4IysKlqnBrRvykjwdC5IQjSTVPiW83gnusPCwZoRZKlQUXw4+swc
 VH/1wBaT75XbeKS1938o+Tvn0KX88/fYTBEX9c51UaTe+UkB97opJfTCtISJeUK0rkrt
 iEVA41mcvhCYyMHy61Qc0R4ioMI4MLkfnzoroGyTk07P0IXAi/3nA/Lzel7nv0bVWEWu
 7pCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h9Lo2dTFJPqsTbR6f6cGl41i7bVUomprempAaw1rbHc=;
 b=iCc5tbs9eUAUWVGVZhVTcDs10TnK+CHp3LVXAV/bbWaNTXdQ1I6klfAsZ4mxA61wLO
 WTp3COv1UpFYw77EK3mFSMczTKozuzzSvyTMLSYq1/0CJcUxQ4VInnx4rlFgNneRjqoa
 tWwVl48LPQ4TfT3OKIqWAVXqr3MjHLUs3uo+6WAAJRRNXIpJHnvkT9mA/T3xHuWSIire
 JBH2WxkaftnBUiPEJfUV/vpAOcEa5IMeWwtOnO1Dt81uVvWMQW8csSfvcaHCT67cJLae
 wLMYiDUrPr++ONpWPs3FdMp00KO71PowwIeSeehDwXzSureOLdFvxaU16ERO3xzsqc8L
 zu6g==
X-Gm-Message-State: AO0yUKUFPkCQurrLi6XL4M9YjGBjR81WdxBQl0zX+Vo26kcvzw1nWwLW
 9d82BtSnTha6m8mn3yU5zu6BwQ==
X-Google-Smtp-Source: AK7set+MBo6KmTmNXnbUO7bzAe9ldI6R4fA+d1S5lLE4PWM3VuRbzovKY4ypmI3q8L6HtVsYxrx/Jw==
X-Received: by 2002:a05:600c:2e95:b0:3ea:e7e7:95d9 with SMTP id
 p21-20020a05600c2e9500b003eae7e795d9mr8301011wmn.32.1677758238010; 
 Thu, 02 Mar 2023 03:57:18 -0800 (PST)
Received: from smtpclient.apple ([93.115.195.2])
 by smtp.gmail.com with ESMTPSA id
 p2-20020adfe602000000b002c561805a4csm15406917wrm.45.2023.03.02.03.57.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Mar 2023 03:57:17 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [External] [PATCH] hostmem: Add clear option to file backend
From: Feiran Zheng <fam.zheng@bytedance.com>
In-Reply-To: <ZACMKL5MOeD59OLl@redhat.com>
Date: Thu, 2 Mar 2023 11:57:06 +0000
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 fam@euphon.net, Igor Mammedov <imammedo@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 stefanha@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <45E8FC3F-B444-4137-8C9D-9BAF9DEE49D9@bytedance.com>
References: <20230302110925.4680-1-fam.zheng@bytedance.com>
 <377c3521-ffe1-074b-48ac-71fd445b3bb4@redhat.com>
 <ZACMKL5MOeD59OLl@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=fam.zheng@bytedance.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



> On 2 Mar 2023, at 11:44, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>=20
> On Thu, Mar 02, 2023 at 12:31:46PM +0100, David Hildenbrand wrote:
>> On 02.03.23 12:09, Fam Zheng wrote:
>>> This adds a memset to clear the backing memory. This is useful in =
the
>>> case of PMEM DAX to drop dirty data, if the backing memory is handed
>>> over from a previous application or firmware which didn't clean up
>>> before exiting.
>>>=20
>>=20
>> Why can't the VM manager do that instead? If you have a file that's
>> certainly easily possible.
>=20
> This feels conceptually similar to the case where you expose a host
> block device to the guest. If that block device was previously given
> to a different guest it might still have data in it. Someone needs
> to take responsibility for scrubbing that data. Since that may take
> a non-trivial amount of time, it is typically todo that scrubbing in
> the background after the old VM is gone rather than put it into the
> startup path for a new VM which would delay boot.
>=20
> PMEM is blurring the boundary between memory and disk, but the =
tradeoff
> is not so different. We know that in general merely faulting in guest
> memory is quite time consuming and delays VM startup significantly as
> RAM size increases. Doing the full memset can only be slower still.
>=20
> For prealloc we've create complex code to fault in memory across many
> threads and even that's too slow, so we're considering doing it in the
> background as the VM starts up.
>=20
> IIUC, this patch just puts the memset in the critical serialized path.
> This will inevitably lead to a demand for improving performance by
> parallelizing across threads, but we know that's too slow already,
> and we cant play the background async game with memset as that's
> actually changunig guest visible contents.
>=20
> IOW, for large PMEM sizes, it does look compelling to do the clearing
> of old data in the background outside context of QEMU VM startup to
> avoid delayed startup.
>=20
> I can still understand the appeal of a simple flag to set on QEMU from
> a usability POV, but not sure its a good idea to encourage this usage
> by mgmt apps.

I can totally see the reasoning about the latency here, but I=E2=80=99m =
a little dubious if multi-threading for memset can actaully help reduce =
the start-up time; the total cost is going to be bound by memory =
bandwidth between the CPU and memory (even more so if it=E2=80=99s PMEM) =
which is limited.

Fam=

