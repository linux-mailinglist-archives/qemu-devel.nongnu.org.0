Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3096A8150
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:38:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhFd-0001sq-E9; Thu, 02 Mar 2023 06:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam.zheng@bytedance.com>)
 id 1pXhFb-0001sf-AE
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:37:31 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fam.zheng@bytedance.com>)
 id 1pXhFY-0004Fq-Ua
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:37:31 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so1505517wms.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m1Q+ww77Dte3sDcCU+1jOtU9oP4AXkfxzJq67gcSpsk=;
 b=XW2bxOJHE4xdBXB48s8VS43qbEr03z5olSIL9YPyeT2l1t14dx6IS8TQAyYs/JGxfK
 UHOoKflJUbgNcBQuxA8kmLS5662C9B9WEI+dM6/7cpnN4NAmtjUD+tu+/XApumxCDsX5
 fpSahqfF6g/18lkmg9WEY5NjHTFRjaQ5BnVASur8j/aXZbbkm2xwWTaXuRXo5jJlvVgG
 LPamcllBF62m+o6TTqM/H0nVApKK4ZXqLZyQDBrXfvGu/Sqb6iKBWsg3Tdxqs7p+RNbj
 +d4j54RlXGLkd1eKKHqDhQo/hV+4NEjCS9hGwFHm6Jrvj+99STFeix6oLX5R9K41ZIiT
 2iaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m1Q+ww77Dte3sDcCU+1jOtU9oP4AXkfxzJq67gcSpsk=;
 b=IKJZ49QTcXcS5L/W6Xfnl2iOnBpFS2y9tomSozW/O73ZYpWbatRFkRS19P+lf+zqH7
 yIOxlh2LRGspjg3klLJB8/VEE4QdYAW0kYQyS3PDFl+5x1NYuPe3qkHO4Ecf015SY8YH
 HHV3teqXg36+tIzGHBvsHhRMbOf21lUVnlN43DVWaVHrjg3ECOj1Gb3tTkG4Jq3ULmfA
 HMt+FNdTwrvFD3lrSQma2EVRZou6dNmkNeUtEbfJ8pwhdSrqJvQTdCe7b7KzBafgCHdP
 d31yciiEicobBtiIsAC0n1zFb4SQK1OjPWmRPw4cKC66GmtLAe/jSXUe96DBeK6X3Hmx
 G8rQ==
X-Gm-Message-State: AO0yUKWz4q7CkuQXm7ghFrTgbLBBXJv1kRFIOU1ZrON5woqg2Jvp5qKD
 wAKt4OmhCBd6Q9mgE25UTcdQdg==
X-Google-Smtp-Source: AK7set/sodROn8GrXvMtE833j6TnAImsP1GpBqhkRS/VDt7/kIlSTaoS47P3RtSxs0zSc87EUKKJ0g==
X-Received: by 2002:a05:600c:4fc3:b0:3ea:ed4d:38ee with SMTP id
 o3-20020a05600c4fc300b003eaed4d38eemr7625007wmq.4.1677757047185; 
 Thu, 02 Mar 2023 03:37:27 -0800 (PST)
Received: from smtpclient.apple ([93.115.195.2])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a7bc392000000b003eb20d4d4a8sm2552629wmj.44.2023.03.02.03.37.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Mar 2023 03:37:26 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [External] [PATCH] hostmem: Add clear option to file backend
From: Feiran Zheng <fam.zheng@bytedance.com>
In-Reply-To: <377c3521-ffe1-074b-48ac-71fd445b3bb4@redhat.com>
Date: Thu, 2 Mar 2023 11:37:15 +0000
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Fam Zheng <fam@euphon.net>,
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <15DA845E-C50C-46BB-A241-164E5851E388@bytedance.com>
References: <20230302110925.4680-1-fam.zheng@bytedance.com>
 <377c3521-ffe1-074b-48ac-71fd445b3bb4@redhat.com>
To: David Hildenbrand <david@redhat.com>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=fam.zheng@bytedance.com; helo=mail-wm1-x332.google.com
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



> On 2 Mar 2023, at 11:31, David Hildenbrand <david@redhat.com> wrote:
>=20
> On 02.03.23 12:09, Fam Zheng wrote:
>> This adds a memset to clear the backing memory. This is useful in the
>> case of PMEM DAX to drop dirty data, if the backing memory is handed
>> over from a previous application or firmware which didn't clean up
>> before exiting.
>=20
> Why can't the VM manager do that instead? If you have a file that's =
certainly easily possible.


Hi David,

Technically yes, but I have a simple VM manager here which wants to =
avoid replicating the same mmap code, such as handling the flags =
depending on share=3Don|off,hugepages=3Don|off. All in all this approach =
requires the least additional code to achieve it.

Thanks,
Fam

>=20
> --=20
> Thanks,
>=20
> David / dhildenb
>=20


