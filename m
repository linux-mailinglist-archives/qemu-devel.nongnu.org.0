Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2832046CF83
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 09:54:10 +0100 (CET)
Received: from localhost ([::1]:32776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1musiG-0004L2-P3
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 03:54:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1musgn-0003a3-02
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 03:52:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1musgk-0000oL-9Y
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 03:52:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638953552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kq482+OLkdW6XBg49y314Yma6eI1+XYeOMNBij+NL6w=;
 b=Nl1WocMB4uaLBKjBliAAD80WcKnx7I4EXQO2eWPum33TwHp/NOzxjQslDiNLNbXG2bw9vm
 CMDgyQsv2G7/qiSWMZ1p0iDard6l3KpSXd4jmzfNcJ1Mi5H9ABbcbpP1nycUKbqPKX600H
 nJHdLxewPCzBxLjMb2JclMI7S5/svgw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-GgRFhLKgOEKvLQ-ygk0-UA-1; Wed, 08 Dec 2021 03:52:29 -0500
X-MC-Unique: GgRFhLKgOEKvLQ-ygk0-UA-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so235388wrd.1
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 00:52:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Kq482+OLkdW6XBg49y314Yma6eI1+XYeOMNBij+NL6w=;
 b=f2QegY4UdIih400tbekeMRhY4Ur1g8mMDMlei6psSoJRbumxPedB573hPag3oiK8Vb
 6HV0UWy2LxO4Jmvox+dBGl017B6+RdBZBncCwln5j0OifKOsHZHgfXqzz6tlRtbrIusl
 jrZj4RCKZzYOb6r/sSTpjSnWlcTzrg/Suqsmrp+IeNjbmS4KseV5tsxelOLnLg80ohxA
 qE99b8KOjA6uKvaLbg8VxNPd4tdyTFTFpLg+xmYWTBoZRCbdl27oY716aRwiDxbUqd1j
 UhpeHoY0Q+H/vLoceiuM3xptMTQ//ZuhYVB/4eErn/1AY/F007NpYlvAK0/m517OKdNT
 NVxg==
X-Gm-Message-State: AOAM532T4wqVGdqocV3aCs9Vi+Zl+nh8kmllpZpwBBQlljnOfh+vkRXx
 zP2RPFFayF7ZUEPp/HDkcjM7upLsuaMGowi0LueUJAGuXfLtAbf2o2K+5FOv4xu8KU3pPZpI7Mw
 6/FUMHvoM0edMJhU=
X-Received: by 2002:a05:600c:1d97:: with SMTP id
 p23mr14363873wms.144.1638953548623; 
 Wed, 08 Dec 2021 00:52:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNTaddWp/skbjeuF4H5IcZykjiaVvIXBjeNX1mCbCxOeqgidEoKzqAvJ7ifl22LvMNzl21Sw==
X-Received: by 2002:a05:600c:1d97:: with SMTP id
 p23mr14363849wms.144.1638953548391; 
 Wed, 08 Dec 2021 00:52:28 -0800 (PST)
Received: from [192.168.100.42] ([82.142.9.98])
 by smtp.gmail.com with ESMTPSA id t8sm2144399wrv.30.2021.12.08.00.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 00:52:28 -0800 (PST)
Message-ID: <0e6e8fd1-7858-bc6f-e586-04a3a4bc809c@redhat.com>
Date: Wed, 8 Dec 2021 09:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 2/4] tests/qtest: add some tests for virtio-net failover
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211207172342.4058491-1-lvivier@redhat.com>
 <20211207172342.4058491-3-lvivier@redhat.com>
 <a54b31e2-0327-6134-517c-71147f3aa6fa@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <a54b31e2-0327-6134-517c-71147f3aa6fa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/12/2021 09:39, Thomas Huth wrote:
> On 07/12/2021 18.23, Laurent Vivier wrote:
>> Add test cases to test several error cases that must be
>> generated by invalid failover configuration.
>>
>> Add a combination of coldplug and hotplug test cases to be
>> sure the primary is correctly managed according the
>> presence or not of the STANDBY feature.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
> [...]
>> diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
>> new file mode 100644
>> index 000000000000..7444d30d2900
>> --- /dev/null
>> +++ b/tests/qtest/virtio-net-failover.c
> [...]
>> +static char *get_mac(QTestState *qts, const char *name)
>> +{
>> +    QDict *resp;
>> +    char *mac;
>> +
>> +    resp = qtest_qmp(qts, "{ 'execute': 'qom-get', "
>> +                     "'arguments': { "
>> +                     "'path': %s, "
>> +                     "'property': 'mac' } }", name);
>> +
>> +    g_assert(qdict_haskey(resp, "return"));
>> +
>> +    mac = g_strdup( qdict_get_str(resp, "return"));
> 
> FYI, check_patch.pl complains about the space after the "(" here.
> 
> I'll fix it up locally, no need to resend just because of this.
> 

I don't know how I missed that as I have pre-commit git hook to run checkpatch.pl

Thank you.

Laurent


