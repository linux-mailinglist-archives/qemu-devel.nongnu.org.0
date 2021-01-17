Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44602F94C3
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 19:57:27 +0100 (CET)
Received: from localhost ([::1]:37222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1DEs-0002s9-RA
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 13:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1DDv-0002Ol-NC
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 13:56:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1DDu-0003iX-5d
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 13:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610909785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nEAEn3TJZliOa7lUKP11EQMRaQzi7FkkxbzNxqyFn5U=;
 b=BkOi/fkAGkOggpvkyE69rkQPVMcbBPdutQ05aEEKCWfE6r2Iy9kdic/IbQxOWJyc12zUEY
 SLcidYI9xkp1AsjcclADXoRCh6Kt39UkHlNpuGk0dDlMoM4jnwRswrZdmqbERzxRbqxSK1
 O29qucfDGY9coSDGy31rU1YCoK3MQUI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-ucTqtSAuOhmA1G5aK52q3g-1; Sun, 17 Jan 2021 13:56:23 -0500
X-MC-Unique: ucTqtSAuOhmA1G5aK52q3g-1
Received: by mail-wr1-f69.google.com with SMTP id r11so7162393wrs.23
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 10:56:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nEAEn3TJZliOa7lUKP11EQMRaQzi7FkkxbzNxqyFn5U=;
 b=FCR2/C6y4Rq5YbbTKrBPj4GXPfvXafz6zszYpOWucQYIrPABndt5VrbIQj3V1Co9oD
 /NABEr0l29jE/KW1roR/8dqQymtcQADbj5bu3OX6OQzSJDufMXgkOmJRsvc4v9e8pYRq
 o9xgyuaBIJIgAxkySfhEy2dlCgV7M5w5JAbxIMnhXr7GCjn74XPDLze6lhdLVC0UNg+W
 KBSwFz7cpsb+dxcyUge/HrGJX95vg/FQ1rEvHNEhSPOSfFkodXrvtOT1r5PTqakYw7km
 9PZBnlWT/cbGa9ghXahpwYT0hD0ADi1NI1+1QAQVlQl8kItpTcaGVjBhidrqLzd+He6v
 R00w==
X-Gm-Message-State: AOAM5322WrwWdz9v0z3e9Vb+Z+5AW18t96aScce/FX9JHhIuf6FCrEZc
 GhCEXz5FAXmbQExb2ZaN0FpSSo+LM7P5uvX66Z5VHCgMCJcnQmlashHsMmwzhnh346gh7rC1bxW
 nrrg0sAViisJcO/A=
X-Received: by 2002:a5d:6cad:: with SMTP id a13mr21962578wra.275.1610909782803; 
 Sun, 17 Jan 2021 10:56:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyU/FN8mCOE/lejKfmQ1eRu6Q8dARIIt5psNo2Zz5h1KvFWuSO3K1dv39n6HihXtveaqd30mA==
X-Received: by 2002:a5d:6cad:: with SMTP id a13mr21962561wra.275.1610909782586; 
 Sun, 17 Jan 2021 10:56:22 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d18sm21141787wmb.30.2021.01.17.10.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 10:56:21 -0800 (PST)
Subject: Re: [PATCH 1/4] tests/qtest: Remove TPM tests
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210115150936.3333282-1-philmd@redhat.com>
 <20210115150936.3333282-2-philmd@redhat.com>
 <d26e4d3e-b20b-75f4-3c0a-6409ce91e2f4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ee5e715a-e1ec-c71f-defa-1125f1a976c0@redhat.com>
Date: Sun, 17 Jan 2021 19:56:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d26e4d3e-b20b-75f4-3c0a-6409ce91e2f4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/21 7:47 PM, Paolo Bonzini wrote:
> On 15/01/21 16:09, Philippe Mathieu-Daudé wrote:
>> |The TPM tests are failing, and no further tests are run, making the
>> rest of the testsuite pointless:|
> 
> Just use -k when running tests, it's a good idea in general.

Yes, this used to be the default. I still see it in the
Meson conversion in commit a2ce7dbd917 ("meson: convert
ests/qtest to meson"), see tests/qtest/meson.build:

265     test('qtest-@0@/@1@'.format(target_base, test),
266          qtest_executables[test],
267          depends: [test_deps, qtest_emulator],
268          env: qtest_env,
269          args: ['--tap', '-k'],
270          protocol: 'tap',
271          suite: ['qtest', 'qtest-' + target_base])
272   endforeach
273 endforeach

Not sure what is going on.


