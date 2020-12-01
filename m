Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E02E2CABA0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:19:20 +0100 (CET)
Received: from localhost ([::1]:56040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBBH-00040T-DD
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkB5F-0007Xb-Pp
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:13:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkB5D-0001Xt-5S
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:13:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606849981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wNOP4EzITf7o6gPphv0ph6bZP2h2ykYm0mHPu/Ig3/w=;
 b=YytwzkcXsuV3h7fJmVinG6AhIYotti/2LNbXK7G3Rf3hFL/F/9OSd0OudgoBAQfk0VCL+1
 6IUU78JC3KjXHSxE2R73XzMm42w+gmxAJ6gGTzyQkfyC0Vy++CCWFd8jiV1CdgffJhB/37
 uV1jhTvcHnXfmVl2wICoA1StXNsUH6U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-BjFH-Cr1PQ22zynMpfYxdw-1; Tue, 01 Dec 2020 14:13:00 -0500
X-MC-Unique: BjFH-Cr1PQ22zynMpfYxdw-1
Received: by mail-wm1-f69.google.com with SMTP id q17so1031154wmc.1
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 11:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wNOP4EzITf7o6gPphv0ph6bZP2h2ykYm0mHPu/Ig3/w=;
 b=qZ642NIyqetrv+EAviYz9iLKGXBvp3LvcmUQ9QhfWYQ3hGKLA9orG+jQsbSQ9YS/4Y
 8fEXCB28OmePSctq1ramlWugk/wnGjARHFloSz9p6DpXoz0yVH2tubLvR25h7Qbxkjmp
 uJxwfb1qVUzi/bcY6xopgGaIwSSbLNwkWQcz55unFltFlKAxh+7YavBtivhEugmRRDdQ
 LSyKKLHGhq/Iej42+yU54P7Bvb9NLG9+2q8cOwaMXo5qkJ67GMfPK9VgsPpvUx3RZbgK
 ThFivMF+wPUWMwCr/VocSSlZeMnZzjPtSJhlloj0CqqpTkYpw7IDdMhOvw+q1amk8Syy
 1vvg==
X-Gm-Message-State: AOAM533UUIUG+ou95wCwMm4AwEEtdKxYSUvXcv9UrClBDAtBhAXbHBer
 pDO82XAikYYaHVlpt8rM35H7sZQBfh0J/azyyKbB+BytZzMVVoBupNriFGbnoG31vIbGkBqzokm
 QTcVMPQjRRPfeBT0=
X-Received: by 2002:a5d:570d:: with SMTP id a13mr5674544wrv.193.1606849979065; 
 Tue, 01 Dec 2020 11:12:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfVuQ/61xr+YZMepvynJOUU/ASUAdzH4fzV6vx+RY/DdzWraMKALBJlNeeaq8I62tNItGvvQ==
X-Received: by 2002:a5d:570d:: with SMTP id a13mr5674522wrv.193.1606849978896; 
 Tue, 01 Dec 2020 11:12:58 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id n189sm1194775wmf.20.2020.12.01.11.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 11:12:58 -0800 (PST)
Subject: Re: [PATCH v2 3/4] tests/qtest/fuzz-test: Add
 test_megasas_cdb_len_zero() reproducer
To: qemu-devel@nongnu.org
References: <20201201191026.4149955-1-philmd@redhat.com>
 <20201201191026.4149955-4-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <06296e10-18b6-609b-1a8a-1a9435c60f7e@redhat.com>
Date: Tue, 1 Dec 2020 20:12:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201191026.4149955-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 8:10 PM, Philippe Mathieu-Daudé wrote:
> Add a reproducer which triggers (without the previous patch):
> 
>   $ make check-qtest-x86_64
>   Running test qtest-x86_64/fuzz-test
>   qemu-system-x86_64: hw/scsi/megasas.c:1679: megasas_handle_scsi: Assertion `cdb_len > 0 && scsi_cdb_length(cdb) <= cdb_len' failed.
>   tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
>   ERROR qtest-x86_64/fuzz-test - too few tests run (expected 1, got 0)
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qtest/fuzz-test.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Oops this should be patch #4...


